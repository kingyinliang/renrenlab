package com.renrenlab.cms.communication.dto;

import java.util.Properties;

import com.renrenlab.cms.common.util.PropertiesUtil;
/**
 * 微信基本的配置 装配accessToken
 * @author Renrenlab
 *
 */
public class WeixinContext {
	private String appId;
	private String appSecurt;
	private String baseUrl;
	private String token;
	private AccessToken accessToken;
	private Long requestTime;
	private static WeixinContext wc;
	
	private WeixinContext(){}
	public static WeixinContext getInstance() {
		if(wc==null) {
			wc = new WeixinContext();
			Properties prop = PropertiesUtil.getInstance().load("weixin_basic");
			wc.setAppId(prop.getProperty("appId"));
			wc.setAppSecurt(prop.getProperty("appsecret"));
			wc.setBaseUrl(prop.getProperty("base_url"));
			wc.setToken(prop.getProperty("weixin_token"));
			wc.setRequestTime(System.currentTimeMillis());
		}
		return wc;
	}
	
	
	public AccessToken getAccessToken() {
		return accessToken;
	}
	public void setAccessToken(AccessToken accessToken) {
		this.accessToken = accessToken;
	}

	public Long getRequestTime() {
		return requestTime;
	}

	public void setRequestTime(Long requestTime) {
		this.requestTime = requestTime;
	}

	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getAppSecurt() {
		return appSecurt;
	}
	public void setAppSecurt(String appSecurt) {
		this.appSecurt = appSecurt;
	}
	public String getBaseUrl() {
		return baseUrl;
	}
	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
}
