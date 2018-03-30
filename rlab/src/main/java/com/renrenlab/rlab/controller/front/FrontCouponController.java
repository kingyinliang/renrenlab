package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.util.PasswordUtils;
import com.renrenlab.rlab.model.OrderCoupon;
import com.renrenlab.rlab.model.OrgCertifyTmp;
import com.renrenlab.rlab.model.OrgProjectTmp;
import com.renrenlab.rlab.service.FrontCouponService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 个人中心创新券模块
 */
@Controller
@RequestMapping("/coupon")
public class FrontCouponController {

    @Autowired
    private FrontCouponService frontCouponService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 人人创新券展示页
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/page", method = RequestMethod.GET)
    public String page(Model model, HttpSession session, @RequestParam(value = "source", required = false) String source) {
        Long uId = (Long) session.getAttribute("uid");
        /*uId=10495L;*/
        Map<String, Object> map = frontCouponService.getPage(uId);
        model.addAllAttributes(map);
        if (StringUtils.isBlank(source)) {
            source = "0";
        }
        model.addAttribute("source", source);
        return "/front/manage/rrcxj_home";
    }


    /**
     * 跳转申请认证页面
     *
     * @param source
     * @param operate operate="modify" 为修改时修改认证 为"apply":申请认证
     * @param model
     * @return
     */
    @RequestMapping(value = "/toApplyCertify", method = RequestMethod.GET)
    public String toApplyCertify(@RequestParam(value = "source", required = false) Integer source,
                                 @RequestParam(value = "operate", required = true) String operate,
                                 Model model) {
        model.addAttribute("source", source);
        model.addAttribute("operate", operate);
        return "/front/manage/rrcxj_identify_company";
    }

    /**
     * 跳转项目申请页面
     *
     * @param cerId
     * @param model
     * @return
     */
    @RequestMapping(value = "/toProject/{cerId}", method = RequestMethod.GET)
    public String toProject(@PathVariable Long cerId, Model model) {
        model.addAttribute("cerId", cerId);
        return "/front/manage/rrcxj_identify_project";
    }

    /**
     * 申请认证/修改认证信息
     *
     * @param orgCertifyTmp
     * @param session
     * @param operate       operate="modify" 为修改时修改认证 为"apply":申请认证
     * @return
     */
    @RequestMapping(value = "/applyCertify", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyCertify(@RequestBody OrgCertifyTmp orgCertifyTmp, HttpSession session,
                                            @RequestParam(value = "operate", required = false) String operate) {
        Long uId = (Long) session.getAttribute("uid");
        /*uId=10495L;*/
        orgCertifyTmp.setuUid(uId);
        Map<String, Object> map = frontCouponService.applyCertify(orgCertifyTmp, operate);
        return map;
    }

    /**
     * 跳转修改申请认证页面
     *
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "/toModifyCertify", method = RequestMethod.GET)
    public String toApplyCertify(Model model, HttpSession session) {
        Long uId = (Long) session.getAttribute("uid");
        /*uId=10495L;*/
        OrgCertifyTmp orgCertifyTmp = frontCouponService.getCertify(uId);
        model.addAttribute("orgCertifyTmp", orgCertifyTmp);
        return "/front/manage/rrcxj_identify_company";
    }

    /**
     * 申请项目信息/项目上传发票和合同
     *
     * @param orgProjectTmp
     * @param session
     * @param operate       operate="modify" 为项目上传发票和合同
     * @return
     */
    @RequestMapping(value = "/applyProject", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyProject(@RequestBody OrgProjectTmp orgProjectTmp, HttpSession session,
                                            @RequestParam(value = "operate", required = false) String operate) {
        Map<String, Object> map = frontCouponService.applyProject(orgProjectTmp, operate);
        return map;
    }

    /**
     * 跳转大学生创新券页面
     *
     * @return
     */
    @RequestMapping(value = "/toCollege", method = RequestMethod.GET)
    public String toCollege(Model model, HttpSession session) {
        Long uId = (Long) session.getAttribute("uid");
        List<OrderCoupon> coupons = null;
        if (uId != null) {
            coupons = frontCouponService.getCollegeCoupon(uId);
        } else {
            return "redirect:/user/login";
        }
        model.addAttribute("coupons", coupons);
        return "/front/manage/dxscxj_home";
    }

    ///**
    // * 活动页
    // * @param model
    // * @param source 0人人实验 1天使助
    // * @return
    // */
    //@RequestMapping(value = "/activity", method = RequestMethod.GET)
    //public String activity(Model model,@RequestParam(value = "source",required = true) String source) {
    //    model.addAttribute("source",source);
    //    return "/front/page/renren_cxj_new";
    //}


    /**
     * 对外认证接口
     *
     * @param data
     * @param token
     * @param time
     * @param flag
     * @return
     */
    @RequestMapping(value = "/applyCouponForExternal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyCouponForExternal(@RequestBody OrgCertifyTmp data,
                                                      @RequestParam String token, @RequestParam Long time, @RequestParam String flag) {
        Map map = new HashMap();
        map.put("code", "205");
        if (data == null || data.getuMobile() == null) {
            map.put("payload", "参数传递错误");
            return map;
        }
        String appid = "";
        if ("1".equals(flag)) {
            data.setuUid(-1L);
            data.setOrgCerSource(1);//天使助
            appid = "测试";
        }
        //判断参数是否合法
        String myToken = PasswordUtils.md5(appid + time);
        if (!myToken.equals(token)) {
            map.put("payload", "验证token失败");
            return map;
        }
        long now = System.currentTimeMillis();
        //有效时间为1分钟
        if (time < now - 60 * 1000 && time > now) {
            map.put("payload", "token失效");
            return map;
        }
        map = frontCouponService.applyCouponForExternal(data);
        return map;

    }


    /**
     * 对外申请项目接口
     *
     * @param data
     * @param token
     * @param time
     * @param flag
     * @return
     */
    @RequestMapping(value = "/applyProjectForExternal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> applyProjectForExternal(@RequestBody OrgProjectTmp data,
                                                       @RequestParam String token, @RequestParam Long time, @RequestParam String flag) {
        Map map = new HashMap();
        map.put("code", "205");
        if (data == null || data.getOrgCerId() == null) {
            map.put("payload", "参数传递错误");
            return map;
        }
        String appid = "";
        if ("1".equals(flag)) {
            appid = "测试";
        }
        //判断参数是否合法
        String myToken = PasswordUtils.md5(appid + time);
        if (!myToken.equals(token)) {
            map.put("payload", "验证token失败");
            return map;
        }
        long now = System.currentTimeMillis();
        //有效时间为1分钟
        if (time < now - 60 * 1000 && time > now) {
            map.put("payload", "token失效");
            return map;
        }
        map = frontCouponService.applyProjectForExternal(data);
        return map;

    }


    /**
     * 对外查询项目接口
     *
     * @param data
     * @param token
     * @param time
     * @param flag
     * @return
     */
    @RequestMapping(value = "/searchForExternal", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> searchForExternal(@RequestBody Map<String, Object> data,
                                                 @RequestParam String token, @RequestParam Long time, @RequestParam String flag) {
        Map map = new HashMap();
        map.put("code", "205");
        if (data == null || data.get("id") == null || !"pro".equals(data.get("type")) || !"cer".equals(data.get("type"))) {
            map.put("payload", "参数传递错误");
            return map;
        }
        String appid = "";
        if ("1".equals(flag)) {
            appid = "测试";
        }
        //判断参数是否合法
        String myToken = PasswordUtils.md5(appid + time);
        if (!myToken.equals(token)) {
            map.put("payload", "验证token失败");
            return map;
        }
        long now = System.currentTimeMillis();
        //有效时间为1分钟
        if (time < now - 60 * 1000 && time > now) {
            map.put("payload", "token失效");
            return map;
        }
        map = frontCouponService.searchForExternal(data);
        return map;

    }


    @RequestMapping(value = "/token", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> token() {
        Map map = new HashMap();
        String appid = "ceshi";
        long time = System.currentTimeMillis();
        String myToken = PasswordUtils.md5(appid + time);
        map.put("token", myToken);
        map.put("time", time);
        return map;

    }


}
