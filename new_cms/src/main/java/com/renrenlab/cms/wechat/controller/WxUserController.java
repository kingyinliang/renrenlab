package com.renrenlab.cms.wechat.controller;

import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.common.response.ReturnCode;
import com.renrenlab.cms.common.util.ParamUtils;
import com.renrenlab.cms.common.util.PasswordUtils;
import com.renrenlab.cms.common.util.SMSUtils;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.model.VerifyCode;
import com.renrenlab.cms.communication.service.IUserBaseInfoService;
import com.renrenlab.cms.communication.service.IUserCouponService;
import com.renrenlab.cms.communication.service.IVerifyCodeService;
import com.renrenlab.cms.communication.service.IWxUserService;
import com.renrenlab.cms.communication.vo.VerifyCodeApplyInfo;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@Controller
@RequestMapping("/wx/user")
public class WxUserController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private IWxUserService wxUserService;

	@Autowired
	private IUserBaseInfoService userService;

	@Autowired
	private IVerifyCodeService verifyCodeService;

	@Autowired
	private IUserCouponService userCouponService;

	/**
	 * 获取手机验证码
	 * 
	 * @param applyInfo
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/verifyCode", method = RequestMethod.POST)
	@ResponseBody
	public Response<?> getVericode(@RequestBody VerifyCodeApplyInfo applyInfo, HttpSession session,@RequestParam(value = "mv_",required = false) String token) {

		log.info("***********************************getVericode*****************************");
		log.info("verifyCode token="+token);
		// 从session中获取OPENID
		String wxOpenId = (String) session.getAttribute("OPENID");
		 //wxOpenId="oWq6swgb98_TmNQD866_MxFgKo34";
		final String phone = applyInfo.getPhone();
		// 从session中获取OPENID
		Object response = null;
		String tokenValue = (String) session.getAttribute("req_"+token);
		log.info("验证码-----1111111111111111111111111");
		if(StringUtils.isNotBlank(tokenValue)){
			log.info("验证码-----1111111111111111111111111");
			try {
				Integer seconds = 0;
				while(!Thread.interrupted() && seconds < 30){
					response = session.getAttribute(token);
					if(response == null){
						log.info("验证码-----22222222222222222222222");
						seconds += 1;
						TimeUnit.MILLISECONDS.sleep(500);
					}else {
						log.info("验证码-----33333333333333333333333");
						break;
					}
				}
			}catch (InterruptedException e){
				log.error("获取验证码中断异常");
			}
			log.info("验证码-----4444444444444444444444444444");
			return (Response<?>) response;
		}else{
			log.info("验证码-----5555555555555555555555555555");
			session.setAttribute("req_"+token, token);
		}
		session.setAttribute(token,null);
		log.info("验证码-----6666666666666666666666666666");
		UserBaseInfo user = userService.selectByuPhone(phone);
		UserWx userWxExist=null;
		if(user!=null){
			userWxExist = wxUserService.selectByUserId(user.getuUid());
		}
		UserWx userWx = wxUserService.selectByOpenId(wxOpenId);
		// 手机号已经被别人绑定过了
		if (userWxExist != null && userWx != null && wxOpenId!=null && !wxOpenId.equals(userWxExist.getWxOpenId())) {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("该号码已绑定"));
			return ResponseHelper.createBusinessErrorResponse("该号码已绑定");
		}

		// 校验手机号是否合法
		ParamUtils.validateMobileNumber(phone);
		String valid = (String) session.getAttribute("valid");
		String validateCode = applyInfo.getValidateCode();

		boolean bl = validateCode == null || "".equals(validateCode) || !validateCode.equalsIgnoreCase(valid);

		if (bl) {
			session.setAttribute(token,ResponseHelper.createResponse(ReturnCode.VALIDATE_CODE_ERROR, "对不起，图像验证码错误"));
			return ResponseHelper.createResponse(ReturnCode.VALIDATE_CODE_ERROR, "对不起，图像验证码错误");
		}
		// 校验是否频繁发送验证码
		VerifyCode vc = verifyCodeService.selectByPhoneAndGraphCode(phone, validateCode);
		if (vc != null && ParamUtils.validateIMGVerifyCode(vc, validateCode)) {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("验证码太频繁"));
			return ResponseHelper.createBusinessErrorResponse("验证码太频繁");
		}

		// 生成随机验证码
		Random random = new Random();
		int num = random.nextInt(899999) + 100000;
		final String vericode = String.valueOf(num);
		log.info("vericode是" + vericode);
		String message = "您好，您的验证码为：" + vericode + "，有效期10分钟【人人实验】";
		boolean sendRes = SMSUtils.sendMessage(phone, message);
		if (sendRes) {
			// session放入电话验证码
			long timeoutTime = System.currentTimeMillis() + ParamUtils.VERICODE_TIME * 1000;
			if (vc == null) {
				vc = new VerifyCode();
				vc.setvPhone(phone);
			}
			vc.setvId(null);
			vc.setId(null);
			vc.setvDeadline(timeoutTime);
			vc.setvSmscode(vericode);
			vc.setvGraphcode(validateCode);
			verifyCodeService.insertSelective(vc);
			session.setAttribute(phone, vericode);
			log.info("***********************************0000000000000000000000000000*****************************");
			session.setAttribute(token,ResponseHelper.createSuccessResponse());
			return ResponseHelper.createSuccessResponse();
		} else {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("验证码发送失败！"));
			return ResponseHelper.createBusinessErrorResponse("验证码发送失败！");
		}

	}

	/**
	 * 绑定跳转页面
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/toBindPage")
	public String toBindPage(Model model, HttpSession session, HttpServletRequest resq) {
		log.debug("绑定手机页面");
		String retUrl = "/wechat/jsp/error"; // 错误页面
		model.addAttribute("errorMsg", "请在微信端打开");
		String wxOpenId = (String) session.getAttribute("OPENID");
		//wxOpenId="oWq6swgb98_TmNQD866_MxFgKo34";
		if (StringUtils.isBlank(wxOpenId)) {
			log.info("绑定的openId为空返回错误页面");
			return retUrl;
		}
		UserWx userWx = wxUserService.selectByOpenId(wxOpenId);
		if (userWx == null) {
			log.info("绑定的wxUser为空返回错误页面");
			model.addAttribute("errorMsg", "请重新关注");
			return retUrl;
		}
		String flag = resq.getParameter("action");
		if (StringUtils.isNotBlank(flag)) {
			// 重置密码
			model.addAttribute("action", 1);
		} else {
			model.addAttribute("action", 0);
		}
		// 绑定手机
		if (userWx.getuUid() != null) {
			UserBaseInfo user = userService.selectByUserId(userWx.getuUid());
			if (user == null) {
				log.info("绑定的user为空返回错误页面");
				return retUrl;
			}
			if (StringUtils.isBlank(user.getuMobile())) {
				log.info("正常跳转绑定页面");
				retUrl = "wechat/jsp/bindPhone";
			}
			if("1".equals(flag)){
				log.info("重置密码");
				retUrl = "wechat/jsp/bindPhone";
			}
			model.addAttribute("errorMsg", "您已绑定过手机");
			log.info("最后的返回页面： " + retUrl);
			return retUrl;
		}
		retUrl = "wechat/jsp/bindPhone";
		return retUrl;
	}

	/**
	 * 根据手机查询是否绑定过 -手机短信是否正确 -根据wxOpenId查询用户信息- 更新用户电话 绑定手机
	 */
	@RequestMapping(value = "/wxBindPhone", method = RequestMethod.POST)
	@ResponseBody
	public synchronized Response<?> wxBindPhone(@RequestBody VerifyCodeApplyInfo applyInfo, HttpSession session,@RequestParam(value = "token",required = false) String token) {
		log.info("wxBindPhone token="+token);
		System.out.println(session.getId()+"*************************************************************");
		Object response = null;
		String tokenValue = (String) session.getAttribute("req_"+token);
		if(StringUtils.isNotBlank(tokenValue)){
			try {
				Integer seconds = 0;
				log.info("111111*************************************************************");
				while(!Thread.interrupted() && seconds < 30){
					response = session.getAttribute(token);
					if(response == null){
						log.info("2222*************************************************************");
						seconds += 1;
						TimeUnit.MILLISECONDS.sleep(500);
					}else {
						log.info("333333333*************************************************************");
						break;
					}
				}
			}catch (InterruptedException e){
				log.error("绑定手机号码异常");
			}
			log.info("444444444*************************************************************");
			return (Response<?>) response;
		}else{
			log.info("555*************************************************************");
			session.setAttribute("req_"+token, token);
		}
		log.info("666666*************************************************************");
		session.setAttribute(token,null);
		// 从session中获取OPENID
		String wxOpenId = (String) session.getAttribute("OPENID");
//		wxOpenId="oWq6swgb98_TmNQD866_MxFgKo34";
		String password= PasswordUtils.encrypt(applyInfo.getPassword());
		if (StringUtils.isBlank(wxOpenId)) {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("wxOpenId为空"));
			return ResponseHelper.createBusinessErrorResponse("wxOpenId为空");
		}
        log.info(applyInfo.toString());
		String phone = applyInfo.getPhone();
		String verifyCode = applyInfo.getValidateCode();

		UserBaseInfo user = userService.selectByuPhone(phone);
		UserWx userWx = wxUserService.selectByOpenId(wxOpenId);
		String vericode = (String) session.getAttribute(phone);
		log.info("vericode ：" + vericode);
		boolean veri1 = StringUtils.isBlank(vericode);
		log.info("verifyCode ：" + verifyCode);
		log.info("vc == null：" + veri1);
		boolean b = !verifyCode.equals(vericode);
		log.info("b ：" + b);
		if (veri1 || b) {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("验证码不对！"));
			return ResponseHelper.createBusinessErrorResponse("验证码不对！");
		}
		if (userWx == null) {
			session.setAttribute(token,ResponseHelper.createBusinessErrorResponse("没有此用户"));
			return ResponseHelper.createBusinessErrorResponse("没有此用户");
		}
		Long uId = userWx.getuUid();
		log.info("1 uId ：" + uId);
		// 用户绑定
		if (uId == null) {
			if (user == null) {
				// 注册
				UserOriginalWx originalUser = wxUserService.queryByOpenid(wxOpenId);
				log.info("2 originalUser ：" + originalUser.toString());
				user = new UserBaseInfo();
				user.setuAvatar(originalUser.getHeadimgurl());
				user.setuMobile(phone);
				user.setuNickname(originalUser.getNickname());
				user.setuPassword(password);
				log.info("3 originalUser.getSex() ：" + originalUser.getSex());
				switch (originalUser.getSex()) {
				case 0:
					user.setuSex(null);
					break;
				case 1:
					user.setuSex(true);
					break;
				case 2:
					user.setuSex(false);
					break;
				}
				log.info("4 插入" );
				userService.insertSelective(user);
			}
			// 绑定
			log.info("5 更新" );
			uId=user.getuUid();
			userWx.setuUid(uId);
			wxUserService.updateByOpenIdSelective(userWx);
		}
		log.info("6 " );
		user = userService.selectByUserId(uId);
		user.setuMobile(phone);
		user.setuPassword(password);
		log.info("7 更新"+user.toString() );

		int retInt = userService.updateByUserIdSelective(user);
		log.info("8 retInt 更新" +retInt);

		if (retInt > 0) {
			log.info("9 手机信息");
			wxUserService.handlerPhoneMsg(uId, wxOpenId, applyInfo.getAction());
			// 新老后台数据同步
			int flag = userService.synchronizeData(user);

			log.info("----------synchronizeData----------" + flag);
		}
		log.info("10 手机信息");
		session.removeAttribute(phone);
		// 判定是否有标签
		int flag = userCouponService.handlerRelation(wxOpenId, uId);
		log.info("11 flag"+flag);
		if (flag == 1) {
			session.setAttribute(token,ResponseHelper.createCollegeActivityResponse());
			return ResponseHelper.createCollegeActivityResponse();
		}
		session.setAttribute(token,ResponseHelper.createSuccessResponse());
		return ResponseHelper.createSuccessResponse();
	}

}
