<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.renrenlab.rlab.common.util.HttpRequestDeviceUtil" pageEncoding="UTF-8" %>
<%
    boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
    if(isMobileDevice){
        request.getRequestDispatcher("/m_500Error.jsp").forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <%@ include file="./WEB-INF/config/taglibs.jsp" %>
    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style>
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }
    </style>
    <![endif]-->

</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="./WEB-INF/front/template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="./WEB-INF/front/template/header.jsp"></jsp:include>
    <!--内容部分-->
    <div class="">
        <div style="margin: 0 auto; width: 600px; height: 200px; margin-top: 150px;">
            <div style="float: left; width: 150px; margin: 0 auto; text-align: center; margin-left: 25px">
                <img src="${rlab}/front/imgs/icon/newplot-404-2.png">
            </div>
            <div style="float: left; width: 400px; margin: 0 auto; margin-left: 25px; height: 163px; line-height: 163px">
                <p style="margin-top: 10px; color: #666666; font-size: 20px">系统出现异常,请稍后再试</p>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="./WEB-INF/front/template/footer.jsp"></jsp:include>
    <%--公用搜索部分--%>
    <%@ include file="./WEB-INF/mobile/template/search.jsp"%>
</div>
<script src="${rlab}/mobile/js/main.js"></script>
<script>
    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }

</script>
</body>
</html>