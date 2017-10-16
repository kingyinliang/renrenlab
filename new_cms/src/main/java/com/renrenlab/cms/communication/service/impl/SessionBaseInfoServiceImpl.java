package com.renrenlab.cms.communication.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.SessionHistoryDao;
import com.renrenlab.cms.communication.dao.SessionMessageDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.session.SessionException;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionHistory;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.service.ISessionBaseInfoService;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import com.renrenlab.cms.communication.vo.SessionInfo;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.List;
import java.util.Date;

/**
 * 会话
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
@Transactional
public class SessionBaseInfoServiceImpl implements ISessionBaseInfoService {

    private static Logger logger = LoggerFactory.getLogger(SessionBaseInfoServiceImpl.class);

    @Autowired
    private SessionBaseInfoDao sessionBaseInfoDao;
    @Autowired
    private SessionHistoryDao sessionHistoryDao;
    @Autowired
    private SessionMessageDao sessionMessageDao;
    @Autowired
    private UserBaseInfoDao userBaseInfoDao;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 会话接入-->更新会话表客服ID-->更新会话历史表-->插入消息、删除临时消息表-->查询消息列表
     *
     * @param sessionId
     * @param csId
     */
    @Override
    public void joinup(long sessionId, long csId) {
        SessionHistory history = sessionHistoryDao.selectLastSessionHistory(sessionId);
        if(history != null && "begin".equals(history.gethKey())){
            throw new SessionException(ResponseMessage.SESSION_ERROR);
        }
        //更新会话表客服ID
        SessionBaseInfo session = sessionBaseInfoDao.selectBySsId(sessionId);
        session.setCsId(csId);
        session.setsState(1);
        sessionBaseInfoDao.updateSession(session);
        //更新会话历史表
        SessionHistory sh = new SessionHistory();
        sh.setsSid(sessionId);
        sh.sethKey("begin");
        sh.sethValue(String.valueOf(new Date().getTime()));
        sessionHistoryDao.insertSelective(sh);
    }

    /**
     * 根据客服ID分页查询会话列表
     *
     * @param csId
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Override
    public PageInfo<SessionInfo> list(long csId, int pageNo, int pageSize) throws Exception {
        PageHelper.startPage(pageNo,pageSize);
        List<SessionInfo> sessions = sessionBaseInfoDao.selectSessionsByCsId(csId);
        fillSessionInfo(sessions);
        return new PageInfo<SessionInfo>(sessions);
    }

    /**
     * 分页查询待接入会话
     *
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Override
    public PageInfo<SessionInfo> listWaitUpSession(int pageNo, int pageSize) throws Exception {
        PageHelper.startPage(pageNo,pageSize);
        List<SessionInfo> sessions = sessionBaseInfoDao.selectSessionIsWaitJoinUp();
        fillSessionInfo(sessions);
        return new PageInfo<SessionInfo>(sessions);
    }

    /**
     * 选择性更新会话
     *
     * @param session
     * @return
     */
    @Override
    public int updateBySsIdSelective(SessionBaseInfo session) {
        Integer state = session.getsState();
        if(state != null){
            if(state == 2){//主动关闭会话
                SessionHistory sh = new SessionHistory();
                sh.setsSid(session.getsSid());
                sh.sethKey("end");
                sh.sethValue(String.valueOf(new Date().getTime()));
                sessionHistoryDao.insertSelective(sh);
            }else if(state == 1){//重新接入会话
                SessionHistory sh = new SessionHistory();
                sh.setsSid(session.getsSid());
                sh.sethKey("begin");
                sh.sethValue(String.valueOf(new Date().getTime()));
                sessionHistoryDao.insertSelective(sh);
            }
        }
        return sessionBaseInfoDao.updateSession(session);
    }

    /**
     * 填充会话信息
     *
     * @param sessions
     */
    private void fillSessionInfo(java.util.List<SessionInfo> sessions) {
        if(sessions == null || sessions.size() == 0)
            return;

        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            for (SessionInfo ss : sessions) {
                // 临时消息条数
                Long count = jedis.llen("tempmsg_" + ss.getSsId());
                // redis中有临时消息
                if (count > 0) {
                    // 获取临时消息中最后一条
                    String messageTmp = jedis.lindex("tempmsg_" + ss.getSsId(), -1);
                    SessionMessage json = null;
                    try {
                        json = (SessionMessage) JsonUtil.getInstance().json2obj(messageTmp, SessionMessage.class);
                        ss.setMsgTime(json.getmTime());
                        ss.setMsgBody((String) JSONObject.fromObject(json.getmBody()).get("msg"));
                        ss.setMsgType(json.getmType());
                        ss.setUnRead(count);
                    } catch (Exception e) {
                        logger.error("解析消息失败:" + messageTmp);
                        e.printStackTrace();
                        ss.setMsgBody("消息解析失败");
                    }
                } else {
                    SessionMessage message = sessionMessageDao.selectLastItemMessageBySessionId(ss.getSsId());
                    JSONObject json = null;
                    try {
                        json = JSONObject.fromObject(message.getmBody());
                        ss.setMsgTime(message.getmTime());
                        ss.setMsgBody((String) json.get("msg"));
                        ss.setMsgType(message.getmType());
                        ss.setUnRead(0L);
                    } catch (Exception e) {
                        logger.error("解析消息失败:" + message.getmBody());
                        e.printStackTrace();
                        ss.setMsgBody("消息解析失败");
                    }
                }
                UserBaseInfo user = userBaseInfoDao.selectByUId(ss.getuId());
                ss.setuNickname(user.getuNickname());
                ss.setuAvatar(user.getuAvatar());
            }
        } catch (JedisConnectionException e) {
            logger.error("redis连接异常");
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
    }

    @Override
    public List<SessionBriefInfo> selectAllSsId() {
        return sessionBaseInfoDao.selectAllSsId();
    }

    @Override
    public int updateBySsId(SessionBaseInfo session) {
        return sessionBaseInfoDao.updateSession(session);
    }
}
