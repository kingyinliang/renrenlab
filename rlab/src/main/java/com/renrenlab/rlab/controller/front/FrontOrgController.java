package com.renrenlab.rlab.controller.front;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.dao.ServiceInfoDao;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.model.OrgIndex;
import com.renrenlab.rlab.model.ServiceIndexInfo;
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
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by wanshou on 2017/5/26.
 */
@Controller
@RequestMapping(value = "/org")
public class FrontOrgController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private OrgService orgService;

    @Autowired
    private IServiceIndexService serviceIndexService;

    @Autowired
    private ISuperSearchService superSearchService;
    @Autowired
    ServiceInfoDao serviceInfoDao;
    @Autowired
    private FrontInsService frontInsService;
    @Autowired
    private IServiceIndexService indexService;

    /**
     * 搜索页搜索服务机构列表
     *
     * @param session
     * @param model
     * @param keyword  搜索关键字
     * @param province 省
     * @param city     市
     * @param district 区
     * @param order    排序规则 0 默认（认证状态和距离） 1 距离排序 2 共享指数 99 其他
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/query", method = RequestMethod.GET)
    public String search(HttpSession session,
                         HttpServletRequest request,
                         Model model,
                         @RequestParam(required = false) String keyword,
                         @RequestParam(required = false) String province,
                         @RequestParam(required = false) String city,
                         @RequestParam(required = false) String district,
                         @RequestParam(required = false, defaultValue = "0") Integer order,
                         @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                         @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        //TODO 手机端判断
        //判断分页参数的合法性
        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            return "redirect:/m_404Error";
        }
        if (StringUtils.isNotBlank(keyword)) {
            order = 99;
        }
        if (StringUtils.isBlank(keyword) && order == 99) {
            order = 0;
        }
        Map<String, Object> map = orgService.searchFrontOrgList(keyword, province, city, district, order, pageNo, pageSize, session);
        PageInfo<OrgIndex> infos = (PageInfo<OrgIndex>) map.get("infos");
        int other = (int) map.get("other");
        Long insCounts = (Long) map.get("insCounts");
        Long serCounts = (Long) map.get("serCounts");

        List<String> districts = null;
        if (province != null || city != null) {
            districts = orgService.getDistrict(province, city);
        }
        //感兴趣的领域
        JSONArray interestArr = superSearchService.relatedInterest(keyword);

        model.addAttribute("infos", infos);
        model.addAttribute("other", other);
        model.addAttribute("insCounts", insCounts);
        model.addAttribute("serCounts", serCounts);
        model.addAttribute("total", infos.getTotal());
        model.addAttribute("keyword", keyword);
        model.addAttribute("province", province);
        model.addAttribute("city", city);
        model.addAttribute("district", district);
        model.addAttribute("districts", districts);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("order", order);
        model.addAttribute("interestArr", interestArr);
//        PageInfo<InsListInfo> ins = frontInsService.searchInstrument(keyword, null, null, null,
//                null, null, province, city, district, null, null, false, request);
//        PageInfo<ServiceIndexInfo> services = indexService.search(keyword, province, city, district,
//                null, null,
//                null, null, null,
//                null, null, null, session);
        model.addAttribute("insSize", insCounts);
        model.addAttribute("serviceSize", serCounts);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/org_list";
        }
        return "/front/org/org_list";
    }


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
     * 查询排名前三的机构
     *
     * @param model
     * @param k
     * @return
     */
    @RequestMapping(value = "/search/top/{k}", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> searchOrgBaseInfoTopK(Model model, @PathVariable Integer k) {
        k = k == null || k < 1 || k > 10 ? 3 : k;
        List<OrgInfo> orgInfoList = orgService.searchOrgBaseInfoListTopK(k);
        Response<?> response = orgInfoList != null ? ResponseHelper.createSuccessResponse(orgInfoList) : ResponseHelper.createErrorResponse("查询前K名机构");
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
        int serviceCounts = serviceIndexService.selectCountsByOrgOid(oid);
        model.addAttribute("orgInfo", orgInfo);
        model.addAttribute("serviceCounts", serviceCounts);
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
                                 @RequestParam Integer pageSize,
                                 @RequestParam(required = false) Integer backFlag
    ) {

        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);

        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            if (isMobileDevice) {
                return "redirect:/m_404Error";
            } else {
                return "redirect:/404Error";
            }
        }
        PageInfo<InsListInfo> pageInfo = orgService.searchInsByOid(oid, pageNo, pageSize);
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        int serviceCounts = serviceIndexService.selectCountsByOrgOid(oid);
        model.addAttribute("serviceCounts", serviceCounts);
        model.addAttribute("oid", oid);
        model.addAttribute("InsListInfoList", pageInfo.getList());
        model.addAttribute("orgInfo", orgInfo);
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("backFlag", backFlag);

        if (isMobileDevice) {
            return "/mobile/page/org_ins";
        }
        return "/front/org/org_ins";

    }

    /**
     * 查询机构所拥有的服务信息
     *
     * @param model
     * @param oid
     * @return
     */
    @RequestMapping(value = "/{oid}/service", method = RequestMethod.GET)
    public String searchServiceByOid(HttpServletRequest request,
                                     Model model,
                                     @PathVariable long oid,
                                     @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                     @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                     @RequestParam(required = false) Integer backFlag
    ) {
        if (pageNo <= 0 || pageSize > 20) {
            logger.error("pageNo{}或者pageSize{}不合法", pageNo, pageSize);
            return "redirect:/m_404Error";
        }
        PageInfo<ServiceIndexInfo> pageInfo = serviceIndexService.searchByOrgOid(oid, pageNo, pageSize, request.getSession());
        OrgInfo orgInfo = orgService.searchOrgInfoByOid(oid);
        model.addAttribute("oid", oid);
        model.addAttribute("infos", pageInfo);
        model.addAttribute("orgInfo", orgInfo);
        model.addAttribute("total", pageInfo.getTotal());
        model.addAttribute("pages", pageInfo.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("backFlag", backFlag);

        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        if (isMobileDevice) {
            return "/mobile/page/org_service";
        }
        return "/front/org/org_server";

    }

    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String toAboutUs() {
        return "/front/org/org_upload";
    }


    @RequestMapping(value = "temp")
    @ResponseBody
    public Response<?> tempGet() {
//        List<TempModel> list = serviceInfoDao.getModels();
//
//        for (TempModel model : list){
//            JSONArray array = JSONArray.parseArray(model.getIds().toString());;
//            for (int i = 0; i < array.size() - 1; i++) {
//                serviceInfoDao.insertIns(model.getInsId(), (int)array.get(i));
//            }
//        }
        return ResponseHelper.createSuccessResponse();
    }
}
