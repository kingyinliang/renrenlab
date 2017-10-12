package com.renrenlab.rlab.common.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.ResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import java.io.IOException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Jason on 27-7-18.
 */
public class SMSUtils {

	private static final Logger logger = LoggerFactory.getLogger(SMSUtils.class);

	// 华兴软通
	public static boolean sendMessage_smshx(String phone, String message) {
		try {
			logger.debug("sending sms to {} ===>>>>>>", phone);
			// 以下为所需的参数,中文请先转为16进制再发送
			String strReg = "101100-WEB-HUAX-315123"; // 注册号（由华兴软通提供）
			String strPwd = "XSXAKVVP"; // 密码（由华兴软通提供）
			String strSourceAdd = ""; // 子通道号，可为空（预留参数一般为空）
			String strPhone = phone; // 手机号码，多个手机号用半角逗号分开，最多1000个
			String strContent = HttpSend.paraTo16(message); // 短信内容
			// 以下参数为服务器URL,以及发到服务器的参数
			String strSmsUrl = "http://www.stongnet.com/sdkhttp/sendsms.aspx";
			String strSmsParam = "reg=" + strReg + "&pwd=" + strPwd
					+ "&sourceadd=" + strSourceAdd + "&phone=" + strPhone
					+ "&content=" + strContent;
			;
			// 发送短信
			String strRes = HttpSend.postSend(strSmsUrl, strSmsParam);
			logger.debug("sending sms to {} response : {}", phone, strRes);
			// 检查结果
			if (!strRes.startsWith("result=0")) {
				return false;
			}
		} catch (Exception e) {
			logger.error("failed sending sms to {}.", phone, e);
			return false;
		}
		return true;
	}

	public static boolean sendMessage(String phone, String message) {
		return sendMessage_smshx(phone, message);
	}

//	public static void main(String[] args) throws Exception {
//		SMSUtils.sendMessage("18513957736", "您好，您的验证码为338323，有效期10分钟【人人实验】");
//	}

}
