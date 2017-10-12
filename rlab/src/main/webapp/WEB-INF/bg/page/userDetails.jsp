<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/7/19 0019
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp"%>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="${rlab}/common/assets/layui/layui.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .pad{
            width: 100%;
            border-radius:5px;
            height: 166px;
            background: white;
            overflow: hidden;
            padding: 20px;
        }
        .userimg{
            width: 124px;
            height: 124px;
            float: left;
            margin-right: 20px;
        }
        .pad .userTxt{
            float: left;
            font-size: 16px;
            color: #7b8da0;
            line-height: 30px;
        }
        .userMes{
            margin-top: 46px;
        }
        .userMes h2{
            font-size: 20px;
            color: #4c5e70;
        }
        .userMes p{
            font-size: 16px;
            color: #7b8da0;
            line-height: 50px;
        }
        .userMes img{
            width: 240px;
            height:148px;
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
                <jsp:param name="levelNum" value="1" />
                <jsp:param name="firstMenu" value="2" />
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a href="${rlab}/bg/user/list?pageNo=1&pageSize=10">用户管理</a>
                    <a><cite>用户详情</cite></a>
                </span>
            </div>
            <div class="pad">
                <div class="userimg">
                    <c:choose>
                        <c:when test="${userBaseInfo.uAvatar != null && !''.equals(userBaseInfo.uAvatar)}">
                            <img src="${userBaseInfo.uAvatar}" style="width: 100%;height: 100%">
                        </c:when>
                        <c:otherwise>
                            <img src="${rlab}/bg/img/avatar.jpg" style="width: 100%;height: 100%">
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="userTxt">
                    <p style="font-size: 18px"><span>用户昵称： </span><span style="color: #4c5e70">${userBaseInfo.uNickname}</span><span style="margin-left: 80px">手机号：</span><span style="color: #4c5e70">${userBaseInfo.uMobile}</span><span style="color: #4c5e70"></span></p>
                    <p style="margin-top: 8px"><span>注册时间： </span><span style="color: #4c5e70;margin-left: 10px">${userBaseInfo.createTimeStr}</span></p>
                    <p><span>用户来源： </span><span style="color: #4c5e70;margin-left: 10px">${userBaseInfo.uSource == 0 ? '微信' : userBaseInfo.uSource == 1 ? 'web' : 'm站'}</span></p>
                    <p><span>认证状态： </span><span style="color: #4c5e70;margin-left: 10px">${userBaseInfo.uAuthentication == 0 ? '未认证' :  '已认证'}</span></p>
                </div>
            </div>
            <div class="userMes">
                <h2>身份认证</h2>
                <p style="margin-top: 10px"><span>真实姓名： </span><span style="color: #4c5e70;margin-left: 10px">${userBaseInfo.identifyFullname == null ? "" : userBaseInfo.identifyFullname}</span><span style="margin-left: 80px">身份证号： </span><span style="color: #4c5e70;margin-left: 10px">${userBaseInfo.identifyNo == null ? "" : userBaseInfo.identifyNo}</span></p>
                <p style="float: left">身份证照片：</p>
                <c:choose>
                    <c:when test="${userBaseInfo.identifyPic1 != null && !''.equals(userBaseInfo.identifyPic1)}">
                        <p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic1}"></p>
                    </c:when>
                    <c:otherwise>
                        <p style="float: left;margin-left: 18px"><img src="${rlab}/bg/img/usercard1.png"></p>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${userBaseInfo.identifyPic2 != null && !''.equals(userBaseInfo.identifyPic2)}">
                        <p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic2}"></p>
                    </c:when>
                    <c:otherwise>
                        <p style="float: left;margin-left: 18px"><img src="${rlab}/bg/img/usercard2.png"></p>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test="${userBaseInfo.identifyPic3 != null && !''.equals(userBaseInfo.identifyPic3)}">
                        <p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic3}"></p>
                    </c:when>
                    <c:otherwise>
                        <p style="float: left;margin-left: 18px"><img src="${rlab}/bg/img/usercard3.png"></p>
                    </c:otherwise>
                </c:choose>
                <%--<p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic1==''? '/bg/img/usercard1.png':userBaseInfo.identifyPic1}"></p>--%>
                <%--<p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic2==''?'${rlab}/bg/img/usercard2.png':userBaseInfo.identifyPic2}"></p>--%>
                <%--<p style="float: left;margin-left: 18px"><img src="${userBaseInfo.identifyPic3==''?'${rlab}/bg/img/usercard3.png':userBaseInfo.identifyPic3}"></p>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
</html>
