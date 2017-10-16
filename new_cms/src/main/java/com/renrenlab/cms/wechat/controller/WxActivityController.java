package com.renrenlab.cms.wechat.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.renrenlab.cms.common.util.PasswordUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenlab.cms.common.constant.Constant;
import com.renrenlab.cms.common.response.ListSlice;
import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.model.OrderCoupon;
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.model.UserCouponMap;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IOrderCouponService;
import com.renrenlab.cms.communication.service.IUserBaseInfoService;
import com.renrenlab.cms.communication.service.IUserCouponService;
import com.renrenlab.cms.communication.service.IUserTagMapService;
import com.renrenlab.cms.communication.service.IWxUserService;
import com.renrenlab.cms.communication.vo.CouponInfo;
import com.renrenlab.cms.communication.vo.UserCouponInfo;
import com.renrenlab.cms.communication.vo.VerifyCodeApplyInfo;
import com.renrenlab.cms.wechat.dto.UserOriginalWx;

/**
 * 微信活动
 * <p>
 * Created by lihongxun on 2017/4/20.
 */
@RequestMapping(value = "/wx/activity")
@Controller
public class WxActivityController {

    private Logger log = LoggerFactory.getLogger(this.getClass());
    //
    @Autowired
    private IUserBaseInfoService userService;

    @Autowired
    private IWxUserService wxUserService;

    @Autowired
    private IOrderCouponService orderCouponService;

    @Autowired
    private IUserCouponService userCouponService;

    @Autowired
    private IUserTagMapService userTagMapService;

    /**
     * 领取创新券
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/getTicket")
    public String getTicket(Model model, HttpSession session) {
        log.info("领取创新券-------------");
        String openId = (String) session.getAttribute("OPENID");
        // 判断是不是微信端打开
        if (openId == null) {
            model.addAttribute("errorMsg", "请在微信端打开");
            log.info("openId为空");
            return "/wechat/jsp/error";
        }
        // 判断是不是我们的用户
        UserWx userWx = wxUserService.selectByOpenId(openId);
        if (userWx == null) {
            log.info("不是活动用户");
            model.addAttribute("errorMsg", "本次活动只针对大学生活动，请联系人人实验服务号人工客服扫码参加");
            return "/wechat/jsp/error";
        }
        Long uId = userWx.getuUid();
        int flag = userTagMapService.handlerTapMap(openId);
        if (flag == 0) {
            log.info("不是扫码进入");
            model.addAttribute("errorMsg", "本次活动只针对大学生活动，请联系人人实验服务号人工客服参加");
            return "/wechat/jsp/error";

        }
        // 判断用户是否已经绑定了手机
        if (uId != null) {
            UserBaseInfo user = userService.selectByUserId(uId);
            if (user != null && user.getuMobile() != null) {
                // 用户绑定了手机，判断用户是否有创新券
                userCouponService.SendCoupon(uId);
                // 跳转到创新券列表页
                return "redirect:/wx/activity/ticketsList.do";
            }
        }
        // 未绑定手机，跳转到注册页面
        log.info("未绑定手机");
        return "/wechat/jsp/getTicket";
    }

    /**
     * 创新券列表
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/ticketsList")
    public String ticketsList(Model model, HttpSession session) {
        log.info("invoke----ticketsList------------------");
        String openId = (String) session.getAttribute("OPENID");
        log.info("openId：" + openId);
        //openId="oD_eJ002BdM-EL536SPLW03V4J0w";
        // 判断是不是微信端打开
        if (openId == null) {
            model.addAttribute("errorMsg", "请在微信端打开");
            log.info("错误：请在微信端打开");
            return "/wechat/jsp/error";
        }
        // 判断用户是否有创新券
        // 判断是不是我们的用户
        List<CouponInfo> coupons = userCouponService.selectCouponList(openId);
        if (coupons == null || coupons.isEmpty()) {
            return "/wechat/jsp/defaultTicket";
        }
        model.addAttribute("coupons", coupons);
        log.info("跳转到优惠券列表页");
        // model.addAttribute("coupons",null);
        return "/wechat/jsp/ticketsList";
    }

    /**
     * 绑定手机号
     *
     * @param applyInfo
     * @param session
     * @return
     */
    @RequestMapping(value = "/bindPhone", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> bindPhone(@RequestBody VerifyCodeApplyInfo applyInfo, HttpSession session) {
        log.info("创新券注册");
        String password = applyInfo.getPassword();
        log.info("password:" + password);
        String openId = (String) session.getAttribute("OPENID");
        if (StringUtils.isBlank(openId)) {
            log.info("openId为空");
            return ResponseHelper.createBusinessErrorResponse("openId为空");
        }

        String phone = applyInfo.getPhone();

        String verifyCode = applyInfo.getValidateCode();

        UserBaseInfo user = userService.selectByuPhone(phone);
        UserWx userWx = wxUserService.selectByOpenId(openId);
        // 手机号已经被别人绑定过了
//        if (user != null && userWx != null && userWx.getuUid() != user.getuUid()) {
//            return ResponseHelper.createBusinessErrorResponse("");
//        }
        String vericode = (String) session.getAttribute(phone);
        boolean veri1 = StringUtils.isBlank(vericode);
        log.info("vc == null：" + veri1);
        if (veri1 || !verifyCode.equals(vericode)) {
            return ResponseHelper.createBusinessErrorResponse("验证码不对！");
        }
        if (userWx == null) {
            return ResponseHelper.createBusinessErrorResponse("没有此用户");
        }
        Long uId = userWx.getuUid();
        // 用户绑定
        if (uId == null && user == null) {
            // 注册
            UserOriginalWx originalUser = wxUserService.queryByOpenid(openId);
            user = new UserBaseInfo();
            user.setuAvatar(originalUser.getHeadimgurl());
            user.setuMobile(phone);
            user.setuNickname(originalUser.getNickname());
            user.setuPassword(PasswordUtils.encrypt(password));
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
            userService.insertSelective(user);
            // 绑定
            uId = user.getuUid();
            userWx.setuUid(uId);
            wxUserService.updateByOpenIdSelective(userWx);
        }

        user = userService.selectByUserId(uId);
        user.setuMobile(phone);
        user.setuPassword(PasswordUtils.encrypt(password));
        userService.updateByUserIdSelective(user);
        // 新老后台数据同步
        int sync = userService.synchronizeData(user);
        log.info("----------synchronizeData----------" + sync);
        int flag = userCouponService.SendCoupon(uId);
        if (flag == 1) {
            return ResponseHelper.createBusinessErrorResponse("获取创新券信息失败");
        }
        session.removeAttribute(phone);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 获取所有创新券信息
     *
     * @return
     */
    @RequestMapping(value = "/getTicketInfo", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getTicketInfo() {
        List<OrderCoupon> list = orderCouponService.selectAllByCoIds(Constant.COUPON_IDS);
        return ResponseHelper.createSuccessResponse(list);
    }

    /**
     * 更新创新券使用状态
     *
     * @param uList
     * @return
     */
    @RequestMapping(value = "/updateTicketInfo", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> updateTicketInfo(@RequestBody List<UserCouponMap> uList) {
        if (uList == null || uList.size() == 0)
            return ResponseHelper.createBusinessErrorResponse("缺少参数");
        for (UserCouponMap userCoupon : uList) {
            userCouponService.updateCouponStatus(userCoupon);
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 获取用户创新券信息
     *
     * @param searchMsg 搜索的信息 手机号或者姓名
     * @param coId      创新券类型 0 全部查询
     * @param pageNo    页码
     * @param pageSize  每页数据条数
     * @return
     */
    @SuppressWarnings("unchecked")
    @RequestMapping(value = "/getScreenTicket", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getScreenTicket(@RequestParam String searchMsg, @RequestParam Long coId,
                                       @RequestParam Integer pageNo, @RequestParam Integer pageSize) {
        if (pageNo == null || pageSize == null || coId == null) {
            return ResponseHelper.createBusinessErrorResponse("参数不全");
        }
        Map<String, Object> map = userCouponService.searchCouponInfo(searchMsg, coId, pageNo, pageSize);
        return ResponseHelper.createSuccessResponse(new ListSlice<>(Long.valueOf(map.get("pages") + ""), (List<UserCouponInfo>) map.get("rlist")));
    }

}
