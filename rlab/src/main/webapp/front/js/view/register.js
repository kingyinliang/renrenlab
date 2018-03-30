var flagUser = 1;// 标记当前输入框状态，1代表为空，2，代表请输入正确手机号。 0 ，代表验证正确
var flagPwd = 1; // 标记密码输入框，1代表为空，2，代表格式错误，0代表正确
var flagConfirmPwd = 1; // 标记确认密码框，1代表上个密码错误，2代表上个密码错误，确认时不相同，0代表正确

$("#user").on("blur", function () {
    validatePhone();

})

$("#user").on("focus", function () {
    clearPhone();

    if ($("#getMsg").text().trim() === "重新发送" || $("#getMsg").text().trim() === "点击获取") {
        enableBtn($("#getMsg"));
    }
})

$("#pwd").on("blur", function () {
    validatePassword();
})

$("#msgIpt").on("focus", function () {
    $("#verifyInfo").text("");
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

$("#getMsg").on("click", function (e) {
    getNodeCode();
})

var REGISTER_FLAG = true;
$("#register").on("click", function () {
    // login();
    register();
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
    // enableBtn($("#getMsg"));
    enableBtn($("#register"));
}

/**
 * 验证密码格式
 *
 */
function validatePassword() {

    var pwd = $("#pwd").val();
    var regPwd = /^(?=.*[a-zA-z])(?=.*[0-9])([a-zA-z0-9\x21-\x7e]{6,20})$/

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
    // 获取短信校验码
    // code:0 成功
    // 1004 账户名已存在
    // 1005 图形验证码错误
    // 1007 手机验证码发送太频繁
    // 1008 验证码发送异常

    var formData = {
        mobile: $("#user").val(),
        validateCode: $("#imgVertify").val()
    }

    $.ajax({
        url: BASE_URL + "/user/sendVerifyCode",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData)
    })
        .done(function (data) {

            if (data.code === 0) {
                countTime();// 计数

            } else if (data.code === 1005) {
                // 图形验证码错误
                setTip($("#imgInfo"), "验证码不正确或已过期");
                $("#imgVertify").val("");
                updateValidateImg($("#vertifyImg"));

            } else if (data.code === 1007) {
                // 手机验证码发送太频繁
                setTip($("#verifyInfo"), "短信验证码发送频繁");

            } else if (data.code === 1008) {
                layer.msg("网络繁忙，请重新操作");
                // setTip($("#verifyInfo"),"验证码发送失败，请重新操作");
                // 手机验证码发送失败

            } else if (data.code === 1009) {
                setTip($("#verifyInfo"), "该手机号今日获取短信验证次数已达上限");
            } else {
                layer.msg("网络繁忙，请稍后再试");
            }

        })
        .fail(function () {
            // countTime();
            //setTip($("#imgInfo"),"图文验证码输入不正确");
            layer.msg("网络繁忙，请稍后再试");
        });
}

function countTime() {

    disableBtn($("#getMsg"));
    $("#getMsg").text("重新发送 " + 60);
    var i = 59;
    var interval = setInterval(function () {

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

function updateValidateImg($this) {

    $this = $($this);
    $this.attr("src", BASE_URL + "/user/validateCode?_=" + new Date().getTime());

}

/**
 * 登录
 */
function register() {


    setTip($("#userInfo"), "");
    setTip($("#pwdInfo"), "");
    setTip($("#confirmInfo"), "");
    setTip($("#confirmInfo"), "");

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

    if ($("#msgIpt").val().length != 6) {
        setTip($("#verifyInfo"), "请输入有效的验证码");
    }

    if ($("#readProtocol").prop("checked")) {

        if (flagPwd === 0 && flagUser === 0 && flagConfirmPwd === 0 && $("#msgIpt").val().length == 6) {
            doRegister();
        }

    } else {
        setTip($("#toolInfo"), "请阅读服务协议");

    }
}

function doRegister() {
    if(!REGISTER_FLAG) {
        return false;
    }

    var formData = {
        mobile: $("#user").val(),
        password: $.md5($("#pwd").val()),
        confirmPassword: $.md5($("#confirmPwd").val()),
        verifyCode: $("#msgIpt").val()
    }

    $.ajax({
        url: BASE_URL + "/user/register",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        beforeSend: function () {
            REGISTER_FLAG = false;
        },
        success: function (data) {
            if (data.code == 0) {
                // [#maidian]注册成功的数据埋点
                _dgt.push(['trackEvent', 'sign_up', ['d_uid'], [formData.mobile]]);

                // 注册成功，跳转回调页面
                var callBackURL = sessionStorage.getItem("labcallBackURL");
                if (!callBackURL) {
                    location.href = BASE_URL;
                } else {
                    location.href = callBackURL;
                }

            } else if (data.code === 1004) {
                // 用户已存在
                setTip($("#userInfo"), "该手机号已经注册");

            } else if (data.code === 1015) {
                setTip($("#userInfo"), "该手机号已经注册，若您忘记密码请重置密码");

            } else if (data.code === 1006) {
                //  短信验证码输入错误
                setTip($("#verifyInfo"), "请输入有效的验证码");

            } else if (data.code === 1016) {
                //  短信验证码输入错误
                setTip($("#verifyInfo"), "验证码已过期，请重新获取");

            } else {
                layer.msg("网络繁忙，请稍后再试");
            }
        },
        error:function (err) {
            layer.msg("网络繁忙，请稍后再试");
            console.log(err);
        },
        complete:function () {
            REGISTER_FLAG = true;
        }

    })

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

/**
 * 点击阅读协议
 */
function reade() {
    $("#toolInfo").text("");
}

/**
 * 微信登录
 * @param $this
 */
function wechatLogin($this) {

}


/**
 * 跳转主页
 */
function toHomePage() {
    window.location.href = BASE_URL;
}


