package com.renrenlab.rlab.controller.bg;

import com.renrenlab.rlab.service.OrgService;
import com.renrenlab.rlab.service.RequirementService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Administrator on 2017/10/17.
 */
@Controller
@RequestMapping("bg/page")
public class BgPageController {

    @Autowired
    private RequirementService requirementService;

    @Autowired
    private OrgService orgService;

    private Logger log = LoggerFactory.getLogger(this.getClass());

    // 服务列表（临时）
    @RequestMapping(value = "/service/list", method = RequestMethod.GET)
    public String toServiceList() {
        return "/bg/page/service/service_list";
    }

    // 服务添加（临时）
    @RequestMapping(value = "/service/add", method = RequestMethod.GET)
    public String toServiceToAdd() {
        return "/bg/page/service/service_add";
    }

    // 服务修改（临时）
    @RequestMapping(value = "/service/alter", method = RequestMethod.GET)
    public String toServiceToAlter() {
        return "/bg/page/service/service_alter";
    }

    // 服务详情（临时）
    @RequestMapping(value = "/service/detail", method = RequestMethod.GET)
    public String toServiceToDetail() {
        return "/bg/page/service/service_detail";
    }

}
