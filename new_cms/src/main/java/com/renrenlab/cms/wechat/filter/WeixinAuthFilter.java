package com.renrenlab.cms.wechat.filter;


import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dto.WeixinContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;


/**
 * 微信网页授权
 * 
 * @author Renrenlab
 *
 */
public class WeixinAuthFilter implements Filter {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest) request;
		HttpServletResponse hResponse = (HttpServletResponse) response;
		String openId = (String) hRequest.getSession().getAttribute("OPENID");
		log.info("网页授权");
		log.info("ip:" + request.getRemoteAddr());
		if (openId == null) {
			String agent = hRequest.getHeader("User-Agent");
			if (agent != null && agent.toLowerCase().indexOf("micromessenger") >= 0) {
				String code = request.getParameter("code");
				String state = request.getParameter("state");
				if (code != null && state != null && state.equals("1")) {
					// 通过Code获取openid来进行授权
					String url = WeixinFinalValue.AUTH_GET_OID;
					url = url.replace("APPID", WeixinContext.getInstance().getAppId())
							.replace("SECRET", WeixinContext.getInstance().getAppSecurt()).replace("CODE", code);
					String json = WeixinBasicUtil.sendGet(url);
					log.debug("json："+json);
					openId = JsonUtil.getMapper().readTree(json).get("openid").asText();
					log.info("openId："+openId);
					hRequest.getSession().setAttribute("OPENID", openId);
				} else {
					String path = hRequest.getRequestURL().toString();
					String query = hRequest.getQueryString();
					if (query != null) {
						path = path + "?" + query;
					}
					String uri = WeixinFinalValue.AUTH_URL;
					uri = uri.replace("APPID", WeixinContext.getInstance().getAppId())
							.replace("REDIRECT_URI", URLEncoder.encode(path, "UTF-8")).replace("SCOPE", "snsapi_base")
							.replace("STATE", "1");
					log.debug("uri："+uri);
					hResponse.sendRedirect(uri);
					return;
				}
			}
		}
		chain.doFilter(hRequest, hResponse);
	}

	@Override
	public void destroy() {

	}

}
