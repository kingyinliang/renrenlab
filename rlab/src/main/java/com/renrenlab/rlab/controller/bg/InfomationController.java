package com.renrenlab.rlab.controller.bg;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.response.Response;
import com.renrenlab.rlab.common.response.ResponseHelper;
import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.model.InfomationTag;
import com.renrenlab.rlab.service.InfomationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by renrenlab on 17/12/6.
 */
@Controller
@RequestMapping(value = "/bg/infomation")
public class InfomationController {
    @Autowired
    InfomationService infomationService;

    /**
     * @param request
     * @param model
     * @param keyword
     * @param uname
     * @param tag
     * @param classify
     * @param beginTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @param order
     * @param source    来源，0：自己写的，1：爬来的政策源，2：爬来的。。。
     * @return
     */
    @RequestMapping(value = "/list")
    public String infomationList(HttpServletRequest request,
                                 Model model,
                                 @RequestParam(required = false) String keyword,
                                 @RequestParam(required = false) String uname,
                                 @RequestParam(required = false) String tag,
                                 @RequestParam(required = false) Integer classify,
                                 @RequestParam(required = false) String beginTime,
                                 @RequestParam(required = false) String endTime,
                                 @RequestParam(required = false, defaultValue = "1") Integer pageNo,
                                 @RequestParam(required = false, defaultValue = "10") Integer pageSize,
                                 @RequestParam(required = false) String order,
                                 @RequestParam(required = false, defaultValue = "0") Integer source) {
        PageInfo<Infomation> infomations = infomationService.infomationList(keyword, uname, tag, classify, beginTime, endTime,
                pageNo, pageSize, order, source);
        if (beginTime == null) {
            beginTime = "2016-01-01";
        }
        if (endTime == null) {
            endTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        }
        model.addAttribute("keyword", keyword);
        model.addAttribute("uname", uname);
        model.addAttribute("classify", classify == null ? 99 : classify);
        model.addAttribute("infomations", infomations.getList());
        model.addAttribute("total", infomations.getTotal());
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("pages", infomations.getPages());
        model.addAttribute("beginTime", beginTime);
        model.addAttribute("endTime", endTime);
        model.addAttribute("source", source);

        return "/bg/page/message_manage";
    }

    @RequestMapping(value = "/add_page")
    public String addPage() {
        return "/bg/page/message_add";
    }

    //    添加资讯
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Response addInfomation(HttpServletRequest request,
                                  @RequestBody Infomation infomation) {
        HttpSession session = request.getSession();
        session.removeAttribute("info");
        infomation.settUid((Long) request.getSession().getAttribute("uid"));
        int result = infomationService.addInfomation(infomation);
        if (result == 1) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("数据插入失败");
    }

    //    存放预览数据
    @RequestMapping(value = "/preview", method = RequestMethod.POST)
    @ResponseBody
    public Response previewInfomation(HttpServletRequest request,
                                      Model model,
                                      @RequestBody Infomation infomation) {
        HttpSession session = request.getSession();
        session.setAttribute("info", infomation);
        return ResponseHelper.createSuccessResponse();
    }

    //    预览
    @RequestMapping(value = "/preview_page")
    public String previewInfomationPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Infomation infomation = (Infomation) session.getAttribute("info");
        infomation.settInfoTags(JSONObject.parseArray(infomation.gettInfoTags().toString()));
        model.addAttribute("info", infomation);
        return "/bg/page/message_preview";
    }

    //    资讯详情
    @RequestMapping(value = "/detail")
    public String infomationDetail(Model model, HttpServletRequest request, @RequestParam(required = true) Long id) {
        Infomation result = infomationService.getBGArticleDetail(id);
        model.addAttribute("info", result);
        return "/bg/page/message_alter";
    }

    //    修改资讯
    @RequestMapping(value = "modify")
    @ResponseBody
    public Response modifyInfomation(HttpServletRequest request, @RequestBody Infomation infomation) {
        int result = infomationService.modifyInfomation(infomation);
        if (result == 1) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("修改失败");
    }

    //    删除资讯
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Response deleteInfomation(@RequestBody Infomation infomation) {
        int result = infomationService.deleteInfomation(infomation.gettInfoId());
        if (result == 1) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("数据删除失败");
    }

    //    资讯审核通过
    @RequestMapping(value = "/pass", method = RequestMethod.POST)
    @ResponseBody
    public Response passInfomation(@RequestBody Infomation infomation) {
        int result = infomationService.passInfomation(infomation.gettInfoId(), infomation.gettInfoState());
        if (result == 1) {
            return ResponseHelper.createSuccessResponse();
        }
        return ResponseHelper.createErrorResponse("数据审核失败");
    }

    //    添加标签
    @RequestMapping(value = "/add_tag", method = RequestMethod.POST)
    @ResponseBody
    public Response addInfomationTag(@RequestBody InfomationTag infomationTag) {
        int result = infomationService.addInfomationTag(infomationTag);
//        if (result == 1) {
        return ResponseHelper.createSuccessResponse();
//        }
//        return ResponseHelper.createErrorResponse("数据添加失败");
    }

    @RequestMapping("get_tags")
    @ResponseBody
    public Response getTag() {
        List<InfomationTag> tags = infomationService.getTags();
        return ResponseHelper.createSuccessResponse(tags);
    }

}
