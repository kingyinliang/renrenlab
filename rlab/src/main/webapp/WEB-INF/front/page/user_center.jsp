<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--<link rel="stylesheet" href="assets/bootstrap-3.3.7-dist/css/bootstrap.css">-->
    <!--<link rel="stylesheet" href="assets/bootstrapvalidator-master/dist/css/bootstrapValidator.css">-->
    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170905">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20170905">
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
            width: 113px;
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
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
            <jsp:param name="levelNum" value="1"/>
            <jsp:param name="firstMenu" value="1"/>
        </jsp:include>
        <div class="user_main">
            <div class="user_infos">
                <h3>个人中心</h3>
                <div class="info_content">
                    <div class="rt_control">
                        <div class="user_name">
                            <i class="lab-user"></i>

                            <!--编辑-->
                            <div id="editStatus" class="edit_status" style="display: block;">
                                <div class="text">${sessionScope}</div>
                                <div id="editName" onclick="editName()" class="btn">
                                    <i class="lab-alter"></i>
                                    <a href="javascript:void(0)">编辑</a>
                                </div>
                            </div>

                            <!--保存-->
                            <div id="saveStatus" class="save_status" style="display: none">
                                <div class="name_ipt">
                                    <input type="text" maxlength="20" placeholder="请输入用户名">
                                </div>
                                <div class="name_save_btn">
                                    <button onclick="modifyNickname()" type="button">保存</button>
                                </div>
                            </div>

                        </div>

                        <div class="user_phone">
                            <i class="lab-phone"></i>
                            <!--<div class="text">-</div>-->
                            <div class="text">${sessionScope.mobile != null ? sessionScope.mobile : "--"}</div>

                            <div class="phone">

                                <c:choose>
                                    <c:when test="${sessionScope.mobile != null}">
                                        <i class="lab-checked-1 is_bind"></i>
                                        <div class="phone_status"></div>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="lab-tip no_bind"></i>
                                        <div class="phone_status">
                                            手机未绑定，<a id="bindPhone" onclick="bindPhone()"
                                                     href="javascript:void(0)">点击绑定</a>
                                        </div>
                                    </c:otherwise>
                                </c:choose>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="control_center">
                <span>关注<a href="${rlab}/front/instrument/qr" target="_blank" style="color: #508df0">人人实验服务号</a>，体验更多VIP个性化定制服务和专业化解决方案</span>
                    <button id="cgPwd" onclick="changePwd()" type="button">修改密码</button>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20170905"></script>
<script type="text/javascript">
    function userSideClick(event, $_this) {
        e = event || window.event;
        // var isSecondClick = e.srcElement.nodeName.toUpperCase() === 'A' || e.target.nodeName.toUpperCase() === 'A';
        var sonTag = $($_this).find("dl");
        var hasSonTag = sonTag.length > 0 ? true : false;
        if (hasSonTag) {
            var isSideDn = sonTag.hasClass("side_dn");
            if (isSideDn) {
                sonTag.hide();
                sonTag.removeClass("side_dn");
            } else {
                sonTag.show();
                sonTag.addClass("side_dn");
            }
        }
    }
    // 初始化侧边栏功能
    //    $("#userSide > li").on("click", function () {
    //        var sonTag = $(this).find("dl");
    //        var hasSonTag = sonTag.length > 0 ? true : false;
    //        if (hasSonTag) {
    //            var isSideDn = sonTag.hasClass("side_dn");
    //            if (isSideDn) {
    //                 sonTag.removeClass("side_dn");
    //                 sonTag.hide();
    //            } else {
    //                sonTag.addClass("side_dn");
    //                sonTag.show();
    //            }
    //        }
    //    })


    function userSideBarClick() {

    }
    //    $("#userSide >")
    /**
     *  编辑昵称（工厂函数）
     */
    function editName() {
        $("#saveStatus input").val($("#editStatus .text").text());
        $("#editStatus").hide();
        $("#saveStatus").show();
    }

    /**
     *  昵称输入框正则（工厂函数）
     */

    $("#saveStatus input").on("input", function (e) {

        var str = $(this).val();
        var len = strlen(str);
        if (len > 40) {
            $(this).val(str.slice(0, 20));
        }
        console.log(e);
    })
    /**
     * 绑定手机号（工厂函数）
     */
    function bindPhone() {
        var html =
            '<div class="bd_phone">\
                <form action="javascript:void(0)">\
                    <h3>\
                        绑定手机号\
                        <span></span>\
                    </h3>\
                    <p class="item item_nomal" style="margin-top: 0;">\
                        <label for="user" class="lab-phone"></label>\
                        <input id="user" type="text" placeholder="请输入手机号">\
                    </p>\
                    <p id="userInfo" class="item_tip" style="color: darkred"></p>\
                    <p class="item item_nomal">\
                        <label for="user" class="lab-lock"></label>\
                        <input id="pwd" type="text" placeholder="请输入密码">\
                    </p>\
                    <p id="pwdInfo" class="item_tip" style="color: darkred"></p>\
                    <p class="item item_nomal">\
                        <label for="user" class="lab-lock"></label>\
                        <input id="confirmPwd" type="text" placeholder="请再次输入密码">\
                    </p>\
                    <p id="confirmInfo" class="item_tip" style="color: darkred"></p>\
                    <p class="item item_img">\
                        <label for="imgVertify" class="lab-im"></label>\
                        <span>\
                            <input id="imgVertify" type="text" placeholder="请输入验证码">\
                        </span>\
                        <img id="vertifyImg"  data-include-img="1"  onclick="updateValidateImg(this)" src="${rlab}/front/user/validateCode" alt="图形校验码">\
                    </p>\
                    <p id="imgInfo" class="item_tip" style="color: darkred"></p>\
                    <p class="item item_msg">\
                        <label for="msgIpt" class="lab-im"></label>\
                        <input id="msgIpt" type="text" placeholder="请输入短信验证码">\
                        <button id="getMsg" type="button">点击获取</button>\
                    </p>\
                    <p id="verifyInfo" class="item_tip" style="color: darkred"></p>\
                    <p id="tipText" class="item_tip" style="color: darkred;display: none">\
                        该手机号获取短信校验码次数仅剩3次\
                    </p>\
                    <button id="resetPwd" type="button">绑定</button>\
                </form>\
            </div>';

        var loopId = -1;
        var layer_bind_phone = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'bd_phone_layer',
            content: html,
            end: function () {
                if (loopId !== -1) {

                    try {
                        clearInterval(loopId);
                    } catch (e) {
                        setTimeout(function () {
                            clearInterval(loopId);
                        }, 100)
                    }

                }
            }
        });

        loopId = bindPhoneEvent();// 重置定时器
    }

    /**
     * 点击修改，触发事件函数
     */
    function changePwd() {
        var html =
            '<div class="cg_pwd">\
                <h3>修改密码<i class="close_x lab-close-1"></i></h3>\
                <p class="item first_item">\
                    <label class="lab-lock" for="originPwd"></label>\
                    <input id="originPwd" type="password" placeholder="请输入原密码">\
                </p>\
                <span id="originInfo" class="item_tip first_item"></span>\
                <p class="item">\
                    <label class="lab-lock" for="newPwd"></label>\
                    <input id="newPwd" type="password" placeholder="请输入新密码">\
                </p>\
                <span id="pwdInfo" class="item_tip"></span>\
                <p class="item">\
                    <label class="lab-lock" for="cfmNewPwd" ></label>\
                    <input id="cfmNewPwd" type="password" placeholder="请确认新密码">\
                </p>\
                <span id="cfmInfo" class="item_tip"></span>\
                <button id="cgPwdBtn" type="button">修改</button>\
            </div>';

        var layer_cg_pwd = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: false,
            skin: 'cg_pwd_layer',
            content: html,
            end: function () {

            }
        });
        // 点击按钮关闭弹窗
        $(".close_x").on("click", function () {
            layer.close(layer_cg_pwd);//　关闭弹窗
        })

        bindCgEvent(layer_cg_pwd);

    }

    // 给绑定手机的弹窗加事件
    function bindPhoneEvent() {
        var flagUser = 1;// 标记当前输入框状态，1代表为空，2，代表请输入正确手机号。 0 ，代表验证正确
        var flagPwd = 1; // 标记密码输入框，1代表为空，2，代表格式错误，0代表正确
        var flagConfirmPwd = 1; // 标记确认密码框，1代表上个密码错误，2代表上个密码错误，确认时不相同，0代表正确
        var interval = 0;

        // todo:控制user验证
        $("#user").on("blur", function () {
            validatePhone();
        })

        $("#user").on("focus", function () {
            clearPhone();
        })

        $("#pwd").on("blur", function () {
            validatePassword();
        })

        $("#pwd").on("focus", function () {
            clearPassword();
        })

        $("#confirmPwd").on("blur", function () {
            validateConformPwd();
        })

        $("#confirmPwd").on("focus", function () {
            clearConformPwd();
        })

        $("#imgVertify").on("focus", function () {
            setTip($("#imgInfo"), "");
        })
        // todo:点击获取短信校验码
        $("#getMsg").on("click", function (e) {
            console.log(1111111111)
            getNodeCode();
        })

        // todo:点击注册
        $("#resetPwd").on("click", function () {
            login();
        })

        /**
         * 验证用户名/手机号输入
         *
         */
        function validatePhone() {

            var userName = $("#user").val();
            var regPhone = /^0?(10|13|15|18|14|17)[0-9]{9}$/;

            if (userName === "") {
                flagUser = 1;
                enableBtn();
                return false;
            }

            if (!regPhone.test(userName)) {

                flagUser = 2;// 置状态
                setTip($("#userInfo"), "请输入正确的手机号");// 设提示
                disableBtn($("#register"));
                disableBtn($("#getMsg"));

            } else if (regPhone.test(userName)) {

                flagUser = 0;
                enableBtn();

            }

        }

        function clearPhone() {

            setTip($("#userInfo"), "");
            enableBtn($("#getMsg"));
            enableBtn($("#register"));
        }

        /**
         * 验证密码格式
         *
         */
        function validatePassword() {

            var pwd = $("#pwd").val();
            var regPwd = /^(?![^A-Za-z]+$)(?![^0-9]+$)[\x21-x7e]{6,20}$/;

            if (pwd === "") {
                flagPwd = 1;
                enableBtn();
                return false;
            }

            if (!regPwd.test(pwd)) {

                flagPwd = 2;
                setTip($("#pwdInfo"), "6~20位之间，需包含数字和英文字母");
                disableBtn($("#register"));

            } else {

                flagPwd = 0;
                enableBtn();
                validateConformPwd(); // 反向验证一下重复密码框

            }

        }

        function clearPassword() {

            setTip($("#pwdInfo"), "");
            enableBtn($("#register"));

        }

        /**
         * 验证两次密码是否一致
         */
        function validateConformPwd() {
            var cfmPwd = $("#confirmPwd").val();
            setTip($("#confirmInfo"), "");

            // 需知：每次进来，提示都为空，样式都为空
            if (cfmPwd === "") {

                flagConfirmPwd = 1;
                enableBtn();
                return false;
            }

            if (flagPwd === 2) {

                flagConfirmPwd = 1;
                disableBtn($("#register"));
                return false;

            }

            if ($("#pwd").val() !== $("#confirmPwd").val() || flagPwd === 1) {

                flagConfirmPwd = 2;
                setTip($("#confirmInfo"), "两次输入密码不一致");
                disableBtn($("#register"));

            } else {

                flagConfirmPwd = 0;
                enableBtn();
            }

        }

        function clearConformPwd() {
            setTip($("#confirmInfo"), "");
            enableBtn($("#register"));
        }


        /**
         * 获取短信验证码
         */
        function getNodeCode() {

            if (flagUser === 1) {
                setTip($("#userInfo"), "手机号不能为空");
                return false;
            }

            if (flagUser === 2) {
                return false;
            }

            todoGetNodeCode();

        }

        function todoGetNodeCode() {

            var imgVal = $("#imgVertify").val();
            $.ajax({
                url: '../api/requirement',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify()

            })
                .done(function (data) {

                    if (data.code == 0) {

                        // todo:成功判断还剩下几次机会，加提示
                        countTime();

                    } else if (data.code === 2202) {

                        // todo:判断是否超过三次，超过三次显示图片验证码div
                        setTip($("#imgInfo"), "图文验证码输入不正确");


                    } else if (data.code === 2001) {

                        // 已注册
                        layer.msg("系统繁忙 , 请稍后再试");

                    } else {


                    }

                    //13261688305
                })
                .fail(function () {
                    countTime();
                    //setTip($("#imgInfo"),"图文验证码输入不正确");

                });
        }

        function countTime() {

            disableBtn($("#getMsg"));
            $("#getMsg").text("重新发送 " + 60);
            var i = 59;
            interval = setInterval(function () {

                if (i > 0) {

                    $("#getMsg").text("重新发送 " + i + "");
                    i--;

                } else {

                    clearInterval(interval);
                    $("#getMsg").text("重新发送");
                    enableBtn($("#getMsg"))

                }

            }, 1000);
        }

        /**
         * 登录
         */
        function login() {

            if (flagUser === 1) {
                setTip($("#userInfo"), "手机号不能为空")
            }

            if (flagPwd === 1) {
                setTip($("#pwdInfo"), "密码不能为空")
            }

            if (flagPwd === 0 && flagConfirmPwd === 1) {
                setTip($("#confirmInfo"), "请确认密码");
            }


            if (flagPwd === 0 && flagConfirmPwd === 2) {
                setTip($("#confirmInfo"), "两次输入密码不一致");
            }

            if (flagPwd === 0 && flagUser === 0 && flagConfirmPwd === 0) {
                doLogin();
            }

        }

        function doLogin() {

            $.ajax({
                url: '../api/requirement',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify()

            })
                .done(function (data) {

                    if (data.code == 0) {
                        // todo:登录成功，跳转回调页面

                    } else if (data.code === 1) {

                        // todo:登录失败，短信验证码错误
                        setTip($("#verifyInfo"), "请输入有效的验证码");


                    } else if (data.code === 2) {
                        // todo:该手机号已注册
                        setTip($("#userInfo"), "该手机号已经注册");
                    } else {
                        // todo:其他情况

                    }

                    //13261688305
                })
                .fail(function () {
                    //countTime();
                    setTip($("#imgInfo"), "图文验证码输入不正确");

                });

        }

        function enableBtn($this) {

            if (!$this) {
                $("#register").attr({"disabled": "disabled"}).addClass("disable");
                if (flagPwd != 2 && flagPwd != 2 && flagUser != 2) {
                    $("#register").removeAttr("disabled").removeClass("disable");
                }

            } else {
                $this.removeAttr("disabled").removeClass("disable");
            }

        }

        function disableBtn($this) {
            $this.attr({"disabled": "disabled"}).addClass("disable");
        }

        function setTip($this, text) {
            $this.text(text);
        }

        return interval;

    }

    // 给修改密码弹窗加事件
    function bindCgEvent(layer_cg_pwd) {

        var pwdStatus = 1;
        var cfmPwdStatus = 1;

        $("#originPwd").on("focus", function () {
            $("#originInfo").text("");
        })

        $("#newPwd").on("blur", function () {
            verifyPwd();
        })

        $("#newPwd").on("focus", function () {
            $("#cfmInfo").text("");
            $("#pwdInfo").text("");
        })

        $("#cfmNewPwd").on("blur", function () {
            verifyCfm();
        })

        $("#cfmNewPwd").on("focus", function () {
            $("#cfmInfo").text("");
        })

        // todo:替换
        $("#cgPwdBtn").on("click", function () {
            updatePwd(layer_cg_pwd);
        })
    }
    /**
     * 确认修改密码（工厂函数）
     */
    function updatePwd(layer_cg_pwd) {
        console.log("updatePwd");
        console.log(layer_cg_pwd);

        if ($("#originPwd").val() === "") {
            $("#originInfo").text("密码不能为空");
        }

        if ($("#newPwd").val() === "") {

            $("#pwdInfo").text("新密码不能为空");

        } else {

            if ($("#cfmNewPwd").val() === "") {

                $("#cfmInfo").text("请确认新密码");

            } else if ($("#cfmNewPwd").val() !== $("#newPwd").val()) {
                $("#cfmInfo").text("两次密码输入不一致");
            }

        }
        verifyPwd();
        verifyCfm();
        if (cfmPwdStatus === 0 && pwdStatus === 0) {
            doChange(layer_cg_pwd);
        }
    }

    /**
     * 验证新密码
     */
    function verifyPwd() {

        // 确认新密码为空跳出

        var newPwd = $("#newPwd").val();

        var regPwd = /^(?=.*[a-zA-z])(?=.*[0-9])([a-zA-z0-9\x21-\x7e]{6,20})$/

        // 密码为空，跳出，不提示，不反向验证。
        if (newPwd === "") {
            pwdStatus = 1;
            return false;
        }

        if (!regPwd.test(newPwd)) {

            pwdStatus = 2;
            $("#pwdInfo").text("6~20位之间，需包含数字和英文字母");

        } else {
            // 验证通过，修改状态，反向验证
            pwdStatus = 0;
            verifyCfm();
        }

    }

    /**
     * 验证确认新密码
     */
    function verifyCfm() {

        if ($("#newPwd").val() === "") {
            pwdStatus = 1;
            return false;
        }

        if ($("#cfmNewPwd").val() === "") {
            cfmPwdStatus = 1;
            return false;
        }

        if ($("#newPwd").val() !== $("#cfmNewPwd").val()) {
            cfmPwdStatus = 2;
            $("#cfmInfo").text("两次密码输入不一致");
        }

        if ($("#newPwd").val() === $("#cfmNewPwd").val()) {
            cfmPwdStatus = 0;
            pwdStatus = 0;
            return false;
        }
    }

    /**
     * 发送修改密码的ajax
     */
    function doChange(layer_cg_pwd) {

        var data = {
            "oldPassword": $.md5($("#originPwd").val()),
            "password": $.md5($("#newPwd").val()),
            "confirmPassword": $.md5($("#cfmNewPwd").val()),
        }

        $.ajax({
            url: BASE_URL + "/front/user/modify/password",
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)
        })
            .done(function (data) {

                if (data.code == 0) {
                    layer.close(layer_cg_pwd);//　关闭弹窗
                    // 用户未登录
                    layer.msg("密码修改成功");
                    window.location.href = BASE_URL + "/front/user/login";
                } else if (data.code === 1012) {
                    // 用户未登录
                    window.location.href = BASE_URL + "/front/user/login";

                } else if (data.code === 1010) {
                    // 旧密码输入错误
                    $("#originInfo").text(data.message);
                } else {
                    layer.close(layer_cg_pwd);//　关闭弹窗
                    layer.msg("网络繁忙，请重新操作");
                }

            })
            .fail(function () {
                layer.msg("网络繁忙，请重新操作");
            });
    }
    /**
     * 修改昵称的ajax函数
     * @param $this 当前DOM对象
     */
    function updateValidateImg($this) {
        console.log($this);
        if ($this === undefined) {
            $("#vertifyImg").attr("src", BASE_URL + "/front/user/validateCode?_=" + new Date().getTime());
        }
        $this = $($this);
        $this.attr("src", BASE_URL + "/front/user/validateCode?_=" + new Date().getTime());

    }

    /**
     * 修改昵称的ajax函数
     * @param nickname 新的用户昵称
     */
    function modifyNickname() {
        var text = $("#saveStatus input").val();
//        var len = 0;
//        for (var i = 0; i < text.length; i++) {
//            if (text[i].match(/[^\x00-\xff]/ig) != null) //全角
//                len += 2; //如果是全角，占用两个字节
//            else
//                len += 1; //半角占用一个字节
//        }
//        if (len > 40) {
//            layer.msg("用户名为1-20个字母、汉字、数字组合");
//            return;
//        }
//        if (!/^[\u4e00-\u9fa5A-Za-z0-9]{1,40}$/.test(text)) {
//            layer.msg("用户名为1-20个字母、汉字、数字组合");
//            return;
//        }

        var data = {
            "nickname": text
        }
        $("#editStatus").show();
        $("#saveStatus").hide();

        $.ajax({
            url: BASE_URL + "/front/user/modify/user",
            type: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(data)
        })
            .done(function (data) {

                if (data.code === 0) {
                    $("#editStatus .text").text($("#saveStatus input").val());
                    window.location.reload();

                } else if (data.code === 1012) {
                    // 用户未登录
                    window.location.href = BASE_URL + "/front/user/login";

                } else {
                    layer.msg("网络繁忙,请重新操作");
                }

            })
            .fail(function () {
                layer.msg("网络繁忙,请重新操作");
            });
    }

</script>
</body>
</html>