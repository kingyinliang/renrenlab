package com.renrenlab.cms.common.util;
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
    private static final String API_URL = "https://api.bmob.cn/1/requestSms";
    
    //Your Application ID
    private static final String APPLICATION_ID = "e56437ed7fd02d909082b7bf63bd8725";
    //Your REST API Key
    private static final String API_KEY = "75e4fee44d15a9f2a86807b23fe15dbd";
    private static final ClientHttpRequestInterceptor CLIENT_HTTP_REQUEST_INTERCEPTOR = new ClientHttpRequestInterceptor() {

        @Override
        public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution)
                throws IOException {
            HttpHeaders headers = request.getHeaders();
            headers.add("X-Bmob-Application-Id", APPLICATION_ID);
            headers.add("X-Bmob-REST-API-Key", API_KEY);
            return execution.execute(request, body);
        }
    };
    private static final RestTemplate REST_TEMPLATE = new RestTemplate();
    static {
        try {
            TrustManager tm = new X509TrustManager() {
                public void checkClientTrusted(X509Certificate[] chain, String authType)
                        throws CertificateException {
                }

                public void checkServerTrusted(X509Certificate[] chain, String authType)
                        throws CertificateException {
                }

                public X509Certificate[] getAcceptedIssuers() {
                    return null;
                }
            };
            SSLContext sslContext = SSLContext.getInstance("SSL");
            sslContext.init(null, new TrustManager[]{tm}, null);
            SSLContext.setDefault(sslContext);
        } catch (Exception e) {
            logger.error("failed to load keystore.", e);
        }

        REST_TEMPLATE.setRequestFactory(new HttpComponentsClientHttpRequestFactory());

        REST_TEMPLATE.setInterceptors(Collections.singletonList(CLIENT_HTTP_REQUEST_INTERCEPTOR));

        REST_TEMPLATE.setErrorHandler(new ResponseErrorHandler() {
            @Override
            public boolean hasError(ClientHttpResponse response) throws IOException {
                logger.error("sms sending, response code is {}", response.getRawStatusCode());
                return false;
            }

            @Override
            public void handleError(ClientHttpResponse response) throws IOException {

            }
        });
    }
    
    //比目科技
    public static boolean sendMessage_bmob(String phone, String message) {
        try {
            logger.debug("sending sms to {} ===>>>>>>", phone);
            Map<String, String> request = new HashMap<>();
            request.put("mobilePhoneNumber", phone);
            request.put("content", message);
            @SuppressWarnings("unchecked")
			Map<String, String> result = REST_TEMPLATE.postForObject(API_URL, request, Map.class);
            logger.debug("sending sms to {} response : {}", phone, result);
            if (result.get("smsId") == null) {
                return false;
            }
        } catch (Exception e) {
            logger.error("failed sending sms to {}.", phone, e);
            return false;
        }
        return true;
    }

    //华兴软通
	public static boolean sendMessage_smshx(String phone, String message){
        try {
	        logger.debug("sending sms to {} ===>>>>>>", phone);
			
			//以下为所需的参数,中文请先转为16进制再发送
			String strReg = "101100-WEB-HUAX-315123";  		//注册号（由华兴软通提供）
	        String strPwd = "XSXAKVVP";                		//密码（由华兴软通提供）
	        String strSourceAdd = "";   					//子通道号，可为空（预留参数一般为空）
	        String strPhone = phone;						//手机号码，多个手机号用半角逗号分开，最多1000个	
	        String strContent = HttpSend.paraTo16(message);	//短信内容  


	        //以下参数为服务器URL,以及发到服务器的参数
	        String strSmsUrl = "http://www.stongnet.com/sdkhttp/sendsms.aspx";
	        String strSmsParam = "reg=" + strReg + "&pwd=" + strPwd + "&sourceadd=" + strSourceAdd + "&phone=" + strPhone + "&content=" + strContent;;
	        
	        //发送短信
	        String strRes = HttpSend.postSend(strSmsUrl, strSmsParam);
	        logger.debug("sending sms to {} response : {}", phone, strRes);
	        
	        //检查结果
	        if(!strRes.startsWith("result=0")){
	        	return false;
	        }
        } catch (Exception e) {
            logger.error("failed sending sms to {}.", phone, e);
            return false;
        }
        return true;
	}
	
	public static boolean sendMessage(String phone, String message){
		return sendMessage_smshx(phone, message);
	}
	
    public static void main(String[] args) throws Exception {
    	SMSUtils.sendMessage("15726608583", "您好，您的验证码为338323，有效期10分钟【人人实验】");
    }
    
}
