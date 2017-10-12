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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">
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
        .radius{
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -ms-border-radius: 10px;
            -o-border-radius: 10px;
        }

        .page_head{
            width: 100%;
            overflow: hidden;
            text-align: center;
        }
        .apply{
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            background-color: #508df0;
            color: white;
            font-size: 14px;
            width: 100px;
            height: 40px;
            margin-top: 30px;
            cursor: pointer;
        }
        .list{
            background-color: white;
        }
        .listli{
            padding: 26px 0 26px 25px;
            margin: 0 25px;
            border-top: 1px solid #f5f7f9;
            position: relative;
        }
        .listli p{
            float: left;
            font-size: 16px;
            color: #666;
            text-align: center;
            line-height: 35px;
        }
        .times{
            width: 165px;
            margin-right: 34px;
        }
        .projectName{
            width: 350px;
            text-align: center;
        }
        .listli .result{
            color: #7acbcf;
            cursor: pointer;
            margin: 0 23px 0 30px;
            width: 101px;
        }
        .listli .result label{
            line-height: 35px;
            float: left;
        }
        .resultBtn{
            margin-left: 23px;
            width: 101px;
            height: 35px;
        }
        .resultBtn button{
            border: none;
            background-color: #508df0;
            font-size: 14px;
            width: 100px;
            height: 35px;
            color: white;
            cursor: pointer;
        }
        .resultBtn button label{
            margin-top: 2px;
            display: block;
            float: left;
            font-size: 16px;
        }
        .listli .notgo{
            color: #ed7979;
        }
        .listli .win{
            color: #666666;
            line-height: 16px;
        }
        .result span{
            line-height: 18px;
        }
        .pop{
            display: none;
            width: 874px;
            height: 107px;
            background: white;
            padding: 20px 17px;
            border: 1px solid #e0dfe0;
            border-radius: 9px;
            box-shadow: 1px 1px 30px rgba(0,0,0,.3);
            -webkit-box-shadow: 1px 1px 30px rgba(0,0,0,.3);
            -o-box-shadow: 1px 1px 30px rgba(0,0,0,.3);
            -moz-box-shadow: 1px 1px 30px rgba(0,0,0,.3);
            position: absolute;
            top:-77px;
        }
        .pop p{
            font-size: 14px;
            color: #b4b4b4;
        }
        .pop .popTit{
            color: #999999;
            line-height: 18px;
            float: none;
            text-align: left;
        }
        .listli .popflowdiv{
            padding: 20px 16px;
        }
        .listli .popflow{
            line-height: 18px;
            font-size: 14px;
        }
        .num{
            background: #c1c1c1;
            color: white;
            width: 17px;
            height: 17px;
            text-align: center;
            line-height: 17px;
            border-radius: 50%;
            float: left;
            margin-right: 8px;
        }
        .pop .selects{
            color: #508df0;
        }
        .selects .num{
            background: #508df0;
        }
        .selects .imIne{
            border-color: #508df0;
        }
        .popflow span{
            float: left;
        }
        .imIne{
            width: 80px;
            border-top:1px dashed #c1c1c1;
            margin-top: 8px;
            margin: 8px 20px;
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
            <jsp:param name="secondMenu" value="1"/>
        </jsp:include>
        <div class="user_main" style="margin-bottom: 50px">
            <div class="radius" style="background-color: white">
                <div>
                    <div class="page_head">
                        <p style="font-size: 20px; color: #7acbcf; width: 100%; text-align: center; margin-top: 120px">已通过认证资格</p>
                        <p style="font-size: 16px; color: #767676; width: 100%; text-align: center; margin-top: 20px">提交项目申请即可获得创新券</p>
                        <button class="apply">申请创新券</button>
                        <p style="margin-top: 100px; color: #333; font-size: 14px"><span style="color: #508df0; font-size: 20px">创新券项目申请记录</span>&nbsp;&nbsp;已通过审核的项目，请尽快上传改项目的合同、发票及成果证明材料至平台进行备案</p>
                    </div>
                </div>
                <div style="margin-top: 30px">
                    <div style="background-color: white; margin-top: 30px; height: 60px; line-height: 60px; background-color: #f9fbfc">
                        <p style="margin-left: 100px; font-size: 16px; color: #999; float: left">申请时间</p>
                        <p style="margin-left: 230px; font-size: 16px; color: #999; float: left">申请项目</p>
                        <p style="margin-left: 210px; font-size: 16px; color: #999; float: left">申请状态</p>
                    </div>
                    <div  class="list">
                        <div class="clearfix listli">
                            <p class="times">2017-08-15 17:25:16</p>
                            <p class="projectName">不经常触手可及手苏坚持不经常触手可及</p>
                            <p class="result">
                                <label class="lab-search"></label>
                                <span>审核通过</span>
                            </p>
                            <p class="resultBtn">
                                <button class="button"><label class="lab-search"></label>上传材料</button>
                            </p>
                            <div class="pop">
                                <p class="popTit">详细进度</p>
                                <div class="popflowdiv clearfix">
                                    <p class="popflow selects">
                                        <span class="num">1</span>
                                        <span>项目审核中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow selects">
                                        <span class="num">2</span>
                                        <span>审核通过</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">3</span>
                                        <span>备案完成，款项发放中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">4</span>
                                        <span>项目已完成</span>
                                    </p>
                                </div>
                            </div>
                        </div>


                        <div class="clearfix listli">
                            <p class="times">2017-08-15 17:25:16</p>
                            <p class="projectName">哈常触手可及手可及哈苏坚持不经常触手可及</p>
                            <p class="result notgo">
                                <label class="lab-search"></label>
                                <span>审核不通过</span>
                            </p>
                            <p class="resultBtn">
                                <button class="button"><label class="lab-search"></label>查看原因</button>
                            </p>
                            <div class="pop">
                                <p class="popTit">详细进度</p>
                                <div class="popflowdiv clearfix">
                                    <p class="popflow selects">
                                        <span class="num">1</span>
                                        <span>项目审核中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow selects">
                                        <span class="num">2</span>
                                        <span>审核通过</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">3</span>
                                        <span>备案完成，款项发放中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">4</span>
                                        <span>项目已完成</span>
                                    </p>
                                </div>
                            </div>
                        </div>


                        <div class="clearfix listli">
                            <p class="times">2017-08-15 17:25:16</p>
                            <p class="projectName">哈常触手可及手可及哈苏坚持不经常触手可及</p>
                            <p class="result win">
                                <label class="lab-search"></label>
                                <span>备案完成<br>款项发放中</span>
                            </p>
                            <div class="pop">
                                <p class="popTit">详细进度</p>
                                <div class="popflowdiv clearfix">
                                    <p class="popflow selects">
                                        <span class="num">1</span>
                                        <span>项目审核中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow selects">
                                        <span class="num">2</span>
                                        <span>审核通过</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">3</span>
                                        <span>备案完成，款项发放中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">4</span>
                                        <span>项目已完成</span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="clearfix listli">
                            <p class="times">2017-08-15 17:25:16</p>
                            <p class="projectName">不经常触手可及手苏坚持不经常触手可及</p>
                            <p class="result">
                                <label class="lab-search"></label>
                                <span>审核通过</span>
                            </p>
                            <p class="resultBtn">
                                <button class="button"><label class="lab-search"></label>上传材料</button>
                            </p>
                            <div class="pop">
                                <p class="popTit">详细进度</p>
                                <div class="popflowdiv clearfix">
                                    <p class="popflow selects">
                                        <span class="num">1</span>
                                        <span>项目审核中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow selects">
                                        <span class="num">2</span>
                                        <span>审核通过</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">3</span>
                                        <span>备案完成，款项发放中</span>
                                        <span class="imIne"></span>
                                    </p>
                                    <p class="popflow ">
                                        <span class="num">4</span>
                                        <span>项目已完成</span>
                                    </p>
                                </div>
                            </div>
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
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
<script type="text/javascript">
    $(".result").hover(function () {
        $(this).parent().find(".pop").show();
    },function () {
        $(this).parent().find(".pop").hide();
    })
</script>
</body>
</html>