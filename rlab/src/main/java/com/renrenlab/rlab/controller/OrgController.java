package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.Location;
import com.renrenlab.rlab.vo.OrgInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 机构模块
 * Created by wanshou on 2017/5/15.
 */
@Controller
@RequestMapping("/bg/org")
public class OrgController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgService orgService;

    /**
     * 分页查询机构信息列表
     *
     * @param keyword
     * @param pageNo
     * @param pageSize
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toOrgList(Model model,
                            @RequestParam(required = false) String keyword,
                            @RequestParam(required = false) Integer wordType,
                            @RequestParam(required = false) Integer oci,
                            @RequestParam(required = false) String order,
                            @RequestParam Integer pageNo,
                            @RequestParam Integer pageSize) {
        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            return "redirect:/m_404Error";
        }
        Integer orgCategoryId = Arrays.asList(new Integer[]{1, 2, 3, 4, 5, 99}).contains(oci) == true ? oci : null;
        Integer selectType = Arrays.asList(new Integer[]{1, 2, 3, 99}).contains(wordType) == true ? wordType : 1;
        keyword = StringUtils.isBlank(keyword) ? null : keyword;
        PageInfo<OrgInfo> pageInfo = orgService.searchOrgList(keyword, selectType,orgCategoryId, pageNo, pageSize, order);
        model.addAttribute("orgBaseInfoList", pageInfo.getList());
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        model.addAttribute("wordType", selectType);
        oci = oci == null ? 0 : oci;
        model.addAttribute("oci", oci);
        model.addAttribute("order", order);
        return "/bg/page/orgManage";
    }

    /**
     * 跳转到添加、修改
     *
     * @param oid
     * @return
     */
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/search/detail", method = RequestMethod.GET)
    public String toOrgDetail(Model model, @RequestParam(required = false) Integer oid, @RequestParam(required = false) String operator) {
        if ("modify".equals(operator)) { //修改机构详情
            model.addAttribute(orgService.searchOrgInfoByOid(oid));
            return "/bg/page/orgInfoToAlter";
        } else { //添加详情
            return "/bg/page/orgInfoToAdd";
        }
    }

    /**
     * 跳转机构详情页面
     *
     * @param oid
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/search/detail/look", method = RequestMethod.GET)
    public String toOrgDetailForLook(Model model, @RequestParam(required = false) Integer oid) {
            model.addAttribute(orgService.searchOrgInfoByOid(oid));
            return "/bg/page/orgDetail";
    }

    /**
     * 修改机构信息
     *
     * @param orgInfo
     * @return
     */
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/modify", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> modifyOrg(@RequestBody OrgInfo orgInfo) {
        orgService.modifyOrg(orgInfo);
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 添加机构信息
     *
     * @param orgInfo
     * @return
     */
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> addOrg(@RequestBody OrgInfo orgInfo) {
        orgInfo = orgService.addOrg(orgInfo);
        return ResponseHelper.createSuccessResponse(orgInfo);
    }

    /**
     * 关闭机构
     *
     * @param oid
     * @param os
     * @return
     */
    @Authentication(permisssion = Permisssion.P1, description = "00000010")
    @RequestMapping(value = "/close", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> closeOrg(@RequestParam Long oid, @RequestParam Integer os) {
        int result = orgService.closeOrg(oid, os);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse();
        } else {
            return ResponseHelper.createErrorResponse("关闭机构失败！");
        }
    }

    @RequestMapping(value = "/city", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> searchCityName(@RequestParam Integer id) {
        List<Location> names = orgService.searchCityName(id);
        return ResponseHelper.createSuccessResponse(names);
    }

    @RequestMapping(value = "/OrgcertificateTmp/add", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> addOrgcertificateName(@RequestParam String name) {
        orgService.addOrgCertificateTmp(name);
        return ResponseHelper.createSuccessResponse();
    }

    @RequestMapping(value = "/OrgcertificateTmp/query", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> queryOrgcertificateName() {
        return ResponseHelper.createSuccessResponse(orgService.selectOrgCertificateTmp());
    }

}
