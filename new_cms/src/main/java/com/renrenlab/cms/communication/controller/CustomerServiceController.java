package com.renrenlab.cms.communication.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;

import com.renrenlab.cms.communication.exception.ResponseEntity;
import com.renrenlab.cms.communication.exception.ResponseMessage;
import com.renrenlab.cms.communication.exception.user.UserNotFoundException;
import com.renrenlab.cms.communication.exception.user.UserNotMatchException;
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
import com.renrenlab.cms.communication.model.UserBaseInfo;
import com.renrenlab.cms.communication.service.IUserBaseInfoService;
import com.renrenlab.cms.communication.vo.CSOutInfo;
import com.renrenlab.cms.communication.vo.CustomerServiceInfo;
import com.renrenlab.cms.communication.vo.params.CSInInfo;

/**
 * 客服管理
 *
 * Created by lihongxun on 2017/5/16.
 */
@Controller
@RequestMapping("/bg/api/cs")
public class CustomerServiceController {

    static final Logger _LOG = LoggerFactory.getLogger(CustomerServiceController.class);

    private static final Map<Long, HttpSession> CS_INFO = new ConcurrentHashMap<Long, HttpSession>();

    @Autowired
    private IUserBaseInfoService userBaseInfoService;

    /**
     * 客服退出
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> doLogout(HttpSession session) {
        try {
            _LOG.info("invoke----------/bg/api/cs/logout");
            CS_INFO.remove(session.getAttribute("csId"));
            session.removeAttribute("csId");
            session.removeAttribute("csName");
            session.removeAttribute("csAvatar");
            session.removeAttribute("rId");
            session.removeAttribute("csPhone");
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /*
     * 客服登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> doLogin(@RequestBody UserBaseInfo loginfo, HttpSession session) {
        CSOutInfo customerService = null;
        _LOG.info("invoke----------/bg/api/cs/login");
        try {
            customerService = userBaseInfoService.doLogin(loginfo.getuName(), loginfo.getuPassword());
            session.setAttribute("csId", customerService.getCsId());
            session.setAttribute("csName", customerService.getCsName());
            session.setAttribute("csAvatar", customerService.getCsAvatar());
            session.setAttribute("rId", customerService.getrId());
            session.setAttribute("csPhone", customerService.getCsPhone());

            if (CS_INFO.containsKey(customerService.getCsId())) {//1.用户已经登录
                HttpSession preSession = (HttpSession) CS_INFO.get(customerService.getCsId());
                try {
                    preSession.removeAttribute("csId");
                    preSession.removeAttribute("csName");
                    preSession.removeAttribute("csAvatar");
                    preSession.removeAttribute("rId");
                    preSession.removeAttribute("csPhone");
                } catch (Exception e) {
                    _LOG.error("session is invalidate!");
                }
            }

            CS_INFO.put(customerService.getCsId(), session);
        } catch (UserNotFoundException e) {
            _LOG.error(ResponseMessage.USER_NOT_FOUND_ERROR + "");
            return ResponseHelper.createResponse(ResponseEntity.USER_NOT_FOUND_ERROR.getCode(),
                    ResponseEntity.USER_NOT_FOUND_ERROR.getMessage());
        } catch (UserNotMatchException e) {
            _LOG.error(ResponseMessage.USER_OR_PASSWORD_ERROR + "");
            return ResponseHelper.createResponse(ResponseEntity.USER_OR_PASSWORD_ERROR.getCode(),
                    ResponseEntity.USER_OR_PASSWORD_ERROR.getMessage());
        } catch (Exception e) {
            _LOG.error("exception:", e);
            return ResponseHelper.createBusinessErrorResponse(customerService);
        }

        return ResponseHelper.createSuccessResponse(customerService);
    }

    /*
     * 修改密码
     */
    @RequestMapping(value = "/amendpassword", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> updatePassword(@RequestBody CSInInfo csInfo, HttpSession session) {
        _LOG.info("invoke----------/bg/api/cs/amendpassword");
        try {
            userBaseInfoService.updatePassword(csInfo, session, CS_INFO);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 获取客服人员列表
     *
     * @return
     */
    @RequestMapping(value = "/cslist", method = RequestMethod.GET)
    @ResponseBody
    public Response<?> getCustomerServiceList(HttpSession session) {
        List<CustomerServiceInfo> customerServiceList = null;
        try {
            _LOG.info("invoke--------------------------/bg/api/cs/cslist");
            customerServiceList = userBaseInfoService.getCSList();
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse(customerServiceList);
    }

    /**
     * 添加客服
     *
     * @return
     */
    @RequestMapping(value = "/addcs", method = RequestMethod.POST)
    @ResponseBody
    public Response<?> addCustomerService(@RequestBody UserBaseInfo customerService, HttpSession session) {
        _LOG.info("invoke--------------------------/bg/api/cs/addcs");
        try {
            userBaseInfoService.addcs(customerService);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 删除客服
     */
    @RequestMapping(value = "/delcs", method = RequestMethod.DELETE)
    @ResponseBody
    public Response<?> delCS(@RequestParam Long csId, HttpSession session) {
        try {
            _LOG.info("invoke--------------------------/bg/api/cs/delcs");
            userBaseInfoService.delCs(csId);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }

    /**
     * 更新客服
     */
    @RequestMapping(value = "/updatecs", method = RequestMethod.PUT)
    @ResponseBody
    public Response<?> updateCs(@RequestBody UserBaseInfo userBaseInfo, HttpSession session) {
        _LOG.info("invoke--------------------------/bg/api/cs/updatecs");
        try {
            userBaseInfoService.updateCs(userBaseInfo);
        } catch (Exception e) {
            _LOG.error("exception:", e);
        }

        return ResponseHelper.createSuccessResponse();
    }
}
