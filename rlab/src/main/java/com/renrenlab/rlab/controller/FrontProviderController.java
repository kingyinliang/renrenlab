package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.FrontProviderInfo;
import com.renrenlab.rlab.vo.OrgInfo;
import com.renrenlab.rlab.vo.OrgManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

/**
 * Created by wanshou on 2017/9/20.
 */
@Controller
@RequestMapping("/front/provider")
public class FrontProviderController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgService orgService;

    /**
     * 客户端查询服务商申请认证记录
     * @param model
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toFrontProviderPage(Model model,
              HttpSession session,
              @RequestParam Integer pageNo,
              @RequestParam Integer pageSize){
        if (pageNo <= 0 || pageSize > 50) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            return "redirect:/404Error";
        }
        Long uid = (Long) session.getAttribute("uid");
        PageInfo<FrontProviderInfo> pageInfo =  orgService.selectProviderInfoByUid(uid, pageNo, pageSize);
        model.addAttribute("frontProviderInfoList", pageInfo.getList());
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        return "/front/manage/org_certify_list";
    }

    /**
     * 服务商申请认证
     *
     * @param orgInfo
     * @return
     */
    @RequestMapping(value = "/application", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> applicationOrg(@RequestBody OrgInfo orgInfo, HttpSession session) {
        Long uid = (Long) session.getAttribute("uid");
        if(orgInfo.getOrgLicense() != null)orgInfo.setuUid(uid);
        orgInfo = orgService.addOrg(orgInfo);
        return ResponseHelper.createSuccessResponse(orgInfo);
    }

    /**
     * 跳转到修改服务商页面
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/modify/{oid}", method = RequestMethod.GET)
    public String toModifyPage(HttpSession session,Model model, @PathVariable Long oid) {
        if(oid == null)return "redirect:/m_500Error";
        Long uid = (Long) session.getAttribute("uid");
        OrgManager orgManager = orgService.searchOrgManagerInfo(oid);
        if(orgManager==null || !orgManager.getuUid().equals(uid)){
            return "redirect:/front/provider/search?pageNo=1&pageSize=49";
        }
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        return "front/manage/facilitator_update";
    }

    /**
     * 跳转到添加服务商页面
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toAddPage() {
        return "/front/manage/facilitator_prove";
    }


    /**
     * 服务商修改认证
     *
     * @param orgInfo
     * @return
     */
    @RequestMapping(value = "/application", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> updateOrg(HttpSession session,@RequestBody OrgInfo orgInfo) {
        Long uid = (Long) session.getAttribute("uid");
        OrgManager orgManager = orgService.searchOrgManagerInfo(orgInfo.getOrgOid());
        if(orgManager==null || !orgManager.getuUid().equals(uid)){
            return ResponseHelper.createErrorResponse("用户错误");
        }
        orgService.modifyOrg(orgInfo);
        orgInfo = orgService.searchOrgInfoByOid(orgInfo.getOrgOid());
        return ResponseHelper.createSuccessResponse(orgInfo);
    }

    /**
     * 服务商认证申请详情
     * @param oid
     * @return
     */
    @RequestMapping(value = "/search/{oid}", method = RequestMethod.GET)
    public String searchProviderInfo(HttpSession session,Model model, @PathVariable Long oid) {
        Long uid = (Long) session.getAttribute("uid");
        OrgManager orgManager = orgService.searchOrgManagerInfo(oid);
        if(orgManager==null || !orgManager.getuUid().equals(uid)){
            return "redirect:/front/provider/search?pageNo=1&pageSize=49";
        }
        OrgInfo orgInfo = null;
        if(oid != null) orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        return "/front/manage/org_certify_details";
    }

}
