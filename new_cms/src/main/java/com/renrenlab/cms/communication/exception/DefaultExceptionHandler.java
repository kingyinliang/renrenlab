package com.renrenlab.cms.communication.exception;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

@ControllerAdvice
public class DefaultExceptionHandler {

    private final Logger LOG = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(GlobalException.class)
    @ResponseBody
    public JSONObject handleGlobalException(HttpServletRequest request, GlobalException ex) {
        LOG.error("GlobalException Occured:: URL=" + request.getRequestURL());
        return JSONObject.fromObject(ex.getResponseEntity().toString());
    }

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public JSONObject handleBusinessException(HttpServletRequest request, BusinessException ex) {
        LOG.error("GlobalException Occured:: URL=" + request.getRequestURL());
        return JSONObject.fromObject(ex.getResponseEntity().toString());
    }
}
