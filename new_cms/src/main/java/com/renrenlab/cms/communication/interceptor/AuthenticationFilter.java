package com.renrenlab.cms.communication.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class AuthenticationFilter implements Filter {

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFilter.class);


	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		//判断用户是否登录
		String url=hRequest.getRequestURL().toString();
		Object csId = hRequest.getSession().getAttribute("csId");
		if(url.contains("/bg/page")){//表示请求的是页面
			//如果请求的是登录页面
			if(url.contains("/bg/page/login")){
				chain.doFilter(hRequest, hResponse);
				return;
			}
			if(csId == null){
				hResponse.sendRedirect("./login.do");
				return;
			}
		}else if(url.contains("/bg/api")){//表示请求的是接口
			//如果请求的是登录接口
			if(url.contains("bg/api/cs/login")){
				chain.doFilter(hRequest, hResponse);
				return;
			}
			if(csId == null){
				try {
					response.setContentType("application/json;charset=UTF-8");
					response.getWriter().print("{\"code\":1003,\"message\": \"用户未登录\"}");
				} catch (Exception e) {
					logger.debug("后台客服登陆过滤器出现异常："+e);
					e.printStackTrace();
				}
				return;
			}
		}
		chain.doFilter(hRequest, hResponse);
	}

	@Override
	public void destroy() {

	}

}
