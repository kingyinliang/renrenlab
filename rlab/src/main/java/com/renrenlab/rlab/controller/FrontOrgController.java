package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.OrgInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by wanshou on 2017/5/26.
 */
@Controller
@RequestMapping(value = "/front/org")
public class FrontOrgController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgService orgService;

    /**
     * 前端查询机构简介信息
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public Response<?> searchOrgBaseInfo(Model model, @RequestParam long oid, HttpSession session) {
        OrgBaseInfo orgBaseInfo = orgService.searchOrgBaseInfoByOid(oid);
        return ResponseHelper.createSuccessResponse(orgBaseInfo);
    }

    /**
     *查询排名前三的机构
     * @param model
     * @param k
     * @return
     */
    @RequestMapping(value = "/search/top/{k}", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> searchOrgBaseInfoTopK(Model model, @PathVariable Integer k) {
        k = k == null || k < 1 || k > 10 ? 3 : k;
        List<OrgInfo> orgInfoList = orgService.searchOrgBaseInfoListTopK(k);
        Response<?> response =  orgInfoList != null ? ResponseHelper.createSuccessResponse(orgInfoList) : ResponseHelper.createErrorResponse("查询前K名机构");
        return response;
    }

    /**
     * 查询机构信息
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}", method = RequestMethod.GET)
    public String searchOrgInfo(HttpServletRequest request, Model model, @PathVariable long oid) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        if (isMobileDevice) {
            //返回查询条件
            return "/mobile/page/org_home";
        }
        return "/front/org/org_home";
    }

    /**
     * 查询机构所拥有的仪器信息
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}/ins", method = RequestMethod.GET)
    public String searchInsByOid(HttpServletRequest request,
                                 Model model,
                                 @PathVariable long oid,
                                 @RequestParam Integer pageNo,
                                 @RequestParam Integer pageSize) {

        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);

        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            if(isMobileDevice){
                return "redirect:/m_404Error";
            }else{
                return "redirect:/404Error";
            }
        }

        PageInfo<InsListInfo> pageInfo = orgService.searchInsByOid(oid, pageNo, pageSize);
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("oid", oid);
        model.addAttribute("InsListInfoList", pageInfo.getList());
        model.addAttribute("orgInfo", orgInfo);
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);

        if(isMobileDevice){
            return "/mobile/page/org_ins";
        }
        return "/front/org/org_ins";

    }

    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String toAboutUs() {
        return "/front/org/org_upload";
    }

}
