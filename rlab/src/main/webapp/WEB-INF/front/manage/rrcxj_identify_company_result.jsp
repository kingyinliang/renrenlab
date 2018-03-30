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

    </style>
    <link rel="stylesheet" href="${rlab}/front/css/rrcxj_style.css?v_=20170622">
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
            <jsp:param name="secondMenu" value="1"/>
        </jsp:include>
        <div class="user_main">
            <div class="rrcxj_notJuan">
                <%--审核中--%>
                <img src="${rlab}/front/imgs/rrcxj/audit.png" alt="" class="rrcxj_notImg" style="width: 99.5px;height: 74.5px">
                <p class="rrcxj_Tit">
                    工作人员将在24h内审核完成</br>请耐心等待工作人员审核认证材料
                </p>
                <%--审核中--%>
                <%--审核失败--%>
                <img src="${rlab}/front/imgs/rrcxj/not-img.png" alt="" class="rrcxj_notImg">
                <p class="redtext" style="margin-top: 20px">拒绝理由：机构营收不符合创新券发放范围内</p>
                <p class="rrcxj_Tit">
                    您有任何疑问可联系客服人员</br>或提交材料重新认证
                </p>
                <a href="" class="goapply">重新认证</a>
                <%--审核失败--%>
                <div class="flow">
                    <p class="flow_tit">如何领用创新券？</p>
                    <div class="flowMain clearfix">
                        <div>
                            <img src="${rlab}/front/imgs/rrcxj/qualification.png" alt="">
                            <p class="flow_text" style="margin-top: 20px">用户发起申请</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                            <p class="flow_text">提交认证材料</p>
                            <p class="flow_text2">（基本信息表、营业执照、近两年财务报表等）</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                            <p class="flow_text">平台审核</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                            <p class="flow_text">审核通过，获得资格</p>
                        </div>
                        <div>
                            <img src="${rlab}/front/imgs/rrcxj/apply.png" alt="">
                            <p class="flow_text" style="margin-top: 20px">用户发起申请</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                            <p class="flow_text">提交项目申请表</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                            <p class="flow_text">平台审核</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                            <p class="flow_text">审核通过，该次交易享受补贴</p>
                        </div>
                        <div>
                            <img src="${rlab}/front/imgs/rrcxj/conversion.png" alt="">
                            <p class="flow_text" style="margin-top: 20px">用户提交材料</p>
                            <p class="flow_text2" style="margin-bottom: 12px">（交易合同、发票、项目成果证明及其他证明材料）</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                            <p class="flow_text" style="line-height: 38px">平台审核</p>
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                            <p class="flow_text" style="margin-top: 6px">审核通过，兑现补贴</p>
                            <p class="flow_text2">（补贴款项汇入账号或直接交易中减免）</p>
                        </div>
                        <div class="goright">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                        </div>
                        <div class="goright" style="left: 491px">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                            <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">

</script>
</body>
</html>