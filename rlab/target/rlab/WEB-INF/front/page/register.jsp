<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>

    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170905">

    <style type="text/css">
        #canvas {
            display: inline-block;
        }
    </style>
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

</head>
<body>
<div id="content" class="wapper">
    <div class="content">
        <div class="bg_content">
            <canvas id="canvas"></canvas>
        </div>
        <div class="main">
            <img onclick="toHomePage()" src="${rlab}/front/imgs/icon/logo-header.png" alt="人人实验官网">
            <form action="javascript:void(0)">

                <h3>
                    注册
                    <span>已有账号？<a href="login.html">立即登录</a></span>
                </h3>

                <p class="item item_nomal" style="margin-top: 0;">
                    <label for="user" class="lab-phone"></label>
                    <input id="user" type="text" placeholder="请输入手机号">
                </p>
                <p id="userInfo" class="item_tip" ></p>

                <p class="item item_nomal">
                    <label for="user" class="lab-lock"></label>
                    <input id="pwd" type="password" placeholder="请输入密码">
                </p>
                <p id="pwdInfo" class="item_tip" ></p>

                <p class="item item_nomal">
                    <label for="user" class="lab-lock"></label>
                    <input id="confirmPwd" type="password" placeholder="请再次输入密码">
                </p>

                <p id="confirmInfo" class="item_tip" style="color: darkred"></p>

                <p class="item item_img">
                    <label for="imgVertify" class="lab-im"></label>
                    <span>
                       <input id="imgVertify" type="text" placeholder="请输入验证码">
                    </span>
                    <img id="vertifyImg" onclick="updateValidateImg(this)" src="${rlab}/front/user/validateCode"
                         alt="图形校验码">
                </p>
                <p id="imgInfo" class="item_tip"></p>

                <p class="item item_msg">
                    <label for="msgIpt" class="lab-im"></label>
                    <input id="msgIpt" type="text" placeholder="请输入短信验证码">
                    <button id="getMsg" type="button">点击获取</button>
                </p>

                <p id="verifyInfo" class="item_tip" ></p>

                <p id="tipText" class="item_tip" style="color: darkred;display: none">
                    该手机号获取短信校验码次数仅剩3次
                </p>

                <div class="protocol">
                    <label>
                        <input id="readProtocol" onchange="reade()" type="checkbox" checked>
                    </label>
                    <span>已阅读同意<a href="http://www.renrenlab.com/pages/service_protocol.html" target="_blank">《人人实验服务协议》</a></span>
                </div>
                <p id="toolInfo" class="item_tip"></p>

                <button id="register" type="button" style="margin-bottom: 40px;margin-top: 30px;">注册</button>

                <div class="other_login" style="display: none;" >
                    <div class="top_line">or</div>
                    <div class="btm_login">
                        <img  onclick="wechatLogin(this)" src="${rlab}/front/imgs/icon/icon-wechat.png" alt="微信登录">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${rlab}/front/js/view/register.js?v_=20170905"></script>
<script src="${rlab}/front/js/util/bg_line.js?v_=20170905"></script>
<script src="${rlab}/front/js/common/main.js?v_=20170905"></script>
</body>
</html>