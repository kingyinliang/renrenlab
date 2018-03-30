<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20171109">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style type="text/css">
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
        }
    </style>
    <![endif]-->


    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

    <style type="text/css">
        .callus{
            padding: 69px 16px 0 0;
        }
        .leftext{
            font-size: 16px;
            color: #333333;
            line-height: 39px;
            float: left;
            width: 437px;
        }
        .leftext span{
            color: #999999;
        }
    </style>


</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>


    <div id="content">
        <div class="main clearfix">
            <div class="lef">
                <div class="tabs">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p class="select"><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tabs protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit">联系我们</div>
                <div class="callus">
                    <div class="leftext">
                        <p><span>客服热线：</span>400-102-9559</p>
                        <p><span>客服邮箱：</span>service@renrenlab.com</p>
                        <p><span>市场合作：</span>010- 81708556</p>
                        <p><span>市场合作邮箱：</span>market@renrenlab.com</p>
                        <p><span>通讯地址：</span>北京市昌平区 回龙观东大街 腾讯众创空间A座五层</p>
                        <p><span>邮编：</span>100096</p>
                    </div>
                    <div class="two">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="">
                        <p>人人实验微信服务号（renrenlab）</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
</body>
</html>