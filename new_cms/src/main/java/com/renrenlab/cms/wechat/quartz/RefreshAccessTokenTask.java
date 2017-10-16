package com.renrenlab.cms.wechat.quartz;

import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.PropertiesUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dto.AccessToken;
import com.renrenlab.cms.communication.dto.WeixinContext;

/**
 * 定时刷新access_token任务
 * @author Renrenlab
 *
 */
@Component
public class RefreshAccessTokenTask {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	public void refreshToken() {
		log.info("开始刷新access_token");
		String url = WeixinFinalValue.ACCESS_TOKEN_URL;
		Properties prop = PropertiesUtil.getInstance().load("weixin_basic");
		String appId = prop.getProperty("appId");
		String appsecret = prop.getProperty("appsecret");
		url = url.replaceAll("APPID", appId);
		url = url.replaceAll("APPSECRET", appsecret);
		String content = WeixinBasicUtil.sendGet(url);
		if(WeixinBasicUtil.checkRequestSucc(content)) {
			AccessToken at = (AccessToken)JsonUtil.getInstance().json2obj(content, AccessToken.class);
			log.info(at.getAccess_token());
			WeixinContext.getInstance().setAccessToken(at);
		} else if(WeixinBasicUtil.getRequestCode(content)==WeixinFinalValue.FULLACCESSTOKEN){
			log.error("acesstoken调用次数达到上限，无法提供服务");
			return;
		}else{
			refreshToken();
		}
	}
}
