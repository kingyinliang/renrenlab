<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/7/14 0014
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../config/taglibs.jsp"%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.js"></script>--%>

    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="../../common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="../../common/assets/layui/layui.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="../../common/icomoon/style.css">
    <style>

    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <jsp:include page="../common/header.jsp" flush="true"></jsp:include>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="firstMenu" value="1" />
                <jsp:param name="secondMenu" value="1" />
            </jsp:include>
        </div>
        <div class="main">
            <%-- 编写代码的地方，内容区域 --%>

        </div>
    </div>
</div>
</body>
<script src="../js/main.js"></script>
</html>

