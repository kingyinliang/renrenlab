package com.renrenlab.rlab.common.interceptor;

import com.renrenlab.rlab.common.util.ConfigUtil;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 访问特定服务模块使用二级域名
 */
@Component
public class URLInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private final String env = ConfigUtil.getProperty("env");


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws IOException {
        if (env.equals("1")) {
            return true;
        }
        if (handler instanceof HandlerMethod) {
            //获取URI
            String uri = request.getRequestURI();
            String queryString = "?" + request.getQueryString();
            StringBuffer url = request.getRequestURL();
            String domain = url.delete(url.length() - request.getRequestURI().length(),
                    url.length()).toString();

            //科研服务
            if (uri.contains("/service/keyan") && domain.equals("http://fix.renrenlab.com")) {
                if (queryString.equals("?null") || queryString.equals("?")) {
                    WebUtils.issueRedirect(request, response, "http://keyan.fix.renrenlab.com" + uri);
                } else {
                    WebUtils.issueRedirect(request, response, "http://keyan.fix.renrenlab.com" + uri + queryString);
                }
            }
            if (domain.contains("keyan") && !uri.contains("service/keyan")) {
                if (queryString.equals("?null") || queryString.equals("?")) {
                    WebUtils.issueRedirect(request, response, "http://fix.renrenlab.com" + uri);
                } else {
                    WebUtils.issueRedirect(request, response, "http://fix.renrenlab.com" + uri + queryString);
                }
            }

            //质量服务
            if (uri.contains("/service/zhiliang") && domain.equals("http://fix.renrenlab.com")) {
                if (queryString.equals("?null") || queryString.equals("?")) {
                    WebUtils.issueRedirect(request, response, "http://quality.fix.renrenlab.com" + uri);
                } else {
                    WebUtils.issueRedirect(request, response, "http://quality.fix.renrenlab.com" + uri + queryString);
                }
            }
            if (domain.contains("quality") && !uri.contains("service/zhiliang")) {
                if (queryString.equals("?null") || queryString.equals("?")) {
                    WebUtils.issueRedirect(request, response, "http://fix.renrenlab.com" + uri);
                } else {
                    WebUtils.issueRedirect(request, response, "http://fix.renrenlab.com" + uri + queryString);
                }
            }

        }
        return true;
    }
}