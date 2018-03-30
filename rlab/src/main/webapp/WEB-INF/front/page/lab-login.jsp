<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2018/3/26
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv=“X-UA-Compatible” content=“chrome=1″/>
    <meta name="renderer" content="webkit">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息,仪器共享"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%--<%@ include file="../../config/shujike.jsp" %>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/base.css?v_=20180319"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png?v_=20171108" type="image/x-icon">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css?v_=20171108">
    <!--<![endif]-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">


    <%--<script src="${rlab}/front/js/common/main.js"></script>--%>
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <style type="text/css">
        body,html{
            width: 100%;
            height: 100%;
        }
        #main{
            width: 100%;
            height: 100%;
        }
        #main .bg{
            width: 100%;
            height: 100%;
        }
        .logo{
            width: 144px;
            height: 38px;
            position: absolute;
            top: 80px;
            left: 100px;
            cursor: pointer;
        }
        .form{
            width: 630px;
            height: 688px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -344px;
            margin-left: -315px;
            border-radius: 5px;
            background: white;
        }
        .form form{
            width: 527px;
            margin: auto;
        }
        .form img{
            width: 100%;
            position: absolute;
        }
        .form p{
            margin: 30px 0 8px 0;
            color: #7e8792;
            font-size: 14px;
        }
        .form p i{
            color: #ff5f73;
        }
        .form input{
            width: 100%;
            height: 43px;
            border: 0;
            background: #f4f7ff;
        }
        .forminp{
            width: 100%;
            height: 43px;
        }
        .sub{
            margin-top: 41px;
            width: 100%;
            height: 47px;
            text-align: center;
            display: block;
            line-height: 47px;
            font-size: 14px;
            color: white;
            background: #588eff;
            cursor: pointer;
        }
        .sub:hover{
            color: white;
        }
    </style>
</head>
<body>
<div id="main">
    <img src="${rlab}/front/imgs/3.0/labloginbg.png" alt="" class="bg">
    <img src="${rlab}/front/imgs/icon/logo-header.png" alt="" class="logo" onclick="gohome()">
    <div class="form">
        <img src="${rlab}/front/imgs/3.0/lablogintop.png" alt="">
        <form class="layui-form">
            <p>所属类型<i>*</i></p>
            <select name="pageSize" lay-verify="" lay-filter="types">
                <option value="10" >企业</option>
                <option value="25" >个人</option>
            </select>
            <p>单位名称<i>*</i></p>
            <input type="text" class="forminp">
            <p>联系人<i>*</i></p>
            <input type="text" class="forminp">
            <p>联系电话<i>*</i></p>
            <input type="text" class="forminp">
            <a class="sub">提交激活</a>
        </form>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js" charset="utf-8"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">
    var types='';
    layui.use(['form'], function () {
        var form = layui.form();

        form.on('select(types)', function (data) {
            types = data.value;
            console.log(types);
        });
    });
</script>
</html>
