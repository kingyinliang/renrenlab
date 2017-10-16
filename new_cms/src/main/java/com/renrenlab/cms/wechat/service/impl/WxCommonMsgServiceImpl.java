
package com.renrenlab.cms.wechat.service.impl;

import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinMessageUtil;
import com.renrenlab.cms.communication.dao.SessionBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IWxUserService;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;
import com.renrenlab.cms.wechat.service.IWxCommonMsgService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service("wxCommonMsgService")
@Transactional
public class WxCommonMsgServiceImpl implements IWxCommonMsgService {

	@Autowired
	private UserBaseInfoDao userBaseInfoDao;
	@Autowired
	private IWxUserService wxUserService;
	@Autowired
	private SessionBaseInfoDao sessionBaseInfoDao;
	@Autowired
	private JedisPool jedisPool;

	private static final Logger log = LoggerFactory.getLogger(WxCommonMsgServiceImpl.class);

	/**
	 * 自动回复匹配
	 */
	private static Map<String, String> replyMsgs = new HashMap<String, String>();

	static {
		replyMsgs.put("你好", "你好");
		replyMsgs.put("在么", "在的");
		replyMsgs.put("你好 在么", "在的，请问有什么需要");
		replyMsgs.put("你是机器人么", "是的，很高兴为您服务");
		replyMsgs.put("/::)", "/::)");
		replyMsgs.put("文献", "链接: https://pan.baidu.com/s/1eS1OICa 密码: umqf");
		replyMsgs.put("LC/MS", "链接: https://pan.baidu.com/s/1sllnqrV 密码: nq4y");
		replyMsgs.put("Endnote", "链接: https://pan.baidu.com/s/1boJpEDx 密码: 3xnn");
		replyMsgs.put("CNKI", "链接: https://pan.baidu.com/s/1jIG9J1O 密码: nnra");
		replyMsgs.put("Origin", "链接: https://pan.baidu.com/s/1bIBJ7C 密码: 22hk");
		replyMsgs.put("GPP", "链接: https://pan.baidu.com/s/1jIDlXOi 密码: 7hsa");
		replyMsgs.put("论文投稿", "链接: https://pan.baidu.com/s/1gfLz7wf 密码: icm6");
		replyMsgs.put("易改", "链接: https://pan.baidu.com/s/1kVfZXDd 密码: sk3e");
		replyMsgs.put("1checker", "链接: https://pan.baidu.com/s/1kVfZXDd 密码: sk3e");
		replyMsgs.put("WhiteSmoke", "链接: https://pan.baidu.com/s/1c1JT9M4 密码: cvxh");
		replyMsgs.put("Gram", "链接: https://pan.baidu.com/s/1qX7ZLCS 密码: sr4m");
		replyMsgs.put("易用宝", "链接: https://pan.baidu.com/s/1dFORyGL 密码: 5pun");
		replyMsgs.put("sigmaplot", "链接: https://pan.baidu.com/s/1slRQK6T 密码: 3qjm");
		replyMsgs.put("截图", "链接: https://pan.baidu.com/s/1mhOwZJ6 密码: 4g72");
		replyMsgs.put("冰点文库", "链接: https://pan.baidu.com/s/1crh8q6 密码: eyyr");
		replyMsgs.put("PPT工具", "链接: https://pan.baidu.com/s/1o8qJhYM 密码: 18w8");
		replyMsgs.put("数据恢复", "链接: https://pan.baidu.com/s/1bpjDZJ5 密码: yrew");
		replyMsgs.put("翻墙", "链接: https://pan.baidu.com/s/1jISfaPS 密码: rz2s");

	}

	@Override
	public String hanlderCommonMsg(Map<String, String> msgMap) {
		// 得到发送来的消息类型
		String msgType = msgMap.get("MsgType");
		// String content = msgMap.get("Content");
		// 处理文本消息
		if (msgType.equals(WeixinFinalValue.REQ_MESSAGE_TYPE_TEXT)) {
			return handlerTextMsg(msgMap);
		} else {
			return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, "抱歉，请发送文本消息，暂不接受其他类型消息"));
		}
	}

	public String handlerTextMsg(Map<String, String> msgMap) {
		log.debug("用户发送了文本消息");
		UserBaseInfo user = null;
		SessionBaseInfo sessionBaseInfo = null;

		// 得到发送来的消息类型
		String msgType = msgMap.get("MsgType");
		String reqcontent = msgMap.get("Content");
		String replyContent = "人人实验竭诚为您服务!";
		// 判断用户输入的长度，如果太长就提示，您输入的内容太长，请分条输入
		if (reqcontent.length() > 180) {
			replyContent = "您输入的内容太长，请分条输入";
			return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, replyContent));
		}
		// 得到用户的openId
		String openid = msgMap.get("FromUserName");
		log.debug("openid="+openid);
		// 根据openId维护微信信息表
		UserWx userWx = handlerUserInfo(openid);
		Long uid = userWx.getuUid();
		log.debug("uid=" + uid);
		if (uid != null) {
			sessionBaseInfo = sessionBaseInfoDao.selectByUId(uid);
			user = userBaseInfoDao.selectByUId(uid);
		}
		if (sessionBaseInfo == null || sessionBaseInfo.getsState() != 1) {
			// 如果匹配就自动回复
			if (replyMsgs.containsKey(reqcontent)) {
				log.debug("自动回复");
				replyContent = replyMsgs.get(reqcontent);
				return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, replyContent));
			}

		}
		// 如果不匹配，验证用户是否绑定了手机号()
		// 绑定了手机号
		if (user != null && !StringUtils.isEmpty(user.getuMobile())) {
			log.debug("绑定了手机号");
			// 存在，判断接入状态是否是已接入
			if (sessionBaseInfo != null) {
				Integer ssState = sessionBaseInfo.getsState();
				// 已接入的状态
				if (ssState == 1) {
					log.debug("会话接入状态");
					// 非当前聊天，插入临时消息表
					handlerTempMsg(sessionBaseInfo, reqcontent, msgType, openid);
					// 已接入，回复success
					return "success";
				}
				log.debug("会话其他状态");
				// 其他状态，将状态改为未接入，更新会话表，同时回复，正为您接入人工客服，并在临时消息表中插入消息
				sessionBaseInfo.setsState(0);
				// 未接入状态 来源微信
				sessionBaseInfo.setsState(0);
				sessionBaseInfoDao.updateSession(sessionBaseInfo);
				log.debug("更新会话状态");
				// 将临时表客服id换空
				sessionBaseInfo.setCsId(0L);
				// 同时回复，正为您接入人工客服,并将消息放到redis中
				handlerTempMsg(sessionBaseInfo, reqcontent, msgType, openid);
				replyContent = "正在为您接入人工客服，请稍后...";
				return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, replyContent));
			}
			// 不存在该用户，会话表中插入一条记录，将状态改为未接入
			sessionBaseInfo = new SessionBaseInfo();
			sessionBaseInfo.setuUid(uid);
			sessionBaseInfoDao.insertSelective(sessionBaseInfo);
			log.debug("插入会话表");
			// 同时回复，正为您接入人工客服,并将消息插入redis中
			handlerTempMsg(sessionBaseInfo, reqcontent, msgType, openid);
			replyContent = "正在为您接入人工客服，请稍后...";
			return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, replyContent));
		}
		log.debug("没有绑定手机号");

		// 未绑定了手机号，发送消息绑定手机页面链接，请先验证手机号，人工客服随后就到
		String baseUrl = WeixinContext.getInstance().getBaseUrl();
		String path = "/wx/user/toBindPage.do";
		String url = baseUrl + path;
//		replyContent = "<a href=\"" + url + "\">请点击链接绑定手机号，人工客服稍后接入</a>";
		replyContent = "您好，如果有疑问咨询或意见反馈，请绑定手机号完成注册，不然后台客服MM接收不到您的消息哦！\n\n<a href=\"" + url + "\">点我注册</a>";
		// 将未绑定手机号的消息存入redis中，会话id设为0
		sessionBaseInfo = null;
		handlerTempMsg(sessionBaseInfo, reqcontent, msgType, openid);
		return WeixinMessageUtil.map2xml(WeixinMessageUtil.createTextMsg(msgMap, replyContent));
	}

	/**
	 * 处理临时消息，存放到redis中
	 * 
	 * @param sessionBaseInfo
	 * @param content
	 * @param msgType
	 * @param openid
	 */
	private void handlerTempMsg(SessionBaseInfo sessionBaseInfo, String content, String msgType, String openid) {
		Map<String, String> map = new HashMap<>();
		SessionMessage sessionMessage = null;
		Jedis jedis = null;
		content = content.replaceAll("\"", "\\\"");
		content = content.replaceAll("\\\\", "\\\\");
		content = content.replaceAll("&", "&#38;");
		content = content.replaceAll("<", "&#60;");
		content = content.replaceAll(">", "&#62;");
		content = content.replaceAll(" ", "&#160;");
		content = content.replaceAll("\\r", "&#13;&#10;");
		content = content.replaceAll("\\n", "&#13;&#10;");
		content = content.replaceAll("\\t", "&#009;");
		content = content.replaceAll("\\f", "&012;");
		map.put("type", msgType);
		map.put("msg", content);
		String msgBody = JsonUtil.getInstance().obj2json(map);
		try {
			jedis = jedisPool.getResource();
			if (sessionBaseInfo == null) {
				//未绑定手机号，按openid存
				jedis.rpush("openid_"+openid, msgBody);
//				jedis.expire("openid_"+openid, 3*24 * 60 * 60);
				return;
			}
			sessionMessage = new SessionMessage();
			sessionMessage.setmFrom(sessionBaseInfo.getuUid());
			sessionMessage.setmTo(sessionBaseInfo.getCsId());
			sessionMessage.setsSid(sessionBaseInfo.getsSid());
			sessionMessage.setmSource(0);
			sessionMessage.setmBody(msgBody);
			sessionMessage.setmType(0);
			sessionMessage.setCreateTime(new Date());
			sessionMessage.setmTime(new Date());
			
			String tempMsg = JsonUtil.getInstance().obj2json(sessionMessage);
			//绑定手机号，用ssid存
			jedis.rpush("tempmsg_"+sessionBaseInfo.getsSid(), tempMsg);
//			jedis.expire("tempmsg_"+sessionBaseInfo.getsSid(), 3*24 * 60 * 60);
		} catch (JedisConnectionException e) {
			log.error("redis连接异常", e);
		} finally {
			if (jedis != null) {
				jedis.close();
			}
		}
	}

	/**
	 * 用户信息表的维护
	 * 
	 * @param openId
	 * @return
	 */
	public UserWx handlerUserInfo(String openId) {
		log.debug("处理用户信息，openid=" + openId);
		UserOriginalWx userOriginalWx = null;
		UserWx userWx = wxUserService.selectByOpenId(openId);
		if (userWx != null) {
			return userWx;
		}
		// 查询微信用户的用户信息
		userOriginalWx = wxUserService.queryByOpenid(openId);
		log.debug(userOriginalWx.toString());
		// 不存在， 插入微信用户信息
		userWx = new UserWx();
		userWx.setWxSubscribe(true);
		userWx.setWxOpenId(openId);
		userWx.setWxSubscribeTime(userOriginalWx.getSubscribe_time());
		userWx.setWxUnionId(userOriginalWx.getUnionid());
		int flag1 = wxUserService.insertSelective(userWx);
		if (flag1 <= 0) {
			log.debug("插入微信用户失败");
		}
		return userWx;
	}
}