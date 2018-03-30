/**
 * Created by wangyinliang on 2017/6/13 0013.
 */
var flagUser = 1;// 标记当前输入框状态，1代表为空，2，代表请输入正确手机号。 0 ，代表验证正确
var flagPwd = 1; // 标记密码输入框，1代表为空，2，代表格式错误，0代表正确
// 控制手机号校验
$("#user").on("blur", function () {
    validatePhone();
})

$("#user").on("focus", function () {
    $("#userTip").text("");
    $("#allTip").text("");
})

$("#pwd").on("blur", function (){
    validatePassword();
})
$("#pwd").on("input", function (){
    validatePassword();
    if (flagPwd==0){
        $("#pwdTip").text("");
    }
})

$("#pwd").on("focus", function (){
    $("#allTip").text("");
    $("#pwdTip").text("");
})

$("#imgVertify").on("focus", function (){
    $("#allTip").text("");
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

        $("#go").attr({"disabled":"disabled"}).addClass("disable");
        $("#userTip").text("手机号不能为空");
        flagUser = 1;

    } else if (!regPhone.test(userName)) {

        $("#go").attr({"disabled":"disabled"}).addClass("disable");
        $("#userTip").text("请输入正确的手机号");
        flagUser = 2;

    } else {

        flagUser = 0;
        if(flagPwd === 0 && flagUser === 0) {
            $("#go").removeAttr("disabled").removeClass("disable");//将按钮可用
        }
    }
}
//paw
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
        setTip($("#pwdTip"), "6~20位之间，需包含数字和英文字母");
        disableBtn($("#go"));

    } else {

        flagPwd = 0;
        enableBtn();

    }

}

/**
 * 跳转主页
 */
function toHomePage() {
    window.location.href = BASE_URL + "/page/home"+ "?isback=" + IS_BACK;
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
//登陆函数
function sendLogin() {
    var formData = getFormData();
    $.ajax({
        url: BASE_URL + "/user/login",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success:function (data) {

            if (data.code === 0) {
                // 判断用户权限,普通权限
                // if (data.param === 0) {
                    // [#maidian] m站登录埋点
                    _dgt.push(['trackEvent', 'login',['d_uid'], [formData.mobile]]);
                    // 成功后调整回调
                    // var callBackURL = sessionStorage.getItem("labcallBackURL");
                    var callBackURL = getCallbackURL();

                    if(!callBackURL) {
                        location.href = BASE_URL +  "/page/home?curURI=" +  encodeURI(URL_CUR_CITY ) + "&isback=" + IS_BACK;
                    } else {
                        // location.href = callBackURL + "?curURI=" + encodeURI(URL_CUR_CITY );
                        location.href = callBackURL;
                    }

                /*  } else {

                    location.href = BASE_URL + "/bg/instrument/search?pageNo=1&pageSize=10"
                 }*/

            } else if(data.code === 1002 ) {
                // 用户名密码错误
                if (data.param >= 3) {

                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }
                $("#userTip").text("用户名不存在");

            }else if(data.code === 1017 ) {
                // 用户名密码错误
                if (data.param >= 3) {

                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }
                $("#userTip").text("用户已被禁用");

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

            }else {
                // 其他异常
                if (data.param >= 3) {
                    $("#imgBox").show();
                    $("#imgBox").data("includeImg",1);
                    updateValidateImg();
                }
                mui.toast("系统繁忙 , 请稍后再试");
            }
        },
        error:function (data) {
            mui.toast("系统繁忙 , 请稍后再试");
        }
    })
}
function goBack() {
    window.history.back();
}
function disableBtn($this) {
    $this.attr({"disabled": "disabled"}).addClass("disable");
}

function setTip($this, text){
    $this.text(text);
}
function enableBtn($this) {

    if(!$this){
        $("#go").attr({"disabled": "disabled"}).addClass("disable");
        if (flagPwd == 0 && flagUser == 0) {
            $("#go").removeAttr("disabled").removeClass("disable");
        }

    } else {
        $this.removeAttr("disabled").removeClass("disable");
    }

}
