package com.renrenlab.rlab.common.shiro.filter;

import com.renrenlab.rlab.vo.Result;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.AuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;

public class RoleAuthorizationFilter extends AuthenticationFilter {

    private static int bytes = 1024;
    private static int startByte = 0;
    private static int endByte = 0;

    /**
     * shiro 授权失败会进入此方法 判断是否是ajax请求
     */
    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        String serlvetPath = httpRequest.getServletPath();
        Subject subject = getSubject(request, response);
        if (subject.getPrincipal() == null) {
            // 这里判断是否为ajax请求且是以.do结尾的
            // 如果不是会走shiro默认的权限流程 
            if (isAjax(httpRequest) && serlvetPath.contains(".do")) {
                returnJsonResult(httpResponse, "您尚未登录或登录时间过长,请重新登录!");
            } else {
                saveRequestAndRedirectToLogin(request, response);

            }
        }
        return false;
    }

    private void returnJsonResult(HttpServletResponse httpResponse, String message) {
        httpResponse.setStatus(301);
        httpResponse.setHeader("Content-type", "application/json;charset=UTF-8");
        Result result = new Result(301, "");
        result.setMessage(message);
        String jsonStr = com.alibaba.fastjson.JSONObject.toJSONString(result);
        try {
            OutputStream os = httpResponse.getOutputStream();
            byte[] jsonByte = jsonStr.getBytes("UTF-8");
            int count = jsonByte.length;
            while (count > 0) {
                if (count < 1024) {
                    endByte = endByte + count;
                } else {
                    endByte = endByte + bytes;
                }
                os.write(jsonByte, startByte, endByte);
                startByte = endByte;
                count = count - bytes;
            }
        } catch (Exception e) {
        }

    }

    /**
     * 判断ajax请求
     *
     * @param request
     * @return
     */
    private boolean isAjax(HttpServletRequest request) {
        return (request.getHeader("X-Requested-With") != null
                && "XMLHttpRequest".equals(request.getHeader("X-Requested-With").toString()));
    }

}