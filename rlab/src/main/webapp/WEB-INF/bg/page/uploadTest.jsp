<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../config/taglibs.jsp"%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.js"></script>--%>
    <link rel="stylesheet" href="../css/home.css">
    <link rel="stylesheet" href="../css/base.css">

    <link rel="stylesheet" href="../../common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="../../common/assets/layui/layui.js"></script>
    <script src="../../common/assets/echarts/echarts.js"></script>
    <script src="../../common/assets/echarts/macarons.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="../../common/icomoon/style.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <style>

    </style>
</head>
<body>
<center>

    <form action="http://localhost:8080/bg/instrument/upload/uploadInstruments" method="post" enctype="multipart/form-data">
        <input type="file" id="file" name="file">
        <input type="hidden"  name="orgId" value="1">
        <input type="hidden" name="uId" value="1">
        <button type="submit">提交</button>
    </form>



</center>
</body>
</html>
