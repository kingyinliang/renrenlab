<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.renrenlab.rlab.common.util.HttpRequestDeviceUtil" pageEncoding="UTF-8" %>
<%
    boolean isMobileDevice = HttpRequestDeviceUtil.isMobileDevice(request);
    if(isMobileDevice){
        request.getRequestDispatcher("/m_IPLimit.jsp").forward(request, response);
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
        <div style="margin: 0 auto; height: 200px; margin-top: 150px; margin-left: 22%">
            <div style="float: left; width: 150px; margin: 0 auto; text-align: center; margin-left: 25px">
                <img src="./front/imgs/icon/newplot-404-3.png">
            </div>
            <div style="float: left; width: 600px; margin: 0 auto; margin-top: 25px; margin-left: 25px">
                <p style="margin-top: 10px; color: #666666; font-size: 20px">抱歉, 此网站仅限中国大陆使用</p>
                <p style="margin-top: 10px; color: #666666; font-size: 20px">Sorry, this website can only be used within Mainland China</p>
            </div>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="./WEB-INF/front/template/footer.jsp"></jsp:include>

</div>
<script src="${rlab}/front/js/common/main.js"></script>
<script src="${rlab}/front/js/util/pagination.js"></script>
<script>

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }

    function toGoodsDetail(){

    }

</script>
<script src="${rlab}/front/js/view/goods_list.js"></script>
</body>
</html>