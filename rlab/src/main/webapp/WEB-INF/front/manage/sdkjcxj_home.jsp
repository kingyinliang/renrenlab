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
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170622">

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
        .details_link{
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            background-color: #508DF0;
            font-size: 18px;
            color: white;
            width: 120px;
            height: 40px;
            cursor: pointer;
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
            <jsp:param name="levelNum" value="2"/>
            <jsp:param name="firstMenu" value="3"/>
            <jsp:param name="secondMenu" value="4"/>
        </jsp:include>
        <div class="user_main" style="padding: 40px 35px 0 35px">
            <h2 style="font-size: 22px; color: #508DF0">首都科技条件平台创新券</h2>
            <img src="${rlab}/front/imgs/rrcxj/shouke.png" style="width: 320px; margin-top: 70px">
            <p style="font-size: 16px; color: #666; margin-top: 40px; line-height: 1.8">为落实《北京市关于加快推进科研机构科技成果转化和产业化的若干意见（试行）》（京政办发〔2014〕35号），充分发挥市场在资源配置中的决定性作用，进一步盘活首都优势科技资源，降低小微企业和创业团队科研创新投入成本，激发小微企业和创业团队的科技创新活力，北京市决定实施首都科技创新券制度。</p>
            <p style="color: #333; font-size: 16px; margin-top: 35px">人人实验平台作为首都科技条件平台的推荐机构，主要负责申领企业资质审批和创新券发放工作。</p>
            <div style="text-align: center; width: 100%; margin-top: 80px">
                <button class="details_link" type="button">查看详情</button>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
</body>
<script type="text/javascript">
    $(".details_link").on('click', function () {
//        window.location.href = 'www.sdtjpt.gov.cn/';
        window.open('http://www.sdtjpt.gov.cn/');
    });
</script>
</html>