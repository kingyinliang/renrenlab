package com.renrenlab.rlab.controller.front;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.InfomationService;
import com.renrenlab.rlab.service.InterfaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

import static com.renrenlab.rlab.common.constant.Constant.BANNER_POSITION_INFO;

/**
 * Created by guanjipeng on 2017/12/8.
 */
@RequestMapping("news")
@Controller
public class FrontInformationController {
    public static final String HOTS = "热门推荐";
    private static final String LATEST_ARTICLES = "最新文章";
    private static final String POLICY_STUDIES = "政策速报";
    private static final String RESEARCH_FRONTIER = "科研前沿";
    private static final String LATEST_ACTIVIES = "最新活动";
    private static final String JOB_TO_JOB_TO = "职来职往";
    private static final String RENRENLAB = "人人实验";

    @Autowired
    InfomationService infomationService;
    @Autowired
    private InterfaceService interfaceService;

    /**
     * 获取home
     *
     * @return
     */
    @RequestMapping("get_articles_page")
    public String getArticles(Model model, HttpServletRequest request,
                              @RequestParam(required = false) String classifyName,
                              @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                              @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        if ("职来职往".equals(classifyName)) {
            Map<String, Object> result = infomationService.getWorksHome(5);
            model.addAttribute("careerList", (List<InfomationCareer>) result.get("careerList"));
            model.addAttribute("recruitList", (List<InfomationRecruit>) result.get("recruitList"));
            model.addAttribute("resumeListe", (List<InfomationResume>) result.get("resumeListe"));
        } else {
            PageInfo<Infomation> articles = infomationService.getArticles(classifyName, pageNo, pageSize);
            model.addAttribute("articles", articles);
        }
        Map<String, Object> hotResult = infomationService.getHots();
        List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
        List<InfomationTag> tags = (List<InfomationTag>) hotResult.get("tagList");
        model.addAttribute("hots", hots);
        model.addAttribute("tags", tags);
        model.addAttribute("classifyName", classifyName);

        List<CommonBanner> banners = interfaceService.searchFrontBannerList(BANNER_POSITION_INFO);
        model.addAttribute("banners", banners);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/message_list";
        }
        return "front/page/message-home";
    }

    @RequestMapping("get_tag_articles_page")
    public String getTagArticles(Model model, HttpServletRequest request,
                                 @RequestParam(required = true) String tagName,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        PageInfo<Infomation> articles = infomationService.getTagArticles(tagName, pageNo, pageSize);

        Map<String, Object> hotResult = infomationService.getHots();
        List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
        List<InfomationTag> tags = (List<InfomationTag>) hotResult.get("tagList");
        model.addAttribute("articles", articles);
        model.addAttribute("hots", hots);
        model.addAttribute("tags", tags);
        model.addAttribute("tagName", tagName);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/message_taglist";
        }
        return "front/page/message-list";
    }

    @RequestMapping("get_tag_articles_info")
    @ResponseBody
    public Response getArticle(@RequestParam(required = true) String tagName,
                               @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                               @RequestParam(required = false, defaultValue = "10") Integer pageSize) {
        PageInfo<Infomation> articles = infomationService.getTagArticles(tagName, pageNo, pageSize);
        return ResponseHelper.createSuccessResponse(articles);
    }


    @RequestMapping("get_article_detail")
    public String getArticleDetail(Model model, HttpServletRequest request,
                                   @RequestParam(required = true) Long id) {
        Map<String, Object> result = infomationService.getArticleDetail(id);

        Map<String, Object> hotResult = infomationService.getHots();
        List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
        List<InfomationTag> tags = (List<InfomationTag>) hotResult.get("tagList");
        model.addAttribute("info", (Infomation) result.get("detail"));
        model.addAttribute("list", result.get("list"));
        model.addAttribute("hots", hots);
        model.addAttribute("tags", tags);
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/message_detail";
        }
        return "front/page/message-detail";
    }

    @RequestMapping("get_works")
    public String getCaeers(Model model,
                            @RequestParam(required = true) int classify,
                            @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                            @RequestParam(required = false, defaultValue = "10") Integer pageSize) {

        Map<String, Object> hotResult = infomationService.getHots();
        List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
        List<InfomationTag> tags = (List<InfomationTag>) hotResult.get("tagList");
        model.addAttribute("hots", hots);
        model.addAttribute("tags", tags);
        model.addAttribute("classify", classify);
        switch (classify) {
            case 3: {
                PageInfo<InfomationCareer> list = infomationService.getCareers(pageNo, pageSize);
                model.addAttribute("careerList", list);
                break;
            }
            case 1: {
                PageInfo<InfomationRecruit> list = infomationService.getRecruits(pageNo, pageSize);
                model.addAttribute("recruitsList", list);
                break;
            }
            case 2: {
                PageInfo<InfomationResume> list = infomationService.getResumes(pageNo, pageSize);
                model.addAttribute("resumeList", list);
                break;
            }
            default:
                break;
        }

        return "front/page/advertise_list";
    }

    @RequestMapping("get_work_detail")
    public String getCaeer(Model model, HttpServletRequest request,
                           @RequestParam(required = true) Long id,
                           @RequestParam(required = true) int classify) {

        Map<String, Object> hotResult = infomationService.getHots();
        List<Infomation> hots = (List<Infomation>) hotResult.get("hotList");
        List<InfomationTag> tags = (List<InfomationTag>) hotResult.get("tagList");
        model.addAttribute("hots", hots);
        model.addAttribute("tags", tags);
        model.addAttribute("classify", classify);
        switch (classify) {
            case 1: {
                InfomationCareer infomationCareer = infomationService.getCareer(id);//招聘资讯
                model.addAttribute("careerInfo", infomationCareer);
                break;
            }
            case 2: {
                InfomationRecruit infomationRecruit = infomationService.getRecruit(id);//招聘信息
                model.addAttribute("recruitInfo", infomationRecruit);
                break;
            }
            case 3: {
                InfomationResume infomationResume = infomationService.getResume(id);//招聘简历
                model.addAttribute("resumeInfo", infomationResume);
                break;
            }
            default:
                break;
        }
        if (HttpRequestDeviceUtil.isMobileDevice(request)) {
            return "mobile/page/job_detail";
        }
        return "front/page/advertise_detail";
    }
}
