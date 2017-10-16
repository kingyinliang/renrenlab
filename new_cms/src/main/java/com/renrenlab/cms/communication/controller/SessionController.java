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

import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.common.response.ListSlice;
import com.renrenlab.cms.common.response.Response;
import com.renrenlab.cms.common.response.ResponseHelper;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.service.ISessionBaseInfoService;
import com.renrenlab.cms.communication.service.ISessionMessageService;
import com.renrenlab.cms.communication.vo.MessageInfo;
import com.renrenlab.cms.communication.vo.SessionInfo;

/**
 * 会话管理
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/session")
public class SessionController {

    static final Logger _LOG = LoggerFactory.getLogger(SessionController.class);

    @Autowired
    private ISessionBaseInfoService sessionBaseInfoService;
    @Autowired
    private ISessionMessageService sessionMessageService;

    /**
     * 会话接入-->更新客服ID-->更新会话历史表
     *
     * @param sessionId
     * @return
     */
    @RequestMapping(value = "/joinup", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> joinup(@RequestParam long sessionId, HttpSession session) {
        _LOG.info("invoke----------/bg/api/session/joinup");
        try {
            Long csId = (Long) session.getAttribute("csId");
            sessionBaseInfoService.joinup(sessionId, csId);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 根据客服ID查询已经接入的会话
     *
     * @param pageNo
     * @param pageSize
     * @param session
     * @return
     */
    @RequestMapping(value = "/list/json", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> listJson(@RequestParam int pageNo, @RequestParam int pageSize, HttpSession session) {
        ListSlice<SessionInfo> slice = null;
        try {
            _LOG.info("invoke----------/bg/api/session/list/json");
            Long csId = (Long)session.getAttribute("csId");
            PageInfo<SessionInfo> pageInfo = sessionBaseInfoService.list(csId, pageNo, pageSize);
            slice = new ListSlice<SessionInfo>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse(slice);
    }

    /**
     * 待接入页面，查询待接入会话
     *
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/home/json", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> listJson(@RequestParam int pageNo, @RequestParam int pageSize) {
        ListSlice<SessionInfo> slice = null;
        try {
            _LOG.info("invoke----------/bg/api/session/home/json");
            PageInfo<SessionInfo> pageInfo = sessionBaseInfoService.listWaitUpSession(pageNo, pageSize);
            slice = new ListSlice<SessionInfo>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse(slice);
    }

    /**
     * 切换会话，根据sessionId分页查询消息列表
     *
     * @param sessionId
     * @param pageNo
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/switch", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> listJson(HttpSession httpSession, @RequestParam int sessionId, @RequestParam int pageNo, @RequestParam int pageSize) {
        ListSlice<MessageInfo> slice = null;
        try {
            _LOG.info("invoke----------/bg/api/session/switch");
            Long csId = (Long)httpSession.getAttribute("csId");
            PageInfo<MessageInfo> pageInfo = sessionMessageService.list(csId, sessionId, pageNo, pageSize);
            slice = new ListSlice<MessageInfo>(pageInfo.getTotal(), pageInfo.getList());
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse(slice);
    }

    /**
     * 更新会话状态
     *
     * @param session
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> update(@RequestBody SessionBaseInfo session){
        try {
            _LOG.info("invoke----------/bg/api/session/update");
            sessionBaseInfoService.updateBySsIdSelective(session);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }
        return ResponseHelper.createSuccessResponse();
    }
}
