package com.renrenlab.rlab.controller.bg;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.ServiceInfoDao;
import com.renrenlab.rlab.model.ServiceAptitudeInfo;
import com.renrenlab.rlab.model.ServiceClassify;
import com.renrenlab.rlab.model.ServiceFeature;
import com.renrenlab.rlab.model.ServiceInfo;
import com.renrenlab.rlab.service.ServiceInfoService;
import com.renrenlab.rlab.vo.ServiceAuditModel;
import com.renrenlab.rlab.vo.ServiceInfoCustom;
import com.renrenlab.rlab.vo.ServiceListModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by renrenlab on 17/10/17.
 */
@Controller
@RequestMapping(value = "/bg/service")
public class ServiceController {
    @Autowired
    ServiceInfoService serviceInfoService;
    public static String UUID = "uid";
    @Autowired
    private ServiceInfoDao serviceInfoDao;

    /*添加服务*/
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Response addService(HttpServletRequest request,
                               HttpServletResponse response,
                               @RequestBody ServiceInfoCustom serviceInfoCustom) {

        int result = serviceInfoService.addService(serviceInfoCustom);
        if (result == 99) {
            return ResponseHelper.createErrorResponse("服务已存在");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("result", serviceInfoCustom.getServiceId());
        return ResponseHelper.createSuccessResponse(map);
    }

    /*查询服务详情*/
    @RequestMapping(value = "/detail")
    public String serviceDetail(Model model, @RequestParam Long serviceId) {
        ServiceInfoCustom serviceInfoCustom = serviceInfoService.selectDetail(serviceId);
        serviceInfoCustom.setServicePrice(SearchUtil.handlePrice(serviceInfoCustom.getServicePrice().toString()));
        model.addAttribute("result", serviceInfoCustom);
        return "/bg/page/service/service_detail";
    }

    /*修改服务页面*/
    @RequestMapping(value = "/modify")
    public String servicemodify(Model model, @RequestParam Long serviceId) {
        ServiceInfoCustom serviceInfoCustom = serviceInfoService.selectDetail(serviceId);
        serviceInfoCustom.setServicePrice(SearchUtil.handlePriceWithoutWan(serviceInfoCustom.getServicePrice().toString()));
        List<Map> orgNames = serviceInfoDao.selectOrgNameByUid(null);
        model.addAttribute("orgNames", orgNames);
        model.addAttribute("result", serviceInfoCustom);
        return "/bg/page/service/service_alter";
    }

    @RequestMapping(value = "/add_page")
    public String serviceAddPage(Model model) {
        List<Map> orgNames = serviceInfoDao.selectOrgNameByUid(null);
        model.addAttribute("orgNames", orgNames);
        return "/bg/page/service/service_add";
    }

    /*查询服务列表*/
    @RequestMapping(value = "/list")
    public String serviceList(HttpServletRequest request,
                              Model model,
                              @RequestParam(required = false) String keyword,
                              @RequestParam(required = false) Integer state,
                              @RequestParam(required = false) String beginTime,
                              @RequestParam(required = false) String endTime,
                              @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                              @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                              @RequestParam(required = false) String order) {

        Long uid = (Long) request.getSession().getAttribute("uid");
        Integer permisssionValue = (Integer) request.getSession().getAttribute("u_permisssion");

        PageInfo<ServiceListModel> serviceInfos = serviceInfoService.serviceList(uid, permisssionValue, keyword, state, beginTime, endTime, pageNo, pageSize, order, null);
        if (beginTime == null) {
            beginTime = "2016-01-01";
        }
        if (endTime == null) {
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        model.addAttribute("total", serviceInfos.getTotal());
        model.addAttribute("pages", serviceInfos.getPages());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("state", state == null ? "99" : state);
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("keyword", keyword);
        model.addAttribute("result", serviceInfos.getList());
        model.addAttribute("order", order);
        return "/bg/page/service/service_list";
    }

    /*修改服务*/
    @RequestMapping(value = "/alter", method = RequestMethod.POST)
    @ResponseBody
    public Response serviceModify(@RequestBody ServiceInfoCustom serviceInfoCustom) {
        serviceInfoCustom.setServiceState(1);
        serviceInfoCustom.setServicePics(SearchUtil.delXOSS(serviceInfoCustom.getServicePics().toString()).toJSONString());
        int result = serviceInfoService.updateService(serviceInfoCustom);
        if (result == 1) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("更新失败");
    }

    /*审核*/
    @RequestMapping(value = "/audit", method = RequestMethod.POST)
    @ResponseBody
    public Response audit(@RequestBody ServiceAuditModel model, HttpServletRequest request) {
        Integer permisssionValue = (Integer) request.getSession().getAttribute("u_permisssion");
        int result = serviceInfoService.auditService(model.getServiceIds(), model.getState());
        if (result > 0) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("审核提交失败");
    }


    /*查询特点*/
    @RequestMapping(value = "/feature")
    @ResponseBody
    public Response featureList(HttpServletRequest request) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        List<ServiceFeature> serviceFeatures = serviceInfoService.featureList(uid);
        return ResponseHelper.createSuccessResponse(serviceFeatures);
    }

    /*增加特点*/
    @RequestMapping(value = "/addFeature", method = RequestMethod.POST)
    @ResponseBody
    public Response addFeature(HttpServletRequest request, @RequestBody String featureName) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        Integer permisssionValue = (Integer) request.getSession().getAttribute("u_permisssion");
        ServiceFeature serviceFeature = new ServiceFeature();
        serviceFeature.setFeatureName(featureName);
        serviceFeature.setuUid(uid);
        serviceFeature.setIsManager((short) (permisssionValue >= 11 ? 1 : 0));
        int result = serviceInfoService.addFeature(serviceFeature);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse(result);
        }
        return ResponseHelper.createErrorResponse("添加失败");
    }

    /*查询资质*/
    @RequestMapping(value = "/aptitude")
    @ResponseBody
    public Response aptitudeList(HttpServletRequest request) {
//        Long uid = (Long) request.getSession().getAttribute("uid");
        List<ServiceAptitudeInfo> serviceAptitudeInfos = serviceInfoService.aptitudeList(null, 1);
        return ResponseHelper.createSuccessResponse(serviceAptitudeInfos);
    }

    /*增加资质*/
    @RequestMapping(value = "/addAptitude", method = RequestMethod.POST)
    @ResponseBody
    public Response addAptitude(HttpServletRequest request, @RequestBody String featureName) {
        Long uid = (Long) request.getSession().getAttribute("uid");
        Integer permisssionValue = (Integer) request.getSession().getAttribute("u_permisssion");
        ServiceAptitudeInfo serviceAptitudeInfo = new ServiceAptitudeInfo();
        serviceAptitudeInfo.setAptitudeName(featureName);
        serviceAptitudeInfo.setuUid(uid);
        serviceAptitudeInfo.setIsManager((short) (permisssionValue >= 11 ? 1 : 0));
        int result = serviceInfoService.addAptitude(serviceAptitudeInfo);
        if (result > 0) {
            return ResponseHelper.createSuccessResponse(result);
        }
        return ResponseHelper.createErrorResponse("添加失败");
    }

    @RequestMapping(value = "/changeState", method = RequestMethod.POST)
    @ResponseBody
    public Response changeServiceState(@RequestBody ServiceInfo serviceInfo) {
        List<Integer> idList = new ArrayList<Integer>();
        idList.add(Integer.valueOf(serviceInfo.getServiceId().toString()));
        int result = serviceInfoService.auditService(idList, serviceInfo.getServiceState());
        if (result > 0) {
            return ResponseHelper.createSuccessResponse("修改成功");
        }
        return ResponseHelper.createErrorResponse("修改失败");
    }

    /*
     * param:productClassifyList当前选择的产品分类*/
    @RequestMapping(value = "/classify", method = RequestMethod.POST)
    @ResponseBody
    public Response getClassify(@RequestParam(required = false) Long id, @RequestBody(required = false) List<ServiceClassify> productClassifyList) {
        List<ServiceClassify> list = serviceInfoService.serviceClassifyList(id);
        if (list == null || list.size() == 0) {
            return ResponseHelper.createErrorResponse("查找失败");
        }
        return ResponseHelper.createSuccessResponse(list);
    }

    @RequestMapping(value = "/product_classify", method = RequestMethod.POST)
    @ResponseBody
    public Response getProductClassify(@RequestParam(required = false) Long id, @RequestBody List<ServiceClassify> classifyList) {
        List<ServiceClassify> list = serviceInfoService.serviceClassifyList(id);
        if (list == null || list.size() == 0) {
            return ResponseHelper.createErrorResponse("查找失败");
        }
        return ResponseHelper.createSuccessResponse(list);
    }
}
