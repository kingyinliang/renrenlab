package com.renrenlab.rlab.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Created by guanjipeng on 2017/11/24.
 * m站首页
 */
@Controller
@RequestMapping(value = "m_home")
public class FrontMSkip {

    /**
     * 最新活动页
     *
     * @return
     */
    @RequestMapping(value = "activity_page")
    public String getActivityPage() {
        return "mobile/page/activity_list";
    }

    /**
     * 应用案例页
     *
     * @return
     */
    @RequestMapping("case_page")
    public String getCasePage() {
        return "mobile/page/case_list";
    }

    @RequestMapping("case_detail")
    public String getDetailPage(Model mode,
                                @RequestParam(required = false) Integer index,
                                @RequestParam(required = false) Integer type) {
        mode.addAttribute("index", index);
        mode.addAttribute("type", type);
        return "mobile/page/case_detail";
    }
}
