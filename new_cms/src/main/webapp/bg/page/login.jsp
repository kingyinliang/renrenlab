<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object csId = request.getSession().getAttribute("csId");
    if (csId != null) {
        response.sendRedirect("./home.html");
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>人人实验，客服平台，登录</title>
    <link rel="shortcut icon" href="../imgs/icon/favicon.png" type="image/x-icon">
    <script src="../assets/jquery-2.1.1/jquery.min.js"></script>
    <script src="../assets/md5.js"></script>

    <style>
        * {
            box-sizing: border-box;
            padding: 0;
            margin: 0;
        }

        body,
        html {
            height: 100%;
            width: 100%;
        }

        .login_cont {
            height: 100%;
            width: 100%;
            background: pink;
        }

        /*上半部分*/

        .login_cont .top {
            height: 55%;
            background: #2ab5dd;
            text-align: center;
        }

        .login_cont .top .realitive {
            position: relative;
            bottom: -300px;
        }

        .login_cont .top span {
            font-size: 30px;
            font-family: '微软雅黑';
            color: #fff;
        }

        /*下半部分*/

        .login_cont .btm {
            height: 45%;
            background: #555;
            overflow: hidden;
        }

        .login_cont .btm .login_form {
            margin-top: 100px;
        }

        .login_cont .login_form form {
            margin: 0 auto;
            width: 260px;
        }

        /*自定义*/

        .login_form {
        }

        .login_form input {
            width: 188px;
            height: 36px;
            outline: none;
            border: 0 none;
            border: 1px solid #eee;
            margin-bottom: 20px;
            padding-left: 15px;
            color: #333;
        }

        .login_form button {
            width: 188px;
            height: 36px;
            border: 0 none;
            outline: none;
            cursor: pointer;
            color: #fff;
        }
    </style>
</head>

<body>
<div class="login_cont">
    <div class="top"><span class="realitive">人人实验运营客服管理平台</span></div>
    <div class="btm login_form">
        <div class="login_form" style="padding-top: 75px;width: 200px;margin: 0 auto;">
            <input id="userName" type="text" name="title" required lay-verify="required" placeholder="用户手机号"
                   autocomplete="off">
            <input id="pwd" type="password" name="password" required lay-verify="required" placeholder="密码"
                   autocomplete="off">
            <button id="loginBtn" style="background: #2fcba8">登&nbsp;&nbsp;&nbsp;录</button>
        </div>
    </div>
</div>
<script>
    <%--$("document body").on("keyup", function(e) {--%>
    <%--if (e.which == 13) {--%>
    <%--alert(1)--%>
    <%--$("#loginBtn").trigger("click");--%>
    <%--}--%>
    <%--});--%>
    //监听提交
    $("#loginBtn").on("click", function () {
        if ($('#pwd').val().length < 5) {
            alert("请输入合法密码")
            return;
        }
        var url = "../api/cs/login.do";
        var params = {
            uName: $("#userName").val(),
            uPassword: $.md5($('#pwd').val())
        }
        $.ajax({
            type: "POST",
            headers: {
                "Content-Type": "application/json;charset=UTF-8"
            },
            url: url,
            data: JSON.stringify(params),
            success: function (data) {
                <%--alert("请求成功");--%>
                <%--alert(data);--%>
                if (data.code == 0) {

                    var waiterInfoStr = JSON.stringify(data.payload);
                    try {

                        localStorage.setItem("waiterInfo", waiterInfoStr);
                        location.href = "/bg/page/home.html";

                    } catch (e) {

                        console.log("客服信息"); //错误信息
                        console.log("storageFaild: " + e); //错误信息
                    }

                } else if(data.code == 1005) {
                    alert("用户名与密码不匹配")
                } else if(data.code == 1004) {
                    alert("用户不存在")
                }
            }
        })
    })
</script>
</body>

</html>