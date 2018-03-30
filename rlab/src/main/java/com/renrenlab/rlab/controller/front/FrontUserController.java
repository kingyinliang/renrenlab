package com.renrenlab.rlab.controller.front;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.*;
import com.renrenlab.rlab.dao.OrgDao;
import com.renrenlab.rlab.dao.ServiceInfoDao;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.IShiro;
import com.renrenlab.rlab.service.ServiceInfoService;
import com.renrenlab.rlab.service.UploadTmpService;
import com.renrenlab.rlab.service.UserBaseInfoService;
import com.renrenlab.rlab.vo.*;
import net.sf.json.JSONObject;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by wanshou on 2017/5/23.
 * 用户模块
 */
@Controller
@RequestMapping("/user")
public class FrontUserController {

    @Autowired
    private UserBaseInfoService userBaseInfoService;

    @Autowired
    private UploadTmpService uploadTmpService;

    public static String UUID = "uid";
    @Autowired
    private ServiceInfoService infoService;

    @Autowired
    private ServiceInfoDao serviceInfoDao;
    @Autowired
    private OrgDao orgDao;

    @Autowired
    IShiro shiro;


    private static final CaptchaGenerator captchagenerator = new CaptchaGenerator();

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 未登录跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/login";
        } else {
            return "/front/page/login";
        }
    }

    /**
     * 用户登录
     *
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public LoginResult login(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        Result<UserBaseInfo> result = userBaseInfoService.login(userSimpleInfo, session);
        if (result.getCode() != 0) {
            session.setAttribute("code", result.getCode());
            session.setAttribute("message", result.getMessage());
            return new LoginResult(result.getCode(), result.getMessage(), (Integer) session.getAttribute("error"));
        } else {
            session.setAttribute("uid", result.getT().getuUid());
            session.setAttribute("nickname", result.getT().getuNickname());
            session.setAttribute("mobile", result.getT().getuMobile());
            session.setAttribute("avatar", result.getT().getuAvatar());
//            session.setAttribute("type", com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
            session.removeAttribute("error");
            session.removeAttribute("code");
            session.removeAttribute("message");
            session.removeAttribute("errorMap");
            int param = 0;
            if (CollectionUtils.isNotEmpty(shiro.getUserRoles(result.getT().getuUid()))) {
                //如果用户有角色信息，她就拥有进入后台的权限
                param = 1;
            }
            return new LoginResult(result.getCode(), result.getMessage(), param);
//            return new LoginResult(result.getCode(), result.getMessage(), (Integer) session.getAttribute("type"));
        }
    }

    /**
     * 未登录跳转到登录页面
     *
     * @return
     */
    @RequestMapping(value = "/text/login", method = RequestMethod.GET)
    public String toTextLogin(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/login_note";
        } else {
            return "/front/page/login_note";
        }
    }

    /**
     * 跳转到用户中心页面
     *
     * @return
     */
    @RequestMapping(value = "/center", method = RequestMethod.GET)
    public String toUserCenter(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/user_center";
        } else {
            return "/front/manage/user_center";
        }
    }

    /**
     * 未注册用户跳转到注册页面
     *
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String toRegister(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/register";
        } else {
            return "/front/page/register";
        }
    }

    /**
     * 跳转到用户找回密码页面
     *
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.GET)
    public String toRestPassword(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/find_password";
        } else {
            return "/front/page/find_pwd";
        }
    }


    /**
     * 用户短信登录
     *
     * @return
     */
    @RequestMapping(value = "/text/login", method = RequestMethod.POST)
    @ResponseBody
    public LoginResult textLogin(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        Result<UserBaseInfo> result = userBaseInfoService.textLogin(userSimpleInfo, session);
        session.setAttribute("uid", result.getT().getuUid());
        session.setAttribute("nickname", result.getT().getuNickname());
        session.setAttribute("mobile", result.getT().getuMobile());
        session.setAttribute("avatar", result.getT().getuAvatar());
        return new LoginResult(result.getCode(), result.getMessage(), (Integer) com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
    }

    /**
     * 用户注册
     *
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
        session.setAttribute("type", (Integer) com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 用户使用验证码注册，赋予随机密码
     */
    @RequestMapping(value = "/newregister", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> newRegister(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        Result<UserBaseInfo> result = userBaseInfoService.newRegister(userSimpleInfo, session);
        session.setAttribute("uid", result.getT().getuUid());
        session.setAttribute("name", result.getT().getuName());
        session.setAttribute("nickname", result.getT().getuNickname());
        session.setAttribute("mobile", result.getT().getuMobile());
        session.setAttribute("avatar", result.getT().getuAvatar());
        session.setAttribute("type", (Integer) com.alibaba.fastjson.JSONObject.parseArray(result.getT().getuType().toString()).get(2));
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 修改密码
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/modify/password", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyPassword(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        userBaseInfoService.modifyPassword((Long) session.getAttribute("uid"), userSimpleInfo.getOldPassword(), userSimpleInfo.getPassword());
        session.removeAttribute("uid");
        session.removeAttribute("nickname");
        session.removeAttribute("mobile");
        session.removeAttribute("avatar");
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 修改用户昵称
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/modify/user", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyUserBaseInfo(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        UserBaseInfo userBaseInfo = new UserBaseInfo();
        userBaseInfo.setuUid((Long) session.getAttribute("uid"));
        userBaseInfo.setuNickname(userSimpleInfo.getNickname());
        userBaseInfoService.modifyUserBaseInfo(userBaseInfo);
        if (!StringUtils.isBlank(userSimpleInfo.getNickname())) {
            session.setAttribute("nickname", userSimpleInfo.getNickname());
            session.setAttribute("simpleNickName", UserUtil.cutUserNickName(userSimpleInfo.getNickname()));
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 重置密码
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/reset", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> resetPassword(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        userBaseInfoService.resetPassword(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 绑定手机号
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/bindMobile", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> bindMobile(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        userBaseInfoService.resetPassword(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String toLogout(HttpSession session) {
        //清除session中所有信息
        session.invalidate();
        SecurityUtils.getSubject().logout();
        return "redirect:/";
    }

    /**
     * 发送验证码
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/sendVerifyCode", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> sendVerifyCode(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        userBaseInfoService.sendVerifyCode(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 发送快速登录/注册验证码
     *
     * @param userSimpleInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/sendRegisterVerifyCode", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> sendRegisterVerifyCode(@RequestBody UserSimpleInfo userSimpleInfo, HttpSession session) {
        userBaseInfoService.sendVerifyCode(userSimpleInfo, session);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 验证手机号是否存在
     */
    @RequestMapping(value = "/validatePhone", method = RequestMethod.GET)
    @ResponseBody
    public Response validatePhone(@RequestParam String phoneNumber) {
        userBaseInfoService.searchUserBaseInfoByMobile(phoneNumber);
        return ResponseHelper.createSuccessResponse("用户已存在");
    }

    /**
     * 获取图形验证码
     *
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
            if (StringUtils.isBlank(code) && StringUtils.isBlank(state)) {
                logger.info("[wx] 没有获取到响应参数");
            } else {
                logger.info("code值为:" + code);
                //通过code获取access_token
                String codeUrl = Constant.WX_OPEN_ACCESS_TOKEN.replace("CODE", code);
                String result = HttpClientUtils.getSend(codeUrl);
                JSONObject object = JSONObject.fromObject(result);
                String access_token = (String) object.get("access_token");
                String openid = (String) object.get("openid");
                String unionid = (String) object.get("unionid");
                //通过access_token获取用户信息
                if (!StringUtils.isBlank(access_token) && !StringUtils.isBlank(openid) && !StringUtils.isBlank(unionid)) {
                    String userinfoUrl = Constant.WX_OPEN_USER_INFO.replace("ACCESS_TOKEN", access_token).replace("OPENID", openid);
                    String userinfo = HttpClientUtils.getSend(userinfoUrl);
                    JSONObject snsuserinfo = JSONObject.fromObject(userinfo);
                    String headimgurl = (String) snsuserinfo.get("headimgurl");
                    String nickname = (String) snsuserinfo.get("nickname");
                    userBaseInfoService.wxLogin(openid, unionid);
                    if (!StringUtils.isBlank(headimgurl) && !StringUtils.isBlank(nickname)) {
                        httpSession.setAttribute("nickname", nickname);
                        httpSession.setAttribute("avatar", headimgurl);
                        httpSession.setAttribute("uid", 0L);
                        httpSession.setAttribute("type", 0);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("http://www.renrenlab.com");
    }

    /**
     * 用户上传仪器
     *
     * @param userUploadTmp
     * @return
     */
    @RequestMapping(value = "/instrument/upload", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> postInstrument(@RequestBody UserUploadTmp userUploadTmp, HttpSession session) {
        Long uid = (Long) session.getAttribute("uid");
        if (uid != null && userUploadTmp != null) {
            userUploadTmp.setuUid(uid);
            uploadTmpService.upload(userUploadTmp);
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 用户个人中心 服务列表
     *
     * @return
     */
    @RequestMapping(value = "service_list")
    public String getServiceList(Model model,
                                 HttpSession session,
                                 @RequestParam(required = false) String keyword,
                                 @RequestParam(required = false) Integer state,
                                 @RequestParam(required = false) String beginTime,
                                 @RequestParam(required = false) String endTime,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                 @RequestParam(required = false) String order) {

        Long uUid = (Long) session.getAttribute(UUID);
        PageInfo<ServiceInfoCustom> infos = infoService.serviceFrontList(keyword, state,
                beginTime, endTime, pageNo, pageSize, order, uUid);

        //返回该用户是否通过了服务商认证
        String isCertification = null;
        List<Long> orgOids = serviceInfoDao.getOrgOids(uUid);
        for (Long orgOid : orgOids) {
            OrgInfo orgInfo = orgDao.searchOrgInfoByOid(orgOid);
//            if (orgInfo.getOrgType() == 2) {
            if (orgInfo != null)
                isCertification = "true";
//            }
        }

        model.addAttribute("infos", infos);
        model.addAttribute("keyword", keyword);
        model.addAttribute("state", state);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("order", order);
        model.addAttribute("isCertification", isCertification);
        return "/front/manage/service_list";
    }

    @RequestMapping(value = "service_upload_page")
    public String getUploadServicePage(Model mode, HttpSession session) {
        //避免横向越权
        Long uUid = (Long) session.getAttribute(UUID);
        List<Map> orgNames = serviceInfoDao.selectOrgNameByUid(uUid);
        mode.addAttribute("orgNames", orgNames);
        return "/front/manage/service_add";
    }

    @RequestMapping(value = "service_upload", method = RequestMethod.POST)
    @ResponseBody
    public Response<String> uploadService(@RequestBody ServiceInfoCustom serviceInfoCustom) {
        int result = infoService.addService(serviceInfoCustom);
        return result > 0 ? ResponseHelper.createSuccessResponse(serviceInfoCustom.getServiceId() + "")
                : ResponseHelper.createSuccessResponse("服务上传失败");
    }

    @RequestMapping(value = "service_detail_page")
    public String getServiceDetailPage(Model model, @RequestParam Long serviceId, HttpSession session) {
        ServiceInfoCustom info = infoService.selectDetail(serviceId);
        info.setServicePrice(SearchUtil.handlePrice(info.getServicePrice().toString()));
        //避免横向越权
        Long uUid = (Long) session.getAttribute(UUID);
        List<Map> orgNames = serviceInfoDao.selectOrgNameByUid(uUid);
        List<Long> orgOids = new ArrayList<>();
        for (Map map : orgNames) {
            orgOids.add((Long) map.get("orgoid"));
        }
        if (!orgOids.contains(info.getOrgOid())) {
            throw new BusinessException(ResponseEntity.PERMISSSION_ERROR);
        }
        model.addAttribute("serviceDetail", info);
        return "/front/manage/service_detail";
    }

    @RequestMapping(value = "service_modify_page")
    public String getServiceModifyPage(ModelMap modelMap, @RequestParam Long serviceId, HttpSession session) {
        ServiceInfo info = infoService.selectDetail(serviceId);
        info.setServicePrice(SearchUtil.handlePriceWithoutWan(info.getServicePrice().toString()));
        //返回当前用户的所有机构
        Long uUid = (Long) session.getAttribute(UUID);
        List<Map> orgNames = serviceInfoDao.selectOrgNameByUid(uUid);
        modelMap.put("serviceDetail", info);
        modelMap.put("orgNames", orgNames);
        return "/front/manage/service_alter";
    }

    @RequestMapping(value = "service_modify", method = RequestMethod.POST)
    @ResponseBody
    public Response modifyService(@RequestBody ServiceInfoCustom serviceInfoCustom) {
        int result = infoService.updateService(serviceInfoCustom);
        return result > 0 ? ResponseHelper.createSuccessResponse("服务修改成功")
                : ResponseHelper.createSuccessResponse("服务修改失败");
    }

    /*查询特点*/
    @RequestMapping(value = "service_feature")
    @ResponseBody
    public Response featureList(HttpServletRequest request) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        List<ServiceFeature> serviceFeatures = infoService.featureList(uid);
        return ResponseHelper.createSuccessResponse(serviceFeatures);
    }

    /*查询资质*/
    @RequestMapping(value = "service_aptitude")
    @ResponseBody
    public Response aptitudeList(HttpServletRequest request) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        List<ServiceAptitudeInfo> serviceAptitudeInfos = infoService.aptitudeList(uid, 0);
        return ResponseHelper.createSuccessResponse(serviceAptitudeInfos);
    }

    /*增加资质*/
    @RequestMapping(value = "/service_addAptitude", method = RequestMethod.POST)
    @ResponseBody
    public Response addAptitude(HttpServletRequest request, @RequestBody String featureName) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        ServiceAptitudeInfo serviceAptitudeInfo = new ServiceAptitudeInfo();
        serviceAptitudeInfo.setAptitudeName(featureName);
        serviceAptitudeInfo.setuUid(uid);
        serviceAptitudeInfo.setIsManager((short) 0);
        int result = infoService.addAptitude(serviceAptitudeInfo);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse(result);
        }
        return ResponseHelper.createErrorResponse("添加失败");
    }

    @RequestMapping(value = "change_state")
    @ResponseBody
    public Response changeState(@RequestBody ServiceInfo serviceInfo) {
        List<Integer> idList = new ArrayList<>();
        idList.add(Integer.valueOf(serviceInfo.getServiceId().toString()));
        int result = infoService.auditService(idList, serviceInfo.getServiceState());
        if (result > 0) {
            return ResponseHelper.createSuccessResponse("修改成功");
        }
        return ResponseHelper.createErrorResponse("修改失败");
    }

}
