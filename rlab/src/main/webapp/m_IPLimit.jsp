<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <%@ include file="./WEB-INF/config/taglibs.jsp" %>
    <%--<link rel="stylesheet" href="${rlab}/mobile/css/base.css">--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <style type="text/css">

        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            background: #f3f3f5;
        }

        .error_404 img {
            margin: 0 auto;
            display: block;
            margin-top: 4rem;
            width: 4.32rem;
            /*height: 4.7067rem;*/
        }

        .error_404 p {
            text-align: center;
        }

        .error_404 .tit {
            font-size: 0.4rem;
            line-height: 0.7rem;
            color: #959595;
            margin-top: 0.5rem;
        }

        .error_404 .tits {
            font-size: 0.32rem;
            line-height: 0.5rem;
            color: #B5B5B5;
        }

        .headers {
            height: 1.173rem;
            width: 100%;
            background: #F5F6FA;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999999;
        }

        .users {
            float: right;
            color: #4E4E4E;
            font-size: 0.56rem;
            line-height: 1.173rem;
            margin-right: 0.3067rem;
        }

        .homelogo {
            float: left;
            width: 2.16rem;
            height: 0.56rem;
            margin: 0.3067rem;
        }

        .homelogo img {
            width: 100%;
            height: 100%;
        }

        #searchs {
            float: right;
            color: #4E4E4E;
            font-size: 0.56rem;
            line-height: 1.173rem;
            margin-right: 0.3067rem;
        }

        #main {
            padding-top: 1.173rem;
        }

        .echartsHead {
            height: 1rem;
            padding: 0 0.32rem;
            background: rgba(120, 120, 120, 0.3);
            overflow: hidden;
        }

        .echartsHead p {
            font-size: 0.32rem;
            color: #7A7A7A;
            line-height: 0.5rem;
            float: left;
            width: 8.8rem;
        }

        a {
            text-decoration: none !important;
        }
    </style>
</head>
<body>

<div id="main" style="overflow: hidden;">

    <div class="headers">
        <p class="homelogo"><a href="${rlab}/page/home"><img src="${rlab}/mobile/imgs/home_logo.png"/></a></p>
        <a class="users lab-user" id="gouser" href="${rlab}/user/center"></a>
        <a class="lab-search" id="searchs" href="${rlab}/page/search"></a>
    </div>
    <div class="error_404">
        <img src="${rlab}/mobile/imgs/fillup_img/m_limit_ip.png"/>
        <p class="tit">抱歉, 此网站仅限中国大陆使用</p>
    </div>

</div>
</body>
<script>
    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;

    function goBack() {
        if (HISTORY_URL != null) {
            window.location.href = HISTORY_URL;
        } else {
            window.history.back();
        }
    }

</script>
</html>
