package com.renrenlab.rlab.controller.front;

import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.service.ISuperSearchService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 高级搜索2.0
 *
 * @author Renrenlab
 */
@Controller
@RequestMapping("/front/superSearch")
public class FrontSuperSearchController {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private ISuperSearchService superSearchService;


    /**
     * 跳转到相关知识页
     *
     * @param model
     * @param query
     * @param flag 默认 0 仪器 1 服务 2 机构
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String toSearch(HttpServletRequest request, Model model, @RequestParam(required = false) String query,
                           @RequestParam(required = false) Integer flag) {
        model.addAttribute("keyword", query);
        model.addAttribute("flag", flag);
        Map<String, Object> map = superSearchService.searchAll(query);
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
        log.debug("是否手机端登陆,{}", isMobileDevice);
        model.addAllAttributes(map);

        if (isMobileDevice) {
            if (map == null || map.get("relatedField") == null) {
                return "/mobile/page/super_search_null";
            }
            model.addAttribute("relatedField", map.get("relatedField"));
            return "/mobile/page/super_search_2";
        }
        if (map == null) {
            return "/front/page/seientific_null";
        }
        return "/front/page/scientific_search_2";
    }

    /**
     * 更多论文页
     *
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/morePaper", method = RequestMethod.GET)
    public String morePaper(HttpServletRequest request, Model model,
                            @RequestParam(value = "query", required = false) String query,
                            @RequestParam(value = "pageNo", required = true) Integer pageNo,
                            @RequestParam(value = "pageSize", required = false) Integer pageSize,
                            @RequestParam(required = false) Integer flag) {
        model.addAttribute("keyword", query);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("flag", flag);
        List<?> paper = superSearchService.searchRelatedInfo(query, "paper", pageNo, pageSize);
        if (paper == null) {
            return "/front/page/seientific_null";
        }
        model.addAttribute("relatedPaper", paper);
        return "/front/page/thesis_2";
    }

    /**
     * 更多项目页
     *
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/morePro", method = RequestMethod.GET)
    public String morePro(HttpServletRequest request, Model model,
                          @RequestParam(value = "query", required = false) String query,
                          @RequestParam(value = "pageNo", required = true) Integer pageNo,
                          @RequestParam(value = "pageSize", required = false) Integer pageSize,
                          @RequestParam(required = false) Integer flag) {
        List<?> project = superSearchService.searchRelatedInfo(query, "project", pageNo, pageSize);
        model.addAttribute("keyword", query);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("flag", flag);
        if (project == null) {
            return "/front/page/seientific_null";
        }
        model.addAttribute("relatedProject", project);
        return "/front/page/project_2";
    }

    /**
     * 更多资讯页
     *
     * @param model
     * @param query
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/moreRelatedInfo", method = RequestMethod.GET)
    public String moreRelatedInfo(HttpServletRequest request, Model model,
                                  @RequestParam(value = "query", required = false) String query,
                                  @RequestParam(value = "pageNo", required = true) Integer pageNo,
                                  @RequestParam(value = "pageSize", required = false) Integer pageSize,
                                  @RequestParam(required = false) Integer flag) {
        List<?> news = superSearchService.searchRelatedNews(query, pageNo, pageSize);
        model.addAttribute("keyword", query);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("flag", flag);
        if (news == null) {
            return "/front/page/seientific_null";
        }
        model.addAttribute("relatedNews", news);
        return "/front/page/message_2";
    }


}
