<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<head>
    <%@ include file="/common/taglibs.jsp"%>
    <meta charset="UTF-8">
    <title>领取创新券</title>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="${cms}/wechat/scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${cms}/wechat/css/getTicket.css">
    <meta name="flexible" content="initial-dpr=2,maximum-dpr=3" />
    <script src="${cms}/bg/assets/md5.js"></script>
</head>
<body>
<div class="xq_modal">
    <div class="xq_modal_contant">
        <!--弹窗内容替换掉    -->
        <div class="xq_modal_main alert">
            <div class="title" style="position: relative">
                请输入图中验证码
                <div id="close" style="position: absolute; height: 1rem; width: 1rem; right: 0rem; top: 0rem;"><i class="lab-close-1"></i></div>
            </div>
            <div class="code_img"><img id="imageCode" src="${cms}/action/validetImg?id=1"></div>
            <div id="altMsg" style="display:none;color:red;margin:0.1rem"><span></span></div>
            <div class="text">看不清,点击图片刷新</div>
            <div class="code_input"><input id="imageCodeInput" placeholder="请输入验证码" maxlength="4" type="text" name="imgCode"></div>
        </div>
    </div>
</div>
<!--遮照-->
<div class="xq_modal_back"></div>


<div style="position: relative">
    <div class="bind_head">
        <img src="${cms}/wechat/img/ticketTitle.png">
    </div>

    <div class="bind_input">
        <div class="phone_number">
            <!--<p id="phoneIcon" class="text">手机号</p>-->
            <i class="lab-phone text"></i>
            <input id="phoneInput" placeholder="请输入手机号" type="number" name="phone" pattern="[0-9]*">
            
        </div>
        <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>
		
		<div class="phone_password">
            <!--<p id="codeIcon" class="text">验证码</p>-->
            <i class="text lab-lock"></i>
            <input id="password" placeholder="密码（6~20位 非纯数字/纯字母/空格）" maxlength="20" type="password" name="" style="width: 80%;">
        </div>
        <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>
        
        <div class="confirm_password">
            <!--<p id="codeIcon" class="text">验证码</p>-->
            <i  class="text lab-lock"></i>
            <input id="confirmPassword" placeholder="请再次输入密码" maxlength="20" type="password" name="" style="width: 80%;">
        </div>
        <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>
        
        <div class="phone_code">
            <!--<p id="codeIcon" class="text">验证码</p>-->
            <i  class="text lab-im"></i>
            <input id="messagePasscode" placeholder="请输入验证码" maxlength="6" type="text" name="code" pattern="[0-9]*">
            <button id="passcodeButton" class="button" disabled>获取验证码</button>
        </div>
        <!--<div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>-->

        <div class="login">
            <button id="loginButton" class="button" disabled>领取优惠券</button>
            <p>点击领取,表示已阅读并同意<a href="./rules.html" style="color: #32a0ff">《大学生创新券条款》</a></p>
        </div>
    </div>
</div>
<script>

    <!--点击图片切换验证码-->
    $("#imageCode").on("click", function () {
        $("#imageCode").attr('src', '${cms}/action/validetImg?id=' + Math.random());
    });

    $("#loginButton").on("click", function () {
        if ($("#password").val()!=$("#confirmPassword").val()) {
            alert("两次密码不一致");
            return false;
        }
        var data = {
            phone: $('#phoneInput').val(),
            validateCode: $('#messagePasscode').val(),
            password: $.md5($("#password").val())
        }
        $("#loginButton").attr("disabled", "true");
        $.ajax({
            url: '${cms}/wx/activity/bindPhone.do',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            async:false,
            data: JSON.stringify(data)
        })
            .done(function (data) {
                if (data.code == 0) {
                    /* WeixinJSBridge.call('closeWindow'); */
                	window.location.href='${cms}/wx/activity/ticketsList.do';
                } else {
                    /* $("#codMsg").css("display", "block"); */
                    alert("验证失败");
                }
                $("#loginButton").attr("disabled", "false");
            })
            .fail(function (data) {
                alert("验证失败");
                $("#loginButton").attr("disabled", "false");
            });
    });
	
	//确认密码验证
    var phone=false;
    var phonepassword=false;
    var phonepasswords=false;
    var phonecodes=false;
    function loginButtonClick(){
    	console.log(phone+phonepasswords+phonepassword+phonecodes);
    	if (phone&&phonepassword&&phonecodes&&phonepasswords) {
    		$("#loginButton").css("background-color", "#2fcba8");
            $("#loginButton").removeAttr("disabled");
        }else {
            $("#loginButton").attr("disabled",true);
            $("#loginButton").css("background-color", "#cccccc")
        }
    }
    //确认密码验证
    $("#confirmPassword").on("blur",function(){
        if ($("#password").val()==$(this).val()) {

        }else{
            alert("两次密码不一致");
        }
    })
    $("#confirmPassword").on("input",function(){
    	if ($("#password").val()==$(this).val()) {
    		phonepassword=true;
    	}else{
    		phonepassword=false;
    	}
    	loginButtonClick();
    })
    //密码验证
    $("#password").on("blur",function(){
        if((/^(?=.*[a-zA-z])(?=.*[0-9])([a-zA-z0-9\x21-\x7e]{6,20})$/.test($(this).val()))){

        }else {
            alert("密码输入有误");
        }
    })
    $("#password").on("input",function(){
    	if((/^(?=.*[a-zA-z])(?=.*[0-9])([a-zA-z0-9\x21-\x7e]{6,20})$/.test($(this).val()))){
            phonepasswords=true;
        }else {
            phonepasswords=false;
        }
        loginButtonClick();
    })
	
    //图片验证获取焦点事件
    $("#imageCodeInput").focus(function(){
        $("#altMsg").css("display","none");
    });
    //短信验证输入框焦点事件
    $("#messagePasscode").focus(function(){
        $("#codMsg").css("display","none");
    });

    //        监听图片验证码输入
    $("#imageCodeInput").on("input", function () {
        console.log($(this).val().length);
        if ($(this).val().length == 4) {
            var data={
                phone:$('#phoneInput').val(),
                action:0,
                validateCode: $('#imageCodeInput').val()
            }
            $.ajax({
                url: '${cms}/wx/user/verifyCode.do?mv_=' + new Date().getTime(),
                type: 'POST',
                dataType: "json",
                aysnc:false,
                contentType: "application/json",
                data: JSON.stringify(data)
            })
                .done(function (data) {
                    if(data.code == 0) {
                        console.log("pass");
                        var passcodeButton = $("#passcodeButton");
                        passcodeButton.attr("disabled", "");
                        passcodeButton.css("color", "#999999");
                        $("#phoneInput").unbind("input");
                        $("#imageCodeInput").val("");
                        var i = 60;
                        var interval = setInterval(function () {
                            if (i > 0) {
                                passcodeButton.text("已发送 (" + i + ")");
                                i--;
                            } else {
                                clearInterval(interval);
                                $("#phoneInput").bind("input", function(){
                                    if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
                                        $("#passcodeButton").removeAttr("disabled");
                                        $("#passcodeButton").attr("style", "color: #fc5360");
                                    }else {
                                        $("#passcodeButton").attr("disabled");
                                        $("#passcodeButton").attr("style", "color: #999999");
                                    }
                                });
                                passcodeButton.removeClass('disabled').text("获取验证码");
                                if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
                                    passcodeButton.removeAttr("disabled");
                                    passcodeButton.css("color", "#fc5360");
                                }
                            }
                        }, 1000);

                        $(".xq_modal").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
                        $("body").css({"overflow": "visible", "padding-right": 0});
                        $(".xq_modal_contant").animate({height: 0}, 0, "swing");
                    } else {
                        $("#altMsg").css("display","block");
                        if(data.payload == "验证码太频繁"){
                        	console.log("pass");
                            var passcodeButton = $("#passcodeButton");
                            passcodeButton.attr("disabled", "");
                            passcodeButton.css("color", "#999999");
                            $("#phoneInput").unbind("input");
                            $("#imageCodeInput").val("");
                            var i = 60;
                            var interval = setInterval(function () {
                                if (i > 0) {
                                    passcodeButton.text("已发送 (" + i + ")");
                                    i--;
                                } else {
                                    clearInterval(interval);
                                    $("#phoneInput").bind("input", function(){
                                        if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
                                            $("#passcodeButton").removeAttr("disabled");
                                            $("#passcodeButton").attr("style", "color: #fc5360");
                                        }else {
                                            $("#passcodeButton").attr("disabled");
                                            $("#passcodeButton").attr("style", "color: #999999");
                                        }
                                    });
                                    passcodeButton.removeClass('disabled').text("获取验证码");
                                    if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
                                        passcodeButton.removeAttr("disabled");
                                        passcodeButton.css("color", "#fc5360");
                                    }
                                }
                            }, 1000);

                            $(".xq_modal").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
                            $("body").css({"overflow": "visible", "padding-right": 0});
                            $(".xq_modal_contant").animate({height: 0}, 0, "swing");
	                        return;
                        }
                        if (data.payload != null && data.payload != "") {
                            $("#altMsg span").text(data.payload);
                        } else if (data.description != null && data.description != "") {
                            $("#altMsg span").text(data.description);
                        } else {
                            $("#altMsg span").text("系统异常");
                        }

                        console.log(data.description);
                    }
                })
                .fail(function (data) {
                    $("#altMsg").css("display","block");
                    if(data.payload == "验证码太频繁"){
                    	console.log("pass");
                        var passcodeButton = $("#passcodeButton");
                        passcodeButton.attr("disabled", "");
                        passcodeButton.css("color", "#999999");
                        $("#phoneInput").unbind("input");
                        $("#imageCodeInput").val("");
                        var i = 60;
                        var interval = setInterval(function () {
                            if (i > 0) {
                                passcodeButton.text("已发送 (" + i + ")");
                                i--;
                            } else {
                                clearInterval(interval);
                                $("#phoneInput").bind("input", function(){
                                    if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
                                        $("#passcodeButton").removeAttr("disabled");
                                        $("#passcodeButton").attr("style", "color: #fc5360");
                                    }else {
                                        $("#passcodeButton").attr("disabled");
                                        $("#passcodeButton").attr("style", "color: #999999");
                                    }
                                });
                                passcodeButton.removeClass('disabled').text("获取验证码");
                                if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
                                    passcodeButton.removeAttr("disabled");
                                    passcodeButton.css("color", "#fc5360");
                                }
                            }
                        }, 1000);

                        $(".xq_modal").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
                        $("body").css({"overflow": "visible", "padding-right": 0});
                        $(".xq_modal_contant").animate({height: 0}, 0, "swing");
                        return;
                    }
                    if (data.payload != null && data.payload != "") {
                        $("#altMsg span").text(data.payload);
                    } else if (data.description != null && data.description != "") {
                        $("#altMsg span").text(data.description);
                    } else {
                        $("#altMsg span").text("系统异常");
                    }
                    console.log(data.description);
                });

        }
    });

    //        监听短信验证码输入
    $("#messagePasscode").on("input", function () {
        if ($(this).val().length == 6 && (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val()))) {
           phonecodes=true;
        } else {
            phonecodes=false;
        }
        loginButtonClick();
    });

    $(".bind_input input").on("focus",function(){
    	$(this).parent().find("i").css("color", "#fc5360");
    })
    $(".bind_input input").on("blur",function(){
    	$(this).parent().find("i").css("color", "#999999");
    })

    //        监听手机号输入
    $("#phoneInput").on("input", function () {
        if ((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))) {
        	phone=true;
            $("#passcodeButton").removeAttr("disabled");
            $("#passcodeButton").attr("style", "color: #fc5360");
        } else {
        	phone=false;
            $("#passcodeButton").attr("disabled",true);
            $("#passcodeButton").attr("style", "color: #999999");
        }
        loginButtonClick();
    });

    $("#phoneInput").on("focus", function () {
        $("#phoneIcon").css("color", "#fc5360");
        $("#codeIcon").css("color", "#999999");
    });

    //        点击获取验证码
    $("#passcodeButton").on("click", function () {
    	$("#imageCode").attr('src','${cms}/action/validetImg?id='+Math.random());
        $("#phoneInput").trigger("keydown");
        $(".xq_modal").css("display", "block").animate({opacity: 1}, 170, "swing").next(".xq_modal_back").css("display", "block").animate({opacity: .5}, 170, "swing");
        $("body").css({"overflow": "hidden"});
        $(".xq_modal_contant").css("display", "block").animate({height: '6rem'}, 170, "swing");
    });

    $("#close").on("click", function () {
        $(".xq_modal").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
        $("body").css({"overflow": "visible", "padding-right": 0});
        $(".xq_modal_contant").animate({height: 0}, 0, "swing");
    });

    $(document).mouseup(function (e) {
        var target_con = $('.xq_modal_contant');
        if (!target_con.is(e.target) && target_con.has(e.target).length === 0) {
            $(".xq_modal").css("display", "none").animate({opacity: 0}, 50, "swing").next(".xq_modal_back").css("display", "none").animate({opacity: 0}, 50, "swing");
            $("body").css({"overflow": "visible", "padding-right": 0});
            $(".xq_modal_contant").animate({height: 0}, 0, "swing");
        }
    });
</script>
</body>
</html>