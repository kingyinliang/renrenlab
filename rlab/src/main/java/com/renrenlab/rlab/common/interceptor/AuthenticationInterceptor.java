package com.renrenlab.rlab.common.interceptor;

import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.ConfigUtil;
import com.renrenlab.rlab.dao.UserRoleDao;
import com.renrenlab.rlab.model.UserRole;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by wanshou on 2017/5/26.
 */
@Component
public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

    private final org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

    public final static Map<String, String> authenticationMap = new ConcurrentHashMap<>();

    @Autowired
    UserRoleDao userRoleDao;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //懒加载用户角色信息
        if (authenticationMap.size() == 0) {
            authenticationMap.put(Constant.RolePermission.ROLE_KEY, System.currentTimeMillis() + "");
            List<UserRole> userRoleList = userRoleDao.selectAllPermission();
            for (UserRole userRole : userRoleList) {
                authenticationMap.put(userRole.getrDescription(), userRole.getrPermisssion());
            }
        }

        //获取session中uid和type
        Long uid = (Long) request.getSession().getAttribute("uid");
        Integer type = (Integer) request.getSession().getAttribute("type");
        String uri = request.getRequestURI();
        if (handler instanceof HandlerMethod) {
            HandlerMethod method = (HandlerMethod) handler;
            ResponseBody responseBody = method.getMethodAnnotation(ResponseBody.class);
            Authentication authentication = method.getMethodAnnotation(Authentication.class);
            //判断是否登录，如果uid为空，代表未登录，否则为登录
            //判断是request请求的方法的返回类型,如果ResponseBody为空，代表返回响应是页面，否则为Ajax请求
            if (uid == null) {
                if (responseBody == null) {
                    String curURI = request.getParameter("curURI");
                    String param = StringUtils.isBlank(curURI) ? "" : URLEncoder.encode(curURI, "UTF-8");
                    if (StringUtils.isBlank(ConfigUtil.getProperty("env")) || "3".equals(ConfigUtil.getProperty("env"))) {
                        response.sendRedirect("/rlab/front/user/login?curURI=" + param);
                    } else {
                        response.sendRedirect("/front/user/login?curURI=" + param);
                    }
                } else {
                    response.setContentType("application/json;charset=UTF-8");
                    response.getWriter().print("{\"code\":1012,\"message\": \"用户未登录\"}");
                }
                return false;
            }
            if (type != null && type == 0 && !StringUtils.isBlank(uri) && uri.contains("bg")) {
                logger.info("----------------------------------------------------");
                logger.info("普通用户请求后台接口和页面，直接返回到前端首页");
                logger.info("----------------------------------------------------");
                if (StringUtils.isBlank(ConfigUtil.getProperty("env")) || "3".equals(ConfigUtil.getProperty("env"))) {
                    response.sendRedirect("/rlab/page/home");
                } else {
                    response.sendRedirect("/page/home");
                }
                return false;
            }
            try {
                //如果没有配置权限，默认通过拦截器
                if (authentication == null) return true;
                modifySession(request.getSession());
                //判断用户是否有权限继续访问
                String r_description = (String) request.getSession().getAttribute("r_description");
                String u_permisssion = authenticationMap.get(r_description);
                char[] u_permisssion_array = u_permisssion.toCharArray();
                int i_permisssion = authentication.permisssion();
                if (isNotPermissioned(u_permisssion_array, i_permisssion)) {
                    if (responseBody == null) {
                        String curURI = request.getParameter("curURI");
                        String param = StringUtils.isBlank(curURI) ? "" : URLEncoder.encode(curURI, "UTF-8");
                        if (StringUtils.isBlank(ConfigUtil.getProperty("env")) || "3".equals(ConfigUtil.getProperty("env"))) {
                            response.sendRedirect("/rlab/bg_admin_limit.jsp?curURI=" + param);
                        } else {
                            response.sendRedirect("/bg_admin_limit.jsp?curURI=" + param);
                        }
                    } else {
                        response.setContentType("application/json;charset=UTF-8");
                        response.getWriter().print("{\"code\":1018,\"message\": \"权限不够\"}");
                    }
                    return false;
                }
            } catch (Exception e) {
                logger.info(e.getMessage());
                return false;
            }
        }
        return true;
    }

    /**
     * @param uPsermission 角色权限
     * @param iPermission  需要的权限
     * @return
     */
    private Boolean isNotPermissioned(char[] uPsermission, Integer iPermission) {
        int uLength = uPsermission.length;
        char[] chars = String.valueOf(iPermission).toCharArray();
        int iLength = chars.length;
        for (int i = 1; i <= iLength; i++) {
            if (chars[iLength - i] != uPsermission[uLength - i])
                return true;
        }
        return false;
    }

    /**
     * 修改每个用户的session中权限信息
     */
    public void modifySession(HttpSession session) {
        if (!authenticationMap.get(Constant.RolePermission.ROLE_KEY).equals(session.getAttribute(Constant.RolePermission.ROLE_KEY))) {
            session.setAttribute(Constant.RolePermission.ROLE_KEY, authenticationMap.get(Constant.RolePermission.ROLE_KEY));
            Long uid = (Long) session.getAttribute("uid");
            UserRole userRole = userRoleDao.selectUserRoleByUUID(uid);
            Integer permisssion = Integer.parseInt(userRole.getrPermisssion());
            session.setAttribute("u_permisssion_array", userRole.getrPermisssion().toCharArray());
            session.setAttribute("u_permisssion", permisssion);
            session.setAttribute("u_rid", userRole.getrRid());
            session.setAttribute("r_description", userRole.getrDescription());
            session.setAttribute("u_r_name", userRole.getrName());
            StringBuffer permissionReverse = new StringBuffer(userRole.getrPermisssion()).reverse();
            session.setAttribute("u_permission", permissionReverse);
        }
    }
}
