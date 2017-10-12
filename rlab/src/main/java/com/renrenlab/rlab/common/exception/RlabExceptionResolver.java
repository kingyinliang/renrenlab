package com.renrenlab.rlab.common.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2017/6/1.
 */
public class RlabExceptionResolver extends SimpleMappingExceptionResolver {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
        //默认处理ajax请求产生的异常，如果为返回页面，不进行处理
        ModelAndView mv = null;
        try {
            if(handler instanceof HandlerMethod){
                HandlerMethod method = (HandlerMethod) handler;
                ResponseBody responseBody = method.getMethodAnnotation(ResponseBody.class);
                if(responseBody != null){
                    mv = new ModelAndView();
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().print("{\"code\":1000,\"message\": \"系统异常\"}");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return mv;
    }















}
