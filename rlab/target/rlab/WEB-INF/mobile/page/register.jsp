<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170608">


    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css" />
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <%--<script src="${rlab}/front/assets/md5/jquery.md5.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/mobile/css/login_register.css?v_=20170608">
    <script src="${rlab}/mobile/assets/zepto-md5/zepto.md5.js"></script>
    <script src="${rlab}/mobile/js/main.js"></script>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <style>
        input{margin: 0 !important;padding: 0 !important;line-height: normal !important;}
    </style>
</head>

<body>
<div id="main" class="mui-content">
    <div class="login_head">
        <div  onclick="goBack()">
            <i class="lab-back_1"></i><span>返回</span>
        </div>
    </div>
    <a href="javascript:void(0)" onclick="toHome()"><img src="${rlab}/mobile/imgs/logos.png"/></a>
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
        <p class="item item_nomal">
            <label for="pwd" class="lab-lock"></label>
            <input id="pwd" type="password" placeholder="请设置密码">
        </p>
        <p class="item_tip" id="pwdInfo"></p>
        <button id="go" disabled>注册</button>
        <p class="logosHref" style="text-align: center"><span>点击注册表示我已同意《人人实验用户协议》</span></p>
        <%--<p class="logosHref"><span>已有账号？</span><a id="to_register" href="${rlab}/front/user/register">立即注册</a><a id="forget" href="${rlab}/front/user/reset">忘记密码？</a></p>
        <div class="other_login">
            <div class="top_line">or</div>
            <div class="btm_login">
                <a href="${rlab}/front/user/text/login" class="lab-im" id="note"></a>
                <p class="login_tit">验证码登陆</p>
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
</div>
</body>
<script src="${rlab}/mobile/js/mobile-datect.js" type="text/javascript" charset="utf-8"></script>
<script src="${rlab}/mobile/js/registers.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }

    var pageName=2;
    mui.init({
        swipeBack: false //启用右滑关闭功能
    });

    var mask = mui.createMask(function(){
        $("#codes").hide();
    });

    $("#code").on("click",function(){

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
        }
    })
    $("#go").on("click",function () {

        register();
    })
    $("#pwdcode").on("input",function () {
        if ($(this).val().length==6) {
            enableBtn();
        }else {
            disableBtn($("#go"))
        }
    })

</script>
</html>