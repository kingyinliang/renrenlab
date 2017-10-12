<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../config/taglibs.jsp"%>



    <link rel="stylesheet" href="../../common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="../../common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="../../common/assets/layui/layui.js"></script>

    <script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>

    <link rel="stylesheet" href="../../common/icomoon/style.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>

</head>
<body>
<div class="wrapper">
    <div class="hd">
        <jsp:include page="../common/header.jsp" flush="true"></jsp:include>
    </div>
    <div class="comn">
        <div class="sd" >
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="firstMenu" value="1" />
                <jsp:param name="secondMenu" value="1" />
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">

        </div>
    </div>
</div>
</body>
<script src="../js/main.js"></script>
</html>
