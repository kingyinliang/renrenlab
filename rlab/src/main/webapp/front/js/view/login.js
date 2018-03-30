var flagUser = 0;// 标记当前输入框状态，1代表为空，2，代表请输入正确手机号。 0 ，代表验证正确
var flagPwd = 0; // 标记密码输入框，1代表为空，2，代表格式错误，0代表正确

// 状态or数据
var IS_MEMORY = false; // 是否记住账户名
getRememberPwd();

var phoneNumber;
var param;

// 控制手机号校验
$("#user").on("blur", function () {
    validatePhone();
})

$("#user").on("input", function () {
    if ($("#user").val().length != 11){
        $("#imgBox").hide();
    }
    if ($("#user").val().length == 11 && $("#user").val() == phoneNumber && param == 3){
        $("#imgBox").show();
        $("#imgBox").data("includeImg",1);
        updateValidateImg();
    }
})

$("#user").on("focus", function () {
    clearPhone();
    $("#allTip").text("");
    $("#imgTip").text("");
})

$("#pwd").on("focus", function (){
    $("#allTip").text("");
    $("#pwdTip").text("");
})

$("#imgVertify").on("focus", function (){
    $("#imgTip").text("");
})

/**
 * 验证用户名/手机号输入框
 * @return Boolean [true/false]
 *
 */
function validatePhone () {

    var userName = $("#user").val();
    var regPhone = /^0?(10|13|15|18|14|17)[0-9]{9}$/;

    if (userName === "") {

        $("#login").attr({"disabled":"disabled"}).addClass("disable");
        $("#userTip").text("手机号不能为空");
        flagUser = 1;

    } else if (!regPhone.test(userName)) {

        $("#login").attr({"disabled":"disabled"}).addClass("disable");
        $("#userTip").text("请输入正确的手机号");
        flagUser = 2;

    } else {

        flagUser = 0;
        if(flagPwd === 0 && flagUser === 0) {
            $("#login").removeAttr("disabled").removeClass("disable");//将按钮可用
        }
    }
}
/**
 * 跳转主页
 */
function toHomePage() {
    window.location.href = BASE_URL;
}

/**
 * 清除手机
 */
function clearPhone () {

    $("#userTip").text("");
    if(flagPwd === 0) {
        $("#login").removeAttr("disabled").removeClass("disable");//将按钮可用
    }

}

/**
 * 登录点击事件触发
 */
var LOGIN_AJAX_FLAG = true;
$("#login").on("click", function (e) {

    if($("#user").val() === ""){
        $("#userTip").text("手机号不能为空");
    }

    if($("#pwd").val() === ""){
        $("#pwdTip").text("密码不能为空");
    }

    if($("#pwd").val() !== "" && $("#user").val() !== "") {
        sendLogin();
    }

});

$("html").on("keyup",function (e) {
    if (e.keyCode === 13) {
        if($("#user").val() === ""){
            $("#userTip").text("手机号不能为空");
        }

        if($("#pwd").val() === ""){
            $("#pwdTip").text("密码不能为空");
        }

        if($("#pwd").val() !== "" && $("#user").val() !== "") {
            sendLogin();
        }
    }
})

/**
 * 发送登录请求
 */
function sendLogin() {
    if(!LOGIN_AJAX_FLAG){
        console.log('不要频繁点击');
        return false;
    }

    var formData = getFormData();
    phoneNumber = $("#user").val();
    $.ajax({
        url: BASE_URL + "/user/login",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        beforeSend:function () {
            LOGIN_AJAX_FLAG = false;
        },
        success:function (data) {
            param = data.param;
            if (data.code === 0 ) {
                // 判断用户权限,普通权限
                if (data.param === 0) {
                    // [#maidian]登录成功的数据埋点
                    _dgt.push(['trackEvent', 'login',['d_uid'], [formData.mobile]]);
                    toFrontHome();

                } else {
                    showCheckesModal();
                }

            } else if(data.code === 1002 ) {
                // 用户名密码错误
                if (data.param >= 3) {

                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }
                $("#userTip").text("用户名不存在");

            }else if(data.code === 1003){
                //  用户名密码错误
                if (data.param >= 3) {

                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }

                $("#allTip").text("手机号或密码不正确");

            }else if(data.code === 1005){
                // 验证码错误
                if (data.param >= 3) {
                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();

                }
                $("#imgTip").text("验证码输入不正确")

            }else if(data.code === 1017){
                // 验证码错误
                if (data.param >= 3) {
                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();

                }
                $("#userTip").text("用户已被禁用");

            }else {
                // 其他异常
                if (data.param >= 3) {
                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }
                layer.msg("系统繁忙 , 请稍后再试");
            }
        },
        error:function (err) {
            console.log(err);
        },
        complete:function () {
            LOGIN_AJAX_FLAG = true;
        }
    })

}

/**
 * 获取并处理登录表单的方法
 * @returns {{}}
 */
function getFormData(){

    var data = {};
    data.mobile = $("#user").val();
    data.password = $.md5($("#pwd").val());
    
    if ($("#imgBox").data("includeImg") === 1) {
        data.validateCode =  $("#imgVertify").val();
    }

    return data;
}

/**
 * 验证码点击事件触发（更新验证码）
 * @param $this
 */
function updateValidateImg ($this) {

    if ($this === undefined) {
        $("#vertifyImg").attr("src", BASE_URL + "/user/validateCode?_=" + new Date().getTime());
    }
    $this = $($this);
    $this.attr("src", BASE_URL + "/user/validateCode?_=" + new Date().getTime());

}

/**
 * * 记住密码初始化操作
 * @returns {boolean}
 */
function getRememberPwd () {

    var rememberCode = localStorage.getItem("REMEMBER");

    if (rememberCode) {

        rememberCode = rememberCode.split("rr&and&lab");
        $("#rememberBtn").prop("checked", true);
        $("#user").val(rememberCode[0]);
        $("#pwd").val(rememberCode[1]);
       $("#user").next().text("");
       $("#pwd").next().text("");
        // 处理时间
        if(rememberCode[2] ){

        }
        return false;

    }

    $("#user").val("");
    $("#pwd").val("");
    $("#rememberBtn").prop("checked", false);
    return false;
}

/**
 * 记住密码设置操作
 */
function setRememberPwd (){

    if($("#rememberBtn").prop("checked")) {

        IS_MEMORY = true;
    }else {
        IS_MEMORY = false;
    }

    if(IS_MEMORY){
        localStorage.setItem("REMEMBER",$("#user").val() + "rr&and&lab" + $("#pwd").val() + "rr&and&lab" +  new Date().getTime());
    }else {
        localStorage.setItem("REMEMBER", "");
    }

}

/**
 * 微信登录事件触发函数（工厂函数）
 *
 */
function wechatLogin($this) {

}
function showCheckesModal() {
    $("#loginMain").hide();
    // var html =
    //     '<div class="checkboxs">' +
    //     '<div class="lft" onclick="toFrontHome();"><img src=""/><p>人人实验平台</p></div>'+
    //     '<div class="rt"  onclick="toBgHome();"><img src=""/><p>后台管理系统</p></div>'+
    //     '<span>o&nbsp;<i class="r">r</i></span>'
    // '</div>';
    var html =
        '<div class="checkboxs">' +
            '<img id="frontBtn" class="lft"  src="'+ BASE_URL +'/front/imgs/o.png" alt="">'+
            '<img id="bgBtn" class="rt" src="'+ BASE_URL +'/front/imgs/r.png" alt="">' +
    '</div>';

    // 页面层-自定义
    layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shade: 0,
        shadeClose: false,
        skin: 'choose_modal',
        content: html
    })

    $("#frontBtn").off("mouseleave").on("mouseleave", function () {
        $(".choose_modal").css({
            boxShadow:'-10px 2px 30px rgba(0,0,0,.0)'
        })
    })

    $("#frontBtn").off("mouseenter").on("mouseenter", function () {
        $(".choose_modal").css({
            boxShadow:'-10px 2px 30px rgba(0,0,0,.3)'
        })
    })

    $("#bgBtn").off("mouseleave").on("mouseleave", function () {
        $(".choose_modal").css({
            boxShadow:'10px 2px 30px rgba(0,0,0,.0)'
        })
    })

    $("#bgBtn").off("mouseenter").on("mouseenter", function () {
        $(".choose_modal").css({
            boxShadow:'10px 2px 30px rgba(0,0,0,.3)'
        })
    })

    $("#frontBtn").off("click").on("click",function () {
        toFrontHome();
    });

    $("#bgBtn").off("click").on("click",function () {
        toBgHome();
    })
}
/**
 * 跳转用户端页面
 */
function toFrontHome() {

    setRememberPwd();
    // 成功后调整回调
    var callBackURL = sessionStorage.getItem("labcallBackURL");
    if(!callBackURL) {
        location.href = BASE_URL;
    } else {
        location.href = callBackURL;
    }

}
/**
 * 跳转管理端界面
 */
function toBgHome() {
    location.href = BASE_URL + "/bg/home/toHome";
}