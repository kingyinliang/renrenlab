package com.renrenlab.cms.communication.service.impl;

import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.communication.dto.AccessToken;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.service.IProviderService;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * 提供给第三方服务
 *
 * Created by lihongxun on 2017/5/25.
 */
@Service
public class ProviderServiceImpl implements IProviderService {

    private static Logger logger = LoggerFactory.getLogger(ProviderServiceImpl.class);

    @Autowired
    private RefreshAccessTokenTask refreshAccessTokenTask;

    @Override
    public AccessToken getToken(HttpServletRequest request, Long timestamp, String token) {
        // access_token 使用时间
        Long useTime = System.currentTimeMillis() - WeixinContext.getInstance().getRequestTime();
        // access_token 剩余有效时间
        Long leftTime = Constant.TOKEN_EFFECTIVE_120 - useTime;
        AccessToken outToken = new AccessToken();
        // access_token 剩余有效时间低于5分钟，重新获取
        if (leftTime < Constant.TOKEN_INVALID_5) {
            refreshAccessTokenTask.refreshToken();
            getToken(request, timestamp, token);
        } else {
            AccessToken accessToken = WeixinContext.getInstance().getAccessToken();
            outToken.setAccess_token(accessToken.getAccess_token());
            outToken.setExpires_in(leftTime.toString());
        }
        return outToken;
    }

    /**
     * 获取请求主机IP地址,如果通过代理进来，则透过防火墙获取真实IP地址;
     *
     * @param request
     * @return
     */
    @Override
    public String getIpAddr(HttpServletRequest request) {

        String ip = request.getHeader("X-real-ip");//先从nginx自定义配置获取
        if (logger.isInfoEnabled()) {
            logger.info("getIpAddress(HttpServletRequest) - X-real-ip - String ip=" + ip);
        }

        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Forwarded-For");
            if (logger.isInfoEnabled()) {
                logger.info("getIpAddress(HttpServletRequest) - X-Forwarded-For - String ip=" + ip);
            }
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("Proxy-Client-IP");
                if (logger.isInfoEnabled()) {
                    logger.info("getIpAddress(HttpServletRequest) - Proxy-Client-IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("WL-Proxy-Client-IP");
                if (logger.isInfoEnabled()) {
                    logger.info("getIpAddress(HttpServletRequest) - WL-Proxy-Client-IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_CLIENT_IP");
                if (logger.isInfoEnabled()) {
                    logger.info("getIpAddress(HttpServletRequest) - HTTP_CLIENT_IP - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getHeader("HTTP_X_FORWARDED_FOR");
                if (logger.isInfoEnabled()) {
                    logger.info("getIpAddress(HttpServletRequest) - HTTP_X_FORWARDED_FOR - String ip=" + ip);
                }
            }
            if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
                ip = request.getRemoteAddr();
                if (logger.isInfoEnabled()) {
                    logger.info("getIpAddress(HttpServletRequest) - getRemoteAddr - String ip=" + ip);
                }
            }
        } else if (ip.length() > 15) {
            String[] ips = ip.split(",");
            for (int index = 0; index < ips.length; index++) {
                String strIp = (String) ips[index];
                if (!("unknown".equalsIgnoreCase(strIp))) {
                    ip = strIp;
                    break;
                }
            }
        }
        return ip;
    }

}
