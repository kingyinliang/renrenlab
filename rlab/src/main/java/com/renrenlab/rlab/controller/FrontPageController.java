package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.InsUtil;
import com.renrenlab.rlab.model.Requirement;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.service.RequirementService;
import com.renrenlab.rlab.vo.OrgInfo;
import org.apache.commons.lang3.StringUtils;
import org.json.HTTP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * Created by Administrator on 2017/5/24.
 */
@Controller
@RequestMapping("/page")
public class FrontPageController {

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private OrgService orgService;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String toHome(Model model, HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        log.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            List<OrgInfo> orgInfoList = orgService.searchOrgBaseInfoListTopK(3);
            model.addAttribute(orgInfoList);
            return "/mobile/page/home";
        } else {
            return "/front/page/homes";
        }
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toSearchHome(HttpServletRequest request) {

        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        log.debug("是否手机端登陆,{}", isMobileDevice);
        if (isMobileDevice) {
            return "/mobile/page/search";
        } else {
            return "/mobile/page/search";
        }
    }

    /**
     * 获取最新的已解决的需求
     *
     * @return
     */
    @RequestMapping(value = "/req/top", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getTop10(HttpServletRequest request) {
        return ResponseHelper.createSuccessResponse(requirementService.getTop10(request));
    }

    @RequestMapping(value = "/req/detail", method = RequestMethod.GET)
    public String getDetail(HttpServletRequest request, @RequestParam Long uReqId, Model model) {
        Requirement requirement = requirementService.getDetailById(uReqId);
        if (requirement != null) {
            SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
            requirement.setEndTime(format.format(requirement.getuReqEndTime()));
            requirement.setBeginTime(format.format(requirement.getCreateTime()));
            requirement.setModifyTimes(requirement.getModifyTime().getTime());
            requirement.setRemainTime(InsUtil.getRemainTime(requirement.getuReqEndTime()));
        }
        model.addAttribute("detail", requirement);
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/demand-detail";
        }
        return "/front/manage/demand_to_alter";
    }

    @RequestMapping(value = "/req/detail/ajax", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getDetailByAjax(@RequestParam Long uReqId) {
        Requirement requirement = requirementService.getDetailById(uReqId);
        if (requirement != null) {
            SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
            requirement.setEndTime(format.format(requirement.getuReqEndTime()));
            requirement.setBeginTime(format.format(requirement.getCreateTime()));
            requirement.setModifyTimes(requirement.getModifyTime().getTime());
            requirement.setRemainTime(InsUtil.getRemainTime(requirement.getuReqEndTime()));
            return ResponseHelper.createSuccessResponse(requirement);
        }
        return ResponseHelper.createErrorResponse("未获取到需求");
    }


    @RequestMapping(value = "/req/listpage", method = RequestMethod.GET)
    public String getPage(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/demand-home";
        }
        return "/front/page/demand_list";
    }

    @RequestMapping(value = "/req/listinfo", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> toDemandList(@RequestParam(required = false) Integer pageNo,
                                    @RequestParam(required = false) Integer pageSize) throws IOException {
        //只检索状态为'未解决'的需求
        PageInfo<Requirement> reqs = requirementService.getList(null, 4, null, null, pageNo, pageSize, null);
        return ResponseHelper.createSuccessResponse(reqs);
    }

    @RequestMapping(value = "/req/addcount", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> addCount(Long uReqId) {
        int result = requirementService.addCount(uReqId);
        if (result > 0)
            return ResponseHelper.createSuccessResponse();
        else return ResponseHelper.createErrorResponse("增加查看人数失败");
    }

    /**
     * 发布需求的页面
     *
     * @return
     */
    @RequestMapping(value = "/req/pubpage", method = RequestMethod.GET)
    public String pub(HttpServletRequest request) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/demand-release";
        }
        return "/front/page/demand_to_create";
    }


    //优惠券紧急需求处理
    @RequestMapping(value = "/coupon", method = RequestMethod.GET)
    public String toCoupon(HttpServletRequest request) {
        return "/front/page/renren_cxj";
    }

    @RequestMapping(value = "/aboutus", method = RequestMethod.GET)
    public String toAboutUs() {
        return "/front/page/lab_about_us";
    }

    @RequestMapping(value = "/joinus", method = RequestMethod.GET)
    public String toJoinUs() {
        return "/front/page/lab_join_us";
    }

    @RequestMapping(value = "/callus", method = RequestMethod.GET)
    public String toCallUs() {
        return "/front/page/lab_call_us";
    }

    @RequestMapping(value = "/ournews", method = RequestMethod.GET)
    public String toOurNews() {
        return "/front/page/lab_our_news";
    }

    @RequestMapping(value = "/equity", method = RequestMethod.GET)
    public String toEquity() {
        return "/front/page/lab_protocol_equity";
    }

    @RequestMapping(value = "/server", method = RequestMethod.GET)
    public String toServerProto() {
        return "/front/page/lab_protocol_server";
    }

    // 创新卷（返回页面调试），前端调试和开发使用
    @RequestMapping(value = "/dxscxj", method = RequestMethod.GET)
    public String toDxscxj() {
        return "/front/manage/dxscxj_home";
    }
    // 创新卷（返回页面调试），前端调试和开发使用

    @RequestMapping(value = "/dxscxj/home", method = RequestMethod.GET)
    public String toDxscxjHome() {
        return "/front/activity/dxscxj_home";
    }

    @RequestMapping(value = "/hdxtcxj", method = RequestMethod.GET)
    public String toHdxtcxj() {
        return "/front/manage/hdxtcxj_home";
    }

    @RequestMapping(value = "/sdkjcxj", method = RequestMethod.GET)
    public String toSdkjcxj() {
        return "/front/manage/sdkjcxj_home";
    }

    // 临时
    @RequestMapping(value = "/demand/manage", method = RequestMethod.GET)
    public String toManageDemand() {
        return "/front/manage/demand_to_manage";
    }

    // 临时
    @RequestMapping(value = "/demand/manage/default", method = RequestMethod.GET)
    public String toManageDemandDefault() {
        return "/front/manage/demand_to_manage_default";
    }

    // 临时
    @RequestMapping(value = "/demand/alter", method = RequestMethod.GET)
    public String toAlterDemand() {
        return "/front/manage/demand_to_alter";
    }

    // 临时创新卷home
    @RequestMapping(value = "/rrcxj/home", method = RequestMethod.GET)
    public String toRrcxjHome() {
        return "/front/manage/rrcxj_home";
    }

    // 临时，企业上传审核
    @RequestMapping(value = "/rrcxj/company/identify", method = RequestMethod.GET)
    public String toCompanyIdentify() {
        return "/front/manage/rrcxj_identify_company";
    }

    // 临时，企业资质审核，返回结果
    @RequestMapping(value = "/rrcxj/company/result", method = RequestMethod.GET)
    public String toCompanyResult() {
        return "/front/manage/rrcxj_identify_company_result";
    }

    // 创新券项目
    @RequestMapping(value = "/rrcxj/company/project", method = RequestMethod.GET)
    public String toCompanyProject() {
        return "/front/manage/rrcxj_identify_project";
    }

    // 发布需求
    @RequestMapping(value = "/demand/create", method = RequestMethod.GET)
    public String toPublishDemand() {
        return "/front/page/demand_to_create";
    }

    // 机构主页
    @RequestMapping(value = "/org/home", method = RequestMethod.GET)
    public String toOrgHome() {
        return "/front/org/org_home";
    }

    /**
     * 创新券申领活动页
     *
     * @param model
     * @param source 0人人实验 1天使助
     * @return
     */
    @RequestMapping(value = "/activity", method = RequestMethod.GET)
    public String activity(Model model, @RequestParam(value = "source", required = true) String source) {
        model.addAttribute("source", source);
        return "/front/page/renren_cxj";
    }

    // 服务商认证（临时）
    @RequestMapping(value = "/facilitator/aut", method = RequestMethod.GET)
    public String todemand() {
        return "/bg/page/facilitator-authenticationManage";
    }

    // 服务商未认证（临时）
    @RequestMapping(value = "/facilitator/un", method = RequestMethod.GET)
    public String todemanddetail() {
        return "/bg/page/facilitator-unautherizedManage";
    }

    // 认证详情（临时）
    @RequestMapping(value = "/facilitator/aut/detail", method = RequestMethod.GET)
    public String todemandrelease() {
        return "/bg/page/facilitatorAuthenticationDetail";
    }

    // 未认证详情（临时）
    @RequestMapping(value = "/facilitator/un/detail", method = RequestMethod.GET)
    public String todemandmodifi() {
        return "/bg/page/facilitatorUnautherizedDetail";
    }

    // 需求管理（临时）
    @RequestMapping(value = "/facilitator/add", method = RequestMethod.GET)
    public String todemandmanage() {
        return "/bg/page/facilitatorAdd";
    }

    // 跳转人人创新券公示页（详情页）（临时）
    @RequestMapping(value = "/activity/details", method = RequestMethod.GET)
    public String torrcxqdetails( @RequestParam Integer noticeId) {
        if(noticeId != null && noticeId == 1){
            return "/front/activity/rrcxq_notice_detail";
        }else if (noticeId != null && noticeId == 2){
            return "/front/activity/rrcxq_notice_detail2";
        }
        return "/front/activity/rrcxq_notice_detail";
    }

    // 跳转人人创新券公示页(公示列表页)（临时）
    @RequestMapping(value = "/activity/notice", method = RequestMethod.GET)
    public String torrcxqlist() {
        return "/front/activity/rrcxq_notice";
    }
    // 跳转人人创新券公示页(公示列表页)（临时）

    // 用户端：服务商认证页面
//    @RequestMapping(value = "/fws/rz", method = RequestMethod.GET)
//    public String toAdminList() {
//        return "/front/manage/facilitator_prove";
//    }

    // 新增管理员
//    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
//    public String toAdminAdd() {
//        return "/bg/page/admin_to_add";
//    }

    // 管理员权限管理
//    @RequestMapping(value = "/admin/root", method = RequestMethod.GET)
//    public String toAdminRoot() {
//        return "/bg/page/admin_is_root";
//    }

    // 管理员详情/修改
//    @RequestMapping(value = "/admin/detail", method = RequestMethod.GET)
//    public String toAdminDetail() {
//        return "/bg/page/admin_is_detail";
//    }

}
