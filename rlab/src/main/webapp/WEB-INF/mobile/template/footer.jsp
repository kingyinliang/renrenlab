<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../../config/taglibs.jsp" %>
<%--公用底部tab--%>
<div class="footer">
    <a class="${param.active==1?'foot-active':''}" href="javascript:void (0);" onclick="toHome()">
        <span class="lab-mobilehome lab-icon"></span>
        <span class="mui-tab-label">首页</span>
    </a>
    <a class="${param.active==2?'foot-active':''}" href="javascript:void (0);" onclick="toClassify()">
        <span class="lab-classify lab-icon"></span>
        <span class="mui-tab-label">分类</span>
    </a>
    <a class="${param.active==3?'foot-active':''}" href="javascript:void (0);" onclick="goReqlist()" >
        <span class="lab-demand lab-icon"></span>
        <span class="mui-tab-label">微需求</span>
    </a>
    <a class="${param.active==4?'foot-active':''}" href="javascript:void (0);" onclick="toCenter()">
        <span class="lab-mine lab-icon"></span>
        <span class="mui-tab-label">我的</span>
    </a>
</div>