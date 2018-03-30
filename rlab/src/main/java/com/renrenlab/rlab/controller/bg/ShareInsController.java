package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.ShareInsService;
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/7/21.
 */
@Controller
@RequestMapping(value = "/bg/share")
public class ShareInsController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ShareInsService service;

    /**
     * 共享仪器列表
     *
     * @param model
     * @param keyword   仪器编号、仪器名称、仪器型号、持有机构
     * @param mapState  仪器状态
     * @param beginTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String toShareList(Model model,
                              @RequestParam(required = false) String keyword,
                              @RequestParam(required = false) String mapState,
                              @RequestParam(required = false) String beginTime,
                              @RequestParam(required = false) String endTime,
                              @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                              @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                              @RequestParam(required = false) String order) {

        try {
            PageInfo<ShareInsListInfo> infoPageInfo = service.getList(keyword, mapState, beginTime, endTime, pageNo, pageSize, order);
            model.addAttribute("shareList", infoPageInfo.getList());
            model.addAttribute("total", infoPageInfo.getTotal());
            model.addAttribute("pages", infoPageInfo.getPages());
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        if (beginTime == null) beginTime = "2016-01-01";
        if (endTime == null) endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword = keyword == null ? "" : keyword);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        mapState = mapState == null ? "99" : mapState;
        model.addAttribute("mapState", mapState);
        model.addAttribute("order", order);
        return "/bg/page/insShareInfoManage";

    }

    /**
     * 根据共享仪器编号 查询详情
     *
     * @param mapId
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String getDetail(Model model, @RequestParam Long mapId) {
        ShareInsDetailInfo insDetailInfo = null;
        try {
            insDetailInfo = service.getDetail(mapId);
            model.addAttribute("detail", insDetailInfo);
        } catch (Exception e) {
            logger.error("根据共享仪器编号查询详情出现异常，mapId=" + mapId + "，异常为", e);
        }
        return "/bg/page/insShareInfoAboutDetail";
//        return ResponseHelper.createSuccessResponse(insDetailInfo);
    }

    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> modifyShareIns(@RequestBody ShareInsDetailInfo shareInsDetailInfo) {
        try {
            int result = service.updateShareIns(shareInsDetailInfo);
            if (result > 0) return ResponseHelper.createSuccessResponse();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return ResponseHelper.createErrorResponse("更新共享仪器信息失败");
    }

    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String toModifyShareIns(Model model, @RequestParam Long mapId) {
        ShareInsDetailInfo insDetailInfo = null;
        try {
            insDetailInfo = service.getDetail(mapId);
            model.addAttribute("detail", insDetailInfo);
        } catch (Exception e) {
            logger.error("根据共享仪器编号查询详情出现异常，mapId=" + mapId + "，异常为", e);
        }
        return "/bg/page/insShareInfoToAlter";
    }

    @RequestMapping(value = "/modifybase", method = RequestMethod.GET)
    public String toModifyLeftShareIns(Model model, @RequestParam Long mapId) {
        ShareInsDetailInfo insDetailInfo = null;
        try {
            insDetailInfo = service.getDetail(mapId);
            model.addAttribute("detail", insDetailInfo);
        } catch (Exception e) {
            logger.error("根据共享仪器编号查询详情出现异常，mapId=" + mapId + "，异常为", e);
        }
        return "/bg/page/insShareBaseInfoToAlter";
    }


    /**
     * 审核仪器
     *
     * @param mapIds
     * @param state
     * @return
     */
    @RequestMapping(value = "/turn", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> turnOnOROff(@RequestParam Long[] mapIds, @RequestParam Integer state) {
        int result = 0;
        try {
            result = service.turn(mapIds, state);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        if (result > 0)
            return ResponseHelper.createSuccessResponse();
        else return ResponseHelper.createErrorResponse("更新状态失败");
    }

    /**
     * ajax 请求机构id 和 名称
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "/queryorg", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getOrgNameAndId(@RequestParam(required = false) String key) {
        List<OrgBaseInfo> baseInfos = service.getOrgNameAndId(key);
        return ResponseHelper.createSuccessResponse(baseInfos);
    }

    /**
     * ajax 查询仪器领域
     */
    @RequestMapping(value = "/scope", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getScope(@RequestParam(required = false) String[] arr) {
        Map<String, Object> result = service.getScope(arr);
        return result;
    }

    /**
     * ajax 添加仪器领域
     */
    @RequestMapping(value = "/addScope", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addScope(@RequestBody InstrumentScope scope) {
        Map<String, Object> result = service.addScope(scope);
        return result;
    }

    /**
     * ajax 查询仪器特点
     */
    @RequestMapping(value = "/feature", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getFeature(@RequestParam(required = false) String[] arr) {
        Map<String, Object> result = service.getFeature(arr);
        return result;
    }

    /**
     * ajax 添加仪器特点
     */
    @RequestMapping(value = "/addFeature", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addFeature(@RequestBody InstrumentFeature feature) {
        Map<String, Object> result = service.addFeature(feature);
        return result;
    }

    //根据机构id 查询机构地址和联系方式
    @RequestMapping(value = "/getmore", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getMore(@Param("orgId") Long orgId) {
        return ResponseHelper.createSuccessResponse(service.getMore(orgId));
    }
}

