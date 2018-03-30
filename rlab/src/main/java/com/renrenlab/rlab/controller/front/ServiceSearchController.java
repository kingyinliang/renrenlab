package com.renrenlab.rlab.controller.front;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.ServiceIndexDao;
import com.renrenlab.rlab.dao.ServiceInfoDao;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.OrgIndex;
import com.renrenlab.rlab.model.ServiceClassify;
import com.renrenlab.rlab.model.ServiceIndexInfo;
import com.renrenlab.rlab.service.*;
import com.renrenlab.rlab.vo.OrgInfo;
import com.renrenlab.rlab.vo.ServiceInfoCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/10/18.
 */
@Controller
@RequestMapping(value = "service")
public class ServiceSearchController {

    @Autowired
    private IServiceIndexService indexService;
    @Autowired
    private ISuperSearchService superSearchService;
    private static final String NATIONWIDE = "全国";
    @Autowired
    private ServiceIndexDao serviceIndexDao;
    @Autowired
    private OrgService orgService;
    @Autowired
    ServiceInfoDao serviceInfoDao;
    @Autowired
    private ServiceInfoService infoService;
    @Autowired
    private FrontInsService frontInsService;

    @RequestMapping(value = "search")
    public String searchServices(Model model, HttpServletRequest request, HttpSession session, @RequestParam(required = false) String keyword,
                                 @RequestParam(required = false) String province, @RequestParam(required = false) String city, @RequestParam(required = false) String district,
                                 @RequestParam(required = false) Integer scopeLowPrice, @RequestParam(required = false) Integer scopeHighPrice,
                                 @RequestParam(required = false) String order,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo, @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                 @RequestParam(required = false) String category1,
                                 @RequestParam(required = false) String category2,
                                 @RequestParam(required = false) String priceFlag) {
        if (pageNo < 0 || pageSize < 0 || pageSize > 50) {
            return "redirect:404";
        }
        String orderByDefault = null, orderByPrice = null, orderByDis = null;
        if (order != null) {
            switch (order) {
                case "dis_asc":
                case "dis_des":
                    orderByDis = order;
                    break;
                case "price_des":
                case "price_asc":
                    orderByPrice = order;
                    break;
            }
        }
        Map<String, String> map = SearchUtil.handleLocation(session);
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
            districts = serviceIndexDao.getDistrict(province, city);
        }
        PageInfo<ServiceIndexInfo> infos = indexService.search(keyword, province, city, district,
                scopeLowPrice, scopeHighPrice,
                orderByDefault, orderByPrice, orderByDis,
                pageNo, pageSize, null, session, null, null, null);
        //该地区是否有服务
        int other = 0;
        if (infos.getTotal() == 0) {
            //该区域没有服务 district条件置空 搜索该省下其他区域  根据经纬度获取其他地区服务
            infos = indexService.search(keyword, province, city, null,
                    scopeLowPrice, scopeHighPrice,
                    orderByDefault, orderByPrice, orderByDis,
                    pageNo, pageSize, null, session, null, category1, category2);
            other = 1;
        }
        if (infos.getTotal() == 0) {
            //该城市没有服务 city,district置空
            infos = indexService.search(keyword, province, null, null,
                    scopeLowPrice, scopeHighPrice,
                    orderByDefault, orderByPrice, orderByDis,
                    pageNo, pageSize, null, session, null, category1, category2);
            other = 2;
        }
        if (infos.getTotal() == 0) {
            //该城市没有服务 province,city,district置空(搜全国)
            infos = indexService.search(keyword, null, null, null,
                    scopeLowPrice, scopeHighPrice,
                    orderByDefault, orderByPrice, orderByDis,
                    pageNo, pageSize, null, session, null, category1, category2);
            other = 3;
        }
        if (infos.getTotal() == 0) {
            other = 4;
        }
        //相关领域
        JSONArray interests = superSearchService.relatedInterest(keyword);
        model.addAttribute("infos", infos);
        model.addAttribute("districts", districts);
        model.addAttribute("interests", interests);
        model.addAttribute("keyword", keyword);
        model.addAttribute("province", rawProvince);
        model.addAttribute("city", city);
        model.addAttribute("district", district);
        model.addAttribute("scopeLowPrice", scopeLowPrice);
        model.addAttribute("scopeHighPrice", scopeHighPrice);
        model.addAttribute("priceFlag", priceFlag);
        model.addAttribute("order", order);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("other", other);
        Map<String, Object> map1 = orgService.searchFrontOrgList(keyword, province, city, district, null, null, null, session);
        PageInfo<OrgIndex> orgSize = (PageInfo<OrgIndex>) map1.get("infos");
        model.addAttribute("orgSize", orgSize.getTotal());
        PageInfo<InsListInfo> ins = frontInsService.searchInstrument(keyword, null, null, null,
                null, null, province, city, district, null, null, false, request, null);
        model.addAttribute("insSize", ins.getTotal());
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/service_list";
        }
        return "front/server/server_list";
    }

    /**
     * 查看服务详情
     *
     * @param serviceId
     * @return
     */
    @RequestMapping(value = {"keyan/detail/{serviceId}",
            "zhiliang/detail/{serviceId}"})
    public String getServiceDetail(Model model, HttpServletRequest request, @PathVariable Long serviceId) {
        //服务详情
        ServiceInfoCustom info = infoService.selectDetail(serviceId);
        //判断服务状态，不是上架状态，返回空
        if (info.getServiceState() != 4) {
            return "";
        }
        info.setServicePrice(SearchUtil.handlePrice(info.getServicePrice().toString()));
        //机构详情
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(info.getOrgOid());
        model.addAttribute("serviceInfo", info);
        model.addAttribute("orgInfo", orgInfo);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/service_detail";
        }
        if (request.getRequestURI().contains("keyan")) {
            model.addAttribute("flag", "keyan");
        } else if (request.getRequestURI().contains("zhiliang")) {
            model.addAttribute("flag", "zhiliang");
        } else {
            model.addAttribute("flag", null);
        }
        return "front/server/server_detail";
    }

    @RequestMapping("mdetail/{serviceId}")
    @ResponseBody
    public Response getServiceDetail(@PathVariable Long serviceId) {
        //服务详情
        ServiceIndexInfo info = serviceIndexDao.selectByServiceId(serviceId);
        if (info != null) {
            info.setServicePrice(SearchUtil.handlePrice(info.getServicePrice().toString()));
            if (info.getServicePic() != null) {
                info.setServicePic(SearchUtil.handlePicToStr(info.getServicePic().toString()));
            }
            return ResponseHelper.createSuccessResponse(info);
        }
        return null;
    }

    /**
     * param:第三方检测和科研众包里面的分类
     */
    @RequestMapping(value = "/classify")
    @ResponseBody
    public Response getClassify(@RequestParam Long id) {
        List<ServiceClassify> list = infoService.serviceClassifyList(id);
        if (list == null || list.size() == 0) {
            return ResponseHelper.createErrorResponse("查找失败");
        }
        return ResponseHelper.createSuccessResponse(list);
    }

    /**
     * m站分类页。。
     */
    @RequestMapping(value = "/classify_home")
    public String getClassifyHome() {
        return "mobile/page/classify_home";
    }

    /**
     * m站分类页获取分类
     */
    @RequestMapping(value = "/product_classify")
    @ResponseBody
    public Response getProductClassify(HttpServletRequest request, @RequestParam Long id) {
        List<HashMap> list = infoService.serviceProductClassifyList(id, HttpRequestDeviceUtil.isMobileDevice(request));

        if (list == null || list.size() == 0) {
            return ResponseHelper.createErrorResponse("查找失败");
        }
        return ResponseHelper.createSuccessResponse(list);
    }

    /**
     * 科研服务 classify=18
     * 质量服务 classify=99
     */
    @RequestMapping(value = {"keyan", "zhiliang"})
    public String getKeyan(Model model, HttpServletRequest request,
                           @RequestParam(required = false) Long classify,
                           @RequestParam String name,
                           @RequestParam(required = false) Integer scopeLowPrice,
                           @RequestParam(required = false) Integer scopeHighPrice,
                           @RequestParam(defaultValue = "1", required = false) Integer pageNo,
                           @RequestParam(required = false) String province,
                           @RequestParam(required = false) String city,
                           @RequestParam(required = false) String district,
                           @RequestParam(required = false) String keyword) {
        model.addAttribute("classify", classify == null ? "" : classify);
        model.addAttribute("name", name);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/classify_list";
        }
        PageInfo<ServiceIndexInfo> infos = indexService.search(keyword, province, city, district,
                scopeLowPrice, scopeHighPrice, null, null, null,
                pageNo, 10, null, request.getSession(), null,
                classify == null ? null : classify.toString(), null);
        model.addAttribute("infos", infos);
        model.addAttribute("keyword", keyword);
        model.addAttribute("province", province);
        model.addAttribute("scopeLowPrice", scopeLowPrice);
        model.addAttribute("scopeHighPrice", scopeHighPrice);
        if (request.getRequestURI().contains("zhiliang")) {
            return "front/server/server_list_zhiliang";
        } else if (request.getRequestURI().contains("keyan")) {
            return "front/server/server_list_keyan";
        }
        return "";
    }

    /**
     * 服务按分类查询列表
     */
    @RequestMapping(value = "/service_list")
    @ResponseBody
    public Response getServiceList(HttpServletRequest request, @RequestParam String classify,
                                   @RequestParam(defaultValue = "1") Integer pageNum,
                                   @RequestParam(required = false) String province,
                                   @RequestParam(required = false) String city,
                                   @RequestParam(required = false) String district) {
        PageInfo<ServiceIndexInfo> infos = indexService.search(null, province, city, district,
                null, null, null, null, null,
                pageNum, 10, null, request.getSession(), null, classify, null);
        return ResponseHelper.createSuccessResponse(infos);
    }
}
