package com.renrenlab.cms.communication.controller;

import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.common.util.IpWhiteTable;
import com.renrenlab.cms.common.util.MD5Util;
import com.renrenlab.cms.communication.dto.AccessToken;
import com.renrenlab.cms.communication.exception.ResponseEntity;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.provider.ProviderErrorIpException;
import com.renrenlab.cms.communication.exception.provider.ProviderErrorTokenException;
import com.renrenlab.cms.communication.service.IProviderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * 给第三方提供信息api
 *
 * Created by lihongxun on 2017/5/24.
 */
@Controller
@RequestMapping("/api/provider")
public class ProviderController {

    static final Logger _LOG = LoggerFactory.getLogger(ProviderController.class);

    @Autowired
    private IProviderService providerService;

    /**
     * 提供给第三方access_token
     *
     * @param request
     * @param timestamp
     * @param token
     * @return
     */
    @RequestMapping(value = "/getaccesstoken", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getAccessToken(HttpServletRequest request, @RequestParam Long timestamp, @RequestParam String token) {
        AccessToken accessToken = null;
        try {
            // 请求ip不在白名单中
            if (!IpWhiteTable.WHITE_TABLE.contains(providerService.getIpAddr(request)))
                return ResponseHelper.createResponse(ResponseEntity.PROVIDER_IP_ERROR.getCode(),
                        ResponseEntity.PROVIDER_IP_ERROR.getMessage());

            // 请求token非法
            if (!token.equalsIgnoreCase(MD5Util.MD5(IpWhiteTable.APP_ID + timestamp)))
                return ResponseHelper.createResponse(ResponseEntity.PROVIDER_TOKEN_ERROR.getCode(),
                        ResponseEntity.PROVIDER_TOKEN_ERROR.getMessage());

            // 请求token过期 超过2分钟
            if (System.currentTimeMillis() - timestamp > Constant.TOKEN_OVERTIME_2)
                return ResponseHelper.createResponse(ResponseEntity.PROVIDER_TOKEN_OVERDUE.getCode(),
                        ResponseEntity.PROVIDER_TOKEN_OVERDUE.getMessage());

            accessToken = providerService.getToken(request, timestamp, token);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(accessToken);
    }


}
