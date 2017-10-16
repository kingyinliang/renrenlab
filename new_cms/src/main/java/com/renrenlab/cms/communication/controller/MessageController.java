package com.renrenlab.cms.communication.controller;

import javax.servlet.http.HttpSession;

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
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.service.ISessionMessageService;

/**
 * 消息
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/msg")
public class MessageController {

    static final Logger _LOG = LoggerFactory.getLogger(MessageController.class);

    @Autowired
    private ISessionMessageService sessionMessageService;

    /**
     * 根据会话ID插入消息
     * @param session
     * @param sessionId
     * @param message
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> add(HttpSession session, @RequestParam int sessionId, @RequestBody SessionMessage message) {
        _LOG.info("invoke----------/msg/add");
        try {
            long csId = (long) session.getAttribute("csId");
            sessionMessageService.add(message, sessionId, csId);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

}
