<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <!--layer-->
    <%--<link rel="stylesheet" href="${rlab}/mobile/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/mobile/assets/layer-v3.0.3/layer/layer.js"></script>--%>

    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">


    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/assets/zepto-md5/zepto.md5.js"></script>
    <script src="${rlab}/mobile/js/main.js?v_=20180207"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/login_register.css?v_=20180202">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">

</head>

<body>

<div id="main" style="margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_three.jsp" %>
    </header>
    <%--<a href="javascript:void(0)" onclick="toHome()"><img src="${rlab}/mobile/imgs/logos.png"/></a>--%>
    <div class="logintab clearfix" style="padding-top:0.8rem">
        <a class="gologin_note" onclick="toNote()">注册/快速登录</a>
        <a class="gologin selectTab" onclick="tologin()">密码登录</a>
    </div>
    <div class="logos">
        <p class="item">
            <label for="user" class="lab-user"></label>
            <input id="user" type="text" placeholder="手机号">
        </p>
        <p id="userTip" class="item_tip"></p>
        <p class="item item_nomal">
            <label for="pwd" class="lab-lock"></label>
            <input id="pwd" type="password" placeholder="请输入密码">
        </p>
        <p id="pwdTip" class="item_tip"></p>

        <p id="imgBox" class="item item_img" data-include-img="0" style="display: none">
            <label for="pwd" class="lab-im"></label>
            <input id="imgVertify" type="text" placeholder="请输入验证码"
                   style="margin: 0 !important;padding-left: 1rem !important;width:2.465rem;">
            <img id="vertifyImg" onclick="updateValidateImg(this)" src="" alt="图形校验码">
        </p>
        <p id="imgTip" class="item_tip"></p>
        <p id="allTip" class="item_tip"></p>

        <button id="go" style="margin-top: 0.2rem;" disabled>登录</button>

        <p class="logosHref"><a id="forget" href="javascript:void(0)" onclick="toFindpaw()">忘记密码？</a></p>
        <%--<div class="other_login">
            <div class="top_line">or</div>
            <div class="btm_login">
                <a href="javascript:void(0)" class="lab-im" id="note" onclick="toNote()"></a>
                <p class="login_tit">验证码登陆</p>
            </div>
        </div>--%>
    </div>
    <footer>
        <jsp:include page="../template/footer.jsp" flush="true">
            <jsp:param name="active" value="4"/>
        </jsp:include>
    </footer>
</div>

<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script src="${rlab}/mobile/js/login_register.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    /**
     * 返回历史上一页
     */
    var loginBackFlag = $.getUrlParam("loginBackFlag") == null ? 1 : $.getUrlParam("loginBackFlag") - 0;
    function goBack() {
        if(loginBackFlag){
            history.go(-loginBackFlag);
        }else {
            history.go(-1);
        }
    }

    $("#go").on("click", function () {
        if ($("#user").val() === "") {
            $("#userTip").text("手机号不能为空");
        }

        if ($("#pwd").val() === "") {
            $("#pwdTip").text("密码不能为空");
        }

        if ($("#pwd").val() !== "" && $("#user").val() !== "") {
            sendLogin();
        }

    })
    function toRegisters() {
        location.href = BASE_URL + "/user/register?curURI=" + encodeURI(URL_CUR_CITY);
    }
    function toFindpaw() {
        location.href = BASE_URL + "/user/reset?curURI=" + encodeURI(URL_CUR_CITY);
    }

    function toNote() {
        loginBackFlag++;
        location.href = BASE_URL + "/user/text/login?loginBackFlag=" + loginBackFlag + "&curURI=" + encodeURI(URL_CUR_CITY);
    }

    function tologin() {
        loginBackFlag++;
        location.href = BASE_URL + "/user/login?loginBackFlag=" + loginBackFlag + "&curURI=" + encodeURI(URL_CUR_CITY);
    }

</script>
</html>