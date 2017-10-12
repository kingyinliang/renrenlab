<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">

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
        body,.wrapper {
            background-color: #f3f6f9!important;
        }
        /*START机构公用头部*/
        /*共享指数*/
        .org_title {
            line-height: 104px;
            background: #fff;
            overflow: hidden;
        }

        .org_title > div{
            height: 104px;
            width: 1120px;
            margin: 0 auto;
        }

        .org_title .org_info {
            float: left;
            position: relative;
        }

        .org_title .org_info img.logo {
            height: 40px;
            vertical-align: middle;
        }

        .org_title .org_info span {
            font-size: 20px;
            color: #4E4E4E;
            position: relative;
        }

        .org_title .org_info img.approve {
            width: 20px;
            height: 20px;
            position: absolute;
            right: -26px;
            top: -6px;
        }

        .org_title .exponent {
            float: right;
            font-size: 12px;
            color: #4E4E4E;
        }


        .org_title .exponent > div {
            float: left;
        }
        .org_title .exponent > div.num {
            font-size: 50px;
            font-family: "779-CAI978";
            color: #ed6a5f;
        }

        /*机构tab栏*/
        .org_tab {
            border-bottom: 2px solid #508DF0;
            line-height: 44px;
            height: 46px;
        }
        .org_tab ul {
            list-style: none;
            width: 1120px;
            margin: 0 auto;
            line-height: 44px;
        }
        .org_tab li {
            font-size: 16px;
            float: left;
            margin-right: 45px;
        }

        .org_tab li a {
            color: #4E4E4E;

        }
        .org_tab li.actived  a{
            color: #508DF0;

        }
        /*END机构公用头部*/
    </style>
</head>
<body>
<div class="wrapper" style="background-color: white">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--模块-->
    <div class="org_main clearfix">
        <%--机构标题--%>
        <div class="org_title">
            <div>
                <div class="org_info">
                    <img class="logo" src="${rlab}/front/imgs/labbang.png" alt="">
                    <span>
                    北京北控高科技孵化器有限公司
                     <img class="approve" src="${rlab}/front/imgs/labbang.png">
                </span>
                </div>
                <div class="exponent">
                    <div>共享指数 |</div>
                    <div class="num">
                        169
                    </div>
                </div>
            </div>

        </div>
        <%--机构tab栏   --%>
        <div class="org_tab">
            <ul >
                <li>
                    <a href="#">机构首页</a>
                </li>
                <li class="actived">
                    <a href="#">持有仪器(15)</a>
                </li>
            </ul>
        </div>

        <%--tip--%>
        <div class="org_result">

        </div>
        <%-- 列表 --%>
        <div class="org_list">

        </div>
        <%--分页--%>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
</html>
