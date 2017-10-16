package com.renrenlab.cms.communication.service.impl;

import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.SessionMessageDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.service.ISessionMessageTmpService;
import com.renrenlab.cms.communication.vo.MessageTmpInfo;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.ArrayList;
import java.util.List;

/**
 * 临时消息
 *
 * Created by lihongxun on 2017/5/17.
 */
@Service
@Transactional
public class SessionMessageTmpServiceImpl implements ISessionMessageTmpService {

    public static Logger logger = LoggerFactory.getLogger(SessionMessageTmpServiceImpl.class);

    @Autowired
    private SessionBaseInfoDao sessionBaseInfoDao;
    @Autowired
    private SessionMessageDao sessionMessageDao;
    @Autowired
    private UserBaseInfoDao userBaseInfoDao;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 聊天页面定时获取微信用户发送的临时消息
     *
     * @param sessionId
     * @return
     * @throws Exception
     */
    @Override
    public List<MessageTmpInfo> quickQuery(long sessionId) throws Exception {
        Jedis jedis = null;
        List<MessageTmpInfo> msgList = new ArrayList<MessageTmpInfo>();
        try {
            jedis = jedisPool.getResource();
            // 根据会话Id获取会话信息
            SessionBaseInfo session = sessionBaseInfoDao.selectBySsId(sessionId);
            // 获取会话相关用户信息
            UserBaseInfo user = userBaseInfoDao.selectByUId(session.getuUid());
            // 会话临时消息
            List<String> list = jedis.lrange("tempmsg_" + sessionId, 0, -1);
            // 临时消息转为对象
            SessionMessage outMsg = null;
            SessionMessage message = null;
            MessageTmpInfo messageTmpInfo;
            for (String str : list) {
                outMsg = (SessionMessage) JsonUtil.getInstance().json2obj(str, SessionMessage.class);

                // 临时消息插入消息表
                message = new SessionMessage();
                message.setmBody(outMsg.getmBody());
                message.setmFrom(outMsg.getmFrom());
                message.setmTo(session.getCsId());
                message.setmType(outMsg.getmType());
                message.setmTime(outMsg.getmTime());
                message.setsSid(sessionId);
                message.setmSource(outMsg.getmSource());
                sessionMessageDao.insertSelective(message);

                // 输出的消息列表
                messageTmpInfo = new MessageTmpInfo();
                try {
                    messageTmpInfo.setMtBody((String) JSONObject.fromObject(outMsg.getmBody()).get("msg"));
                    messageTmpInfo.setMtFrom(outMsg.getmFrom());
                    messageTmpInfo.setMtType(outMsg.getmType());
                    messageTmpInfo.setMtTime(outMsg.getmTime());
                    messageTmpInfo.setuNickname(user.getuNickname());
                    messageTmpInfo.setuAvatar(user.getuAvatar());
                    msgList.add(messageTmpInfo);
                } catch (Exception e) {
                    logger.error("解析消息失败:" + str);
                    e.printStackTrace();
                    messageTmpInfo.setMtBody("消息解析失败");
                }
                // 从头部删除一条临时消息
                jedis.lpop("tempmsg_" + sessionId);
            }
        } catch (JedisConnectionException e) {
            logger.error("redis连接异常", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return msgList;
    }

    @Override
    public SessionMessage selectLastMsgBySsId(Long ssId) {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            Long count = jedis.llen("tempmsg_" + ssId);
            if (count != 0) {
                List<String> msg = jedis.lrange("tempmsg_" + ssId, count - 1, -1);
                SessionMessage outMsg = (SessionMessage) JsonUtil.getInstance().json2obj(msg.get(0), SessionMessage.class);
                return outMsg;
            }
        } catch (JedisConnectionException e) {
            logger.error("redis连接异常", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }
}
