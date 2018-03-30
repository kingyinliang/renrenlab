package com.renrenlab.rlab.common.interceptor;

import com.renrenlab.rlab.dao.GeoIpDao;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.slf4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by wanshou on 2017/5/25.
 */
@Component
public class IPInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    GeoIpDao geoIpDao;

    @Autowired
    JedisPool jedisPool;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        if (handler instanceof HandlerMethod) {
            //判断ip是否存在于缓存中
            Jedis jedis = jedisPool.getResource();
            try {
                //获取ip
                String realIp = request.getHeader("X-Real-IP");
                String ip = StringUtils.isBlank(realIp) ? request.getRemoteAddr() : realIp;
                Long uid = (Long) request.getSession().getAttribute("uid");
                StringBuffer url = request.getRequestURL();
                String header = request.getHeader("user-agent");
                MDC.put("header", header);
                MDC.put("url", url.toString());
                MDC.put("uid", String.valueOf(uid));
                MDC.put("ip", ip);
                request.getSession().setAttribute("ip", ip);
                //内网ip直接过滤
                if ("0:0:0:0:0:0:0:1".equals(ip) || "127.0.0.1".equals(ip) || ip.contains("192.168.")) {
                    return true;
                }
                String isExist = jedis.get(ip);
                if (!StringUtils.isBlank(isExist) && "1".equals(isExist)) {
                    return true;
                } else if (!StringUtils.isBlank(isExist) && "0".equals(isExist)) {
                    response.sendRedirect("/IPLimit.jsp");
                    return false;
                }
                //判断ip是否合法
                String[] strs = ip.split("\\.");
                Long ip_stamp = Long.parseLong(strs[0]) * 256 * 256 * 256 + Long.parseLong(strs[1]) * 256 * 256 + Long.parseLong(strs[2]) * 256 + Long.parseLong(strs[3]);
                logger.info("IP不存在缓存中，查询数据库：ip=" + ip + ",ip_stamp=" + ip_stamp);
                Integer result = geoIpDao.selectGeoIpByIp(ip_stamp);
                if (result != null && result == 1) {
                    jedis.set(ip, "1");
                    jedis.expire(ip, 60 * 60 * 24);
                    return true;
                } else {
                    jedis.set(ip, "0");
                    jedis.expire(ip, 60 * 60 * 24);
                    response.sendRedirect("/IPLimit.jsp");
                    return false;
                }
            } catch (Exception e) {
                e.printStackTrace();
                try {
                    response.sendRedirect("/500Error.jsp");
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
                return true;
            } finally {
                if (jedis != null) {
                    jedis.close();
                }
            }
        }
        return true;
    }
}