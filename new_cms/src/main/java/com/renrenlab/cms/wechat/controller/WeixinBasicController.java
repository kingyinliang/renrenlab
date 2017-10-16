package com.renrenlab.cms.wechat.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenlab.cms.common.util.Sha1Util;
import com.renrenlab.cms.common.util.WeixinMessageUtil;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.wechat.service.IWxBasicService;


/**
 * 微信服务号请求传入的controller
 * 
 * @author Renrenlab
 *
 */
@Controller
@RequestMapping(value = "/wx")
public class WeixinBasicController {
	
	@Autowired
	private IWxBasicService wxBasicService;
	
	private Logger log = LoggerFactory.getLogger(this.getClass());

	/**
	 * 首次配置微信服务号时的请求校验
	 * 
	 * @param req
	 * @param resp
	 * @param signature
	 * @param timestamp
	 * @param nonce
	 * @param echostr
	 * @throws IOException
	 */
	@RequestMapping(value = "/wechat", method = RequestMethod.GET)
	public void handlerGet(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam("signature") String signature, @RequestParam("timestamp") String timestamp,
			@RequestParam("nonce") String nonce, @RequestParam("echostr") String echostr) throws IOException {

		log.debug("传入参数为signature:" + signature + " timestamp:" + timestamp + " nonce:" + nonce);
		String[] arrs = { WeixinContext.getInstance().getToken(), nonce, timestamp };

		// 将token、timestamp、nonce三个参数进行字典序排序
		Arrays.sort(arrs);
		StringBuffer sb = new StringBuffer();
		for (String a : arrs) {
			sb.append(a);
		}
		// 用sha1加密
		String sha1 = Sha1Util.sha1(sb.toString());
		if (sha1.equals(signature)) {
			try {
				log.debug("参数验证通过");
				resp.getWriter().print(echostr);
			} catch (Exception e) {
				e.printStackTrace();
				log.error("错误：" + e);
			}
		}
	}
	
	/**
	 * 微信消息进入的接口
	 * @param resp
	 * @param req
	 * @throws IOException
	 */
	@RequestMapping(value="/wechat", method = RequestMethod.POST)
	public void wechatPost(HttpServletResponse resp, HttpServletRequest req) throws IOException {
		log.debug("微信用户消息进入后台");
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/xml;charset=utf-8");
		resp.setCharacterEncoding("utf-8");
		//处理微信过来的消息并返回
		String respMessage = this.wxBasicService.basicService(req);
		if(!WeixinMessageUtil.isEmpty(respMessage)){
			resp.getWriter().write(respMessage);
		}
	
	}
	
	
	@RequestMapping(value="/wechat/sendMsgToAll", method = RequestMethod.GET)
	@ResponseBody
	public String SendMsgToAll(HttpServletResponse resp, HttpServletRequest req) throws IOException {
		int flag = wxBasicService.sendMsgToAll();
		if(flag==1){
			return "发布失败";
		}
		return "发布成功";
	}
	


}
