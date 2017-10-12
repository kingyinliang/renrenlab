/**
 * Created by kingyinliang 2017/6/16 0016.
 */

/**
 * 破华为
 */
//判断数组中是否包含某字符串
Array.prototype.contains = function(needle) {
    for (i in this) {
        if (this[i].indexOf(needle) > 0)
            return i;
    }
    return -1;
}

var device_type = navigator.userAgent;//获取userAgent信息
var md = new MobileDetect(device_type);//初始化mobile-detect
var os = md.os();//获取系统
var model = "";
if (os == "iOS") {//ios系统的处理
    os = md.os() + md.version("iPhone");
    model = md.mobile();
} else if (os == "AndroidOS") {//Android系统的处理
    os = md.os() + md.version("Android");
    var sss = device_type.split(";");
    var i = sss.contains("Build/");
    if (i > -1) {
        model = sss[i].substring(0, sss[i].indexOf("Build/"));
    }
}
var mobilebrand=model.split("");
if (mobilebrand[1]=="H"){
    $("#main").css("height","125%");
    $("#codes").css("top","35%");
}

/**
 * 分割线
 */
var flagUser = 1;// 标记当前输入框状态，1代表为空，2，代表请输入正确手机号。 0 ，代表验证正确
var flagPwd = 1; // 标记密码输入框，1代表为空，2，代表格式错误，0代表正确
var flagCoder=1;// 标记code输入框，0代表错误，1代表正确
$("#user").on("blur", function () {
    validatePhone();
})
$("#user").on("input", function () {
    validatePhone();
    if ($(this).val().length==11) {
       validatePhone();
    }else {
        clearPhone();
        disableBtn($("#code"));
    }
})
$("#user").on("focus", function () {
    clearPhone();
})

$("#pwd").on("blur", function () {
    validatePassword();
})

$("#pwd").on("input", function (){
    validatePassword();
    if (flagPwd==0){
        clearPassword();
    }
})

$("#pwd").on("focus", function () {
    clearPassword();
})
$("#pwdcode").on("focus", function () {
    clearCode();
})
function disableBtn($this) {
    $this.attr({"disabled": "disabled"}).addClass("disable");
}

function setTip($this, text){
    $this.text(text);
}
function enableBtn($this) {

    if(!$this){
        $("#go").attr({"disabled": "disabled"}).addClass("disable");
        if (flagPwd == 0 && flagUser == 0 && $("#pwdcode").val().length==6) {
            $("#go").removeAttr("disabled").removeClass("disable");
        }

    } else {
        $this.removeAttr("disabled").removeClass("disable");
    }

}
function enableBtncode($this) {

    if(!$this){
        $("#code").attr({"disabled": "disabled"}).addClass("disable");
        if (flagUser == 0) {
            $("#code").removeAttr("disabled").removeClass("disable");
        }

    } else {
        $this.removeAttr("disabled").removeClass("disable");
    }

}
//phone
function validatePhone() {

    var userName = $("#user").val();
    var regPhone = /^0?(10|13|15|18|14|17)[0-9]{9}$/;

    if (userName === "") {
        flagUser = 1;
        setTip($("#userTip"),"手机号不能为空")
        enableBtn();
        return false;
        $("#code").attr({"disabled": "disabled"}).addClass("disable");
    }

    if (!regPhone.test(userName)) {

        flagUser = 2;// 置状态
        setTip($("#userTip"), "请输入正确的手机号");// 设提示
        disableBtn($("#go"));

    } else if(regPhone.test(userName)){

        flagUser = 0;
        enableBtn();


    }
    if(flagUser==0){
        if (flagCoder==1) {
            $("#code").removeAttr("disabled").removeClass("disable");
        }
    }else {
        $("#code").attr({"disabled": "disabled"}).addClass("disable");
    }
}
function clearPhone() {

    setTip($("#userTip"), "");
    // enableBtn($("#getMsg"));
    enableBtn();
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
        setTip($("#pwdInfo"), "6~20位之间，需包含数字和英文字母");
        disableBtn($("#go"));

    } else {

        flagPwd = 0;
        enableBtn();

    }

}
function clearPassword() {

    setTip($("#pwdInfo"), "");
    enableBtn();

}
function clearCode() {

    setTip($("#codeError"), "");
    // enableBtn($("#getMsg"));
    enableBtn();
}
//code img
function updateValidateImg () {

    $("#codeImg").attr("src",BASE_URL + "/front/user/validateCode?_=" + new Date().getTime());

}
//计数
function countTime(){

    disableBtn($("#code"));
    $("#code").text("重新发送 " + 60);
    var i = 59;
    var interval = setInterval(function () {

        if (i > 0) {
            flagCoder=0;
            $("#code").text("重新发送 " + i + "");
            i--;

        } else {
            flagCoder=1;
            clearInterval(interval);
            $("#code").text("重新发送");
            enableBtncode();
        }
    }, 1000);

}

//短信验证码
function todoGetNodeCode(){
    var imgVal = $("#codeimgInp").val();
    // 获取短信校验码
    // code:0 成功
    // 1004 账户名已存在
    // 1005 图形验证码错误
    // 1007 手机验证码发送太频繁
    // 1008 验证码发送异常
    var formData = {
        mobile:$("#user").val(),
        validateCode:$("#codeimgInp").val()
    }
    $.ajax({
        url: BASE_URL + "/front/user/sendVerifyCode",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success:function (data) {

            if (data.code === 0) {
                countTime();// 计数
                $("#codes").hide();
                mask.close();
            } else if (data.code === 1005) {
                // 图形验证码错误
                setTip($("#imgInfo"),"图形验证码不正确");
                $("#codeimgInp").val("");
                updateValidateImg();

            } else if (data.code === 1007) {
                // 手机验证码发送太频繁
                setTip($("#imgInfo"),"短信验证码发送频繁");

            } else if (data.code === 1008) {
                mui.toast("网络繁忙，请重新操作");
                // setTip($("#verifyInfo"),"验证码发送失败，请重新操作");
                // 手机验证码发送失败

            } else if (data.code === 1009) {
                setTip($("#imgInfo"),"该手机号今日获取短信验证次数已达上限");
            } else {
                mui.toast("网络繁忙，请稍后再试");
            }

        },
        error:function () {
            mui.toast("网络繁忙，请稍后再试");
        }
    })
}
//注册
function register() {

    setTip($("#userTip"),"");
    setTip($("#pwdInfo"),"");
    setTip($("#codeError"),"");


    if ( flagUser === 1 ) {
        setTip($("#userTip"),"手机号不能为空")
    }

    if ( flagPwd === 1 ) {
        setTip($("#pwdInfo"),"密码不能为空")
    }


    if($("#pwdcode").val().length != 6) {
        setTip($("#codeError"), "请输入有效的验证码");
    }


    if ( flagPwd === 0 && flagUser === 0 && $("#pwdcode").val().length == 6) {
        if (pageName==2){
            doRegister();
        }else {
            findPaw();
        }

    }
}
function doRegister(){

    var formData = {
        mobile:$("#user").val(),
        password:$.md5($("#pwd").val()),
        confirmPassword:$.md5($("#pwd").val()),
        verifyCode:$("#pwdcode").val()
    }

    $.ajax({
        url:BASE_URL + "/front/user/register",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success:function (data) {

            if (data.code == 0) {
                // [#maidian] m站注册埋点
                _dgt.push(['trackEvent', 'sign_up',['d_uid'], [formData.mobile]]);
                // var callBackURL = sessionStorage.getItem("labcallBackURL");
                var callBackURL = getCallbackURL();
                if(!callBackURL) {
                    location.href = BASE_URL +  "/page/home?curURI=" +  encodeURI(URL_CUR_CITY ) ;
                } else {
                    // location.href = callBackURL + "?curURI=" + encodeURI(URL_CUR_CITY );
                    location.href = callBackURL;
                }

            } else if (data.code === 1004) {
                // 用户已存在
                setTip($("#userTip"),"该手机号已经注册");

            } else if(data.code === 1015){
                setTip($("#userTip"),"该手机号已经注册，若您忘记密码请重置密码");

            }else if (data.code === 1006) {
                //  短信验证码输入错误
                setTip($("#codeError"), "短信验证码输入错误");

            }else if (data.code === 1016) {
                //  短信验证码输入错误
                setTip($("#codeError"), "验证码已过期，请重新获取");

            }  else {
                mui.toast("网络繁忙，请稍后再试");
            }
        },
        error:function () {
            mui.toast("网络繁忙，请稍后再试");
        }

    })
}
//找回密码
function findPaw(){

    var formData = {
        mobile:$("#user").val(),
        password:$.md5($("#pwd").val()),
        confirmPassword:$.md5($("#pwd").val()),
        verifyCode:$("#pwdcode").val()
    }

    $.ajax({
        url: BASE_URL + "/front/user/reset",
        type: 'put',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success:function (data) {

            if (data.code == 0) {
                // todo:登录成功，跳转回调页面
                location.href = BASE_URL + '/front/user/login?curURI=' +  encodeURI(URL_CUR_CITY ) ;
            } else if (data.code === 1006) {

                // todo:登录失败，短信验证码错误
                setTip($("#codeError"), "短信验证码输入错误");
            } else if (data.code === 1002) {
                // todo:该手机号已注册
                setTip($("#userTip"), "该用户不存在");
            } else {
                // todo:其他情况

            }

        },
        error:function () {
            setTip($("#imgInfo"),"图文验证码输入不正确");
        }

    })
}

//验证码登陆
function doNoteLogin(){

    var formData = {
        mobile:$("#user").val(),
        verifyCode:$("#pwdcode").val()
    }

    $.ajax({
        url:BASE_URL + "/front/user/text/login",
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        data: JSON.stringify(formData),
        success:function (data) {

            if (data.code == 0) {
                // [#maidian] m站登录埋点
                _dgt.push(['trackEvent', 'login',['d_uid'], [formData.mobile]]);

                // var callBackURL = sessionStorage.getItem("labcallBackURL");
                var callBackURL = getCallbackURL();
                if(!callBackURL) {
                    location.href = BASE_URL +  "/page/home?curURI=" +  encodeURI(URL_CUR_CITY ) ;
                } else {
                    // location.href = callBackURL + "?curURI=" + encodeURI(URL_CUR_CITY );
                    location.href = callBackURL;
                }


            } else if(data.code === 1002 ) {
                // 用户名密码错误
                $("#userTip").text("用户名不存在");

            }else if(data.code === 1017 ) {
                // 用户名密码错误
                $("#userTip").text("用户已被禁用");

            }else if(data.code === 1006){
                // 验证码错误
                $("#codeError").text("验证码输入不正确")

            }else if(data.code === 1016){
                // 验证码错误
                $("#codeError").text("验证码过期")

            }else {
                // 其他异常
                mui.toast("网络繁忙，请稍后再试");
            }
        },
        error:function () {
            mui.toast("网络繁忙，请稍后再试");
        }
    })
}
function goBack() {
    window.history.back();
}
