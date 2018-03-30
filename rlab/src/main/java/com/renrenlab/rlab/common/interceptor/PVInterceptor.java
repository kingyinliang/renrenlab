package com.renrenlab.rlab.common.interceptor;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by guanjipeng on 2017/11/30.
 */
public class PVInterceptor extends HandlerInterceptorAdapter {

    public static final String PV_KEY = "renrenlab_pv_all";

    @Autowired
    JedisPool jedisPool;

    /**
     * This implementation always returns {@code true}.
     *
     * @param request
     * @param response
     * @param handler
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            ResponseBody responseBody = method.getMethodAnnotation(ResponseBody.class);
            //如果ResponseBody为空，代表返回响应是页面，否则为Ajax请求
            if (responseBody == null) {
                addPV();
            }
        }
        return true;
    }

    /**
     * 统计网站总pv
     */
    private void addPV() {
        Jedis jedis = jedisPool.getResource();
        try {
            String pvValue = jedis.get(PV_KEY);
            if (StringUtils.isEmpty(pvValue)) {
                jedis.set(PV_KEY, "1");
            } else {
                int countPV = Integer.valueOf(pvValue) + 1;
                jedis.set(PV_KEY, countPV + "");
            }
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
    }
}
