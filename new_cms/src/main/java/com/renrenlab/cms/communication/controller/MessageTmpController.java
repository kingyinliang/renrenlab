package com.renrenlab.cms.communication.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.service.ISessionMessageTmpService;
import com.renrenlab.cms.communication.vo.MessageTmpInfo;

/**
 * 临时消息
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/mt")
public class MessageTmpController {

    static final Logger _LOG = LoggerFactory.getLogger(MessageTmpController.class);

    @Autowired
    private ISessionMessageTmpService sessionMessageTmpService;

    /**
     * 快速获取临时消息
     *
     * @param sessionId
     * @return
     */
    @RequestMapping(value = "/query/json", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> queryJson(@RequestParam long sessionId) {
        List<MessageTmpInfo> list = null;
        try {
            _LOG.info("invoke----------/mt/query/json");
            list = sessionMessageTmpService.quickQuery(sessionId);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(list);
    }

}
