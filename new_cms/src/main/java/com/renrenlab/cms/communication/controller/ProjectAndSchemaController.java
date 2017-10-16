package com.renrenlab.cms.communication.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.model.OrderProject;
import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.service.IOrderProjectService;
import com.renrenlab.cms.communication.service.IOrderSchemeService;
import com.renrenlab.cms.communication.vo.params.SendScheme;

/**
 * 项目和方案相关操作
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/project")
public class ProjectAndSchemaController {

    static final Logger _LOG = LoggerFactory.getLogger(ProjectAndSchemaController.class);

    @Autowired
    private IOrderProjectService orderProjectService;
    @Autowired
    private IOrderSchemeService orderSchemeService;

    /**
     * 添加项目
     *
     * @param project
     * @return
     */
    @RequestMapping(value = "/addpj", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> addProject(@RequestBody OrderProject project) {
        _LOG.info("invoke----------/project/addpj");
        try {
            orderProjectService.addPro(project);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 根据用户uId查询项目信息
     *
     * @param uId
     * @return
     */
    @RequestMapping(value = "/querypj", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> queryPj(@RequestParam long uId) {
        _LOG.info("invoke----------/project/querypj");
        return ResponseHelper.createSuccessResponse(orderProjectService.selectProList(uId));
    }

    /**
     * 添加方案
     *
     * @param scheme
     * @return
     */
    @RequestMapping(value = "/addsch", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> addScheme(@RequestBody OrderScheme scheme) {
        _LOG.info("invoke----------/project/addsch");
        try {
            orderSchemeService.addScheme(scheme);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 查询方案
     *
     * @param pjId
     * @return
     */
    @RequestMapping(value = "/querysch", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> querySche(@RequestParam Long pjId) {
        _LOG.info("invoke----------/project/querysch");
        List<OrderScheme> schemeList = null;

        try {
            schemeList = orderSchemeService.querySchemeList(pjId);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(schemeList);
    }

    /**
     * 发送方案
     *
     * @param sendScheme
     * @return
     */
    @RequestMapping(value = "/sendsche", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> sendPjScheToWechat(@RequestBody SendScheme sendScheme) {
        _LOG.info("invoke----------/project/sendsche");
        try {
            orderProjectService.postPjScheToWechat(sendScheme.getuId(), sendScheme.getSchId());
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }
}
