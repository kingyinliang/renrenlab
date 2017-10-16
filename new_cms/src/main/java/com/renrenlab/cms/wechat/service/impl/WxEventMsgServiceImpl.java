package com.renrenlab.cms.wechat.service.impl;

import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.common.constant.WeixinFinalMessage;
import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.WeixinMessageUtil;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserTagMapDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserTagMap;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.model.WxMenu;
import com.renrenlab.cms.communication.service.IWxUserService;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;
import com.renrenlab.cms.wechat.service.IWxEventMsgService;
import com.renrenlab.cms.wechat.service.IWxMenuService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

@Service("wxEventMsgService")
@Transactional
public class WxEventMsgServiceImpl implements IWxEventMsgService {

	private static final Logger log = LoggerFactory.getLogger(WxEventMsgServiceImpl.class);

	@Autowired
	private IWxUserService wxUserService;
	@Autowired
	private UserBaseInfoDao userBaseInfoDao;
	@Autowired
	private IWxMenuService wxMenuService;
	@Autowired
	private UserTagMapDao userTagMapDao;
	@Autowired
	private JedisPool jedisPool;

	@Override
	public String handlerEventMsg(Map<String, String> msgMap) {
		// 得到事件类型
		String event = msgMap.get("Event");
		// 匹配事件类型
		log.debug("传递的事件类型：" + event);
		// 处理关注事件
		if (event.equals(WeixinFinalValue.EVENT_TYPE_SUBSCRIBE)) {
			log.debug("用户关注，开始进行用户信息操作！");
			return handlerSubsribeEvent(msgMap);
		} else if (event.equals(WeixinFinalValue.EVENT_TYPE_UNSUBSCRIBE)) {
			log.debug("用户取消关注");
			// 处理取消关注事件
			return handlerUnSubsribeEvent(msgMap);
		} else if (event.equals(WeixinFinalValue.EVENT_TYPE_CLICK)) {
			log.debug("用户点击菜单");
			// 处理菜单点击事件
			return handlerClickEvent(msgMap);
		} else if (event.equals(WeixinFinalValue.EVENT_TYPE_VIEW)) {
			log.debug("用户跳转页面");
			// 处理菜单视图跳转时间
			return null;
		} else if (event.equals(WeixinFinalValue.EVENT_TYPE_SCAN)) {
			log.debug("扫描二维码");
			return handlerUnScanEvent(msgMap);
		}
		return null;
	}

	/**
	 * 处理扫码推送 1 大学生活动 推送优惠券图文
	 * 
	 * @param msgMap
	 * @return
	 */
	private String handlerUnScanEvent(Map<String, String> msgMap) {
		Map<String, Object> respMsg = WeixinMessageUtil.createTextMsg(msgMap, WeixinFinalMessage.RESP_CONTENT_SCAN);
		// 判断微信用户是否存在
		UserWx userWx = operateUser(msgMap);
		log.debug("userWx" + userWx.toString());
		return handlerActivityReply(msgMap, userWx, respMsg, 1);
	}

	/**
	 * 处理click点击返回菜单表中content
	 *
	 * @param msgMap
	 * @return
	 */
	private String handlerClickEvent(Map<String, String> msgMap) {
		String keyCode = msgMap.get("EventKey");
		WxMenu wm = wxMenuService.selectByWmMenuKey(keyCode);
		if (wm != null && wm.getWmRespType() == 1) {
			Map<String, Object> map = WeixinMessageUtil.createTextMsg(msgMap, wm.getWmContent());
			return WeixinMessageUtil.map2xml(map);
		}
		return "";
	}

	/**
	 * 处理用户取消关注事件
	 *
	 * @param msgMap
	 * @return
	 */
	private String handlerUnSubsribeEvent(Map<String, String> msgMap) {
		// 得到用户的openId
		String openid = msgMap.get("FromUserName");
		// 查询微信用户附录表
		UserWx userWx = wxUserService.selectByOpenId(openid);
		// 判断是否存在
		if (userWx == null) {
			return null;
		}
		// 改变用户的关注状态
		userWx = new UserWx();
		userWx.setWxOpenId(openid);
		userWx.setWxSubscribe(false);
		;
		int flag = wxUserService.updateByOpenIdSelective(userWx);
		if (flag <= 0) {
			log.debug("更新微信用户失败");
		}
		return null;
	}

	/**
	 * 0 处理用户关注事件
	 *
	 * @param msgMap
	 * @return
	 */
	private String handlerSubsribeEvent(Map<String, String> msgMap) {

		String content = WeixinFinalMessage.RESP_CONTENT_SUBSCRIBE;
		// 用户关注后需要返回的信息map
		Map<String, Object> respMsg = WeixinMessageUtil.createTextMsg(msgMap, content);
		UserWx userWx = operateUser(msgMap);
		return handlerActivityReply(msgMap, userWx, respMsg, 0);

	}

	/**
	 * 发送大学生活动的图文消息
	 * 
	 * @param msgMap
	 * @return
	 */
	public Map<String, Object> sendNews(Map<String, String> msgMap) {
		String title = "注册就送1000大学生创新券";
		String description = "人人实验全品类科技资源共享服务创新券免费领取啦，下单立减";
		String baseUrl = WeixinContext.getInstance().getBaseUrl();
		String picUrl = baseUrl + "/wechat/img/banner.png";
		String url = baseUrl + "/wx/activity/getTicket.do";
		Map<String, Object> map = WeixinMessageUtil.createNewsMsg(msgMap, title, description, picUrl, url);
		return map;

	}

	/**
	 * 处理用户操作
	 * 
	 * @param msgMap
	 * @return
	 */
	public UserWx operateUser(Map<String, String> msgMap) {
		String openid = msgMap.get("FromUserName");
		log.debug("用户进入operateUser方法，openid=" + openid);
		// 查询用户微信附录表
		UserWx userWx = wxUserService.selectByOpenId(openid);
		// 判断该微信用户是否存在
		if (userWx != null) {
			// 存在，更新用户信息
			userWx.setWxSubscribe(true);
			userWx.setWxSubscribeTime(new Date());
			int flag = wxUserService.updateByOpenIdSelective(userWx);
			if (flag <= 0) {
				log.debug("更新微信用户失败");
			}
			Long uid = userWx.getuUid();
			if (uid != null) {
				UserBaseInfo userBaseInfo = userBaseInfoDao.selectByUId(uid);
				if (StringUtils.isBlank(userBaseInfo.getuAvatar())) {
					// 查询微信用户的用户信息
					UserOriginalWx userOriginalWx = wxUserService.queryByOpenid(openid);
					userBaseInfo.setuAvatar(userOriginalWx.getHeadimgurl());
					if (StringUtils.isBlank(userBaseInfo.getuNickname())) {
						userBaseInfo.setuNickname(userOriginalWx.getNickname());
					}
					userBaseInfoDao.updateByUIdSelective(userBaseInfo);
				}
			}
			// 更新用户信息
			return userWx;
		}
		// 查询微信用户的用户信息
		UserOriginalWx userOriginalWx = wxUserService.queryByOpenid(openid);
		log.debug(userOriginalWx.toString());
		// 不存在， 插入微信用户信息
		userWx = new UserWx();
		userWx.setWxSubscribe(true);
		userWx.setWxOpenId(openid);
		userWx.setWxSubscribeTime(userOriginalWx.getSubscribe_time());
		userWx.setWxUnionId(userOriginalWx.getUnionid());
		int flag1 = wxUserService.insertSelective(userWx);
		if (flag1 <= 0) {
			log.debug("插入微信用户失败");
		}
		return userWx;

	}

	/**
	 * 
	 * @param msgMap
	 * @param userWx
	 * @param respMsg
	 * @param flag
	 * @return
	 */
	public String handlerActivityReply(Map<String, String> msgMap, UserWx userWx, Map<String, Object> respMsg,
			int flag) {
		String openid = msgMap.get("FromUserName");
		// flag为0 关注事件 flag为1 扫码事件
		String sceneId = msgMap.get("EventKey");
		log.debug("处理大学生活动回复方法");
		if (!StringUtils.isBlank(sceneId) && flag == 0) {
			// qrscene_1，
			sceneId = sceneId.substring(8);
		}
		log.debug("sceneId=" + sceneId);
		Long tId = null;
		if (WeixinFinalMessage.SCNEMEID.equals(sceneId)) {
			tId = Constant.TAG;
			// 判断是否存在真实用户
			Long uid = userWx.getuUid();
			Jedis jedis = null;
			try {
				jedis = jedisPool.getResource();
				jedis.set("tag_" + openid, "" + tId);
				jedis.expire("tag_" + openid, 7 * 24 * 60 * 60);
			} catch (JedisConnectionException e) {
				log.error("redis连接异常", e);
			} finally {
				if (jedis != null) {
					jedis.close();
				}
			}
			if (uid != null) {
				UserTagMap tags = userTagMapDao.selectByUIdAndTId(uid, tId);
				// 判断用户标签是否存在
				if (tags != null) {
					// 用户有此标签,正常返回
					return WeixinMessageUtil.map2xml(respMsg);
				}
				// 用户没有此标签，给用户贴上此标签
				UserTagMap userTagMap = new UserTagMap();
				userTagMap.settTid(tId);
				userTagMap.setuUid(uid);
				userTagMapDao.insertSelective(userTagMap);
				// 推送图文消息
				respMsg = sendNews(msgMap);
				return WeixinMessageUtil.map2xml(respMsg);
			}
			// 推送图文消息
			respMsg = sendNews(msgMap);
			return WeixinMessageUtil.map2xml(respMsg);

		}
		// 扫描的不是本次活动的二维码，正常推送
		return WeixinMessageUtil.map2xml(respMsg);

	}
}
