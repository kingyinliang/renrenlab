package com.renrenlab.rlab.controller.front;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.InstrumentCategoryDao;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.ISearchAll;
import com.renrenlab.rlab.service.ISuperSearchService;
import com.renrenlab.rlab.service.InfomationService;
import com.renrenlab.rlab.service.ServiceInfoService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2018/1/10.
 */
@Controller
@RequestMapping("front/search")
public class SearchAllController {
    @Autowired
    ISearchAll searchAll;
    @Autowired
    InstrumentCategoryDao instrumentCategoryDao;
    @Autowired
    InfomationService infomationService;
    @Autowired
    private ISuperSearchService superSearchService;
    @Autowired
    private ServiceInfoService infoService;

    @RequestMapping("all")
    public String searchAll(HttpServletRequest request, Model model,
                            @RequestParam(required = false) String searchKey,
                            @RequestParam(defaultValue = "1", required = false) Integer pageNo,
                            @RequestParam(defaultValue = "10", required = false) Integer pageSize,
                            @RequestParam(required = false) String province,
                            @RequestParam(required = false) String city,
                            @RequestParam(required = false) String district) {
        Map<String, PageInfo> map = searchAll.searchAll(pageNo, pageSize, searchKey, province, city, district);
        //感兴趣的领域
        JSONArray interestArr = superSearchService.relatedInterest(searchKey);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            model.addAttribute("keyword", searchKey);
            model.addAttribute("result", map);
            model.addAttribute("interestArr", interestArr);
            return "mobile/page/search_result";
        }
        return "";
    }

    @RequestMapping({"p1", "p2", "p3", "p4"})
    public String searchItem(HttpServletRequest request, Model model,
                             @RequestParam(required = false) String searchKey,
                             @RequestParam(required = false) String all,

                             @RequestParam(defaultValue = "1", required = false) Integer pageNo,
                             @RequestParam(defaultValue = "10", required = false) Integer pageSize,
                             @RequestParam(required = false) String province,
                             @RequestParam(required = false) String city,
                             @RequestParam(required = false) String district,
                             @RequestParam(required = false) String keyword,
                             @RequestParam(required = false) String category2,
                             @RequestParam(required = false) String tag) {
        String strUri = request.getRequestURI();
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            model.addAttribute("keyword", searchKey);
            if (StringUtils.contains(strUri, "p1")) {
                return "mobile/page/search_result1";
            }
            if (StringUtils.contains(strUri, "p2")) {
                model.addAttribute("all", all);
                //第三方检测页面 返回一级的服务分类
                List<ServiceClassify> list = infoService.serviceClassifyList(0L);
                model.addAttribute("category", list);
                return "mobile/page/search_result2";
            }
            if (StringUtils.contains(strUri, "p3")) {
                model.addAttribute("all", all);
                //第三方检测页面 返回一级的服务分类
                List<ServiceClassify> list = infoService.serviceClassifyList(0L);
                model.addAttribute("category", list);
                return "mobile/page/search_result3";
            }
            if (StringUtils.contains(strUri, "p4")) {
                model.addAttribute("all", all);
                return "mobile/page/search_result4";
            }
            return "";
        } else {
            if (StringUtils.contains(strUri, "p2")) {
                PageInfo<ServiceIndexInfo> info = searchAll.getService(pageNo, pageSize, keyword, tag, province, city, district, category2);
                model.addAttribute("info", info);
                return "front/page/ins_list";
            }
        }
        return "";
    }

    /**
     * 仪器预约
     *
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("more_ins_page")
    public ModelAndView getMoreInsPage(HttpServletRequest request,
                                       Model model) {
        //session 中没有经纬度
        Map<String, String> map = SearchUtil.handleLocation(request.getSession());
        //province是1.'全国'搜全国 2.'null' 根据地理定位去搜 3、准确的省
        String province = null, city = null;
        if (map != null) {
            province = map.get(SearchUtil.PROVINCE_BY_IP);
            city = map.get(SearchUtil.CITY_BY_IP);
        }
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            model.addAttribute("province", province);
            model.addAttribute("city", city);
            return new ModelAndView("mobile/page/ins_list");
        }
        return null;

    }

    /**
     * 仪器预约更多
     *
     * @param pageNo
     * @param pageSize
     * @param tag      "仪器预约"
     * @return
     */
    @RequestMapping("more_ins")
    @ResponseBody
    public Response getMoreIns(@RequestParam(defaultValue = "1", required = false) Integer pageNo,
                               @RequestParam(defaultValue = "10", required = false) Integer pageSize,
                               @RequestParam(required = false) String province,
                               @RequestParam(required = false) String city,
                               @RequestParam(required = false) String district,
                               @RequestParam(required = false) String category2,
                               @RequestParam(required = false) String keyword,
                               @RequestParam String tag) {
        PageInfo<InsListInfo> ins = searchAll.getMoreIns(pageNo, pageSize, keyword, category2, province, city, district, tag);
        return ResponseHelper.createSuccessResponse(ins);
    }

    /**
     * 根据分类父类id获取二级分类
     *
     * @param code
     * @return
     */
    @RequestMapping("categories")
    @ResponseBody
    public Response getCategories(@RequestParam() String code) {
        List<InstrumentCategory> categories = instrumentCategoryDao.selectByLevelAndCode(2, code);
        return ResponseHelper.createSuccessResponse(categories);
    }

    /**
     * 带标签的服务，仪器修改
     *
     * @param pageNo
     * @param pageSize
     * @param province
     * @param city
     * @param district
     * @param keyword
     * @param tag      临床前CRO服务,人人实验室,分析检测,第三方检测,科研众包
     * @return
     */
    @RequestMapping("cro")
    @ResponseBody
    public Response getCROService(@RequestParam(defaultValue = "1", required = false) Integer pageNo,
                                  @RequestParam(defaultValue = "10", required = false) Integer pageSize,
                                  @RequestParam(required = false) String province,
                                  @RequestParam(required = false) String city,
                                  @RequestParam(required = false) String district,
                                  @RequestParam(required = false) String keyword,
                                  @RequestParam(required = false) String category2,
                                  @RequestParam() String tag) {
        PageInfo<ServiceIndexInfo> info = searchAll.getService(pageNo, pageSize, keyword, tag, province, city, district, category2);
        return ResponseHelper.createSuccessResponse(info);
    }

    @RequestMapping("cro_page")
    public String getCROServicePage(HttpServletRequest request, Model model, String tag) {
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            model.addAttribute("tag", tag);
            return "mobile/page/cro";
        }
        return "";
    }

    /**
     * 资讯检索(科技头条页面)
     *
     * @param keyword      搜索的关键词
     * @param classifyName 最新文章,行业动态  政策速报 最新活动
     */
    @RequestMapping("sciences")
    @ResponseBody
    public Response getMClassifies(@RequestParam(defaultValue = "1", required = false) Integer pageNo,
                                   @RequestParam(defaultValue = "10", required = false) Integer pageSize,
                                   @RequestParam(required = false) String keyword,
                                   @RequestParam String classifyName) {
        PageInfo<Infomation> infomations = null;
        switch (classifyName) {
            case "行业动态":
            case "政策速报":
            case "最新活动":
                infomations = searchAll.getClassify(classifyName, pageNo);
                break;
            case "职来职往":
                break;
            default:
                //最新文章
                infomations = infomationService.getArticles(keyword, null, pageNo, pageSize);
                break;
        }
        return ResponseHelper.createSuccessResponse(infomations);
    }

    /**
     * 职来职往列表
     *
     * @param pageNo
     * @return
     */
    @RequestMapping({"career", "recruit", "resume"})
    @ResponseBody
    public Response getJobs(HttpServletRequest request, @RequestParam(defaultValue = "1", required = false) Integer pageNo) {
        String requestUri = request.getRequestURI();
        PageInfo infomations = null;
        if (StringUtils.contains(requestUri, "career")) {
            infomations = infomationService.getCareers(pageNo, 2);
        }
        if (StringUtils.contains(requestUri, "recruit")) {
            infomations = infomationService.getRecruits(pageNo, 2);
        }
        if (StringUtils.contains(requestUri, "resume")) {
            infomations = infomationService.getResumes(pageNo, 2);
        }
        return ResponseHelper.createSuccessResponse(infomations);
    }


    @RequestMapping("sciences_page")
    public String getMClassifiesPage(HttpServletRequest request) {
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/message_list";
        }
        return "";
    }

    @RequestMapping("renrenlab_page")
    public String getRenrenlabPage(HttpServletRequest request, Model model, String name) {
        model.addAttribute("name", name);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/renrenlab_detail";
        }
        return "front/page/renrenlab_detail";
    }

}
