package com.renrenlab.rlab.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.model.OrgCertifyTmp;
import com.renrenlab.rlab.service.CouponService;
import com.renrenlab.rlab.vo.OrgProjectTmpInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

/**
 * 创新券管理模块
 * Created by guowanting on 2017/7/19.
 */
@Controller
@RequestMapping("/bg/coupon")
public class CouponController {

    @Autowired
    private CouponService couponService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 创新券列表页
     * @param model
     * @param flag 1为认证 2为项目
     * @param keyword 手机号、机构名称
     * @param state 审核状态
     * @param startTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/search")
    public String search(Model model,
                              @RequestParam(value = "pageSize",required = false) Integer pageSize ,
                       @RequestParam(value = "keyword", required = false) String keyword,
                       @RequestParam(value = "state",required = false) String state,
                       @RequestParam(value = "startTime",required = false) String startTime,
                       @RequestParam(value = "endTime",required = false) String endTime,
                       @RequestParam(value = "pageNo",required = false) Integer pageNo,
                         @RequestParam(value = "order",required = false) String order,
                              @RequestParam(value = "flag",required = true) Integer flag){
        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;

        if (startTime == null || "".equals(startTime)) {
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - 7);
            Date monday = c.getTime();
            startTime = new SimpleDateFormat("yyyy-MM-dd").format(monday);
        }
        if (endTime == null || "".equals(endTime)) endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("state", state);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("order", order);
        model.addAttribute("startTime", startTime);
        model.addAttribute("endTime", endTime);
        if(flag==1){
            PageInfo<OrgCertifyTmp> info =  couponService.searchCertifyList(keyword,state,startTime,endTime,pageNo,pageSize,order);
            model.addAttribute("list", info.getList());
            model.addAttribute("total", info.getTotal());
            model.addAttribute("pages", info.getPages());
            return "bg/page/rrcxj_enterpise_manage";
        }
        if(flag==2){
            PageInfo<OrgProjectTmpInfo> info =  couponService.searchProjectList(keyword,state,startTime,endTime,pageNo,pageSize,order);
            model.addAttribute("list", info.getList());
            model.addAttribute("total", info.getTotal());
            model.addAttribute("pages", info.getPages());
            return "bg/page/rrcxj_project_manage";
        }

        return "";
    }

    /**
     * 认证详情
     * @param model
     * @param id
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String detail(Model model,Long id){

        OrgCertifyTmp info = couponService.searchCertifyOrg(id);
        if (info.getOrgReport() != null) {
            JSONArray finance = JSON.parseObject(info.getOrgReport().toString(), JSONArray.class);
            model.addAttribute("finance",finance);
        }
        if (info.getOrgOtherReport() != null) {
            JSONArray otherReport = JSON.parseObject(info.getOrgOtherReport().toString(), JSONArray.class);
            model.addAttribute("otherReport",otherReport);
        }

        model.addAttribute("detail",info);

        return "bg/page/rrcxj_enterpise_detail";
    }

    /**
     * 项目详情
     * @param model
     * @param id
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/proDetail", method = RequestMethod.GET)
    public String proDetail(Model model,Long id){

        OrgProjectTmpInfo info = couponService.searchOrgPro(id);
        model.addAttribute("detail",info);

        return "bg/page/rrcxj_project_detail";
    }

    /**
     * 创新券审核
     * @param session
     * @param reason 审核失败拒绝原因
     * @param state 0待审核1审核成功2审核失败3备案完成款项发放中4项目完成
     * @param flag 1为认证 2为项目
     * @param id
     * @return
     */
    @Authentication(permisssion = Permisssion.P2, description = "00000100")
    @RequestMapping(value = "/check", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> check(HttpSession session,@RequestParam(value = "reason",required = false)String reason,
                                    @RequestParam(value = "state",required = true) Integer state,
                                    @RequestParam(value = "flag",required = true) Integer flag,
                                    @RequestParam(value = "id",required = true) Long id){
        Long uId = (Long) session.getAttribute("uid");
        //uId=10495L;
        Map<String,Object> map = couponService.check(reason,state,flag,id,uId);
        return map;
    }



}
