package com.renrenlab.cms.communication.service.impl;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.renrenlab.cms.common.constant.WeixinFinalMessage;
import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IWxUserService;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;


/**
 *微信用户service
 */
@Service("wxUserService")
@Transactional
public class WxUserServiceImpl implements IWxUserService {
	private Logger log =  LoggerFactory.getLogger(this.getClass());

//	@Autowired
//	private UserDao userDao;
//	
	@Autowired
	private UserWxDao userWxDao;
	@Autowired
	private SessionBaseInfoDao sessionDao;

	@Autowired
	private JedisPool jedisPool;
	@Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
	
	@Override
	public UserOriginalWx queryByOpenid(String openid) {
		String url = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.USER_QUERY);
		url = url.replace("OPENID", openid);
		log.debug("进入queryByOpenid，url="+url);
		String json = WeixinBasicUtil.sendGet(url);
		boolean flag = WeixinBasicUtil.checkRequestSucc(json);
		if(!flag && WeixinBasicUtil.getRequestCode(json)==WeixinFinalValue.INVALIDACCESSTOKEN){
			refreshAccessTokenTask.refreshToken();
			queryByOpenid(openid);
		}
		log.debug("获取用户信息"+json);
		return (UserOriginalWx) JsonUtil.getInstance().json2obj(json, UserOriginalWx.class);
	}
	/**
	 * 根据code获取openId
	 */
	@Override
	public String queryOpenidByCode(String code)  {
		try {
			String url = WeixinFinalValue.AUTH_GET_OID;
			url = url.replace("APPID", WeixinContext.getInstance().getAppId())
			   .replace("SECRET",WeixinContext.getInstance().getAppSecurt())
			   .replace("CODE", code);
			String json = WeixinBasicUtil.sendGet(url);
			String openid = JsonUtil.getMapper().readTree(json).get("openid").asText();
			return openid;
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Transactional()
	@Override
	public void handlerPhoneMsg(Long uId, String wxOpenId,int action) {
		log.debug("处理手机绑定前消息，uId："+uId);
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			if(jedis.llen("openid_"+wxOpenId)<=0){
				return;
			}
			Long sid =null;
//			判断会话是否存在，存在查出会话id，不存在插入一条新会话
			SessionBaseInfo session = sessionDao.selectByUId(uId);
			if(session==null){
				session = new SessionBaseInfo();
				session.setuUid(uId);
				sessionDao.insertSelective(session);
				log.debug("插入会话表");
			}
			sid = session.getsSid();
			List<String> msgBodys = jedis.lrange("openid_"+wxOpenId, 0, -1);
			SessionMessage sessionMessage=null;
			for (String msgBody : msgBodys) {
				sessionMessage = new SessionMessage();
				sessionMessage.setmFrom(uId);
				sessionMessage.setmTo(session.getCsId());
				sessionMessage.setsSid(sid);
				sessionMessage.setmSource(0);
				sessionMessage.setmBody(msgBody);
				sessionMessage.setmType(0);
				sessionMessage.setCreateTime(new Date());
				sessionMessage.setmTime(new Date());
				String tempMsg = JsonUtil.getInstance().obj2json(sessionMessage);
				jedis.rpush("tempmsg_"+sid, tempMsg);
				//jedis.expire("tempmsg_"+sid, 48 * 60 * 60);
			}
			jedis.del("openid_"+wxOpenId);
			//发送绑定成功的消息
			String weChatUrl = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.ADD_MESSAGE);
			if(action==1){
				String msgBody="{\"touser\":\""+wxOpenId+"\",\"msgtype\":\"text\",\"text\":{\"content\":\""+WeixinFinalMessage.RESP_CONTENT_UPDATEPASSWORD+"\"}}";
				String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);
				log.debug("绑定手机返回："+rel);
				return;
			}
			String msgBody="{\"touser\":\""+wxOpenId+"\",\"msgtype\":\"text\",\"text\":{\"content\":\"恭喜您已绑定成功，人工客服正飞速接入...\"}}";
			String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, msgBody);
			log.debug("绑定手机返回："+rel);
		} catch (JedisConnectionException e) {
			log.error("redis连接异常");
		} finally {
			if (jedis != null) {
				jedis.close();
			};
		}
	}
	@Override
	public int insertSelective(UserWx userWx) {
		return userWxDao.insertSelective(userWx);
	}
	@Override
	public UserWx selectByUserId(Long uUid) {
		return userWxDao.selectChatUserByUuId(uUid);
	}
	@Override
	public UserWx selectByOpenId(String wxOpenId) {
		return userWxDao.selectByOpenId(wxOpenId);
	}
	@Override
	public int updateByOpenIdSelective(UserWx userWx) {
		return userWxDao.updateByOpenIdSelective(userWx);
	}

}
