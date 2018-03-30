<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="WEB-INF/config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <%--<script src="${rlab}/common/assets/layui/layui.js"></script>--%>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <%--开发环境--%>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <link rel="stylesheet" href="${rlab}/bg/css/admin.css">
    <style type="text/css">

        /* START自定义勾选框公用样式1*/
        label.ckbox {
            display: block;
            position: relative;
            width: 14px;
            height: 14px;
            background: green;
            /*overflow: hidden;*/
            cursor: pointer;
        }

        label.cancel {
            background: url("${rlab}/mobile/imgs/icon/meigouxuan.png") no-repeat 0px 0px/14px 14px;
        }

        label.checked {
            background: url("${rlab}/mobile/imgs/icon/gouxuan.png") no-repeat 0px 0px/14px 14px;
        }

        .ckbox input {
            position: absolute;
            left: -20px;
        }

        /* END自定义勾选框公用样式1*/

        /*START是否确认修改弹窗*/
        .acceptModal {
            -webkit-border-radius: 6px !important;
            -moz-border-radius: 6px !important;
            border-radius: 6px !important;
            width: auto !important;
        }

        .acceptModal button {
            cursor: pointer;
        }

        /*END是否确认修改弹窗*/
        .admin {
            text-align: center;
            width: 100% !important;
            position: relative;
            padding-top: 200px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="WEB-INF/bg/common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="WEB-INF/bg/common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="0"/>
                <jsp:param name="firstMenu" value="0"/>
                <jsp:param name="secondMenu" value="0"/>
            </jsp:include>
        </div>
        <div class="main">
            <%--头部面包屑导航标签--%>
            <div class="admin">
                <img src="${rlab}/bg/img/limit_1.png" alt="" style="width: 180px;height: 180px;">
                <p>
                    哎呦，您还没有操作权限
                </p>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<script src="${rlab}/bg/js/main.js"></script>
</html>
