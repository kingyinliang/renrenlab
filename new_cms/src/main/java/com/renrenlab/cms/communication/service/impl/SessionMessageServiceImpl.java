package com.renrenlab.cms.communication.service.impl;

import java.util.Date;
import java.util.List;

import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.SessionMessageDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.message.MessageException;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.service.ISessionMessageService;
import com.renrenlab.cms.communication.vo.MessageInfo;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;

import net.sf.json.JSONObject;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

/**
 * 消息
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
public class SessionMessageServiceImpl implements ISessionMessageService {

    private static Logger logger = LoggerFactory.getLogger(SessionMessageServiceImpl.class);

    @Autowired
    private SessionMessageDao sessionMessageDao;
    @Autowired
    private SessionBaseInfoDao sessionBaseInfoDao;
    @Autowired
    private UserWxDao userWxDao;
    @Autowired
    private UserBaseInfoDao userBaseInfoDao;
    @Autowired
    private JedisPool jedisPool;
    @Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;

    /**
     * 发送消息，消息入库
     *
     * @param msg
     * @param sessionId
     * @param csId
     */
    @Override
    public void add(SessionMessage msg, long sessionId, long csId) {
        //1.发送给微信
        SessionBaseInfo session = sessionBaseInfoDao.selectBySsId(sessionId);//sessionBaseInfoDao.selectBySsId(sessionId);
        if(csId != session.getCsId() || session.getsState() != 1){
            throw new MessageException(ResponseMessage.MESSAGE_ERROR);
        }
        String openId = userWxDao.selectChatUserByUuId(session.getuUid()).getWxOpenId();

        String messageBody = msg.getmBody().replaceAll("\\\\", "\\\\\\\\");
        messageBody = messageBody.replaceAll("\"", "\\\\\"");
        String toWxMessage = messageBody;

        messageBody = messageBody.replaceAll("&", "&#38;");
        messageBody = messageBody.replaceAll("<", "&#60;");
        messageBody = messageBody.replaceAll(">", "&#62;");
        messageBody = messageBody.replaceAll(" ", "&#160;");
        messageBody = messageBody.replaceAll("\\r", "&#13;&#10;");
        messageBody = messageBody.replaceAll("\\n", "&#13;&#10;");
        messageBody = messageBody.replaceAll("\\t", "&#009;");
        messageBody = messageBody.replaceAll("\\f", "&012;");

        String standardMessage = "{\"msg\":\""+messageBody+"\",\"type\":\"text\"}";
        String wxMessage = "{\"touser\":\""+openId+"\",\"msgtype\":\"text\",\"text\":{\"content\":\""+toWxMessage+"\"}}";
        String url = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.ADD_MESSAGE);
        String result = WeixinBasicUtil.sendJsonPost(url, wxMessage);
        logger.error("调用微信接口返回信息:"+result);
        JSONObject json = JSONObject.fromObject(result);
        if(result != null && (!new Integer(0).equals(json.get("errcode"))) && (!"ok".equals(json.get("errmsg")))){
        	if(WeixinBasicUtil.getRequestCode(result)==WeixinFinalValue.INVALIDACCESSTOKEN){
    			refreshAccessTokenTask.refreshToken();
    			result=WeixinBasicUtil.sendJsonPost(url, wxMessage);
    		}
        	if(!WeixinBasicUtil.checkRequestSucc(result)){
        		throw new MessageException(ResponseMessage.MESSAGE_ERROR);
        	}
        }
        //2.添加到数据库
        msg.setmFrom(session.getCsId());
        msg.setmTo(session.getuUid());
        msg.setmBody(standardMessage);
        msg.setmType(0);
        msg.setmTime(new Date());
        msg.setmSource(1);
        msg.setmState(0);
        msg.setsSid(sessionId);
        sessionMessageDao.insert(msg);
    }

    /**
     * 切换会话，根据sessionId分页查询消息列表
     *
     * @param csId
     * @param sessionId
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Override
    public PageInfo<MessageInfo> list(long csId, long sessionId, int pageNo, int pageSize) throws Exception {
        Jedis jedis = null;
        try {
            jedis = jedisPool.getResource();
            // 查询临时消息表如果有数据添加到消息表中
            List<String> jList = jedis.lrange("tempmsg_" + sessionId, 0, -1);
            SessionMessage tmpMsg = null;
            SessionMessage inMsg = null;
            for (String str : jList) {
                tmpMsg = (SessionMessage) JsonUtil.getInstance().json2obj(str, SessionMessage.class);

                // 临时消息插入消息表
                inMsg = new SessionMessage();
                inMsg.setmBody(tmpMsg.getmBody());
                inMsg.setmFrom(tmpMsg.getmFrom());
                inMsg.setmTo(csId);
                inMsg.setmType(tmpMsg.getmType());
                inMsg.setmTime(tmpMsg.getmTime());
                inMsg.setsSid(sessionId);
                inMsg.setmState(0);
                inMsg.setmSource(1);
                sessionMessageDao.insertSelective(inMsg);

                // 从redis头部删除一条临时消息
                jedis.lpop("tempmsg_" + sessionId);
            }
        } catch (JedisConnectionException e) {
            logger.error("redis连接异常");
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }

        //根据会话ID分页查询消息表
        SessionBaseInfo session = sessionBaseInfoDao.selectBySsId(sessionId);
        UserBaseInfo cs = userBaseInfoDao.selectByUId(csId);
        UserBaseInfo user = userBaseInfoDao.selectByUId(session.getuUid());

        //前端查询第一页相当于查询最后一页消息
        PageHelper.startPage(pageNo, pageSize);
        List<MessageInfo> list = sessionMessageDao.selectMessageBySessionId(sessionId);
        for(MessageInfo info : list){
            try{
                JSONObject json=JSONObject.fromObject(info.getMsgBody());
                info.setMsgBody((String)json.get("msg"));
                info.setuNickname(user.getuNickname());
                info.setuAvatar(user.getuAvatar());
                info.setCsAvatar(cs.getuAvatar());
            }catch (Exception e){
                logger.error("解析消息失败:"+info.getMsgBody());
                info.setMsgBody("消息解析失败");
            }
        }
        return new PageInfo<>(list);
    }

    /**
     * 用户最后一条消息
     *
     * @param sessionBriefInfo
     * @return
     */
    @Override
    public SessionMessage selectLastMsgBySsIdFromUser(SessionBriefInfo sessionBriefInfo) {
        return sessionMessageDao.selectLastMsgBySsIdFromUser(sessionBriefInfo);
    }

    /**
     * 根据会话Id查询最后一条消息
     *
     * @param ssId
     * @return
     */
    @Override
    public SessionMessage selectLastMsgBySsId(long ssId) {
        return sessionMessageDao.selectLastItemMessageBySessionId(ssId);
    }
}
