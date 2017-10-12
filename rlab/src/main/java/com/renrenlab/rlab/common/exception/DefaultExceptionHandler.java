package com.renrenlab.rlab.common.exception;

import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class DefaultExceptionHandler {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(GlobalException.class)
    @ResponseBody
    public JSONObject handleGlobalException(HttpServletRequest request, GlobalException ex) {
        logger.error("GlobalException Occured:: URL=" + request.getRequestURL());
        return JSONObject.fromObject(ex.getResponseEntity().toString());
    }

    @ExceptionHandler(BusinessException.class)
    @ResponseBody
    public JSONObject handleBusinessException(HttpServletRequest request, BusinessException ex) {
        logger.error("GlobalException Occured:: URL=" + request.getRequestURL());
        return JSONObject.fromObject(ex.getResponseEntity().toString());
    }
}
