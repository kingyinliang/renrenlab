<%--
  Created by IntelliJ IDEA.
  User: ChenXuan
  Date: 2017/9/18 0018
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="${rlab}/common/assets/layui/layui.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
    <script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .lableBox a{
            display: inline-block;
            padding: 0 8px;
            font-size: 11px;
            color: #ff9393;
            line-height: 20px;
            border: 1px solid;
            margin: 0 5px 17px 5px;
            border-radius: 10px;
            cursor: pointer;
        }
        .detail {
            background-color: #ffffff;
            border-radius: 5px;
            padding: 25px 27px;
            margin-bottom: 20px;
        }

        .detail h3 {
            font-size: 24px;
            color: #424242;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .detailTxt {
            font-size: 14px;
            color: #404040;
            line-height: 13px;
        }

        .detailTxt img{
            max-width: 657px;
        }
        .detailTxt div{
            line-height: 24px;
            font-size: 14px;
        }
        .detailTxt p{
            line-height: 24px;
            font-size: 14px;
        }
        strong{
            font-weight: bold;
        }
        table{
            line-height: 24px;
            max-width: 657px;
            border-collapse: collapse;
            display: table;
        }

        .detailTxt span {
            line-height: 24px;
        }
        .detailTxt td,.detailTxt th{
            padding: 5px 10px;
            border: 1px solid #DDD;
            margin: 0;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="10"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>科创头条管理</cite></a>
                    <a><cite>科创头条列表</cite></a>
                </span>
            </div>
            <div class="detail clearfix" style="max-width: 720px">
                <h3>${info.tInfoTitle}</h3>
                <div class="clearfix">
                </div>
                <div style="height: 1px;background:#d6d6d6;margin: 15px 0;"></div>
                <div class="lableBox">
                    <c:forEach items="${info.tInfoTags}"
                               var="tag"><a style="color: #ff9393">${tag}&nbsp;&nbsp;</a></c:forEach>
                </div>
                <div class="detailTxt">${info.tInfoContent}</div>
                <div style="margin-top: 30px;display: ${info.tInfoFrom==''?'none':'block'}"><p>来源：${info.tInfoFrom}</p></div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>

</script>
</html>

