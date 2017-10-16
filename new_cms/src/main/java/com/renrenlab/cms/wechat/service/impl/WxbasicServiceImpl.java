package com.renrenlab.cms.wechat.service.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.common.constant.WeixinFinalMessage;
import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.DuplicateMessageUtil;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.common.util.WeixinMessageUtil;
import com.renrenlab.cms.communication.dao.UserBaseInfoDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import com.renrenlab.cms.wechat.service.IWxBasicService;
import com.renrenlab.cms.wechat.service.IWxCommonMsgService;
import com.renrenlab.cms.wechat.service.IWxEventMsgService;

@Service("wxBasicService")
public class WxbasicServiceImpl implements IWxBasicService {

	private static final Logger log = LoggerFactory.getLogger(WxbasicServiceImpl.class);
	
	@Autowired
	private IWxEventMsgService wxEventMsgService; 
	@Autowired
	private UserBaseInfoDao userBaseInfoDao; 
	@Autowired
	private UserWxDao userWxDao; 
	@Autowired
	private IWxCommonMsgService wxCommonMsgService; 
	@Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
	
	

	/**
	 * 处理微信过来的消息
	 * @throws IOException 
	 */
	@Override
	public String basicService(HttpServletRequest req) throws IOException {
		//1 将请求转解析成xml形式,2将转换好的xml转换成map
		Map<String,String> msgMap = WeixinMessageUtil.reqMsg2Map(req);
		log.debug("传过来的请求"+msgMap);
		//消息排重,过滤重复消息
		if(DuplicateMessageUtil.checkDuplicate(msgMap)) {
			String respMessage = DuplicateMessageUtil.getRel(msgMap);
			return respMessage;
		}
		//得到传来的消息的类型
		String msgType = msgMap.get("MsgType");
		log.debug("传过来的请求类型"+msgType);
		//处理消息
		//1 处理事件消息
		if("event".equals(msgType.trim())) {
			String respMessage = wxEventMsgService.handlerEventMsg(msgMap);
			DuplicateMessageUtil.setRel(msgMap, respMessage);
			return respMessage;
		} else {
			//2 处理普通消息
			String respMessage = wxCommonMsgService.hanlderCommonMsg(msgMap);
			DuplicateMessageUtil.setRel(msgMap, respMessage);
			return respMessage;
		}
	}



	/**
	 * 群发消息给用户
	 * 0成功 1失败
	 */
	@Override
	public int sendMsgToAll() {
		//查询所有绑定了手机号，但密码为空的用户
		List<UserBaseInfo> userList = userBaseInfoDao.selectByPhoneAndPassword();
		List<String> openIdList = new ArrayList<>();
		//根据用户id拿到所有的openid列表
		if(userList.isEmpty()){
			return 1;
		}
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		for(int i=0;i<userList.size();i++){
			UserWx wxUser = userWxDao.selectUserByUuId(userList.get(i).getuUid());
			if(wxUser==null){
				return 1;
			}
			openIdList.add(wxUser.getWxOpenId());
		}
		map.put("touser", openIdList);
		map.put("msgtype", "text");
		map3.put("content", WeixinFinalMessage.SENDMSGTOALL);
		map.put("text", map3);
		String url = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.ADD_MESSAGE_FOR_ALL);
		String msgBody = JsonUtil.getInstance().obj2json(map);
		log.info("--------------" + msgBody + "--------------");
		String rel = WeixinBasicUtil.sendJsonPost(url, msgBody);
		log.info("--------------" + rel + "--------------");
		if (!WeixinBasicUtil.checkRequestSucc(rel)) {
        	if(WeixinBasicUtil.getRequestCode(rel)==WeixinFinalValue.INVALIDACCESSTOKEN){
    			refreshAccessTokenTask.refreshToken();
    			rel=WeixinBasicUtil.sendJsonPost(url, msgBody);
    			if(WeixinBasicUtil.checkRequestSucc(rel)){
    				return 0;
    			}
    		}
        	log.error("群发消息失败：" + WeixinBasicUtil.getRequestMsg(rel));
//            throw new RuntimeException("群发消息失败：" + WeixinBasicUtil.getRequestMsg(rel));
        }
		return 1;
		
	}
	
}
