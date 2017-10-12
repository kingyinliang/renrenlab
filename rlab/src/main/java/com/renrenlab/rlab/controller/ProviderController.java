package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.service.ProviderService;
import com.renrenlab.rlab.vo.OrgInfo;
import com.renrenlab.rlab.vo.ProviderInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by guowanting on 2017/9/20.
 */
@Controller
@RequestMapping("/bg/provider")
public class ProviderController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ProviderService providerService;

    @Autowired
    private OrgService orgService;

    /**
     * 服务商列表
     * @param model
     * @param session
     * @param flag 1认证 2 未认证
     * @param orgName 机构名称
     * @param rankLow 共享指数排名低
     * @param rankHigh 共享指数排名高
     * @param bizName 业务人员名称
     * @param state 公有、私有状态 0 公有 1 私有 99 全部
     *              审核、拒绝状态 1 待审核 3 审核拒绝 99 全部
     * @param source 来源 0：线下，1：运营扩展，2：线上 99 全部
     * @param time 通过时间（审核时间） 0 一天以内 2 三天以内 6 一周以内 99全部
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/auth/search", method = RequestMethod.GET)
    @Authentication(permisssion = Permisssion.P0)
    public String toAuthList(Model model,HttpSession session,
                             @RequestParam(required = false) String orgName,
                             @RequestParam(required = false) Integer rankLow,
                             @RequestParam(required = false) Integer rankHigh,
                             @RequestParam(required = false) String bizName,
                             @RequestParam(required = false) Integer state,
                             @RequestParam(required = false) Integer source,
                             @RequestParam(required = false) Integer time,
                             @RequestParam(required = false) String order,
                             @RequestParam(required = false) Integer pageNo,
                             @RequestParam(required = false) Integer pageSize,
                             @RequestParam(required = true) Integer flag) {
        if (flag != 1 && flag != 2) {
            logger.error("FLAG参数不合法", flag);
            return "redirect:/m_404Error";
        }
        if (pageNo==null||pageNo <= 0 ) pageNo=1;
        if (pageSize==null) pageSize=10;
        if (pageSize>=100) pageSize=100;
        model.addAttribute("orgName", orgName);
        model.addAttribute("bizName", bizName);
        orgName = StringUtils.isBlank(orgName) ? null : orgName;
        bizName = StringUtils.isBlank(bizName) ? null : bizName;
        Integer isCommon = 0;
        if(bizName!=null && "人人实验".contains(bizName)) isCommon=1;
        Integer orgSource = Arrays.asList(new Integer[]{0, 1, 2}).contains(source) == true ? source : null;
        Integer date = Arrays.asList(new Integer[]{0, 2, 6}).contains(time) == true ? time : null;
        String startTime = null;
        if (date!=null) {
            Calendar c = Calendar.getInstance();
            c.add(Calendar.DATE, - date);
            Date monday = c.getTime();
            startTime = new SimpleDateFormat("yyyy-MM-dd").format(monday);
        }

        // 查看是否有审核权限，有的话传null，无的话传业务人员id
        Long uId = (Long) session.getAttribute("uid");
        Integer u_permisssion = (Integer)session.getAttribute("u_permisssion");
        if(u_permisssion  != 11) uId=null;
        PageInfo<ProviderInfo> pageInfo =null;
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("state", state);
        model.addAttribute("source", source);
        model.addAttribute("time", time);
        //认证服务商列表
        if(flag==1){
            Integer orgState = Arrays.asList(new Integer[]{0, 1}).contains(state) == true ? state : null;
            pageInfo = providerService.searchAuthProviderList(orgName,rankLow,rankHigh,bizName,isCommon,orgSource,orgState,startTime, uId,pageNo,pageSize,order);
            model.addAttribute("rankLow", rankLow);
            model.addAttribute("rankHigh", rankHigh);
            model.addAttribute("total", pageInfo.getTotal());
            model.addAttribute("pages", pageInfo.getPages());
            model.addAttribute("providerList", pageInfo.getList());
            return "/bg/page/facilitator-authenticationManage";
        }
        //未认证服务商列表
        if(flag==2){
            Integer orgState = Arrays.asList(new Integer[]{1,3}).contains(state) == true ? state : null;
            List<Integer> orgIdentifications = Arrays.asList(new Integer[]{1,3});
            if(orgState!=null){
                orgIdentifications=Arrays.asList(new Integer[]{orgState});
            }
            pageInfo = providerService.searchNotAuthProviderList(orgName,bizName,isCommon,orgSource,orgIdentifications,startTime, uId,pageNo,pageSize,order);
            model.addAttribute("providerList", pageInfo.getList());
            model.addAttribute("total", pageInfo.getTotal());
            model.addAttribute("pages", pageInfo.getPages());
            return "/bg/page/facilitator-unautherizedManage";
        }

        return "";
    }

    /**
     * 撤销认证
     * @param oids
     * @param session
     * @return
     */
    @RequestMapping(value = "/auth/backout")
    @ResponseBody
    @Authentication(permisssion = Permisssion.P3, description = "00001111")
    public Response<?> backout(@RequestParam Long[] oids,HttpSession session,@RequestParam String reason) {

        //TODO 日志都没加
        Long uId = (Long) session.getAttribute("uid");
        int result = providerService.backout(oids,uId,reason);
        if(result<=0){
            return ResponseHelper.createErrorResponse("撤销失败");
        }
        return ResponseHelper.createSuccessResponse();

    }


    /**
     * 服务商新增时查询机构接口
     * @param key
     * @return
     */
    @RequestMapping(value = "/queryName", method = RequestMethod.GET)
    @ResponseBody
    @Authentication(permisssion = Permisssion.P0)
    public Response<?> getProvider(@RequestParam(required = false) String key) {
        List<OrgBaseInfo> providerInfo = providerService.getProviderByName(key);
        return ResponseHelper.createSuccessResponse(providerInfo);
    }


    /**
     * 服务商未认证审核
     * @param session
     * @param reason
     * @param state 2审核通过 3 审核拒绝
     * @param oid
     * @return
     */
    @RequestMapping(value = "/audit", method = RequestMethod.GET)
    @ResponseBody
    @Authentication(permisssion = Permisssion.P2, description = "00000111")
    public Response<?> audit(HttpSession session,@RequestParam(required = false) String reason,
                             @RequestParam(required = true) Integer state,
                             @RequestParam(required = true) Long oid) {
        if(state !=2 && state !=3 ){
            return ResponseHelper.createErrorResponse("state参数传递错误");
        }
        Long uId = (Long) session.getAttribute("uid");
        int result = providerService.audit(uId,oid,state,reason);
        if(result<=0){
            return ResponseHelper.createErrorResponse("审核失败");
        }
        return ResponseHelper.createSuccessResponse();
    }


    /**
     * 服务商私有池激活
     * @param session
     * @param oid
     * @return
     */
    @RequestMapping(value = "/activate", method = RequestMethod.GET)
    @ResponseBody
    @Authentication(permisssion = Permisssion.P1)
    public Response<?> activate(HttpSession session,
                                @RequestParam(required = true) Long oid) {

        Long uId = (Long) session.getAttribute("uid");
        //Integer u_permisssion = (Integer)session.getAttribute("u_permisssion");
        //if(u_permisssion  != 1) {
        //    return ResponseHelper.createErrorResponse("您不是业务人员");
        //};
        int result = providerService.activate(oid,uId);
        if(result<=0){
            return ResponseHelper.createErrorResponse("激活失败");
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 未认证详情
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/detail/uncertificated/{oid}", method = RequestMethod.GET)
    @Authentication(permisssion = Permisssion.P0)
    public String getUncertificatedProviderInfo(Model model, @PathVariable Long oid) {
        OrgInfo orgInfo = null;
        if(oid != null) orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        return "/bg/page/facilitatorUnautherizedDetail";
    }

    /**
     * 认证详情
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/detail/certificated/{oid}", method = RequestMethod.GET)
    @Authentication(permisssion = Permisssion.P0)
    public String getCertificatedProviderInfo(Model model, @PathVariable Long oid) {
        OrgInfo orgInfo = null;
        if(oid != null) orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        return "/bg/page/facilitatorAuthenticationDetail";
    }

    /**
     * 查询认证服务商详情
     * @param oid
     * @return
     */
    @RequestMapping(value = "/detail/{oid}", method = RequestMethod.GET)
    @ResponseBody
    @Authentication(permisssion = Permisssion.P0)
    public Response<?> searchOrg(@PathVariable Long oid) {
        if(oid == null)return ResponseHelper.createErrorResponse("查询失败");
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        return ResponseHelper.createSuccessResponse(orgInfo);
    }

    /**
     * 跳转到修改服务商页面
     * @param model
     * @param oid
     * @return
     */
    @Authentication(permisssion = Permisssion.P1)
    @RequestMapping(value = "/modify/{oid}", method = RequestMethod.GET)
    public String toModifyPage(Model model, @PathVariable Long oid) {
        if(oid == null)return "redirect:/m_500Error";
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        return "/bg/page/facilitatorUpdate";
    }

    /**
     * 服务商申请认证
     *
     * @param orgInfo
     * @return
     */
    @RequestMapping(value = "/application", method = RequestMethod.POST)
    @Authentication(permisssion = Permisssion.P1)
    @ResponseBody
    public Response<?> applicationOrg(@RequestBody OrgInfo orgInfo, HttpSession session) {
        Long uId = (Long) session.getAttribute("uid");
//        Integer u_permisssion = (Integer)session.getAttribute("u_permisssion");
//        orgInfo.setOrgBizUid(u_permisssion  != 1 ? null : uId);
        orgInfo.setOrgBizUid(uId);
        orgInfo.setApplicationTime(new Date());
        orgInfo.setOrgType(1);
        if(orgInfo.getOrgOid() == null){
            orgInfo = orgService.addOrg(orgInfo);
        }else{
            orgService.modifyOrg(orgInfo);
            orgInfo = orgService.searchOrgInfoByOid(orgInfo.getOrgOid());
        }
        return ResponseHelper.createSuccessResponse(orgInfo);
    }

    /**
     * 跳转到新增服务商页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/page/add")
    @Authentication(permisssion = Permisssion.P1)
    public String toAddPage(Model model) {
        model.addAttribute("providerInfo",providerService.getProviderByName(null));
        return "/bg/page/facilitatorAdd";
    }

}
