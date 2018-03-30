<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>


    <style type="text/css">
        *{margin: 0;padding: 0;}html,body{width: 100%;height: 100%;background: #f5f6fa;}
        a:hover{text-decoration: none !important;}a:link{text-decoration: none !important;}
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
        #searchs{
            float: right;
            color: #4E4E4E;
            font-size: 0.56rem;
            line-height: 1.173rem;
            margin-right: 0.3067rem;
        }
        #main{
            padding-top: 1.173rem;
        }
        #footer {
            text-align: center;
            line-height: 1rem;
            background: #F5F6FA;
            padding-top: 0.89rem;
            margin-top: 2rem;
        }

        #footer p {
            margin: 0;
            font-size: 0.267rem;
            color: #b5b5b5;
        }

        #footer img {
            width: 2.13rem;
            height: 0.56rem;
        }
        #footer p img{
            width:2.6rem;
            height: 2.6rem;
            margin-bottom: 0.5rem;
        }
        #super_search_null img{margin: 0 auto;display: block;margin-top: 3rem;width: 3.3067rem;height: 3.173rem;}
        #super_search_null p{text-align: center;}
        .tit{font-size: 0.4rem;line-height: 0.7rem;color: #6b6a6f;margin-top: 0.5rem;}.tits{font-size: 0.32rem;line-height: 0.5rem;color: #B5B5B5;}
    </style>
</head>

<body>
<div id="main">
    <div class="headers">
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()"><img src="${rlab}/mobile/imgs/home_logo.png" /></a></p>
        <a class="users lab-user" id="gouser" href="javascript:void (0)" onclick="toCenter()"></a>
        <a class="lab-search" id="searchs" href="javascript:void (0)" onclick="showSearchModal(this)" data-main-id="main"></a>
    </div>

    <div id="super_search_null">
        <img src="${rlab}/mobile/imgs/fillup_img/superserch.png"/>
        <p class="tit">抱歉，没有找到相关资料</p>
        <p class="tits">您可以更换一下关键词，或适当扩大您的搜索范围重新尝试</p>
    </div>

    <div id="footer">
        <img src="${rlab}/mobile/imgs/home_logo.png" />
        <p>关注“人人实验”服务号，体验VIP专业定制服务</p>
        <p><img src="${rlab}/mobile/imgs/two.jpg"></p>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script>
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }

    setCallbackUrl();// 设置登录时回跳路径
</script>
</html>

