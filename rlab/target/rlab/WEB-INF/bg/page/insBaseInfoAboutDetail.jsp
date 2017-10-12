<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="${rlab}/common/assets/layui/layui.js"></script>

    <script src="${rlab}/common/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .infModify p, .infP {
            line-height: 50px;
            font-size: 16px;
            color: #7b8da0;
            margin-top: 20px;
        }

        .infModify p .instext {
            width: 80%;
            height: 50px;
            padding-left: 20px;
            margin-left: 13px;
            border-radius: 5px;
        }

        .infModify p img {
            width: 110px;
            height: 110px;
        }

        .insImg {
            width: 110px;
            height: 110px;
            float: left;
            display: block;
            border-radius: 15px;
            position: relative;
            margin: 0 7px 0 13px;
        }

        .infTable {
            width: 540px;
            float: left;
            margin-left: 13px;
        }

        .infTable table {
            width: 100%;
        }

        .infArg {
            background: #6693c8;
            color: white;
        }

        .infTable .layui-table tr:hover {
            background-color: white;
        }

        .addDesmain {
            margin-bottom: 30px;
        }

        .desMain {
            margin-top: 10px;
            background: white;
            padding: 23px;
            border-radius: 2px;
        }

        .desMain h2 {
            font-size: 20px;
            color: #4c5e70;
            font-weight: bold;
        }

        .desMain p {
            font-size: 16px;
            color: #627587;
            line-height: 30px;
        }

        .save {
            text-align: center;
            margin-top: 60px;
        }

        .save button {
            width: 140px;
            height: 50px;
            background: #49aaff;
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
        <div class="sd" >
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>仪器管理</cite></a>
                    <a href="${rlab}/bg/baseins/list">基本信息管理</a>
                    <a><cite>基本信息详情</cite></a>
                </span>
            </div>
            <div class="infModify">
                <p>仪器名称：<span class="instext">${baseInfo.insName}</span></p>
                <p>仪器型号：<span class="instext">${baseInfo.insMode}</span></p>
                <p class="clearfix">
                    <span style="float: left;margin-right: 20px;line-height: 7">仪器图片：</span>
                    <c:forEach items="${insPicList}" var="info">
                        <a class="insImg"><img src="${info}" alt=""></a>
                    </c:forEach>
                </p>
                <p>仪器品牌：<span class="instext">${baseInfo.insBrand}</span></p>
                <p>仪器产地：<span class="instext">${baseInfo.insOrigin}</span></p>
                <p><span style="float: left">仪器分类：</span><span
                        class="instext">${baseInfo.insturmentCategories[0].categoryName}>${baseInfo.insturmentCategories[1].categoryName}>${baseInfo.insturmentCategories[2].categoryName}</span>
                </p>
                <div class="infP clearfix">
                    <span style="float: left">核心参数<em>*</em>：</span>
                    <div class="infTable">
                        <table class="layui-table">
                            <colgroup>
                                <col width="50%">
                                <col >
                            </colgroup>
                            <tbody>

                            <c:forEach items="${coreParamList}" var="core">
                                <tr>
                                    <td class="infArg">${core.title}</td>
                                    <td>${core.content}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <p class="addDes">仪器简介：</p>
                <div class="addDesap">
                    <div class="addDesmain">
                        <c:forEach items="${descriptionList}" var="des">
                            <div class="desMain">
                                <h2 class="currTit">${des.title}</h2>
                                <p class="currTextarea">${des.content}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="save">
                    <button class="layui-btn" onclick="goalter()">修改仪器</button>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    function goalter() {
        var url = '${rlab}/bg/baseins/tomodify?insIid=${baseInfo.insIid}';
        window.location.href = url;
    }
</script>
</html>
