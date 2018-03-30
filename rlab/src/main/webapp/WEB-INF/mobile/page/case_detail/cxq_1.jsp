<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>让仪器共享起来—微需求：${detail.uReqDescription}</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="description" content="人人实验是互联网+科技服务平台，200多家检测机构，提供近5万种设备和服务项目，涵盖生物医药、智能硬件、化学化工等多个领域，由专业人员1对1跟踪服务，保证检测质量与效率">
    <meta name="Keywords" content="实验外包，仪器租用，第三方检测，仪器租赁，仪器共享，实验服务，研发服务，检测服务，服务商加盟，互联网+，化学，化工，材料，学术，科学，科研，博士，硕士，理工，科技创新券，生物医药检测，生物器械检测，化学化工检测，金属材料检测，电子电气及机械检测， 电磁兼容（EMC）检测，软件信息检测， 环境监测，环境监测与职业卫生检测，食品及农产品检测，可靠性测试，气候环境实验，大型仪器，服务机构。">
    <meta property="og:type" content="article">
    <meta property="og:title" content="让仪器共享起来—微需求：${detail.uReqDescription}" />
    <%--缩略图--%>
    <meta property="og:image" content="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/wxfx.jpg">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202 ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <%--layer--%>
    <style type="text/css">
        /*头部样式在base.css*/

        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            background: #f5f6fa;
        }

        a {
            text-decoration: none !important;
        }

        a:hover {
            text-decoration: none !important;
        }

        a:link {
            text-decoration: none !important;
        }

        .content {
            margin-top: 1.173rem;
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
            position: absolute;
            top: 0;
            right: 0;
        }

        .user-img {
            width: 0.8267rem;
            height: 1.173rem;
            line-height: 1.173rem;
            text-align: center;
            position: absolute;
            top: 0;
            right: 0.3rem;
        }

        .user-img img {
            overflow: hidden;
            border-radius: 50%;
            width: 0.8267rem;
            height: 0.8267rem;
        }

        .homelogo {
            height: 0.56rem;
            display: block;
            margin: 0.3067rem;
            text-align: center;
        }

        .homelogo img {
            height: 100%;
        }

        .headers .lft_back {
            width: 1rem;
            line-height: 1.173rem;
            text-align: center;
            font-size: 0.45rem;
            float: left;
            position: absolute;
            top: 0;
            left: 0;
        }

        .substance {
            padding: 0.62rem 0.47rem;
            background: #fff;
            border-radius: 0.2rem;
            margin-top: 0.26rem;
        }

        .information {
            font-size: 0.293rem;
            color: #7a7a7a;
        }

        .information_see {
            float: right;
        }

        .substance_text {
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.37rem;
            line-height: 0.54rem;
            letter-spacing: 0.008rem;
            color: #4e4e4e;
            margin: auto;
            margin-top: 0.38rem;
        }

        .end_Time {
            margin-top: 1.34rem;
            text-align: right;
        }

        .expire {
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.29rem;
            line-height: 0.44rem;
            letter-spacing: 0.005rem;
            color: #4f8df0;

        }

        .both_btn {
            height: 1.17rem;
            background-color: rgba(79, 141, 240, 1);
            width: 100%;
            position: fixed;
            bottom: 0;
        }

        .btnName, .contactWay {
            width: 50%;
            height: 100%;
            float: left;
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.37rem;
            line-height: 1.17rem;
            letter-spacing: 0.008rem;
            color: #ffffff;
            text-align: center;
        }

        .btnName {
            background-color: rgba(30, 30, 31, 1);
        }

        .contactWay {
        }

        /*START登录弹窗*/
        .login_modal {
            background-color: #fff;
            /*position: fixed;*/
            top: 100px;
            width: 6.9rem;
            text-align: center;
            -webkit-border-radius: 0.26rem;
            -moz-border-radius: 0.26rem;
            border-radius: 0.26rem;
            overflow: hidden;
        }

        .login_modal .tips {
            height: 1.58rem;
            margin-top: 1.33rem;
            font-size: 1.2rem;
            color: #4f8df0;
        }

        .login_modal p {
            font-size: 0.45rem;
            color: #333;
            line-height: 0.60rem;
        }

        .login_modal p.fast {
            margin-top: 0.45rem;
        }

        .login_modal p.last {
            padding-bottom: 0.84rem;
        }

        [data-dpr="1"] .login_modal p.last {
            border-bottom: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal p.last {
            border-bottom: 2px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal p.last {
            border-bottom: 4px solid #bfbfbf;
        }

        .login_modal .btn {
            height: 1.33rem;
            overflow: hidden;
        }

        .login_modal .btn button {
            height: 1.33rem;
            width: 50%;
            float: left;
            background-color: #fff;
            outline: 0 none;
            border: 0 none;
            font-size: 0.45rem;
            text-align: center;
            color: #4f8df0;
            box-sizing: border-box;
        }

        [data-dpr="1"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        .layui-m-layercont {
            padding: 0 !important;
        }

        /*END 登录弹窗*/

    </style>
</head>
<body>
<div id="main" class="sp_main">
    <div class="headers">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()"><img
                src="${rlab}/mobile/imgs/home_logo.png"/></a></p>
        <c:choose>
            <%--登录--%>
            <c:when test="${sessionScope.uid != null}">
                <p class="user-img" onclick="toCenter()">
                    <i>
                        <c:choose>
                            <c:when test="${sessionScope.avatar != null}">
                                <img src="${sessionScope.avatar}" alt="用户头像">
                            </c:when>
                            <c:otherwise>
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg"
                                     alt="用户头像">
                            </c:otherwise>
                        </c:choose>
                    </i>
                </p>
            </c:when>
            <%--未登录--%>
            <c:otherwise>
                <a class="users lab-user" id="gouser" href="javascript:void (0)" onclick="toCenter()"></a>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="content">
        <%--<div style="padding: 0.32rem">--%>
            <%--<div class="substance">--%>
                <%--<div class="information">--%>
                    <%--<div class="information_time">--%>
                        <%--<span>发布时间：${detail.beginTime}</span>--%>
                        <%--<div class="information_see">--%>
                            <%--<i class="lab-yanjing"></i>--%>
                            <%--<span>--%>
                                    <%--<s>${detail.uChkCount}</s>人--%>
                                <%--</span>--%>

                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="substance_text">--%>
                    <%--${detail.uReqDescription}--%>
                <%--</div>--%>
                <%--<div class="end_Time">--%>
                    <%--<p class="expire" style="display: ${detail.uReqState == 3? 'none':'block'}">--%>
                        <%--${detail.remainTime}天后过期--%>
                    <%--</p>--%>
                    <%--<p class="endDate">--%>
                        <%--截止日期：<span>${detail.endTime}</span>--%>
                    <%--</p>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="both_btn">--%>
            <%--<div class="btnName">--%>
                <%--${detail.uName}--%>
            <%--</div>--%>
            <%--<c:choose>--%>
                <%--&lt;%&ndash;登录&ndash;%&gt;--%>
                <%--<c:when test="${sessionScope.uid != null}">--%>
                    <%--<div class="contactWay" onclick="showcontactWay(this)" data-u-phone="${detail.uMobile}">查看联系方式</div>--%>
                <%--</c:when>--%>
                <%--&lt;%&ndash;未登录&ndash;%&gt;--%>
                <%--<c:otherwise>--%>
                    <%--<div class="contactWay" onclick="showModalToLogin()">查看联系方式</div>--%>
                <%--</c:otherwise>--%>
            <%--</c:choose>--%>
        <%--</div>--%>
    </div>

</div>


</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">

</script>
</html>

