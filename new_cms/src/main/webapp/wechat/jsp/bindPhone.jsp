<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<head>
<%@ include file="/common/taglibs.jsp"%>
    <meta charset="UTF-8">
    <title>${action eq 1? "重置密码":"绑定手机"}</title>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="${cms}/wechat/scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
    <!--<script src="./layer/layer.js" type="text/javascript"></script>-->
    <link rel="stylesheet" href="${cms}/wechat/css/bindPhone.css?_20170424">
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
                <div
                     style="position: absolute; height: 1.17333rem; width: 1.17333rem; right: 0rem; top: 0.05rem;"><img
                        id="close" src="${cms}/wechat/img/close.png" style="width: 0.4rem; height: 0.4rem;"></div>
            </div>
            <div class="code_img"><img id="imageCode" src="${cms}/action/validetImg?id=1"></div>
            <div id="altMsg" style="display:none;color:red;margin:0.1rem"><span></span></div>
            <div class="text">看不清,点击图片刷新</div>
            <div class="code_input"><input id="imageCodeInput" maxlength="4" type="text" name="imgCode"></div>

        </div>
    </div>
</div>
<!--遮照-->
<div class="xq_modal_back"></div>
    <div style="position: relative">
        <div class="bind_head">
            <p class="title">${action eq 1? "重置密码":"验证手机号"}</p>
            <p class="text">验证注册完手机号不仅可以同验小花咨询，还能直接登录官网哦~</p>
        </div>

        <div class="bind_input">
            <div class="phone_number">
                <i class="lab-phone text"></i>
                <input id="phoneInput" type="number" name="phone" pattern="[0-9]*" placeholder="手机号" style="width: 76%;font-size: 0.35rem">
                
            </div>
            <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>

            <div class="phone_password">
                <i class="text lab-lock"></i>
                <input id="password"  type="password" placeholder="密码（6~20位 非纯数字/纯字母/空格）" style="width: 76%;font-size: 0.35rem" style="width: 65%;"  maxlength="20" name="code">
            </div>
            <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>
            
            <div class="confirm_password">
                <i  class="text lab-lock"></i>
                <input id="confirmPassword"  type="password" name="code" placeholder="请再次输入密码" style="width: 76%;font-size: 0.35rem">
            </div>
            <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc" on></div>
            
            <div class="phone_code">
                <i  class="text lab-im"></i>
                <input id="messagePasscode" maxlength="6" type="number" name="code" pattern="[0-9]*" placeholder="请输入验证码" style="font-size: 0.35rem">
                <button id="passcodeButton" class="button" disabled>获取验证码</button>
            </div>
            
            <div style="margin-top: 5px; margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>



            <div class="login">
                <button id="loginButton" class="button" disabled>确 认</button>
                <a ></a>
            </div>
        </div>
    </div>
    <script>
   
        <!--点击图片切换验证码-->
        $("#imageCode").on("click", function(){
            $("#imageCode").attr('src','${cms}/action/validetImg?id='+Math.random());
        });
        //确认密码验证
        var phone=false;
        var phonepassword=false;
        var phonepasswords=false;
        var phonecodes=false;
        function loginButtonClick(){
//        		console.log(phone+phonepassword+phonecodes+phonepasswords);
        	if (phone&&phonepassword&&phonecodes&&phonepasswords) {
        		$("#loginButton").css("background-color", "#2fcba8");
                $("#loginButton").removeAttr("disabled");
            }else {
                $("#loginButton").attr("disabled");
                $("#loginButton").css("background-color", "#cccccc")
            }
        }
        //确认密码验证
        $("#confirmPassword").on("input",function(){
        	if ($("#password").val()==$(this).val()) {
        		phonepassword=true;
        	}else{
        		phonepassword=false;
        	}
        	loginButtonClick();
        })
        $("#confirmPassword").on("blur",function(){
            if ($("#password").val()==$(this).val()) {

            }else{
                alert("两次密码不一致");
            }
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
        /* 手机验证 */
        $("#loginButton").on("click", function () {
        	if ($("#password").val()!=$("#confirmPassword").val()) {
            	alert("两次密码不一致");
        		return false;	
        	}
        var action = ${action};
            $("#loginButton").attr("disabled", "true");
        //验证ajax开始
        var data = {
                phone:$('#phoneInput').val(),
                validateCode: $('#messagePasscode').val(),
                password: $.md5($("#password").val()),
                action:action
            }
        $.ajax({
                url: '${cms}/wx/user/wxBindPhone.do?token=' + new Date().getTime(),
                type: 'POST',
                dataType: "json",
                async: false,
                contentType:"application/json",
                data:JSON.stringify(data)
        })
        .done(function(data){
            if (data.code == 0) {
                //关闭页面
                WeixinJSBridge.call('closeWindow');
            } else if (data.code == 1) {
                window.location.href = '${cms}/wx/activity/ticketsList.do'
            } else {
                console.log(data.description);
                alert("验证失败");
            }
            $("#loginButton").attr("disabled", "false");
        })
        .fail(function(data){
             console.log(data.description);
            alert("验证失败");
            $("#loginButton").attr("disabled", "false");
            })
           //验证ajax结束
        });
            //图片验证获取焦点事件
            $("#imageCodeInput").focus(function(){
               $("#altMsg").css("display","none");
            });
            //短信验证输入框焦点事件
           $("#messagePasscode").focus(function(){
               $("#codMsg").css("display","none");
            });
            
           
            
        //监听图片验证码输入
        $("#imageCodeInput").on("input", function(){
        	// alert($(this).val().length);
            $("#altMsg").css("display","none");
            if ($(this).val().length == 4){
            	
            	//ajax请求开始
                 var data={
                    phone:$('#phoneInput').val(),
                    action:0,
                    validateCode: $('#imageCodeInput').val()
                }
            	var flag = true;
            	// if(flag){
            		   $.ajax({
                           url: '${cms}/wx/user/verifyCode.do?mv_=' + new Date().getTime(),
                           type: 'POST',
                           dataType: "json",
                           aysnc:false,
                           contentType: "application/json",
                           data:JSON.stringify(data)
                       })
                       .done(function(data){
                       	
                           // alert('成功回调data.code' + data.code);
                           
          					
	                        if(data.code === 0){
		
		                        var passcodeButton = $("#passcodeButton");
		                        passcodeButton.attr("disabled", "");
		                        passcodeButton.attr("style", "background-color: #cccccc");
		                        $("#phoneInput").unbind("input");
		                        $("#imageCodeInput").val("");
		                        var i=60;
		                        var interval=setInterval(function () {
		                        	
		                            if(i>0){
		                                passcodeButton.text("已发送 ("+i+")");
		                                i--;
		                            }else{
		                                clearInterval(interval);
		                                $("#phoneInput").bind("input", function(){
		                                    if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
		                                        $("#passcodeButton").removeAttr("disabled");
		                                        $("#passcodeButton").attr("style", "background-color: orange");
		                                    }else {
		                                        $("#passcodeButton").attr("disabled");
		                                        $("#passcodeButton").attr("style", "background-color: #cccccc");
		                                    }
		                                });
		                                if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
		                                    passcodeButton.removeAttr("disabled");
		                                    passcodeButton.attr("style", "background-color: orange");
		                                }
		                                passcodeButton.removeClass('disabled').text("获取验证码");
		                            }
		                            
		                        },1000);
		                        $(".xq_modal").css("display","none").animate({opacity:0},50,"swing").next(".xq_modal_back").css("display","none").animate({opacity:0},50,"swing");
		                        $("body").css({"overflow":"visible","padding-right":0});
		                        $(".xq_modal_contant").animate({height:0},0,"swing");
	                        }//成功if结束
	                        else{
	                        	
		                        $("#altMsg").css("display","block");
		                        if(data.payload == "验证码太频繁"){
		                        	var passcodeButton = $("#passcodeButton");
			                        passcodeButton.attr("disabled", "");
			                        passcodeButton.attr("style", "background-color: #cccccc");
			                        $("#phoneInput").unbind("input");
			                        $("#imageCodeInput").val("");
			                        var i=60;
			                        var interval=setInterval(function () {
			                        	
			                            if(i>0){
			                                passcodeButton.text("已发送 ("+i+")");
			                                i--;
			                            }else{
			                                clearInterval(interval);
			                                $("#phoneInput").bind("input", function(){
			                                    if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
			                                        $("#passcodeButton").removeAttr("disabled");
			                                        $("#passcodeButton").attr("style", "background-color: orange");
			                                    }else {
			                                        $("#passcodeButton").attr("disabled");
			                                        $("#passcodeButton").attr("style", "background-color: #cccccc");
			                                    }
			                                });
			                                if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
			                                    passcodeButton.removeAttr("disabled");
			                                    passcodeButton.attr("style", "background-color: orange");
			                                }
			                                passcodeButton.removeClass('disabled').text("获取验证码");
			                            }
			                            
			                        },1000);
			                        $(".xq_modal").css("display","none").animate({opacity:0},50,"swing").next(".xq_modal_back").css("display","none").animate({opacity:0},50,"swing");
			                        $("body").css({"overflow":"visible","padding-right":0});
			                        $(".xq_modal_contant").animate({height:0},0,"swing");
			                        return;
		                        }
		                        if (data.payload != null && data.payload != "") {
		                            $("#altMsg span").text(data.payload);
		                        } else if (data.description != null && data.description != "") {
		                            $("#altMsg span").text(data.description);
		                        } else {
		                            $("#altMsg span").text("系统异常");
		                        }
	                     
	                        }
                       })
                        .fail(function(data) {
                       		
                          // alert('失敗回调data.code' + data.code);
                          
                          $("#altMsg").css("display","block");
                          if(data.payload == "验证码太频繁"){
                        	  var passcodeButton = $("#passcodeButton");
		                        passcodeButton.attr("disabled", "");
		                        passcodeButton.attr("style", "background-color: #cccccc");
		                        $("#phoneInput").unbind("input");
		                        $("#imageCodeInput").val("");
		                        var i=60;
		                        var interval=setInterval(function () {
		                        	
		                            if(i>0){
		                                passcodeButton.text("已发送 ("+i+")");
		                                i--;
		                            }else{
		                                clearInterval(interval);
		                                $("#phoneInput").bind("input", function(){
		                                    if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
		                                        $("#passcodeButton").removeAttr("disabled");
		                                        $("#passcodeButton").attr("style", "background-color: orange");
		                                    }else {
		                                        $("#passcodeButton").attr("disabled");
		                                        $("#passcodeButton").attr("style", "background-color: #cccccc");
		                                    }
		                                });
		                                if (/^1[3|4|5|7|8]\d{9}$/.test($("#phoneInput").val())) {
		                                    passcodeButton.removeAttr("disabled");
		                                    passcodeButton.attr("style", "background-color: orange");
		                                }
		                                passcodeButton.removeClass('disabled').text("获取验证码");
		                            }
		                            
		                        },1000);
		                        $(".xq_modal").css("display","none").animate({opacity:0},50,"swing").next(".xq_modal_back").css("display","none").animate({opacity:0},50,"swing");
		                        $("body").css({"overflow":"visible","padding-right":0});
		                        $(".xq_modal_contant").animate({height:0},0,"swing");
		                        return;
	                        }
                          if (data.payload != null && data.payload != "") {
                              $("#altMsg span").text(data.payload);
                          } else if (data.description != null && data.description != "") {
                              $("#altMsg span").text(data.description);
                          } else {
                              $("#altMsg span").text("系统异常");
                          }
                          
                       });
            		
            	//}
             
            //ajax请求结束
            }
        });
//        监听短信验证码输入
        $("#messagePasscode").on("input", function(){

           if ($(this).val().length == 6){
               phonecodes=true;
           }else {
               phonecodes=false;
           }
            loginButtonClick();
        });
//        监听手机号输入
        $("#phoneInput").on("input", function(){
            if((/^1[3|4|5|7|8]\d{9}$/.test($(this).val()))){
            	phone=true;
                $("#passcodeButton").removeAttr("disabled");
                $("#passcodeButton").attr("style", "background-color: orange");
            }else {
            	phone=false;
                $("#passcodeButton").attr("disabled");
                $("#passcodeButton").attr("style", "background-color: #cccccc");
            }
            loginButtonClick();
        });
//        点击获取验证码
        $("#passcodeButton").on("click", function(){
//            var $_this = $(this);
//            $_this.attr("disabled", "");
//            $_this.attr("style", "background-color: #cccccc");
			$("#altMsg").hide();
			$("#imageCode").attr('src','${cms}/action/validetImg?id='+Math.random());
            $("#phoneInput").trigger("keydown");
            $(".xq_modal").css("display","block").animate({opacity:1},170,"swing").next(".xq_modal_back").css("display","block").animate({opacity:.5},170,"swing");
            $("body").css({"overflow":"hidden"});
            $(".xq_modal_contant").css("display","block").animate({height:'6rem'},170,"swing");
//            var i=60;
//            var interval=setInterval(function () {
//                if(i>0){
//                    $_this.text("已发送 ("+i+")");
//                    i--;
//                }else{
//                    clearInterval(interval);
//                    $_this.removeClass('disabled').text("获取验证码");
//                    $_this.removeAttr("disabled");
//                    $_this.attr("style", "background-color: orange");
//                }
//            },1000);
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