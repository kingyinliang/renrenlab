package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.model.Requirement;
import com.renrenlab.rlab.service.RequirementService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by guanjipeng on 2017/8/8.
 */
@Controller
@RequestMapping(value = "/bg/req")
public class BgReqController {

    @Autowired
    private RequirementService requirementService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String getReqList(Model model,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(required = false) Integer mapState,
                             //排序
                             @RequestParam(required = false) String order,
                             @RequestParam(required = false, defaultValue = "2016-01-01") String beginTime,
                             @RequestParam(required = false) String endTime,
                             @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                             @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        if (mapState == null || mapState == 99) {
            mapState = null;
        }

        String order1 = order;
        if (StringUtils.isBlank(order)) {
            order1 = null;
            order = "DESC";
        }
        PageInfo<Requirement> pageInfo = requirementService.getList(keyword, mapState, beginTime, endTime, pageNo, pageSize, order1);
        if (endTime == null) {
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        model.addAttribute("infos", pageInfo.getList());

        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("keyword", keyword);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        mapState = mapState == null ? 99 : mapState;
        model.addAttribute("mapState", mapState);
        model.addAttribute("order", order);
        return "/bg/page/demand_manage";

    }

    /**
     * 延长需求的有效期
     *
     * @return
     */
    @RequestMapping(value = "/delay", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> delay(@RequestParam Long uReqId) {
        int result = requirementService.delay(uReqId);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse();
        } else {
            return ResponseHelper.createErrorResponse("该需求只能延期一次");
        }
    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getDetail(HttpServletRequest request, @RequestParam Long uReqId, Model model) {
        Requirement requirement = requirementService.getDetailById(uReqId);
        SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd HH:mm:ss");
        requirement.setEndTime(format.format(requirement.getuReqEndTime()));
        requirement.setBeginTime(format.format(requirement.getCreateTime()));
        requirement.setModifyTimeStr(format.format(requirement.getModifyTime()));
        requirement.setRemainTime(SearchUtil.getRemainTime(requirement.getuReqEndTime()));
        model.addAttribute("detail", requirement);
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/demand-detail";
        }
        return "/bg/page/demand_detail";
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
        if (result > 0) {
            return ResponseHelper.createSuccessResponse();
        } else {
            return ResponseHelper.createErrorResponse("修改审核状态失败");
        }
    }
}
