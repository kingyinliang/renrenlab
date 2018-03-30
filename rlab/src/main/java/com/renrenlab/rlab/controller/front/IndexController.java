package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.service.InfomationService;
import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.vo.OrgInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author guanjipeng
 * @date 2018/1/3
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {
    @Autowired
    OrgService orgService;
    @Autowired
    InfomationService infomationService;

    @RequestMapping(value = "/index")
    public String getHomePage(Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
/*        String uri = request.getRequestURI();
        String queryString = "?" + request.getQueryString();
        StringBuffer url = request.getRequestURL();
        String domain = url.delete(url.length() - request.getRequestURI().length(),
                url.length()).toString();

        if (domain.equals("http://keyan.fix.renrenlab.com") && uri == null) {
            WebUtils.issueRedirect(request, response,
                    "http://keyan.fix.renrenlab.com/service/keyan?classify=18&name=科研服务");
        }
        if (domain.equals("http://quality.fix.renrenlab.com") && uri == null) {
//            WebUtils.issueRedirect(request, response,
//                    "http://quality.fix.renrenlab.com/service/zhiliang?classify=99&name=质量服务");
            return "redirect:http://quality.fix.renrenlab.com/service/zhiliang?classify=99&name=质量服务";
        }*/


        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            List<OrgInfo> orgInfoList = orgService.searchOrgBaseInfoListTopK(3);
            model.addAttribute(orgInfoList);
            return "/mobile/page/home";
        } else {
            Map<String, Object> hotResult = infomationService.getHots();
            List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
            model.addAttribute("hots", hots);
            return "/front/page/new_home";
        }
    }

    @RequestMapping(value = "/unauthorized")
    public String unauthorized() {
        return "/unauthorized";
    }
}
