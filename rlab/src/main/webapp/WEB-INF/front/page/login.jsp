<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
        <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/login.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <script src="${rlab}/front/fonts/ie7/ie7.js"></script>
    <style>
        .choose_modal {
            width: 401px !important;
            height: 240px !important;
            -webkit-border-radius: 20px;
            -moz-border-radius: 20px;
            border-radius: 20px;
            overflow: hidden;
            /*box-shadow: -0px 0px 0px rgba(0,0,0,.0);*/
            box-shadow: 13px 7px 29px rgba(0, 0, 0, .3);

        }

        .checkboxs {
            width: 401px;
            position: relative;
            overflow: hidden;
        }

        .checkboxs img {
            cursor: pointer;
        }

        .checkboxs img.lft {
            float: left;
        }

        .checkboxs img.rt {
            float: right;
        }

        /*.checkboxs > div {*/
        /*height: 240px;*/
        /*cursor: pointer;*/
        /*font-size: 20px;*/
        /*text-align: center;*/
        /*}*/

        /*.checkboxs > .lft {*/
        /*width: 200px;*/
        /*background-color: #fff;*/
        /*float: left;*/
        /*color: #616161;*/
        /*}*/

        /*.checkboxs > .rt {*/
        /*width: 200px;*/
        /*background-color: #5db4ff;*/
        /*float: right;*/
        /*font-size: 20px;*/
        /*color: #fff;*/
        /*}*/
        /*.checkboxs > span{*/
        /*position: absolute;*/
        /*font-size: 30px;*/
        /*color: #5db4ff;*/
        /*width: 80px;*/
        /*display: block;*/
        /*height: 40px;*/
        /*line-height: 34px;*/
        /*left: 50%;*/
        /*top: 50%;*/
        /*margin-left: -42px;*/
        /*margin-top: -20px;*/
        /*text-align: center;*/
        /*}*/
        /*.checkboxs > span i {*/
        /*color: #FFF;*/
        /*}*/
    </style>
</head>
<body>

<div id="content" class="wapper">
    <div class="bg_content">
        <canvas id="canvas"></canvas>
    </div>
    <div id="loginMain" class="content" style="display: block">
        <div class="main">

            <img onclick="toHomePage()" src="${rlab}/front/imgs/icon/logo-header.png" alt="人人实验官网">
            <form action="javascript:void(0)" autocomplete="off">

                <h3>
                    登录
                    <%--<span><a href="javascript:void(0)">我已在公众号注册?</a></span>--%>
                </h3>
                <p class="item item_nomal">
                    <label for="user" class="lab-user"></label>
                    <input id="user" autocomplete="off" type="text" placeholder="手机号">
                </p>
                <p id="userTip" class="item_tip"></p>

                <p class="item item_nomal">
                    <label for="pwd" class="lab-lock"></label>
                    <input id="pwd" autocomplete="off" type="password" placeholder="请输入密码">
                </p>
                <%--${error }<br>--%>
                <%--${error != null && error > 3}--%>
                <%--<br>--%>
                <%--${error != null}--%>
                <%--<br>--%>
                <p id="pwdTip" class="item_tip" style="display: block"></p>
                <p id="imgBox" class="item item_img" data-include-img="0"
                   style="display: ${error != null && error >= 3 ? "block" : "none"};">
                    <label for="imgVertify" class="lab-im"></label>
                    <span>
                        <input id="imgVertify" type="text" placeholder="请输入验证码">
                    </span>
                    <img id="vertifyImg" onclick="updateValidateImg(this)" src="${rlab}/user/validateCode"
                         alt="图形校验码">
                </p>

                <p id="imgTip" class="item_tip"></p>
                <p id="allTip" class="item_tip"></p>

                <div id="memoryCheck" class="item_remember">
                    <div class="lft">
                        <label>
                            <input id="rememberBtn" type="checkbox">
                        </label>
                        <div>
                            记住密码
                        </div>
                    </div>
                    <div class="rt">
                        <a href="${rlab}/user/reset">忘记密码？</a>
                    </div>
                </div>
                <button id="login" type="button">登录</button>
                <div class="to_register" style="height: 70px">
                    还没有账号，<a href="${rlab}/user/register">立即注册</a>
                </div>

                <%--<div class="other_login">--%>
                <%--<div class="top_line">or</div>--%>
                <%--<div class="btm_login">--%>
                <%--<img  onclick="wechatLogin(this)" src="${rlab}/front/imgs/icon/icon-wechat.png" alt="微信登录">--%>
                <%--</div>--%>
                <%--</div>--%>

            </form>
        </div>
    </div>
</div>
<style>
    div {
        /*background-color:red;*/
    }
</style>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    //    function fill($this) {
    //        $("#pwdfill").val($($this).val());
    //    }
    var useragent = navigator.userAgent;
    if (useragent.indexOf("WebKit") > 0) {
        setTimeout(function () {
            $("#user").css("backgroundColor", '#f3f6f9');
            $("#pwd").css("backgroundColor", '#f3f6f9');
        }, 110)
    }
    setMinHeight();

    function setMinHeight() {
        var windowCurHeight = $(window).height();
        try {

            if (windowCurHeight > 520) {
                $(".bg_content").css("minHeight", windowCurHeight);
                $(".wapper").css("minHeight", windowCurHeight);
                $(".main").css("minHeight", windowCurHeight);
            }

        } catch (e) {
            console.log(e);
        }
    }

</script>
<script src="${rlab}/front/js/view/login.js?v_=20170905"></script>
<script src="${rlab}/front/js/util/bg_line.js?v_=20170905"></script>
</body>
</html>