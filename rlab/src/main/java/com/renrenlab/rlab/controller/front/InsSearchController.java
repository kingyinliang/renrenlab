package com.renrenlab.rlab.controller.front;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.ConfigUtil;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.InsSearchDao;
import com.renrenlab.rlab.dao.InstrumentCategoryDao;
import com.renrenlab.rlab.dao.ServiceInfoDao;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.FrontInsService;
import com.renrenlab.rlab.service.IServiceIndexService;
import com.renrenlab.rlab.service.ISuperSearchService;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.OrgInfo;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/5/17.
 */
@Controller
@RequestMapping(value = "/instrument")
public class InsSearchController {

    @Autowired
    private FrontInsService frontInsService;
    @Autowired
    private InstrumentCategoryDao instrumentCategoryDao;
    @Autowired
    private OrgService orgService;
    @Autowired
    private ISuperSearchService superSearchService;
    @Autowired
    ServiceInfoDao serviceInfoDao;
    @Autowired
    InsSearchDao searchDao;
    @Autowired
    private IServiceIndexService indexService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    private static final String NATIONWIDE = "全国";

    /**
     * 搜索页搜索仪器列表
     *
     * @param pageNo
     * @param pageSize
     * @param keyword
     * @param isSubscribe 仪器预约
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(HttpServletRequest request,
                         Model model,
                         @RequestParam(required = false) String keyword,
                         @RequestParam(required = false) String insServiceType,
                         @RequestParam(required = false) Integer scopeLowPrice,
                         @RequestParam(required = false) Integer scopeHighPrice,
                         @RequestParam(required = false) String category1,
                         @RequestParam(required = false) String category2,
                         @RequestParam(required = false) String province,
                         @RequestParam(required = false) String city,
                         @RequestParam(required = false) String district,
                         @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                         @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                         @RequestParam(required = false) String code,
                         @RequestParam(required = false) String priceFlag,
                         @RequestParam(required = false) String slideFlag,
                         @RequestParam(required = false) String isSubscribe) {
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        logger.debug("是否手机端登陆,{}", isMobileDevice);
        //pageNo不合法返回404
        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            return "redirect:/m_404Error";
        }

        //session 中没有经纬度
        Map<String, String> map = SearchUtil.handleLocation(request.getSession());
        //province是1.'全国'搜全国 2.'null' 根据地理定位去搜 3、准确的省
        String rawProvince = province;
        List<String> districts = null;

        if (province == null && city == null) {
            province = map == null ? null : map.get(SearchUtil.PROVINCE_BY_IP);
        }
        if (NATIONWIDE.equals(province)) {
            province = null;
        }
        if (!NATIONWIDE.equals(province) && province != null) {
            districts = frontInsService.getDistrict(province, city);
        }
        PageInfo<InsListInfo> infos = frontInsService.searchInstrument(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                category1, category2, province, city, district, pageNo, pageSize, false, request, isSubscribe);
        //返回仪器分类
        List<InstrumentCategory> categories = null;
        if (code != null) {
            categories = instrumentCategoryDao.selectByLevelAndCode(2, code);
        }
        //该地区是否有仪器
        int other = 0;
        if (infos.getTotal() == 0) {
            //该区域没有仪器 district条件置空 搜索该省下其他区域  根据经纬度获取其他地区仪器
            infos = frontInsService.searchInstrument(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, city, null, pageNo, pageSize, true, request, isSubscribe);
            other = 1;
        }
        if (infos.getTotal() == 0) {
            //该城市没有仪器 city,district置空
            infos = frontInsService.searchInstrument(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, null, null, pageNo, pageSize, true, request, isSubscribe);
            other = 2;
        }

        if (infos.getTotal() == 0) {
            //该城市没有仪器 province,city,district置空
            infos = frontInsService.searchInstrument(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, null, null, null, pageNo, pageSize, true, request, isSubscribe);
            other = 3;
        }
        if (infos.getTotal() == 0) {
            other = 4;
        }

        //感兴趣的领域
        JSONArray interestArr = superSearchService.relatedInterest(keyword);

        model.addAttribute("infos", infos.getList());
        model.addAttribute("total", infos.getTotal());
        model.addAttribute("keyword", keyword);
        model.addAttribute("insServiceType", insServiceType);
        model.addAttribute("scopeLowPrice", scopeLowPrice);
        model.addAttribute("scopeHighPrice", scopeHighPrice);
        model.addAttribute("category1", category1);
        model.addAttribute("category2", category2);
        model.addAttribute("province", rawProvince);
        model.addAttribute("city", city);
        model.addAttribute("district", district);
        model.addAttribute("districts", districts);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("categories", categories);
        model.addAttribute("interestArr", interestArr);
        model.addAttribute("priceFlag", priceFlag);
        model.addAttribute("slideFlag", slideFlag);
        model.addAttribute("other", other);
        //返回查询条件
        PageInfo<ServiceIndexInfo> services = indexService.search(keyword, province, city, district,
                null, null,
                null, null, null,
                null, null, null, request.getSession(), null, null, null);
        model.addAttribute("serviceSize", services.getTotal());
        Map<String, Object> map1 = orgService.searchFrontOrgList(keyword, province, city, district, null, null, null, request.getSession());
        PageInfo<OrgIndex> orgSize = (PageInfo<OrgIndex>) map1.get("infos");
        model.addAttribute("orgSize", orgSize.getTotal());
        if (isMobileDevice) {
            return "/mobile/page/goods_list";
        }
        if (StringUtils.isNotBlank(isSubscribe)) {
            model.addAttribute("isSubscribe", isSubscribe);
        }
        return "/front/page/ins_list";
    }

    /**
     * 仪器详情搜索
     *
     * @param mapId
     * @return
     */
    @RequestMapping(value = "/search/{mapId}", method = RequestMethod.GET)
    public String search(HttpServletRequest request, Model model, @PathVariable Long mapId) {
        InsDetailInfo detailInfo = frontInsService.search(mapId);
        OrgInfo orgInfo = null;
        if (detailInfo != null) {
            if (detailInfo.getOrgOid() != null) {
                orgInfo = orgService.searchOrgInfoByOid(detailInfo.getOrgOid());
            }
            boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
            logger.debug("是否手机端登陆,{}", isMobileDevice);
            //        todo  判断结果非空
            if (detailInfo == null && isMobileDevice)
                return "redirect:/m_404Error";
            if (detailInfo == null && !isMobileDevice)
                return "redirect:/404Error";
            model.addAttribute("detail", detailInfo);
            model.addAttribute("orgInfo", orgInfo);
            if (isMobileDevice) {
                detailInfo.setInsCoreParam(null);
                model.addAttribute("detail", detailInfo);
                return "/mobile/page/goods_detail";
            }
        }
        return "/front/page/ins_detail";
    }


    @RequestMapping("msearch/{mapId}")
    @ResponseBody
    public Response search(HttpServletRequest request, @PathVariable Long mapId) {
        InsListInfo detailInfo = searchDao.selectByMapId(mapId);
        if (detailInfo != null) {
            detailInfo.setPrice(SearchUtil.handlePrice(detailInfo.getInsOrgPriceList()));
            if (detailInfo.getInsPic() != null) {
                detailInfo.setInsPic(SearchUtil.handlePicToStr(detailInfo.getInsPic().toString()));
            }
            return ResponseHelper.createSuccessResponse(detailInfo);
        }
        return null;
    }

    /**
     * 服务号二维码
     *
     * @return
     */
    @RequestMapping(value = "/qr", method = RequestMethod.GET)
    public String toWeixin() {
        return "/front/page/weixin";
    }

    @RequestMapping(value = "/location", method = RequestMethod.GET)
    @ResponseBody
    public Response<Map<String, String>> getPageLocation(HttpServletRequest request) {
        return ResponseHelper.createSuccessResponse(handleLocation(request));
    }

    private Map<String, String> handleLocation(HttpServletRequest request) {
        //获取客户端地理位置
        String cprovince = "";
        String ccity = "";
        String isMunicipality = "0";
        if (StringUtils.isEmpty((CharSequence) request.getSession().getAttribute("ccity"))
                && StringUtils.isEmpty((CharSequence) request.getSession().getAttribute("cprovince"))) {
            try {
                request.getSession().setAttribute("locationState", 1);
                String ip = (String) request.getSession().getAttribute("ip");
                if (!"3".equals(ConfigUtil.getProperty("env"))) {
                    ip = "111.204.101.181";
                }
                String result = HttpClientUtils.getSend(Constant.BAIDU_IP + ip);
//                result = "{\"address\":\"CN|\\u4e0a\\u6d77|\\u4e0a\\u6d77|None|CHINANET|0|0\",\"content\":{\"address\":\"\\u4e0a\\u6d77\\u5e02\",\"address_detail\":{\"city\":\"\\u4e0a\\u6d77\\u5e02\",\"city_code\":289,\"district\":\"\",\"province\":\"\\u4e0a\\u6d77\\u5e02\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"121.48789949\",\"y\":\"31.24916171\"}},\"status\":0}";
//                result = "{\"address\":\"CN|\\u5317\\u4eac|\\u5317\\u4eac|None|UNICOM|0|0\",\"content\":{\"address\":\"\\u5317\\u4eac\\u5e02\",\"address_detail\":{\"city\":\"\\u5317\\u4eac\\u5e02\",\"city_code\":131,\"district\":\"\",\"province\":\"\\u5317\\u4eac\\u5e02\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"116.40387397\",\"y\":\"39.91488908\"}},\"status\":0}";
//                result = "{\"address\":\"CN|\\u6e56\\u5317|\\u6b66\\u6c49|None|CHINANET|0|0\",\"content\":{\"address\":\"\\u6e56\\u5317\\u7701\\u6b66\\u6c49\\u5e02\",\"address_detail\":{\"city\":\"\\u6b66\\u6c49\\u5e02\",\"city_code\":218,\"district\":\"\",\"province\":\"\\u6e56\\u5317\\u7701\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.31620010\",\"y\":\"30.58108413\"}},\"status\":0}";
                net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(result);
                Integer status = (Integer) jsonObject.get("status");
                if (status != null && status == 0) {
                    net.sf.json.JSONObject adderssDetail = net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(jsonObject.get("content"))).get("address_detail"));
                    cprovince = (String) adderssDetail.get("province");
                    ccity = (String) adderssDetail.get("city");
                    //解析result 得到经纬度
                    net.sf.json.JSONObject latlng = net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(net.sf.json.JSONObject.fromObject(jsonObject.get("content"))).get("point"));
                    request.getSession().setAttribute(Constant.Service.LONGITUDE, latlng.get("x"));
                    request.getSession().setAttribute(Constant.Service.LATITUDE, latlng.get("y"));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            //是否是直辖市
            if (!StringUtils.isBlank(cprovince) && !StringUtils.isBlank(ccity) && ccity.equals(cprovince)) {
                //判断该直辖市是否有仪器
                isMunicipality = "1";
                if (!frontInsService.IsExistedInstrument(cprovince, false)) {
                    cprovince = "";
                }
                ccity = "";
            } else if (!StringUtils.isBlank(cprovince) && !StringUtils.isBlank(ccity) && !ccity.equals(cprovince)) {
                //判断该城市是否有仪器，如果没有判断省份有没有仪器
                if (frontInsService.IsExistedInstrument(ccity, true)) {
                    cprovince = "";
                } else if (frontInsService.IsExistedInstrument(cprovince, false)) {
                    ccity = "";
                } else {
                    ccity = "";
                    cprovince = "";
                }
            }
            request.getSession().setAttribute("cprovince", cprovince);
            request.getSession().setAttribute("ccity", ccity);
        } else {
            ccity = (String) request.getSession().getAttribute("ccity");
            cprovince = (String) request.getSession().getAttribute("cprovince");
        }
        Map<String, String> result = new HashMap<>();
        result.put("ccity", ccity);
        result.put("cprovince", cprovince);
        result.put("isMunicipality", isMunicipality);
        return result;
    }
}
