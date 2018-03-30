package com.renrenlab.rlab.controller.bg;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.model.Price;
import com.renrenlab.rlab.service.InstrumentService;
import com.renrenlab.rlab.vo.InstrumentInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/5/15.
 * 后台仪器模块
 */
@Controller
@RequestMapping("/bg/instrument")
public class InstrumentController {

    @Autowired
    private InstrumentService instrumentService;
    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 仪器列表页面 可以根据关键字搜索 or 默认显示
     *
     * @param keyword  查询关键字
     * @param pageNo   查询第几页
     * @param pageSize 该页条数
     * @return 仪器列表页面
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toBgInstrumentSearch(Model model,
                                       @RequestParam(required = false) String keyword,
                                       @RequestParam(required = false) Integer oci,
                                       @RequestParam(required = false) Integer pageNo,
                                       @RequestParam(required = false) Integer pageSize) {
        logger.info("invoke--------------------/bg/instrument/search");
        PageInfo<InstrumentInfo> infos = instrumentService.searchInstrument(keyword, oci, pageNo, pageSize);
        //处理价格
        for (InstrumentInfo info : infos.getList()) {
            Price price = SearchUtil.handlePrice(info.getInsOrgPriceList().toString());
            info.setInsOrgPriceList(price);
        }
        model.addAttribute("instrumentList", infos.getList());
        model.addAttribute("total", infos.getTotal());
        model.addAttribute("pages", infos.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("keyword", keyword);
        if (oci == null)
            model.addAttribute("oci", 0);
        else model.addAttribute("oci", oci);

        return "/bg/page/machineList";
    }

    /**
     * 仪器详情页面
     *
     * @return
     */
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public String toBgInstrumentDetail(Model model, @RequestParam Long insIid, @RequestParam Long mapId) {

        logger.info("invoke--------------------/bg/instrument/detail");
        InstrumentInfo instrumentInfo = instrumentService.searchInstrument(insIid, mapId);
        if (instrumentInfo == null)
            return "";
        //处理描述
        List<InstrumentInfo.Description> descriptionList =
                JSONObject.parseArray(instrumentInfo.getInsDescription().toString(), InstrumentInfo.Description.class);
        //价格处理
        if (instrumentInfo.getInsOrgPriceList() != null) {
            SearchUtil.handlePrice(instrumentInfo.getInsOrgPriceList().toString());
            model.addAttribute("price", SearchUtil.handlePrice(instrumentInfo.getInsOrgPriceList().toString()));
        }
        //图片处理
        if (instrumentInfo.getInsPic() != null) {
            model.addAttribute("insPicList", SearchUtil.handlePic(instrumentInfo.getInsPic().toString()));
        }
        model.addAttribute("instrumentInfo", instrumentInfo);
        model.addAttribute("descriptionList", descriptionList);
        return "/bg/page/machineDetails";
    }

    /**
     * 仪器添加页面
     *
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String toBgInstrumentAdd() {
        return "/bg/page/addMachine";
    }

    /**
     * 仪器添加接口
     *
     * @param instrumentInfo 仪器类对象
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> bgInstrumentAdd(@RequestBody InstrumentInfo instrumentInfo) {
        logger.info("invoke---/bg/instrument/add ");
        //添加仪器之前校验一下 仪器持有机构是否存在
        Long orgOid = instrumentInfo.getOrgOid();
        Map<String, Object> map = new HashMap<>();
        if (orgOid == null) {
            map.put("code", "250");
            map.put("payload", "机构不存在");
            return map;
        }
        String orgName = instrumentService.getOrgName(orgOid);
        if (!orgName.equals(instrumentInfo.getOrgName())) {
            map.put("code", "250");
            map.put("payload", "机构不存在");
            return map;
        }

        InstrumentInfo result = instrumentService.addInstrument(instrumentInfo);
        if (result.getInsIid() != null) {
            map.put("code", "200");
            map.put("payload", "添加成功");
            map.put("insIid", result.getInsIid());
            map.put("mapId", result.getMapId());
        } else {
            map.put("code", "250");
            map.put("payload", "添加失败");
        }
        return map;
    }

    /**
     * 仪器修改页面
     *
     * @return
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String toBgInstrumentModify(Model model, @RequestParam Long insIid, @RequestParam Long mapId) {
        logger.info("invoke---/bg/instrument/modify");
        InstrumentInfo instrumentInfo = instrumentService.searchInstrument(insIid, mapId);
        model.addAttribute("instrumentInfo", instrumentInfo);
        List<InstrumentInfo.Description> descriptionList = JSONObject.parseArray(instrumentInfo.getInsDescription().toString(), InstrumentInfo.Description.class);
        model.addAttribute("descriptionList", descriptionList);
        //价格处理
        if (instrumentInfo.getInsOrgPriceList() != null) {
            SearchUtil.handlePrice(instrumentInfo.getInsOrgPriceList().toString());
            model.addAttribute("price", SearchUtil.handlePrice(instrumentInfo.getInsOrgPriceList().toString()));
        }
        //图片处理
        if (instrumentInfo.getInsPic() != null) {
            model.addAttribute("insPicList", SearchUtil.handlePic(instrumentInfo.getInsPic().toString()));
        }
        return "/bg/page/modifyMachine";
    }

    /**
     * 更新仪器信息
     *
     * @param instrumentInfo 仪器类对象
     * @return
     */
    @RequestMapping(value = "/modify", method = RequestMethod.PUT)
    @ResponseBody
    public Map<String, Object> bgInstrumentModify(@RequestBody InstrumentInfo instrumentInfo) {
        logger.info("invoke--------------------/bg/instrument/modify");
        Long orgOid = instrumentInfo.getOrgOid();
        Map<String, Object> map = new HashMap<>();
        if (orgOid == null) {
            map.put("code", "250");
            map.put("payload", "机构不存在");
            return map;
        }
        int result = instrumentService.modifyInstrument(instrumentInfo);
        if (result > 0) {
            map.put("code", "200");
            map.put("payload", "保存成功");
            return map;
        } else {
            map.put("code", "250");
            map.put("payload", "保存失败");
            return map;
        }
    }

    /**
     * 仪器详情页 可以关闭或打开仪器 or 跳转到仪器修改页面
     *
     * @param id 想要关闭的仪器id
     * @return
     */
    @RequestMapping(value = "/turn", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> bgInstrumentClose(@RequestParam Long mapId, @RequestParam Long id, @RequestParam Integer insState) {
        logger.info("invoke--------------------/bg/instrument/turn");
        int result = instrumentService.closeOrOpenInstrument(mapId, id, insState);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse();
        } else {
            return ResponseHelper.createErrorResponse("关闭仪器失败！");
        }
    }

    /**
     * ajax 自动填充仪器品牌
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "/brand", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getBrandName(@RequestParam("key") String key) {
        logger.info("invoke---/bg/instrument/brand" + key);
        List<String> brands = instrumentService.getBrandName(key);
        Map<String, Object> result = new HashMap<>();
        result.put("code", "200");
        result.put("payload", brands);
        return result;
    }

    /**
     * ajax 请求机构id 和 名称
     *
     * @param key
     * @return
     */
    @RequestMapping(value = "/orgni", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> getOrgNameAndId(@RequestParam("key") String key) {
        List<OrgBaseInfo> baseInfos = instrumentService.getOrgNameAndId(key);
        Map<String, Object> result = new HashMap<>();
        result.put("code", "200");
        result.put("payload", baseInfos);
        return result;
    }


}
