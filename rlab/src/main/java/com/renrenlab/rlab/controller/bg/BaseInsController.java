package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.model.BaseInsInfo;
import com.renrenlab.rlab.service.BaseInsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/5/15.
 * 后台仪器模块
 */
@Controller
@RequestMapping("/bg/baseins")
public class BaseInsController {

    @Autowired
    private BaseInsService baseInsService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 基本仪器列表
     *
     * @param model
     * @param keyword     仪器编号/仪器名称/仪器型号
     * @param pageNo
     * @param pageSize
     * @param insCategory 仪器分类
     * @param beginTime
     * @param endTime
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String toBgInstrumentSearch(Model model,
                                       @RequestParam(required = false) String keyword,
                                       @RequestParam(required = false) String insCategory,
                                       @RequestParam(required = false) String beginTime,
                                       @RequestParam(required = false) String endTime,
                                       @RequestParam(required = false) Integer pageNo,
                                       @RequestParam(required = false) Integer pageSize,
                                       @RequestParam(required = false) String order) {

        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;
        PageInfo<BaseInsInfo> info = baseInsService.getList(keyword, insCategory, beginTime, endTime, pageNo, pageSize, order);
        if (beginTime == null) beginTime = "2016-01-01";
        if (endTime == null) endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        model.addAttribute("infoList", info.getList());
        model.addAttribute("total", info.getTotal());
        model.addAttribute("pages", info.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("insCategory", insCategory);
        model.addAttribute("order", order); //排序
        return "/bg/page/insBaseInfoToManage";
    }

    /**
     * 仪器详情页面
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String toInsDetail(Model model, @RequestParam Long insIid) {
        BaseInsInfo baseInsInfo = baseInsService.getDetail(insIid);
        model.addAttribute("baseInfo", baseInsInfo);

        //处理核心参数
        if (baseInsInfo.getInsCoreParam() != null) {
            model.addAttribute("coreParamList",
                    SearchUtil.handelCoreParam(baseInsInfo.getInsCoreParam().toString()));
        }

        //图片处理
        if (baseInsInfo.getInsPic() != null) {
            model.addAttribute("insPicList",
                    SearchUtil.handlePic(baseInsInfo.getInsPic().toString()));
        }

        //描述处理
        if (baseInsInfo.getInsDescription() != null) {
            model.addAttribute("descriptionList",
                    SearchUtil.handleDes(baseInsInfo.getInsDescription().toString()));
        }
        return "/bg/page/insBaseInfoAboutDetail";
    }

    /**
     * 仪器修改页面
     *
     * @return
     */
    @RequestMapping(value = "/tomodify", method = RequestMethod.GET)
    public String toModify(Model model, @RequestParam Long insIid) {
        BaseInsInfo instrumentInfo = baseInsService.getDetail(insIid);
        model.addAttribute("baseInfo", instrumentInfo);

        //处理核心参数
        if (instrumentInfo.getInsCoreParam() != null) {
            model.addAttribute("coreParamList",
                    SearchUtil.handelCoreParam(instrumentInfo.getInsCoreParam().toString()));
        }

        //图片处理
        if (instrumentInfo.getInsPic() != null) {
            model.addAttribute("insPicList",
                    SearchUtil.handlePic(instrumentInfo.getInsPic().toString()));
        }

        //描述处理
        if (instrumentInfo.getInsDescription() != null) {
            model.addAttribute("descriptionList",
                    SearchUtil.handleDes(instrumentInfo.getInsDescription().toString()));
        }
        return "/bg/page/insBaseInfoToAlter";
    }


    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modify(@RequestBody BaseInsInfo insInfo) {
        Map<String, Object> map = new HashMap<>();
        int result = baseInsService.modify(insInfo);
        if (result > 0) {
            map.put("code", "200");
            map.put("message", "更新成功");
        }
        return map;
    }


    /**
     * ajax 仪器三级分类
     */
    @RequestMapping(value = "/category", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCategory(@RequestParam("level") Integer level, @RequestParam(value = "code", required = false) String code) {
        Map<String, Object> result = baseInsService.getCategory(level, code);
        return result;
    }

    /**
     * ajax 仪器核心参数分类
     */
    @RequestMapping(value = "/coreParam", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getCoreParam(@RequestParam("code") String code) {
        Map<String, Object> result = baseInsService.getCoreParam(code);
        return result;
    }
}
