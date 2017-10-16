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

    </style>

    <style type="text/css">
        .person_detail{
            margin: 40px 0 0 30px;
            overflow: hidden;
        }
        .page_title{
            font-size: 22px;
            color: #508df0;
        }
        .person_title{
            color: #333;
            font-size: 17px;
        }
        .line{
            background-color: #e9e9e9;
            margin: 20px 40px 0 0;
            height: 1px;
        }
        .data_text{
            margin-top: 30px;
            color: #999;
            font-size: 16px;
            overflow: hidden;
        }
        .data_text .title{
            width: 130px;
            float: left;
        }
        .idcard{
            float: left;
            margin-left: 30px;
            text-align: center;
        }

        .idcard img{
            /*background-color: yellow;*/
            width: 150px;
            height: 100px;
        }

        .idcard p{
            color: #999;
            font-size: 16px;
        }

        .org_logo{
            width: 115px;
            height: 115px;
            margin-top: 30px;
            /*background-color: yellow;*/
            border: 1px solid #f9f9f9;
        }

        .org_image{
            float: left;
            text-align: center;
            margin-right: 30px;
        }

        .org_image img{
            width: 160px;
            height: 110px;
            /*background-color: yellow;*/
        }

        .org_image p{
            font-size: 16px;
            color: #999;
        }

        .button {
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            width: 100px;
            height: 40px;
            background-color: #508DF0;
            font-size: 18px;
            color: white;
            cursor: pointer;
        }

        .shade2{
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.6);
            filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#7f000000,endColorstr=#7f000000);
            position: fixed;
            top:0;
            left: 0;
            z-index: 999;
            display: none;
        }

        .cause{
            width: 525px;
            height: 250px;
            background: white;
            position: absolute;
            top:50%;
            left: 50%;
            margin-top: -125px;
            margin-left: -262.5px;
            font-size: 16px;
            line-height: 35px;
        }

        .closecause{
            text-align: center;
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
            <%--机构法人信息--%>
            <div class="person_detail">
                <div style="overflow: hidden; margin-right: 30px">
                    <p class="page_title" style="float: left">服务商认证详情</p>
                    <button class="button" style="float: right" type="button" onclick="toAlter()">
                        修改
                    </button>
                </div>

                <div style="overflow: hidden; margin-top: 50px; margin-right: 30px">
                    <p class="person_title" style="float: left">机构法人信息</p>
                    <div style="float: right">
                        <p style="float: left; color: #999; font-size: 14px">对接方：<span style="color: #333">${orgInfo.orgBizName == null ? "人人实验" : orgInfo.orgBizName}</span></p>
                        <div style="float: left; background-color: #ccc; width: 1px; height: 22px; margin-left: 20px"></div>
                        <p style="float: left; margin-left: 20px; color: #999;  font-size: 14px">审核状态：<span style="color: #333">${orgInfo.orgIdentificationStr}</span></p>
                        <c:if test="${orgInfo.orgIdentification == 3}">
                            <div style="float: left; margin: -2px 0 0 5px"><i class="lab-gantanhao" style="color: #508DF0; cursor: pointer" onclick="showReason()"></i></div>
                        </c:if>
                    </div>
                </div>
                <div class="line"></div>
                <div class="data_text">
                    <p class="title">真实姓名:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.orgPerson}</p>
                </div>
                <div class="data_text">
                    <p class="title">身份证号码:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.identificationNumber}</p>
                </div>
                <div style="margin-top: 30px;">
                    <div style="float: left">
                        <p style="color: #999; font-size: 16px">
                            身份证照片
                            :
                        </p>
                    </div>
                    <div class="idcard">
                        <img src="${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.legalPersonPic1}">
                        <p>身份证正面</p>
                    </div>
                    <div class="idcard">
                        <img src="${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.legalPersonPic2}">
                        <p>身份证背面</p>
                    </div>
                </div>
            </div>

            <%--机构信息--%>
            <div class="person_detail">
                <p class="person_title" style="margin-top: 0px">机构信息</p>
                <div class="line"></div>
                <div>
                    <p class="data_text">
                        机构Logo
                        :
                    </p>
                    <c:if test="${!empty orgInfo.orgLogo}">
                        <img class="org_logo" src="${orgInfo.orgLogo}">
                    </c:if>
                    <c:if test="${empty orgInfo.orgLogo}">
                        <img class="org_logo" src="${rlab}/front/imgs/icon/org_logo_default.png">
                    </c:if>
                </div>
                <div>
                    <p class="data_text">
                        机构材料
                        :
                    </p>
                    <div style="overflow: hidden; margin-top: 30px">
                        <div class="org_image">
                            <img src="${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.orgLicensePic}">
                            <p>营业执照副本</p>
                        </div>
                        <c:if test="${orgInfo.orgCodeObject.orgCodePic != null && !''.equals(orgInfo.orgCodeObject.orgCodePic)}">
                            <div class="org_image">
                                <img src="${orgInfo.orgCodeObject.orgCodePic}">
                                <p>组织机构代码证</p>
                            </div>
                        </c:if>
                        <c:if test="${orgInfo.orgLicense.taxEnrolCertificatePic != null && !''.equals(orgInfo.orgLicense.taxEnrolCertificatePic)}">
                            <div class="org_image">
                                <img src="${orgInfo.orgLicense.taxEnrolCertificatePic}">
                                <p>税务登记证</p>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="data_text">
                    <p class="title">机构名称:</p>
                    <p style="color: #333; font-size: 16px; float: left; width: 700px">${orgInfo.orgName}</p>
                </div>
                <div class="data_text">
                    <p class="title">组织机构代码:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgCode}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构性质:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgCategory}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构注册地:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgAddress.orgAddrStreet}</p>
                </div>
                <div class="data_text">
                    <p class="title">详细地址:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgAddress.orgAddrStreet}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构经纬度:</p>
                    <p style="color: #333; font-size: 16px; float: left">东经 ${orgInfo.orgAddress.orgAddrLatitude} 北纬 ${orgInfo.orgAddress.orgAddrLongitude}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构座机:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgContacts.conPhone}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构邮编:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgAddress.orgZipcode}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构网址:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgWeb}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构传真:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgContacts.conFax}</p>
                </div>
                <div class="data_text">
                    <p class="title">机构邮箱:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgContacts.conEmail}</p>
                </div>
                <div class="data_text">
                    <p class="title">联系方式:</p>
                    <p style="color: #333; font-size: 16px; float: left">
                        <c:forEach items="${orgInfo.orgContactsList}" var="item">
                            ${item.conName} ${item.conPhone}
                        </c:forEach>
                    </p>
                </div>
                <div class="data_text">
                    <p class="title">机构来源:</p>
                    <p style="color: #333; font-size: 16px; float: left">${orgInfo.orgSourceStr}</p>
                </div>
                <div>
                    <p class="data_text">
                        机构资质
                        :
                    </p>
                    <div style="overflow: hidden; margin-top: 30px">
                        <c:forEach items="${orgInfo.orgCertificateList}" var="item">
                            <div class="org_image">
                                <img src="${item.orgCertificatePic}" style="width: 120px; height: 170px">
                                <p>${item.orgCertificateName}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="data_text">
                    <p class="title">机构简介:</p>
                    <br>
                    <p style="color: #333; font-size: 16px; float: left; width: 760px">
                        ${orgInfo.orgDescription}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <div class="shade2">
        <div class="cause" style="text-align: center">
            <div style="margin: 30px 30px 0 30px;">
                <p style=" text-align: left; height: 150px; overflow: hidden">拒绝原因：${orgInfo.rejectReason}</p>
            </div>

                <button class="closecause button"><a onclick="closecause()">我知道了</a></button>
        </div>
    </div>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
<script type="text/javascript">
    function showReason() {
        $(".shade2").show();
    }
    function closecause() {
        $(".shade2").hide();
    }
    function toAlter() {
        location.href = BASE_URL + "/front/provider/modify/${orgInfo.orgOid}";
    }
</script>
</body>
</html>
