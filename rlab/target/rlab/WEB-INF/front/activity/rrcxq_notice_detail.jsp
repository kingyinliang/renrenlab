<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css">

    <%--<link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

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
    <style>
        html, body, .sp_main {
            background-color: #f6f7ff;
        }

        .banners img {
            width: 100%;
        }

        /*导航部分*/
        .navigator {
            margin: 0 auto;
            margin-top: 30px;
            width: 1200px;
            background-color: #3d8cf8;
            height: 50px;
            line-height: 50px;
        }

        .navigator .ad {
            float: left;
            line-height: 48px;
            height: 50px;
            margin-left: 15px;

        }

        .navigator .ad img {
            vertical-align: middle;
        }

        .navigator .txt {
            float: left;
            margin-left: 15px
        }

        .navigator .txt a {

        }

        .navigator .txt a:hover {
            text-decoration: underline;
        }

        /*列表部分*/
        .nt_list {
            width: 1200px;
            margin: 0 auto;
            background: #fff;
            border: solid 1px rgba(239, 239, 239, 1);
            margin-top: 9px;
            padding: 20px 35px;
            height: 646px;
            position: relative;
        }

        .nt_list > ul.list {
            list-style: none;
        }

        .nt_list > ul.list li {
            height: 50px;
            line-height: 50px;
            padding-left: 26px;
            position: relative;
        }

        .nt_list > ul.list i {
            color: #3d8cf8;
            display: block;
            line-height: 50px;
            position: absolute;
            left: 0;
        }

        .nt_list > ul.list a {
            font-size: 18px;
            color: #414141;
        }

        .nt_list > ul.list a:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .nt_list > ul.list s {
            font-size: 18px;
            color: #9f9f9f;
            position: absolute;
            right: 6px;
        }

        /*内容区域*/
        .detail_main {
            margin: 0 auto;
            margin-top: 10px;
            width: 1200px;
            background-color: white;
            text-align: center;
            overflow: hidden;
            padding-bottom: 85px;
        }

        .detail_main .title {
            font-size: 30px;
            color: #414141;
            margin-top: 40px
        }

        .detail_main .author {
            margin-top: 20px;
            font-size: 15px;
            color: #9f9f9f;
        }
    </style>
</head>
<body>
<div id="main" class="wrapper">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>

    <div class="cxj_content" style="padding-bottom: 30px">
        <%--banner--%>
        <div class="banners">
            <img src="${rlab}/front/imgs/cxj/activityBanner.png">
        </div>

        <%--导航--%>
        <div class="navigator">
            <div class="ad" style="">
                <img src="${rlab}/front/imgs/cxj/add@1x.png" alt="">
            </div>
            <div class="txt">
                <a style="color: white" href="${rlab}/page/activity?source=0">人人创新券</a>
                <i class="lab-youjian_1" style="color: #9ec5fb; font-size: 14px;"></i>
                <a style="color: white" href="${rlab}/page/activity/notice">人人创新券公告信息</a>
                <i class="lab-youjian_1" style="color: #9ec5fb; font-size: 15px;"></i>
                <a style="color: white" href="#">公告正文</a>
            </div>
        </div>
        <%--内容区域--%>
        <div class="detail_main">
            <p class="title">关于人人创新券2017年第一批支持项目公示的公告</p>
            <p class="author">2017-09-28</p>
            <div style="margin-top: 30px; width: 100%; height: 1px; background-color: #f6f6f6"></div>
            <div style="margin: 30px 70px 0 70px; text-align: left; color: #414141; font-size: 18px">
                <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据《昌平区小微企业创业创新基地城市示范专项资金管理办法》（昌政办发〔2016〕33号）以及领导小组统一安排，由昌平园管委会具体指导，并由昌平区重点建设的科技条件平台——人人实验负责组织实施人人创新券。经公开申报征集、人人创新券工作小组审定、第三方评审机构监督，确定了人人创新券2017年第一批支持项目21个，现将项目名单予以公示。</p>
                <p style="margin-top: 30px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;任何单位或个人对以上项目有异议的，可在公示期内以书面形式向人人创新券工作小组反映，异议材料请注明真实姓名和联系方式。</p>
                <p style="margin-top: 30px">一、公示时间： 2017年09月28日—10月04日</p>
                <p style="margin-top: 30px">二、联系电话：010-81708556</p>
                <p style="margin-top: 30px; font-size: 15px">附件：人人创新券项目公示表（2017年第一批）</p>
                <div style="margin-top: 30px; position: relative">
                    <a style="color: #3d8cf8;position: relative" href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E4%BA%BA%E4%BA%BA%E5%88%9B%E6%96%B0%E5%88%B8%E9%A1%B9%E7%9B%AE%E5%85%AC%E7%A4%BA%E8%A1%A8%EF%BC%882017%E5%B9%B4%E7%AC%AC%E4%B8%80%E6%89%B9%EF%BC%89.pdf" download="download" target="_blank">附件：人人创新券项目公示表（2017年第一批）
                        <img src="${rlab}/front/imgs/activity_download.png" style="position: absolute;right:-20px;top: 50%;margin-top:-9px;cursor: pointer">
                    </a>

                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
</body>
</html>
</html>