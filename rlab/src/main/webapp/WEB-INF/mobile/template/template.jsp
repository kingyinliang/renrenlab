<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <style type="text/css">
        /*头部样式在base.css*/

        *{margin: 0;padding: 0;}html,body{width: 100%;height: 100%;background: #f5f6fa;}

        a{
            text-decoration: none!important;
        }

        a:hover{text-decoration: none !important;}a:link{text-decoration: none !important;}


        .closes{
            float: right;
            width: 0.5rem;
            font-size: 0.5rem;
            line-height: 1rem;
            color: #4E4E4E;
        }

        #echart{
            width: 100%;
            height: 10rem;
            font-size: 0.2rem;
        }
        #footer {
            text-align: center;
            line-height: 1rem;
            background: #F5F6FA;
            padding-top: 0.89rem;
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

        /*super_search主页面*/
        .sp_main {
        }

        .sp_ctnt {
            padding:0 0.32rem;
        }
        .sp_ctnt  > .tip{
            font-size: 0.32rem;
            color: #4083ef;
            border:1px solid ;
        }
    </style>
</head>
<body>
<div id="main" class="sp_main">

    <%--搜索页面独有的头部--%>
    <div class="header" >
        <div class="ipt">
            <div class="ipt_content">

                <div class="lft_back" onclick="goBack()">
                    <i class="lab-back_1"></i>
                </div>

                <div class="ct_ipt" onclick="showSearchModal(this)" data-main-id = "main">
                    <input id="searchIpt" type="text" value="<c:out value="${keyword}" escapeXml="true"/>" disabled>
                    <i class="lab-search"></i>
                </div>

                <div class="rt_user" onclick="toCenter()">
                    <i class="lab-user"></i>
                </div>

            </div>
        </div>
    </div>
    <div class="content">

    </div>

</div>

<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

</script>
</html>