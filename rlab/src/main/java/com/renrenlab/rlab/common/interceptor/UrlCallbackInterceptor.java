package com.renrenlab.rlab.common.interceptor;

import com.renrenlab.rlab.common.util.HttpRequestDeviceUtil;
import com.renrenlab.rlab.model.UrlHistory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;


public class UrlCallbackInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //获取session中uid和type
        String method = request.getMethod();
        boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);

        // 进入拦截器
        if (isMobileDevice && "GET".equals(method.toUpperCase())) {

            // 判断是进入页面还是回跳页面
//            String[] isBacks = request.getParameterValues("isback");
            String isBack = null;

//            System.out.println(isBacks);
//            if (isBacks.length == 1) {
//                isBack = isBacks[0];
//            }
//            Map<String, String> map = new HashMap<String, String>();
//            map = request.getParameterMap();

            Map map = request.getParameterMap();

            Set<String> keySet = map.keySet();
            // isBack = map.get("keyword");

            for (String key : keySet) {
                String[] values = (String[]) map.get(key);
                for (String value : values) {
                    if("isback".equals(key)){
                        isBack = value;
                    }
                }
            }

            // 处理URL对象
            String curUri = request.getRequestURI();
            String curUrl = request.getRequestURL().toString();
            String pareams = request.getQueryString();
            UrlHistory urlhistory = new UrlHistory();
            urlhistory.setUri(curUri);
            if (pareams != null) {
                curUrl = curUrl + "?" + pareams;
            }
            urlhistory.setUrl(curUrl);
            urlhistory.setParams(pareams);

            // 获取session的url容器
            LinkedList<UrlHistory> urlHistoryList = (LinkedList<UrlHistory>) request.getSession().getAttribute("urlHistory");

            if (urlHistoryList == null) {
                // 1:新会话
                urlHistoryList = new LinkedList();

                urlHistoryList.add(urlhistory);// 添加url对象
                HttpSession session = request.getSession();//获得一个session对象
                session.setAttribute("urlHistory", urlHistoryList);// 绑定数据

            } else {

                // 2:已连接会话
                if ("1".equals(isBack)) {
                    // 回跳
                    if(urlHistoryList.getLast() != null){
                        urlHistoryList.removeLast();
                    }

                } else {

                    // 进入新页面
                    UrlHistory lastUrlHistory = urlHistoryList.getLast();
                    if (!lastUrlHistory.equals(urlhistory)) {
                        urlHistoryList.add(urlhistory);
                    }

                }
            }

        }
        return true;
    }
}
