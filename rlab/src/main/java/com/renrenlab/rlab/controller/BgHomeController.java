package com.renrenlab.rlab.controller;

import com.renrenlab.rlab.common.interceptor.Authentication;
import com.renrenlab.rlab.common.interceptor.Permisssion;
import com.renrenlab.rlab.service.BgHomeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

/**
 * 后台管理系统首页
 */
@Controller
@RequestMapping("/bg/home")
public class BgHomeController {

    @Autowired
    private BgHomeService bgHomeService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 后台首页统计信息
     * @param model
     * @return
     */
    @Authentication(permisssion = Permisssion.P0, description = "00000001")
    @RequestMapping(value = "/toHome", method = RequestMethod.GET)
    public String toHome(Model model){

        Map<String,Object> map = bgHomeService.searchInfo();
        model.addAllAttributes(map);

        return "/bg/page/home";
    }


}
