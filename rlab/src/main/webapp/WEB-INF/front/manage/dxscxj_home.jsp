<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170622">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
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
        .user_content {
            height: auto !important;
        }

        /* START 侧边栏公用样式*/
        .side_dn {
            display: block !important;
        }

        .user_side {
            float: left;
            width: 153px;
            min-height: 800px;
            background: #fff;
        }

        .user_side .avatar {
            padding: 0 20px;
            text-align: center;
        }

        .user_side img {
            width: 100px;
            margin-top: 26px;
        }

        .user_side p {
            height: 50px;
            line-height: 50px;
            color: #4e4e4e;
            font-size: 16px;
            border-bottom: 1px dashed #dde3ea;
        }

        /*侧边栏bar*/
        ul.u_sd_ul a {
            color: #4e4e4e;
        }

        ul.u_sd_ul {
            list-style: none;
        }

        ul.u_sd_ul > li {
            line-height: 46px;
            margin-top: 20px;
        }

        ul.u_sd_ul > li > a {
            font-size: 16px;
            padding-left: 26px;
            line-height: 46px;
            display: block;
        }

        ul.u_sd_ul > li.actived > a {
            color: #508df0;
        }

        ul.u_sd_ul > li dl {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul.u_sd_ul > li dl dd {
            text-align: left;
            margin: 0;
            padding: 0;
            background: #f9fbfc;
        }

        ul.u_sd_ul > li dd a {
            padding-left: 26px;
            font-size: 14px;
            display: block;
        }

        ul.u_sd_ul > li.actived dd.actived a {
            color: #508df0;
        }

        ul.u_sd_ul > li dd i {
            font-size: 1px;
            display: inline-block;
            -webkit-transform: scale(0.8, 0.8);
            -moz-transform: scale(0.8, 0.8);
            -ms-transform: scale(0.8, 0.8);
            -o-transform: scale(0.8, 0.8);
            transform: scale(0.8, 0.8);
        }

        /*END 侧边栏公用样式*/

        /*START 内容部分公用样式*/
        .user_main {
            margin-left: 10px;
            min-height: 800px;
            float: left;
            width: 957px;
            background: #fff;
        }

        /*END 内容部分公用样式*/

        .ticket {
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -ms-border-radius: 10px;
            -o-border-radius: 10px;
        }

        .ticket_bottom {
            -webkit-border-radius-bottom: 10px;
            -moz-border-radius-bottom: 10px;
            -ms-border-radius-bottom: 10px;
            -o-border-radius-bottom: 10px;
        }

        .price_text {
            height: 120px;
            line-height: 120px;
            color: white;
            display: inline-block;
            overflow: hidden;
        }

        .price_text p {
            height: 30px;
            line-height: 30px;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="user_center user_content clearfix">
        <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
        <jsp:include page="../template/user_side.jsp" flush="true">
            <jsp:param name="levelNum" value="2"/>
            <jsp:param name="firstMenu" value="3"/>
            <jsp:param name="secondMenu" value="2"/>
        </jsp:include>
        <div class="user_main">
            <div>
                <p style="font-size: 22px; color: #508df0;  margin: 30px 0px 0px 30px">大学生创新券</p>
            </div>
            <c:if test="${coupons.size() == 0}">
                <div style="text-align: center">
                    <img src="${rlab}/front/imgs/rrcxj/not-img.png" alt="" class="" style="margin-top: 100px; width: 235px; height: 138px">
                    <p class="" style="margin-top: 30px; color: #767676; font-size: 16px">哎呦，您居然还没领创新券！</p>
                </div>

            </c:if>
            <c:if test="${coupons.size() > 0}">
                <div style="">
                    <c:forEach items="${coupons}" var="info">
                        <c:if test="${info.oCid == 10002}">
                            <c:if test="${info.oCouponStat == 0}">
                                <div class="ticket"
                                     style="background-color: #a496ea; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">100</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${info.oCouponStat == 1}">
                                <div class="ticket"
                                     style="background-color: #c0c0c0; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">100</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${info.oCid == 10003}">
                            <c:if test="${info.oCouponStat == 0}">
                                <div class="ticket"
                                     style="background-color: #7acbcf; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">300</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${info.oCouponStat == 1}">
                                <div class="ticket"
                                     style="background-color: #c0c0c0; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">300</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${info.oCid == 10004}">
                            <c:if test="${info.oCouponStat == 0}">
                                <div class="ticket"
                                     style="background-color: #75a1e9; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">600</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${info.oCouponStat == 1}">
                                <div class="ticket"
                                     style="background-color: #c0c0c0; width: 440px; height: 175px; float: left; margin: 30px 0px 0px 30px; border: 1px solid #fefefe">
                                    <div style="background: url(${rlab}/front/imgs/dxscxj/ticketBG.png) no-repeat">
                                        <p class="price_text" style="font-size: 34px">￥</p>
                                        <p class="price_text" style="font-size: 74px">600</p>
                                        <div class="price_text" style="width: 250px;">
                                            <p style="text-align: right; font-size: 16px; margin-right: 10px; line-height: 3; color: #376492">
                                                北京</p>
                                            <p style="font-size: 22px; margin-left: 10px">全品类优惠券</p>
                                            <p style="font-size: 16px; margin-left: 10px; color: #44536c">
                                                有效期2017-05-01至2017-10-31</p>
                                        </div>
                                    </div>
                                    <div class="ticket_bottom"
                                         style="padding: 0 10px 0 10px; background-color: white; height: 50px; border-bottom: 1px solid #fefefe">
                                        <p style="color: #63707c; font-size: 14px">
                                            订单满1500元可用，不可与满减、活动价、会员价、买一赠一、第二次半价等共同使用</p>
                                    </div>
                                </div>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
<script type="text/javascript">

</script>
</body>
</html>