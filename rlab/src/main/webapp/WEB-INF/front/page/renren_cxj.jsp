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

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">

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
        body, html {
            background: #f6f7ff;
            color: #666;
            font-size: 20px;
        }

        /*banner样式开始*/
        .banner {

        }

        .img_content {
            width: 100%;
            padding-bottom: 27.96%;
            background: #f6f7ff;
            position: relative;
        }

        .banner img {
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
        }

        /*创新券宗旨*/
        .outline {
            position: relative;
            margin-top:67px;
        }

        .outline_content {
            width: 910px;
            margin: 0 auto;
            height: 130px;
            background: #fff;
            border: 1px solid #6178fa;
            position: relative;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
            position: relative;
        }

        .outline_content .txt {
            padding: 24px 20px;
            background: #fff;
            line-height: 40px;
            position: relative;
            z-index: 2;
        }

        .outline_content .bg {
            width: 924px;
            height: 104px;
            background: #6178fa;
            position: absolute;
            bottom: -10px;
            left: 50%;
            margin-left: -462px;
            z-index: 1;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        /*扶持对象*/
        .target_user {
            width: 1200px;
            height: 368px;
            margin: 0 auto;
            background: #fff;
            margin-top: 25px;
        }

        .target_user .h2 {
            height: 160px;
            line-height: 160px;
            font-size: 32px;
            color: #6178fa;
            text-align: center;
        }

        .target_user .h2 p {
            position: relative;
        }

        .target_user .h2 i {
            position: absolute;
            bottom: 40px;
            left: 50%;
            margin-left: -31px;
            height: 4px;
            width: 62px;
            background: #6178fa;
            display: block;
        }

        .target_user .txt {
            padding: 0 180px;
        }

        .target_user .txt > p {
            height: 48px;
            line-height: 48px;
        }

        .target_user .txt > p > span {
            color: #6178fa;
        }

        .target_user .txt > div {
        }

        .target_user .txt > div p {
            float: left;
            width: 50%;
            line-height: 54px;
            padding-left: 30px;
            position: relative;
        }

        .target_user .txt > div p > i {
            position: absolute;
            left: 0;
            top: 50%;
            margin-top: -12px;
            display: block;
            background: #6178fa;
            width: 24px;
            height: 24px;
            -webkit-border-radius: 12px;
            -moz-border-radius: 12px;
            border-radius: 12px;
            text-align: center;
            line-height: 24px;
            color: #fff;
        }

        /*扶持额度*/
        .quota {
            background: #fff;
            width: 1200px;
            margin: 0 auto;
            margin-top: 30px;
            overflow: hidden;
        }

        .quota .h2 {
            height: 160px;
            line-height: 160px;
            font-size: 32px;
            color: #6178fa;
            text-align: center;
        }

        .quota .h2 p {
            position: relative;
        }

        .quota .h2 i {
            position: absolute;
            bottom: 40px;
            left: 50%;
            margin-left: -31px;
            height: 4px;
            width: 62px;
            background: #6178fa;
            display: block;
        }

        .quota .tables {
            width: 1060px;
            height: 340px;
            margin: 0 auto;
        }

        .quota .tables {
            border: 2px solid #6178fa;

        }

        .quota .tables > p span {
            display: block;
            float: left;
            width: 25%;
            line-height: 66px;
            border-right: 2px solid #ecefff;
            border-bottom: 2px solid #ecefff;
        }

        .quota .tables > p span.rt_last {
            border-right: 0 none;
        }

        .quota .tables > p span.btm_last {
            border-bottom: 0 none;
        }

        .quota .tables > p.tr {
            text-align: center;
        }

        .quota .tables > p.tr .th {
            background: #6178fa;
            color: #fff;
        }

        .quota .describe {
            font-size: 18px;
            padding: 0 70px;
            margin-top: 16px;
        }

        .quota .describe p {
            padding-left: 106px;
            position: relative;
            line-height: 36px;
        }

        .quota .describe span {
            position: absolute;
            left: 12px;
            color: #6178fa;
            display: block;
        }

        .quota .btm_tit {
            color: #333;
            font-size: 24px;
            text-align: center;
            line-height: 30px;
            height: 100px;
            margin-top: 40px;
        }

        /*创新券使用指南*/
        .guide {
            background: #fff;
            width: 1200px;
            height: 1966px;
            margin: 0 auto;
            overflow: hidden;
            margin-top: 28px;
            margin-bottom: 52px;
        }

        .guide .h2 {
            height: 140px;
            line-height: 140px;
            font-size: 32px;
            color: #6178fa;
            text-align: center;
        }

        .guide .h2 p {
            position: relative;
        }

        .guide .h2 i {
            position: absolute;
            bottom: 30px;
            left: 50%;
            margin-left: -31px;
            height: 4px;
            width: 62px;
            background: #6178fa;
            display: block;
        }

        .qd_content {
        }

        .qd_content .crosswise {
            text-align: center;
        }

        .qd_content .crosswise p {
            margin-top: 15px;
        }

        .qd_content .lengthways .line {
            width: 2px;
            min-height: 351px;
            background: #6178fa;
            margin: 0 auto;
            margin-top: 17px;
            position: relative;
        }

        /*左侧公用部分*/
        .qd_content .lengthways .line .lft {
            width: 44px;
            height: 26px;
            background: url("${rlab}/front/imgs/cxj/cx_icon_12@1.0.jpg") no-repeat;
            position: absolute;
            /*margin-left: -26px;*/
            left: -30px;
        }

        .qd_content .line .lft > span {
            position: absolute;
            color: #fff;
            top: 0;
            left: 25px;
        }

        .qd_content .line .lft .section {

        }

        .qd_content .line .lft div.package {
            height: 66px;
            padding-right: 66px;
            position: absolute;
            right: 70px;
            top: -6px;
            width: 450px;
        }

        .qd_content .line .lft div.package p {
            text-align: right;
            color: #333;
            font-size: 18px;
        }

        .qd_content .line .lft div.package span {
            color: #6178fa;
            font-size: 24px;
        }

        .qd_content .line .lft div.package a {
            font-size: 24px;
            color: #e37ed9;
            text-decoration: underline;
        }

        .qd_content .line .lft div.package a:hover {
            text-decoration: underline;
        }

        .qd_content .line .lft div.package img {
            position: absolute;
            right: 0;
            top: 0;
        }

        .qd_content .line .lft p.describe {
            height: 66px;
            position: absolute;
            top: 70px;
            right: 70px;
            width: 500px;
            font-size: 16px;
            color: #666;
            text-align: right;
        }

        .qd_content .line .lft p.describe span {
            color: #999;
            font-size: 14px;
        }

        /*右侧*/
        .qd_content .lengthways .line .rt {
            width: 44px;
            height: 26px;
            background: url("${rlab}/front/imgs/cxj/cx_icon_11@1.0.jpg") no-repeat;
            position: absolute;
            /*margin-left: -26px;*/
            left: -11px;
            /*!*top: 100px;*!动态设置top*/
        }

        .qd_content .line .rt > span {
            position: absolute;
            color: #fff;
            top: 0;
            left: 7px;
        }

        .qd_content .line .rt .section {

        }

        .qd_content .line .rt div.package {
            height: 66px;
            padding-left: 66px;
            position: absolute;
            left: 76px;
            top: -6px;
            width: 400px;
        }

        .qd_content .line .rt div.package p {
            text-align: left;
            color: #333;
            font-size: 18px;
        }

        .qd_content .line .rt div.package span {
            color: #6178fa;
            font-size: 24px;
        }

        .qd_content .line .rt div.package a {
            font-size: 24px;
            color: #6178fa;
            text-decoration: underline;
        }

        .qd_content .line .rt div.package a:hover {
            text-decoration: underline;
        }

        .qd_content .line .rt div.package img {
            position: absolute;
            left: 0;
            top: 0;
        }

        .qd_content .line .rt p.describe {
            height: 66px;
            padding-left: 60px;
            position: absolute;
            left: 16px;
            top: 53px;
            width: 500px;
            font-size: 16px;
            color: #666;
        }

        .qd_content .line .rt p.describe span {
            color: #999;
            font-size: 14px;
        }

        .icon_dian {
            display: block;
            background: #6178fa;
            width: 6px;
            height: 6px;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            position: absolute;
            bottom: 0;
            left: 1px;
        }

        .layui-layer-btn a {
            font-size: 14px !important;
        }

        .md_ctnt {
            width: 358px;
            height: 190px;
            text-align: center;
            overflow: hidden;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
        }

        .md_ctnt h6 {
            margin-top: 66px;
            font-size: 26px;
            color: #333;
        }

        .md_ctnt p span {
            color: #6178fa;
        }

        .md_ctnt p {
            margin-top: 15px;
            font-size: 16px;
            color: #999;
        }
        
        /*公示入口*/
        .publicity {
            background: url("${rlab}/front/imgs/cxj/Group.png");
            width:414px;
            height:87px;
            position: absolute;
            top: -90px;
            left:50%;
            margin-left: -207px;
            text-align: center;
            line-height:78px;
            font-size: 25px;
            color: #fff;
            cursor: pointer;
        }

        .publicity img {
            position: absolute;
            right: 28px;
            width: 27px;
            height: 17px;
            top: 50%;
            margin-top: -12px;

        }
    </style>
</head>
<body>

<div class="wrapper">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="cxj_content">
        <%--banner开始--%>
        <div class="banner">
            <div class="img_content">
                <img src="${rlab}/front/imgs/cxj/banner-1.png" alt="人人实验创新券海报">
            </div>
        </div>
        <%--banner结束--%>
        <%--创新券宗旨开始--%>
        <div class="outline">
            <div class="outline_content">
                <div class="publicity" onclick="toNoticePage()" style="display: block;">
                    人人创新券公示信息
                    <img src="${rlab}/front/imgs/cxj/rt_to@2x.png" >
                </div>
                <div class="txt">
                    人人创新券由中关村昌平园管委会提供“昌平区小微企业创新创业基地城市示范专项资金”支持，<br>
                    并负责管理、评估和审计，委托人人实验平台具体实施。
                </div>
                <div class="bg"></div>
            </div>
        </div>
        <%--创新券宗旨结束--%>
        <%--扶持对象开始--%>
        <div class="target_user">
            <div class="h2">
                <p>
                    <span>扶持对象</span>
                    <i style=""></i>
                </p>
            </div>
            <div class="txt">
                <p>同时满足以下几项条件的<span>小微企业</span>和<span>创新创业团队</span> ：</p>
                <div>
                    <p><i>1</i>注册资金不高于3000万元</p>
                    <p><i>2</i>在职正式员工不多于100人</p>
                    <p><i>3</i>近两年营业收入均在1000万元以下</p>
                    <p><i>4</i>无不良诚信记录</p>
                </div>
            </div>
        </div>
        <%--扶持对象结束--%>
        <%--扶持额度开始--%>
        <div class="quota">
            <div class="h2">
                <p>
                    <span>扶持额度</span>
                    <i style=""></i>
                </p>
            </div>
            <div class="tables">
                <p class="tr clearfix">
                    <span class="th">申请企业注册地区</span>
                    <span class="th">服务方注册地区</span>
                    <span class="th">扶持比例</span>
                    <span class="th rt_last">额度上限</span>
                </p>
                <p class="tr clearfix">
                    <span class="td">昌平区内</span>
                    <span class="td">昌平区内</span>
                    <span class="td">50%</span>
                    <span class="td rt_last">20万元</span>
                </p>
                <p class="tr clearfix">
                    <span class="td">昌平区内</span>
                    <span class="td">昌平区外</span>
                    <span class="td">40%</span>
                    <span class="td rt_last">20万元</span>
                </p>
                <p class="tr clearfix">
                    <span class="td">昌平区外</span>
                    <span class="td">昌平区内</span>
                    <span class="td">30%</span>
                    <span class="td rt_last">10万元</span>
                </p>
                <p class="tr clearfix">
                    <span class="td btm_last">昌平区外</span>
                    <span class="td btm_last">昌平区外</span>
                    <span class="td btm_last">20%</span>
                    <span class="td btm_last rt_last">5万元</span>
                </p>
            </div>
            <div class="describe">
                <p>
                    <span>使用范围:</span>包括仪器设备共享、测试检测服务、研发设计服务、委托开发服务、合作研发服务、技术解决方案、创新支撑服务等科技创新创业活动。
                </p>
            </div>
            <div class="btm_tit">
                用户向人人实验平台所有合作服务方购买科技服务时可使用
                <p style="font-size: 18px;color: #666;">若项目服务方尚未入驻本平台，可随时推荐其在平台注册并提交相关资料，完成入驻手续</p>
            </div>
        </div>
        <%--扶持额度结束--%>
        <%--使用指南开始--%>
        <div class="guide">
            <div class="h2">
                <p>
                    <span>申请和使用流程</span>
                    <i style=""></i>
                </p>
            </div>
            <div class="qd_content">
                <div class="crosswise" style="color: #333;font-size: 18px;">
                    <img src="${rlab}/front/imgs/cxj/cx_icon_2@1.0.jpg" alt="">
                    <p>发起资格认证申请</p>
                </div>
                <div class="lengthways">
                    <div class="line" style="height: 360px;">
                        <i class="icon_dian" style="top: 0px;left: -2px;"></i>
                        <div class="lft" style="top:36px;">
                            <span>1</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_6@1.0.png" alt="">
                                    <p>进入资格认证申请页面，下载填写</p>
                                    <p><span>企业基本信息表</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="rt" style="top:150px;">
                            <span>2</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_8@1.0.jpg" alt="">
                                    <p>将基本信息表和附件材料</p>
                                    <p><span>提交平台进行审核</span></p>
                                </div>
                                <p class="describe">
                                    1.用户在申请页面上传电子版材料<br>
                                    2.在线审核通过后，将纸版邮寄至人人实验办公地址
                                </p>
                            </div>
                        </div>

                        <div class="lft" style="top:260px;">
                            <span>3</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_1@1.0.jpg" alt="">
                                    <p>审核通过后</p>
                                    <p><span>获得创新券使用资格</span></p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="crosswise" style="margin-top: 18px;color: #333;font-size: 18px;">
                    <img src="${rlab}/front/imgs/cxj/cx_icon_3@1.0.jpg" alt="">
                    <p>发起创新券项目申请</p>
                </div>
                <div class="lengthways">
                    <div class="line" style="height: 360px;">
                        <div class="lft" style="top:36px;">
                            <span>4</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_6@1.0.png" alt="">
                                    <p>进入项目申请页面，下载填写</p>
                                    <p><span>创新券项目申请表</span></p>
                                </div>
                            </div>
                        </div>
                        <div class="rt" style="top:150px;">
                            <span>5</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_8@1.0.jpg" alt="">
                                    <p>将创新券项目申请表</p>
                                    <p><span>提交平台进行审核</span></p>
                                </div>
                                <p class="describe">
                                    1.用户在申请页面上传电子版材料<br>
                                    2.在线审核通过后，将纸版邮寄至人人实验办公地址
                                </p>
                            </div>
                        </div>

                        <div class="lft" style="top:260px;">
                            <span>6</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_7@1.0.jpg" alt="">
                                    <p>审核通过后</p>
                                    <p><span>该项目可使用创新券</span></p>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="crosswise" style="margin-top: 18px;color: #333;font-size: 18px;">
                    <img src="${rlab}/front/imgs/cxj/cx_icon_4@1.0.jpg" alt="">
                    <p>创新券兑现</p>
                </div>
                <div class="lengthways">
                    <div class="line" style="height: 460px;">
                        <%--7--%>
                        <div class="lft" style="top:36px;">
                            <span>7</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_10@1.0.jpg" alt="">
                                    <p>用户、平台与项目服务方</p>
                                    <p><span>三者签订服务合同</span></p>
                                </div>
                                <p class="describe">

                                </p>
                            </div>
                        </div>
                        <%--8--%>
                        <div class="rt" style="top:145px;">
                            <span>8</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_9@1.0.jpg" alt="">
                                    <p>用户将</p>
                                    <p><span>项目费用汇入人人实验账户</span></p>
                                </div>

                            </div>
                        </div>
                        <%--9--%>
                        <div class="lft" style="top:260px;">
                            <span>9</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_14@1.0.jpg" alt="">
                                    <p>项目完成后，用户将</p>
                                    <p>
                                        <span style="font-size: 18px;">项目服务合同、项目成果、交易发票等材料 <br>提交至平台备案</span>
                                    </p>
                                </div>
                                <p class="describe">
                                    1.用户在材料备案页面上传电子版材料<br>
                                    2.在线审核通过后，将纸版邮寄至人人实验办公地址
                                </p>
                            </div>
                        </div>
                        <%--10--%>
                        <div class="rt" style="top:365px;">
                            <span style="left:1px;">10</span>
                            <div class="section">
                                <div class="package">
                                    <img src="${rlab}/front/imgs/cxj/cx_icon_5@1.0.jpg" alt="">
                                    <p>平台将创新券</p>
                                    <p><span>扶持金额汇入用户账户</span></p>
                                </div>
                            </div>
                        </div>
                        <i class="icon_dian" style="bottom: -3px;left: -2px;"></i>
                    </div>
                </div>
                <div style="height: 128px;line-height: 128px;font-size: 22px;color: #333;text-align: center;">
                    注：以上材料均需提供原件或复印件，并加盖公章。
                </div>
                <div style="font-size: 18px;color: #808080;line-height: 30px;padding-left: 48px;">
                    <p>邮寄地址：北京市昌平区回龙观东大街创客广场A座530</p>
                    <p>人人创新券工作小组（收）：010-81708556 &nbsp;&nbsp;&nbsp;13810645981</p>
                </div>
            </div>
        </div>
        <%--使用指南结束--%>
        <div style="text-align: center;margin-bottom: 150px;">
            <c:choose>
                <c:when test="${sessionScope.uid != null}">
                    <button style="color:#fff;width: 264px;line-height: 62px;" type="button" class="init-btn bg-blue" onclick="toCouponPage()">立即申请</button>
                </c:when>
                <c:otherwise>
                    <button style="color:#fff;width: 264px;line-height: 62px;" type="button" class="init-btn bg-blue" onclick="logins();">立即申请</button>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <!--绑定手机号弹窗源码-->
</div>
<!--my common js-->
<%--<div class="md_ctnt" >--%>
<%--<h6>请您登录后下载文件</h6>--%>
<%--<p><span id="timer">3s</span>后自动跳转至登录页</p>--%>
<%--</div>--%>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script>

    function toCouponPage() {
        location.href = BASE_URL + '/coupon/page?source=${source}';
    }

    // 跳转：Notice页面
    function toNoticePage() {
        window.location.href = BASE_URL + "/page/activity/notice";
    }

    function isLogin() {
        var lyerModal;
        var HTML = '<div class="md_ctnt" >\
                        <h6>请您登录后下载文件</h6>\
                        <p><span id="timer">3s</span>后自动跳转至登录页</p>\
                     </div>'
        var layerOption = {
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: false,
            skin: 'yourclass',
            content: HTML
        }
        lyerModal = layer.open(layerOption);
        var index = 3;
        setInterval(function () {
            if (index == 0) {
                logins();
            } else {
                $("#timer").text(--index + 's');
            }
        }, 1000)
    }
</script>
</body>
</html>