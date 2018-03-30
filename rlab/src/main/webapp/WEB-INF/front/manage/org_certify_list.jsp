<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20171108">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20171108">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

    <style type="text/css">
        .user_content {
            height: auto !important;
        }

        /* START 侧边栏公用样式*/
        .side_dn {
            display: block !important;
        }

        .user_side {
            float: left;
            width: 153px;
            min-height: 800px;
            background: #fff;
        }

        .user_side .avatar {
            padding: 0 20px;
            text-align: center;
        }

        .user_side img {
            width: 100px;
            margin-top: 26px;
        }

        .user_side p {
            height: 50px;
            line-height: 50px;
            color: #4e4e4e;
            font-size: 16px;
            border-bottom: 1px dashed #dde3ea;
        }

        /*侧边栏bar*/
        ul.u_sd_ul a {
            color: #4e4e4e;
        }

        ul.u_sd_ul {
            list-style: none;
        }

        ul.u_sd_ul > li {
            line-height: 46px;
            margin-top: 20px;
        }

        ul.u_sd_ul > li > a {
            font-size: 16px;
            padding-left: 26px;
            line-height: 46px;
            display: block;
        }

        ul.u_sd_ul > li.actived > a {
            color: #508df0;
        }

        ul.u_sd_ul > li dl {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul.u_sd_ul > li dl dd {
            text-align: left;
            margin: 0;
            padding: 0;
            background: #f9fbfc;
        }

        ul.u_sd_ul > li dd a {
            padding-left: 26px;
            font-size: 14px;
            display: block;
        }

        ul.u_sd_ul > li.actived dd.actived a {
            color: #508df0;
        }

        ul.u_sd_ul > li dd i {
            font-size: 1px;
            display: inline-block;
            -webkit-transform: scale(0.8, 0.8);
            -moz-transform: scale(0.8, 0.8);
            -ms-transform: scale(0.8, 0.8);
            -o-transform: scale(0.8, 0.8);
            transform: scale(0.8, 0.8);
        }

        /*END 侧边栏公用样式*/

        /*START 内容部分公用样式*/
        .user_main {
            margin-left: 10px;
            min-height: 800px;
            float: left;
            width: 957px;
            background: #fff;
        }

        /*END 内容部分公用样式*/

    </style>

    <style type="text/css">
        .button {
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            width: 155px;
            height: 40px;
            border: 1px solid #508DF0;
            background-color: #f3f8ff;
            font-size: 18px;
            color: #508DF0;
            cursor: pointer;
        }

        .button:active {
            background: #d9e7fc;
        }

        .look_detail:hover {
            text-decoration: underline;
        }
        .button a:link{
            color: #508df0;
        }
        .button a:visited{
            color: #508df0;
        }

    </style>
</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="user_center user_content clearfix">
        <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
        <jsp:include page="../template/user_side.jsp" flush="true">
            <jsp:param name="levelNum" value="1"/>
            <jsp:param name="firstMenu" value="4"/>
        </jsp:include>
        <div class="user_main" style="margin-bottom: 30px; padding-bottom: 30px">
            <div style="margin: 40px 0 0 30px">
                <p style="font-size: 22px; color: #508df0">服务商认证</p>
                <p style="font-size: 17px; color: #4e4e4e; margin-top: 50px">申请记录</p>
            </div>
            <div>
                <table style="margin: 30px 30px 0 30px; width: 880px" rules="none">
                    <colgroup>
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                        <col width="20%">
                    </colgroup>
                    <thead style="height: 45px; background-color: #74a4f2; color: white; font-size: 15px">
                    <tr style="height: 45px">
                        <th>机构名称</th>
                        <th>审核状态</th>
                        <th>申请时间</th>
                        <th>对接方</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${frontProviderInfoList.size() > 0}">
                        <c:forEach items="${frontProviderInfoList}" var="item">
                            <tr style="height: 45px; background-color: white; font-size: 15px; color: #4e4e4e">
                                <th>${item.orgName}</th>
                                <th>${item.orgIdentificationStr}</th>
                                <th>${item.applicationTimeStr}</th>
                                <th>${item.orgBizName}</th>
                                <th><a class="look_detail" href="${rlab}/provider/search/${item.orgOid}"
                                       style="color: #508DF0">查看详情</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <c:if test="${frontProviderInfoList.size() <= 0}">
                <div style="width: 100%;text-align: center">
                    <img width="600px;" src="${rlab}/front/imgs/default_no_concat.png" alt="">
                </div>
            </c:if>

            <div style="margin: 30px 50px 0 0; float: right">
                <button class="button" onclick="toAddCertify()">申请服务商认证</button>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">
function toAddCertify() {
    location.href = BASE_URL + "/provider/add";
}
</script>
</body>
</html>