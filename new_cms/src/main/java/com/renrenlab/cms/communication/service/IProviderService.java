package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.dto.AccessToken;

import javax.servlet.http.HttpServletRequest;

/**
 * 提供给第三方服务
 *
 * Created by lihongxun on 2017/5/25.
 */
public interface IProviderService {

    /**
     * 获取access_token
     *
     * @param request
     * @return
     */
    AccessToken getToken(HttpServletRequest request, Long timestamp, String token);

    /**
     * 获取请求客户端ip地址
     *
     * @param request
     * @return
     */
    String getIpAddr(HttpServletRequest request);

}
