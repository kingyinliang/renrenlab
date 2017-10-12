package com.renrenlab.rlab.controller;

import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.CaptchaGenerator;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.UserUtil;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserUploadTmp;
import com.renrenlab.rlab.service.UploadTmpService;
import com.renrenlab.rlab.service.UserBaseInfoService;
import com.renrenlab.rlab.vo.LoginResult;
import com.renrenlab.rlab.vo.Result;
import com.renrenlab.rlab.vo.UserSimpleInfo;
import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;

/**
 * Created by wanshou on 2017/5/23.
 * 用户模块
 */
@Controller
@RequestMapping("/front/user")
public class FrontUserController {

    @Autowired
    private UserBaseInfoService userBaseInfoService;

    @Autowired
    private UploadTmpService uploadTmpService;

    private static final CaptchaGenerator captchagenerator = new CaptchaGenerator();

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 未登录跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}",isMobileDevice);
        if(isMobileDevice){
            return "/mobile/page/login";
        }else{
            return "/front/page/login";
        }
    }

    /**
     * 未登录跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/text/login", method = RequestMethod.GET)
    public String toTextLogin(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}",isMobileDevice);
        if(isMobileDevice){
            return "/mobile/page/login_note";
        }else{
            return "/front/page/login_note";
        }
    }

    /**
     * 跳转到用户中心页面
     * @return
     */
    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public String toUserCenter(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}",isMobileDevice);
        if(isMobileDevice){
            return "/mobile/page/user_center";
        }else{
            return "/front/manage/user_center";
        }
    }

    /**
     * 为注册用户跳转到注册页面
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String toRegister(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}",isMobileDevice);
        if(isMobileDevice){
            return "/mobile/page/register";
        }else{
            return "/front/page/register";
        }
    }

    /**
     * 跳转到用户找回密码页面
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.GET)
    public String toRestPassword(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}",isMobileDevice);
        if(isMobileDevice){
            return "/mobile/page/find_password";
        }else{
            return "/front/page/find_pwd";
        }
    }

    /**
     * 用户登录
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public LoginResult login(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
    	Result<UserBaseInfo> result = userBaseInfoService.login(userSimpleInfo, session);
    	if(result.getCode() != 0){
    		session.setAttribute("code", result.getCode());
            session.setAttribute("message", result.getMessage());
    		return new LoginResult(result.getCode(), result.getMessage(), (Integer)session.getAttribute("error"));
    	}else{
    		session.setAttribute("uid", result.getT().getuUid());
            session.setAttribute("nickname", result.getT().getuNickname());
            session.setAttribute("mobile", result.getT().getuMobile());
            session.setAttribute("avatar", result.getT().getuAvatar());
            session.setAttribute("type", com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
            session.removeAttribute("error");
            session.removeAttribute("code");
            session.removeAttribute("message");
            session.removeAttribute("errorMap");
            return new LoginResult(result.getCode(), result.getMessage(), (Integer)session.getAttribute("type"));
    	}
    }

    /**
     * 用户短信登录
     * @return
     */
    @RequestMapping(value = "/text/login", method = RequestMethod.POST)
    @ResponseBody
    public LoginResult textLogin(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
        Result<UserBaseInfo> result = userBaseInfoService.textLogin(userSimpleInfo, session);
        session.setAttribute("uid", result.getT().getuUid());
        session.setAttribute("nickname", result.getT().getuNickname());
        session.setAttribute("mobile", result.getT().getuMobile());
        session.setAttribute("avatar", result.getT().getuAvatar());
        return new LoginResult(result.getCode(), result.getMessage(), (Integer) com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
    }

    /**
     * 用户注册
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> register(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        Result<UserBaseInfo> result = userBaseInfoService.register(userSimpleInfo, session);
        session.setAttribute("uid", result.getT().getuUid());
        session.setAttribute("name", result.getT().getuName());
        session.setAttribute("nickname", result.getT().getuNickname());
        session.setAttribute("mobile", result.getT().getuMobile());
        session.setAttribute("avatar", result.getT().getuAvatar());
        session.setAttribute("type", (Integer)com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 修改密码
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/modify/password", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyPassword(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
        userBaseInfoService.modifyPassword((Long)session.getAttribute("uid"), userSimpleInfo.getOldPassword(), userSimpleInfo.getPassword());
        session.removeAttribute("uid");
        session.removeAttribute("nickname");
        session.removeAttribute("mobile");
        session.removeAttribute("avatar");
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 修改用户昵称
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/modify/user", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyUserBaseInfo(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
        UserBaseInfo userBaseInfo = new UserBaseInfo();
        userBaseInfo.setuUid((Long)session.getAttribute("uid"));
        userBaseInfo.setuNickname(userSimpleInfo.getNickname());
        userBaseInfoService.modifyUserBaseInfo(userBaseInfo);
        if(!StringUtils.isBlank(userSimpleInfo.getNickname())){
            session.setAttribute("nickname", userSimpleInfo.getNickname());
            session.setAttribute("simpleNickName", UserUtil.cutUserNickName(userSimpleInfo.getNickname()));
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 重置密码
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> resetPassword(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
        userBaseInfoService.resetPassword(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 绑定手机号
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/bindMobile", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> bindMobile(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
        userBaseInfoService.resetPassword(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     *退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String toLogout(Model model, @RequestParam(required = false,  value = "curURI") String curURI, HttpSession session) {
        String param = null;
        try{
            session.removeAttribute("uid");
            session.removeAttribute("nickname");
            session.removeAttribute("mobile");
            session.removeAttribute("avatar");
            session.removeAttribute("simpleNickName");

            session.removeAttribute("u_permisssion_array");
            session.removeAttribute("u_permisssion");
            session.removeAttribute("u_rid");
            session.removeAttribute("r_description");
            session.removeAttribute("u_r_name");

            param = StringUtils.isBlank(curURI) ? "" : URLEncoder.encode(curURI, "UTF-8");
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/front/user/login?curURI="+param;
    }

    /**
     * 发送验证码
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/sendVerifyCode", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> sendVerifyCode(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session){
    	userBaseInfoService.sendVerifyCode(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 获取图形验证码
     * @param request
     * @param response
     */
    @RequestMapping(value = "/validateCode", method = RequestMethod.GET)
    public void getValidateCode(HttpServletRequest request, HttpServletResponse response) {
        HttpSession httpSession = request.getSession();
        response.setContentType("image/jpeg");
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        try {
            String validateCode = captchagenerator.generateOneAndWriteToStream(response.getOutputStream());
            httpSession.setAttribute("validateCode", validateCode);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @RequestMapping(value = "/wx/login", method = RequestMethod.GET)
    public void wxRedirect(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String url = Constant.WX_OPEN_QRCONNECT.replace("STATE", request.getSession().getId());
        response.sendRedirect(url);
    }

    @RequestMapping(value = "/wx/callback", method = RequestMethod.GET)
    public void wxCallback(String code, String state, HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession httpSession = request.getSession();
        try {
            if(StringUtils.isBlank(code) && StringUtils.isBlank(state)){
                logger.info("[wx] 没有获取到响应参数");
            }else{
                logger.info("code值为:"+code);
                //通过code获取access_token
                String codeUrl = Constant.WX_OPEN_ACCESS_TOKEN.replace("CODE", code);
                String result = HttpClientUtils.getSend(codeUrl);
                JSONObject object = JSONObject.fromObject(result);
                String access_token = (String) object.get("access_token");
                String openid = (String) object.get("openid");
                String unionid = (String) object.get("unionid");
                //通过access_token获取用户信息
                if(!StringUtils.isBlank(access_token) && !StringUtils.isBlank(openid) && !StringUtils.isBlank(unionid)){
                    String userinfoUrl = Constant.WX_OPEN_USER_INFO.replace("ACCESS_TOKEN", access_token).replace("OPENID", openid);
                    String userinfo = HttpClientUtils.getSend(userinfoUrl);
                    JSONObject snsuserinfo = JSONObject.fromObject(userinfo);
                    String headimgurl = (String) snsuserinfo.get("headimgurl");
                    String nickname = (String) snsuserinfo.get("nickname");
                    userBaseInfoService.wxLogin(openid, unionid);
                    if(!StringUtils.isBlank(headimgurl) && !StringUtils.isBlank(nickname)){
                        httpSession.setAttribute("nickname", nickname);
                        httpSession.setAttribute("avatar", headimgurl);
                        httpSession.setAttribute("uid", 0L);
                        httpSession.setAttribute("type", 0);
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("http://www.renrenlab.com/rlab/page/home");
    }

    /**
     * 用户上传仪器
     * @param userUploadTmp
     * @return
     */
    @RequestMapping(value = "/instrument/upload", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> postInstrument(@RequestBody UserUploadTmp userUploadTmp, HttpSession session){
        Long uid = (Long) session.getAttribute("uid");
        if(uid != null && userUploadTmp != null){
            userUploadTmp.setuUid(uid);
            uploadTmpService.upload(userUploadTmp);
        }
        return ResponseHelper.createSuccessResponse();
    }
    
}
