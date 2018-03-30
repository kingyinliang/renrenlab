<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">


    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css" />
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto-md5/zepto.md5.js"></script>
    <script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
    <link rel="stylesheet" href="${rlab}/mobile/css/login_register.css?v_=20180202">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <style>


        .agre span{
            color: #398df8;
        }
        .agre{
            color: #7a7a7a;
            font-size: 0.32rem;
            line-height: 0.8rem;
        }
    </style>
</head>

<body>

<div id="main" class="mui-content" style="margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_three.jsp" %>
    </header>
    <%--<a href="javascript:void(0)" onclick="toHome()"><img src="${rlab}/mobile/imgs/logos.png"/></a>--%>
    <div class="logintab clearfix" style="padding-top:0.8rem">
        <a class="gologin_note selectTab" onclick="toNote()">注册/快速登录</a>
        <a class="gologin" onclick="tologin()">密码登录</a>
    </div>
    <div class="logos">
        <p class="item">
            <label for="user" class="lab-phone-type-2"></label>
            <input id="user" type="text" placeholder="手机号">
        </p>
        <p id="userTip" class="item_tip" ></p>
        <p class="item item_nomal">
            <label for="pwdcode" class="lab-im"></label>
            <input id="pwdcode" type="number" placeholder="请输入验证码">
            <button id="code" disabled>获取验证码</button>
        </p>
        <p class="item_tip" id="codeError"></p>
        <button id="go" disabled>快速登录</button>
        <p class="agre">注册即代表同意遵守人人实验“<a href="${rlab}/page/server">服务协议</a>”</p>
        <%--<p class="logosHref"><span>没有账号？</span><a id="to_register" href="javascript:void(0)" onclick="toRegisters()">立即注册</a><a id="forget" href="javascript:void(0)" onclick="toFindpaw()">忘记密码？</a></p>
        <div class="other_login">
            <div class="top_line">or</div>
            <div class="btm_login">
                <a href="javascript:void(0)" class="lab-im" id="note" onclick="toNote()"></a>
                <p class="login_tit">密码登陆</p>
            </div>
        </div>--%>
        <div id="codes">
            <p style="overflow: hidden;"><a class="lab-close-1 close"></a></p>
            <p class="codes_head">请输入图中验证码</p>
            <img src="" id="codeImg" alt="图形校验码"/>
            <p class="codes_tit" id="updateCode"><a>看不清？点击图片刷新</a></p>
            <input type="text" name="" id="codeimgInp" value="" />
            <p id="imgInfo"></p>
        </div>
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
<script src="${rlab}/mobile/js/mobile-datect.js" type="text/javascript" charset="utf-8"></script>
<script src="${rlab}/mobile/js/registers.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

    /**
     * 返回历史上一页
     */
    var loginBackFlag = $.getUrlParam("loginBackFlag") == null? 1: $.getUrlParam("loginBackFlag") - 0;
    function goBack() {
        if(loginBackFlag){
            history.go(-loginBackFlag);
        }else {
            history.go(-1);
        }
    }

    mui.init({
        swipeBack: false //启用右滑关闭功能
    });

    var flagPwd=0;
    var mask = mui.createMask(function(){
        $("#codes").hide();
    });
    $("#code").on("click",function(){
        if (flagUser != 0) {
            setTip($("#userTip"),"手机号不能为空");
            return false;
        }
        $("#codeimgInp").val("");
        setTip($("#imgInfo"),"");
        updateValidateImg();
        mask.show();
        $("#codes").show();
    })
    $(".close").on("click",function(){
        $("#codes").hide();
        mask.close();
    })
    $("#codeImg").on("click",function () {
        updateValidateImg()
    })
    $("#codeimgInp").on("input",function () {
        if ($(this).val().length==6) {
            todoGetNodeCode();
           /* GetNodeCode();*/
        }
    })
    $("#go").on("click",function () {
        if (flagUser!=0) {
            setTip($("#userTip"),"手机号不正确不能为空");
            return false;
        }
        if ($("#pwdcode").val().length!=6) {
            setTip($("#codeError"),"验证码为6位数字或不能为空");
            return false;
        }
        doNoteLogin();
    })
    $("#pwdcode").on("input",function () {
        if ($(this).val().length==6) {
            enableBtn();
        }else {
            disableBtn($("#go"))
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