package com.renrenlab.rlab.common.shiro;

import net.sf.json.JSONObject;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Map;

/**
 * Created by guanjipeng on 2018/3/16.
 */
public class ShiroFilterUtils {
    //登录页面
    public static final String LOGIN_URL = "/user/login";

    //没有权限提醒
    public static final String UNAUTHORIZED = "/unauthorized";

    public static boolean isAjax(ServletRequest request) {
        return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
    }

    public static void out(ServletResponse response, Map<String, String> resultMap) {

        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            out = response.getWriter();
            out.println(JSONObject.fromObject(resultMap).toString());
        } catch (Exception e) {
//            LoggerUtils.fmtError(CLAZZ, e, "输出JSON报错。");
        } finally {
            if (null != out) {
                out.flush();
                out.close();
            }
        }
    }
}
