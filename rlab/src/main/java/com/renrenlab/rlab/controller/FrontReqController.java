package com.renrenlab.rlab.controller;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.InsUtil;
import com.renrenlab.rlab.model.Requirement;
import com.renrenlab.rlab.service.RequirementService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/8/8.
 */
@Controller
@RequestMapping(value = "/front/user/req")
public class FrontReqController {

    @Autowired
    private RequirementService requirementService;

    /**
     * 微需求列表页
     *
     * @return
     */
    @RequestMapping(value = "/tinylist", method = RequestMethod.GET)
    public String toTinyDemandList(HttpServletRequest request,
                                   HttpServletResponse response,
                                   Model model,
                                   @RequestParam(required = false) Integer state,
                                   @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                   @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        Long uUid = (Long) request.getSession().getAttribute("uid");
        Integer state1 = state;
        if (state1 == null || state1 == 99) state = null;
        PageInfo<Requirement> reqs = requirementService.getListByUid(uUid, state, pageNo, pageSize);
        List<Map<String, Integer>> list = requirementService.getCount(uUid);
        Map<String, Integer> map = new HashMap<>();
        for (Map<String, Integer> map1 : list) {
            for (int i = 0; i < 5; i++) {
                if (map1.get("u_req_state") == i)
                    map.put(i + "", map1.get("count"));
            }
        }
        map.put("count", requirementService.getAllCount(uUid));
        model.addAttribute("infos", reqs.getList());
        model.addAttribute("total", reqs.getTotal());
        model.addAttribute("state", state1);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("map", map);
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/demand-manage";
        }
        return "/front/manage/demand_to_manage";
    }

    @RequestMapping(value = "/modifypage", method = RequestMethod.GET)
    public String getDetail(HttpServletRequest request,@RequestParam Long uReqId, Model model,@RequestParam(required = false) String isDetail) {
        Requirement requirement = requirementService.getDetailById(uReqId);
        if (request!=null){
        SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
        requirement.setEndTime(format.format(requirement.getuReqEndTime()));
        requirement.setBeginTime(format.format(requirement.getCreateTime()));
        requirement.setModifyTimes(requirement.getModifyTime().getTime());
        requirement.setRemainTime(InsUtil.getRemainTime(requirement.getuReqEndTime()));
        }
        //        GregorianCalendar gc=new GregorianCalendar();
//        requirement.setRemainTime(format.format(requirement.getuReqEndTime()-requirement.getCreateTime()));
        model.addAttribute("detail", requirement);
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice && StringUtils.isNotBlank(isDetail)){
            return "/mobile/page/demand-detail";
        }
        if (isMobileDevice) {
            return "/mobile/page/demand-modifi";
        }
        return "/front/manage/demand_to_alter";
    }


    /**
     * 用户发布需求
     *
     * @param requirement
     * @return
     */
    @RequestMapping(value = "/pub", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> publish(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody Requirement requirement) {
        Long uUid = (Long) request.getSession().getAttribute("uid");
        if (uUid == null) {
            try {
                response.sendRedirect("/front/user/login");
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }
        if (StringUtils.isEmpty(requirement.getuReqDescription())) {
            ResponseHelper.createErrorResponse("发布需求 描述不能为空");
        }
        requirement.setuUid(uUid);
        int result = requirementService.publish(requirement);
        if (result > 0)
            return ResponseHelper.createSuccessResponse(result);
        return ResponseHelper.createErrorResponse("发布需求失败");
    }

    /**
     * 用户修改需求
     *
     * @param requirement
     * @return
     */
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> modify(@RequestBody Requirement requirement, HttpServletRequest request) {
        //用户修改需求内容后 状态变为待审核,有效期重新计算
        Long uUid = (Long) request.getSession().getAttribute("uid");
        requirement.setuUid(uUid);
        int result = requirementService.modify(requirement);
        if (result > 0)
            return ResponseHelper.createSuccessResponse(result);
        return ResponseHelper.createErrorResponse("修改需求失败");
    }

    /**
     * 修改审核状态
     *
     * @param requirement
     * @return
     */
    @RequestMapping(value = "/auditing", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> auditing(@RequestBody Requirement requirement) {
        int result = requirementService.auditing(requirement);
        if (result > 0)
            return ResponseHelper.createSuccessResponse();
        else return ResponseHelper.createErrorResponse("修改审核状态失败");
    }

    /**
     * 延长需求的有效期
     *
     * @return
     */
    @RequestMapping(value = "/delay", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> delay(Long uReqId) {
        int result = requirementService.delay(uReqId);
        if (result > 0)
            return ResponseHelper.createSuccessResponse();
        else return ResponseHelper.createErrorResponse("延期失败");
    }

}
