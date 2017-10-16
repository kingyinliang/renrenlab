package com.renrenlab.cms.communication.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 客服登录管理
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/page")
public class PageController {

    static final Logger _LOG = LoggerFactory.getLogger(PageController.class);

    /**
     * 跳转登录页
     *
     * @param response
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String toLogin(HttpServletResponse response, HttpSession httpSession) {
        _LOG.info("invoke----------/page/login");
        return "bg/page/login";
    }

    /**
     * 跳转主页面
     *
     * @param response
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String toHome(HttpServletResponse response, HttpSession httpSession) {
        _LOG.info("invoke----------/page/home");
        return "bg/page/home";
    }

}
