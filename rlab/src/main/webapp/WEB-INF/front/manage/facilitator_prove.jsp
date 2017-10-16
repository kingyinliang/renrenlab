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
    <%--<script src="${rlab}/front/assets/md5/jquery.md5.js"></script>--%>
    <script src="${rlab}/front/js/view/jq.form.js"></script>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

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
            padding-top: 38px;
            padding: 38px 30px 0px 35px;
            margin-bottom: 257px;
        }

        /*END 内容部分公用样式*/
        /*服务商认证*/
        .user_main h4.tit {
            font-size: 22px;
            line-height: 62px;
            color: #508DF0;
        }

        .secent_tit {
            font-size: 17px;
            color: #4E4E4E;
            line-height: 57px;
            border-bottom: 1px solid #f5f5f5;
        }

        .user_main div.item {
            padding-left: 114px;
            position: relative;
            min-height: 48px;
            margin-top: 20px;

        }

        .user_main div.item > span {
            line-height: 38px;
            height: 38px;
            position: absolute;
            left: 0;
            top: 0;
            font-size: 16px;
            color: #999;
        }

        .user_main div.item > span > em {
            color: #f84141;
        }

        /*输入框基本样式公用*/
        .ipt_base {
            color: #333;
            border: solid 1px #e3e3e3;
            height: 38px;
            line-height: 38px;
            padding-left: 7px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .user_main div.item .layui-input {
            color: #333;
            border: solid 1px #e3e3e3;
            height: 38px;
            line-height: 38px;
            padding-left: 7px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .user_main div.item .layui-form-select dl {
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
        }

        .layui-form-select dl dd.layui-this {
            background: #508df0 !important;
        }

        /*IE9下placehodle*/
        span.placehodle {
            height: 38px !important;
            line-height: 38px !important;

        }

        .zz_add span.placehodle {
            font-size: 12px;
            overflow: hidden;
            line-height: 32px;
            height: 32px;
        }

        /*机构简介*/
        .org_intro {
            width: 508px;
            /*height: 231px;*/
        }

        .org_intro .layui-layedit {
            border: 1px solid rgba(221, 221, 221, 1);
            /*height: 245px;*/
        }

        .org_intro .layui-layedit textarea {
            color: #333;
        }

        /*身份证照片*/
        .item > .logo_box {
            /*width: 115px;*/
            /*height: 115px;*/
            overflow: hidden;
        }

        .item > .logo_box > label {
            width: 115px;
            height: 115px;
        }

        .item > .logo_box img {
            width: 115px;
            height: 115px;
        }

        /*身份证照片*/
        .identity_box {
            overflow: hidden;
        }

        .identity_box > .img_item {
            float: left;
            margin-right: 12px;
        }

        .identity_box > .img_item > i {
            line-height: 40px;
            font-size: 15px;
            color: #999;
            text-align: center;
            display: block;
            width: 100%;
        }

        .identity_box label {

        }

        .identity_box img {
            width: 161px;
            height: 95px;
        }

        /*公用图片上传lable*/
        label.ipt_lable {
            position: relative;
            display: block;
            overflow: hidden;
            cursor: pointer;
        }

        label.ipt_lable span {
            cursor: pointer;
            position: absolute;
            z-index: 999;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            background: url("${rlab}/front/imgs/opaque.png") no-repeat 100% 100%;
            background-size: 100% 100%;
            cursor: pointer;
        }

        label.ipt_lable img {
            z-index: 2;
        }

        label.ipt_lable input {
            position: absolute;
            top: -50px;
            left: 0;
        }

        /*机构营业执照*/
        .org_license {
            overflow: hidden;
        }

        .org_license .radio_swift {
            height: 38px;
            line-height: 38px;
            position: relative;
            padding-left: 20px;
        }

        .org_license .radio_swift > label {
            position: absolute;
            left: 0;
            top: 50%;
            margin-top: -7px;
            color: #999;

        }

        .org_license .radio_swift > span {
            color: #777;
        }

        .org_license div.img_item {
            float: left;
            margin-right: 16px;
        }

        .org_license div.img_item > i {
            display: block;
            text-align: center;
            height: 40px;
            line-height: 40px;
            color: #999;
        }

        .org_license div.img_item > label {
            width: 164px;
            height: 115px;

        }

        .org_license div.img_item img {
            width: 100%;
            height: 100%;
        }

        /*地址下拉*/
        .ad_new_item {
            width: 140px;
            float: left;
            margin-right: 16px;
        }

        .user_main div.item .ad_new_item .layui-form-select dl {
            width: 130px !important;
        }

        /*切换按钮*/
        label.ckbox {
            display: block;
            position: relative;
            width: 14px;
            height: 14px;
            overflow: hidden;
            cursor: pointer;
        }

        label.ckbox input {
            position: absolute;
            left: -100px;
            top: 0;
        }

        label.checkbox_cancel {
        <%--background: url("${rlab}/mobile/imgs/icon/meigouxuan.png") no-repeat 0px 0px/14px 14px;--%><%--background: url("${rlab}/mobile/imgs/icon/meigouxuan.png") no-repeat 0px 0px;--%> background: url("${rlab}/common/common_img/icon/meigouxuan.png") no-repeat 0px 0px;
        }

        label.checkbox_checked {
        <%--background: url("${rlab}/mobile/imgs/icon/gouxuan.png") no-repeat 0px 0px/14px 14px;--%> background: url("${rlab}/common/common_img/icon/gouxuan.png") no-repeat 0px 0px;
        }

        /*增减ICON*/
        span.icon_box {
            font-size: 24px;
            cursor: pointer;
            overflow: hidden;
            display: block;
        }

        .icon_box > i.up_icon {
            color: #49aaff;
            display: block;
            float: left;
            line-height: 40px;
            margin-right: 12px;
            margin-left: 12px;
        }

        .icon_box > i.down_icon {
            color: #e0e0e0;
            display: block;
            float: left;
            line-height: 40px;
        }

        /*机构座机*/
        .org_call {
            max-width: 690px;
            overflow: hidden;

        }

        .org_call input {
            margin-right: 18px;
            width: 198px;
            float: left;
            margin-bottom: 10px;
        }

        /*机构联系方式*/
        .org_person {
            overflow: hidden;
        }

        .org_person > .person_item {
            overflow: hidden;
            margin-bottom: 16px;
        }

        .org_person > .person_item > .icon_box {
            text-align: center;
        }

        .org_person > .person_item > .person_phone {
            float: left;
            position: relative;
            max-width: 180px;
        }

        .person_item > .person_phone > div {
            float: left;
            margin-bottom: 25px;
            position: relative;
        }

        .person_item > .person_phone > div > s.error_tip {
            position: absolute;
            right: -145px;
            line-height: 38px;
        }

        .person_item > .person_name {
            position: relative;
            float: left;
        }

        .person_item > .person_name > s.error_tip {
            position: absolute;
            bottom: -24px;
            left: 0;
        }

        /*提示公用部分*/
        s.error_tip {
            font-size: 12px;
            color: #f84141;
        }

        /*机构资质*/
        .org_zz {

        }

        .org_zz .zz_ctro {
            height: 48px;
            overflow: hidden;

        }

        .org_zz .zz_ctro > button {
            width: 140px;
            height: 48px;
            background: #49aaff;
            color: #fff;
            outline: 0 none;
            border: 0 none;
            float: left;
            margin-right: 30px;
            cursor: pointer;
        }

        .org_zz .zz_ctro > button:active {
            background: #3e72c0;
        }

        .org_zz .zz_ctro > span {
            display: block;
            float: left;
            font-size: 12px;
            color: #c7c7c7;
            line-height: 18px;
            vertical-align: bottom;
            padding-top: 9px;
        }

        .org_zz .zz_box {
            margin-top: 29px;
            overflow: hidden;
        }

        .org_zz .zz_box > .img_item {
            float: left;
            margin-right: 12px;
        }

        .org_zz .zz_box > .img_item > i {
            line-height: 40px;
            height: 40px;
            text-align: center;
            display: block;
        }

        .org_zz .zz_box > .img_item > label {
            width: 163px;
            height: 115px;
        }

        .org_zz .zz_box > .img_item img {
            width: 100%;
            height: 100%;
        }

        /*提交申请*/
        .cfm {
            text-align: center;
            padding-top: 35px;
            padding-bottom: 40px;
        }

        .cfm button {
            width: 142px;
            height: 49px;
            line-height: 49px;
            background-color: #49aaff;
            /*box-shadow: 0px 4px 20.2px 4.8px rgba(73, 170, 255, 0.38);*/
            border: 0 none;
            outline: 0 none;
            color: #fff;
            cursor: pointer;
        }

        .cfm button:active {
            background: #3e72c0;
        }

        /*机构来源*/
        .error_tip {

        }

        /*START 资质弹窗*/
        .zz_modal {
            width: 560px;
            padding: 0 38px;
        }

        .zz_modal .zz_title {
            height: 86px;
            line-height: 86px;
            color: #508DF0;
            font-size: 20px;
        }

        .zz_modal > .zz_main {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .zz_modal > .zz_main > .zz_xiao_main {
            height: 230px;
            overflow: auto;
            position: absolute;
            top: -12px;
            right: -8px;
        }

        .zz_modal > .zz_main ul {
            list-style: none;
            overflow: hidden;
        }

        .zz_modal > .zz_main ul > li {
            height: 44px;
            line-height: 44px;
            position: relative;
            padding-left: 20px;
            width: 150px;
            float: left;
            margin-bottom: 20px;
        }

        .zz_modal > .zz_main ul > li > label {
            position: absolute;
            left: 0;
            top: 50%;
            margin-top: -7px;
        }

        .zz_modal > .zz_add {

        }

        .zz_modal > .zz_add > .add {
            line-height: 48px;
            height: 48px;
            font-size: 14px;
            color: #333;

        }

        .zz_modal > .zz_add > .ipt {

        }

        .zz_modal > .zz_add > .ipt input {
            line-height: 32px;
            height: 32px;
            padding-left: 5px;
            border: 0 none;
            outline: 0 none;
            font-size: 14px;
            border: 1px solid #e0e0e0;
            color: #4E4E4E;
        }

        .zz_modal > .zz_add > .ipt span {
            height: 32px;
            line-height: 32px;
            color: #508DF0;
            width: 76px;
            text-align: center;
            display: inline-block;
            cursor: pointer;
        }

        .zz_modal > .zz_btn {
            padding-top: 76px;
            padding-bottom: 52px;
            text-align: center;
        }

        .zz_modal > .zz_btn button:active {
            opacity: 0.5;
        }

        .zz_modal > .zz_btn button {
            width: 88px;
            outline: 0 none;
            border: 0 none;
            height: 34px;
            line-height: 34px;
            cursor: pointer;

        }

        /*覆盖*/
        .my_zz_modal {
            width: 560px !important;
            height: auto !important;
        }

        /*START 资质弹窗*/
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
        <div class="user_main">

            <h4 class="tit">服务商认证申请</h4>
            <div class="secent_tit">
                机构法人信息
            </div>
            <%--真实姓名--%>
            <div class="item">
                <span>真实姓名<em>*</em>：</span>
                <input id="uName" maxlength="10" class="ipt_base" type="text" placeholder="请输入真实姓名" style="float: left">
                <s id="uNameTip" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">请输入真实姓名</s>
            </div>
            <%--身份证号--%>
            <div class="item">
                <span>身份证号码<em>*</em>：</span>
                <input id="uIdCard" class="ipt_base" type="text" maxlength="18" placeholder="请输入真实身份证号"
                       style="float: left">
                <s id="uIdCardTip" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">请输入真实姓名</s>
            </div>
            <%--身份证照片--%>
            <div class="item">
                <span>身份证照片<em>*</em>：</span>
                <div class="identity_box">
                    <div class="img_item">
                        <label class="ipt_lable">
                            <span></span>
                            <img id="idCardFront" src="${rlab}/front/imgs/icon/2_2/add_type3.png" alt="">
                            <form method="post" enctype="multipart/form-data">
                                <input id="idCardFrontInput" data-load-type="0"
                                       data-spin="${rlab}/front/imgs/icon/2_2/add_type3_loading.gif"
                                       type="file" name="file"
                                       onchange="uploadLogos(this)"
                                       onclick="clearErrorTipIdCard(this)">
                            </form>
                        </label>
                        <i>身份证正面</i>
                    </div>
                    <div class="img_item">
                        <label class="ipt_lable">
                            <span></span>
                            <img id="idCardVerso" src="${rlab}/front/imgs/icon/2_2/add_type3.png" alt="">
                            <form method="post" enctype="multipart/form-data">
                                <input id="idCardVersoInput" data-load-type="0"
                                       data-spin="${rlab}/front/imgs/icon/2_2/add_type3_loading.gif"
                                       type="file" name="file" onchange="uploadLogos(this)"
                                       onclick="clearErrorTipIdCard(this)">
                            </form>
                        </label>
                        <i>身份证反面</i>
                    </div>
                    <s id="idCardTip" class="error_tip rt_tip"
                       style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请上传身份证照片</s>
                </div>
            </div>
            <%--机构信息--%>
            <div class="secent_tit">
                机构信息
            </div>
            <%--机构logo--%>
            <div class="item">
                <span>机构logo：</span>
                <div class="logo_box">
                    <label class="ipt_lable" style="float: left">
                        <span></span>
                        <img id="logoImg" src="${rlab}/front/imgs/icon/2_2/add_type1.png" alt="">
                        <form method="post" enctype="multipart/form-data">
                            <input id="logoInput" data-load-type="0"
                                   data-spin="${rlab}/front/imgs/icon/2_2/add_type1_loading.gif"
                                   type="file" name="file" onchange="uploadLogos(this)" onclick="clearLogoTip(this)">
                        </form>
                    </label>
                    <s id="logoErrorTip" class="error_tip rt_tip"
                       style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请上传机构logo</s>
                </div>
            </div>
            <%--机构材料--%>
            <div class="item">
                <span>机构材料<em>*</em>：</span>
                <div class="org_license">
                    <div class="radio_swift">
                        <label class="ckbox checkbox_cancel">
                            <input id="szhy" type="checkbox" onclick="changeCheck(this)" onchange="slideUp(this)">
                        </label>
                        <span>三证合一</span>
                        <s id="orgInfoErrorTip" class="error_tip rt_tip"
                           style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请补全机构材料</s>
                    </div>
                    <div>
                        <div id="orgPapers1" class="img_item">
                            <label class="ipt_lable">
                                <span></span>
                                <img id="orgCard1Img" src="${rlab}/front/imgs/icon/2_2/add_type3.png" alt="">
                                <form method="post" enctype="multipart/form-data">
                                    <input id="orgCard1Input" data-load-type="0"
                                           data-spin="${rlab}/front/imgs/icon/2_2/add_type3_loading.gif"
                                           type="file" name="file" onchange="uploadLogos(this)"
                                           onclick="clearErrorPaper(this)">
                                </form>
                            </label>
                            <i>营业执照副本<em style="color: #f84141;">*</em></i>
                        </div>
                        <div id="orgPapers2" class="img_item">
                            <label class="ipt_lable">
                                <span></span>
                                <img id="orgCard2Img" src="${rlab}/front/imgs/icon/2_2/add_type3.png" alt="">
                                <form method="post" enctype="multipart/form-data">
                                    <input id="orgCard2Input" data-load-type="0"
                                           data-spin="${rlab}/front/imgs/icon/2_2/add_type3_loading.gif"
                                           type="file" name="file" onchange="uploadLogos(this)"
                                           onclick="clearErrorPaper(this)"
                                    >
                                </form>
                            </label>
                            <i>组织机构代码证<em style="color: #f84141;">*</em></i>
                        </div>
                        <div id="orgPapers3" class="img_item">
                            <label class="ipt_lable">
                                <span></span>
                                <img id="orgCard3Img" src="${rlab}/front/imgs/icon/2_2/add_type3.png" alt="">
                                <form method="post" enctype="multipart/form-data">
                                    <input id="orgCard3Input" data-load-type="0"
                                           data-spin="${rlab}/front/imgs/icon/2_2/add_type3_loading.gif"
                                           type="file" name="file" onchange="uploadLogos(this)"
                                           onclick="clearErrorPaper(this)">
                                </form>
                            </label>
                            <i>税务登记证<em style="color: #f84141;">*</em></i>
                        </div>
                    </div>
                </div>
            </div>
            <%--机构名称--%>
            <div class="item">
                <span>机构名称<em>*</em>：</span>
                <input id="orgName" maxlength="100" class="ipt_base" type="text" placeholder="请输入机构名称"
                       style="float: left;">
                <s id="orgNameTip" class="error_tip rt_tip"
                   style="line-height: 38px;margin-left: 10px;display: none;float: left">请输入机构名称</s>
            </div>
            <%--组织机构代码--%>
            <div class="item">
                <span>组织机构代码<em>*</em>:</span>
                <input id="orgCode" class="ipt_base" type="text" placeholder="请输入组织机构代码" style="float: left;">
                <s id="orgCodeTip" class="error_tip rt_tip"
                   style="line-height: 38px;margin-left: 10px;display: none;float: left">请输入组织机构代码</s>
            </div>
            <%--机构性质--%>
            <div class="item">
                <span>机构性质<em>*</em>：</span>
                <div class="layui-form" style="width: 198px;float: left;">
                    <select id="orgNature" name="city" lay-verify="" lay-filter="orgNature">
                        <option value="">请选择...</option>
                        <option value="1">科研院所</option>
                        <option value="2">高等院校</option>
                        <option value="3">国有企业</option>
                        <option value="4">民营企业</option>
                        <option value="5">第三方检测</option>
                        <option value="99">其他</option>
                    </select>
                </div>
                <s id="orgNatureTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请选择机构性质</s>
            </div>
            <%--机构注册地--%>
            <div class="item">
                <span>机构注册地<em>*</em>：</span>
                <div class="" style="float: left;">
                    <%--省--%>
                    <div class="ad_new_item layui-form" style="">
                        <select id="province_1" name="quiz1" lay-filter="province1" style="width: 114px;">
                            <option value="">请选择省</option>
                            <option value="北京市" data-province-id="110000">北京市</option>
                            <option value="天津市" data-province-id="120000">天津市</option>
                            <option value="河北省" data-province-id="130000">河北省</option>
                            <option value="山西省" data-province-id="140000">山西省</option>
                            <option value="内蒙古自治区" data-province-id="150000">内蒙古自治区</option>
                            <option value="辽宁省" data-province-id="210000">辽宁省</option>
                            <option value="吉林省" data-province-id="220000">吉林省</option>
                            <option value="黑龙江省" data-province-id="230000">黑龙江省</option>
                            <option value="上海市" data-province-id="310000">上海市</option>
                            <option value="江苏省" data-province-id="320000">江苏省</option>
                            <option value="浙江省" data-province-id="330000">浙江省</option>
                            <option value="安徽省" data-province-id="340000">安徽省</option>
                            <option value="福建省" data-province-id="350000">福建省</option>
                            <option value="江西省" data-province-id="360000">江西省</option>
                            <option value="山东省" data-province-id="370000">山东省</option>
                            <option value="河南省" data-province-id="410000">河南省</option>
                            <option value="湖北省" data-province-id="420000">湖北省</option>
                            <option value="湖南省" data-province-id="430000">湖南省</option>
                            <option value="广东省" data-province-id="440000">广东省</option>
                            <option value="广西壮族自治区" data-province-id="450000">广西壮族自治区</option>
                            <option value="海南省" data-province-id="460000">海南省</option>
                            <option value="重庆市" data-province-id="500000">重庆市</option>
                            <option value="四川省" data-province-id="510000">四川省</option>
                            <option value="贵州省" data-province-id="520000">贵州省</option>
                            <%--${'云南省'.equals(orgInfo.orgAddress.orgAddrProvince)?'selected':''--%>
                            <option value="云南省" data-province-id="530000">云南省</option>
                            <option value="西藏自治区" data-province-id="540000">西藏自治区</option>
                            <option value="陕西省" data-province-id="610000">陕西省</option>
                            <option value="甘肃省" data-province-id="620000">甘肃省</option>
                            <option value="青海省" data-province-id="630000">青海省</option>
                            <option value="宁夏回族自治区" data-province-id="640000">宁夏回族自治区</option>
                            <option value="新疆维吾尔自治区" data-province-id="650000">新疆维吾尔自治区</option>
                        </select>
                    </div>
                    <%--市--%>
                    <div class="ad_new_item layui-form">
                        <select id="city_1" name="quiz2" lay-filter="city1">
                            <option value="">请选择市</option>
                        </select>
                    </div>
                    <%--区--%>
                    <div class="ad_new_item layui-form">
                        <select id="county_1" name="quiz3" lay-filter="county1">
                            <option value="">请选择县/区</option>
                        </select>
                    </div>
                </div>
                <s id="orgAd1Tip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请补全机构注册地址</s>
            </div>
            <%--机构注册详细地址--%>
            <div class="item">
                <span>详细地址<em>*</em>：</span>
                <input id="orgDetail_1" class="ipt_base" maxlength="100" type="text" placeholder="请输入详细地址"
                       style="float: left;">
                <s id="orgDetailTip1" class="error_tip rt_tip"
                   style="line-height: 38px;margin-left: 10px;display: none ;float: left">请输入注册地详细地址</s>
            </div>
            <%--机构所在地--%>
            <div class="item">
                <span>机构所在地<em>*</em>：</span>
                <div class="" style="float: left;">
                    <%--省--%>
                    <div class="ad_new_item layui-form" style="">
                        <select id="province_2" name="quiz1" lay-filter="province2" style="width: 114px;">
                            <option value="">请选择省</option>
                            <option value="北京市" data-province-id="110000">北京市</option>
                            <option value="天津市" data-province-id="120000">天津市</option>
                            <option value="河北省" data-province-id="130000">河北省</option>
                            <option value="山西省" data-province-id="140000">山西省</option>
                            <option value="内蒙古自治区" data-province-id="150000">内蒙古自治区</option>
                            <option value="辽宁省" data-province-id="210000">辽宁省</option>
                            <option value="吉林省" data-province-id="220000">吉林省</option>
                            <option value="黑龙江省" data-province-id="230000">黑龙江省</option>
                            <option value="上海市" data-province-id="310000">上海市</option>
                            <option value="江苏省" data-province-id="320000">江苏省</option>
                            <option value="浙江省" data-province-id="330000">浙江省</option>
                            <option value="安徽省" data-province-id="340000">安徽省</option>
                            <option value="福建省" data-province-id="350000">福建省</option>
                            <option value="江西省" data-province-id="360000">江西省</option>
                            <option value="山东省" data-province-id="370000">山东省</option>
                            <option value="河南省" data-province-id="410000">河南省</option>
                            <option value="湖北省" data-province-id="420000">湖北省</option>
                            <option value="湖南省" data-province-id="430000">湖南省</option>
                            <option value="广东省" data-province-id="440000">广东省</option>
                            <option value="广西壮族自治区" data-province-id="450000">广西壮族自治区</option>
                            <option value="海南省" data-province-id="460000">海南省</option>
                            <option value="重庆市" data-province-id="500000">重庆市</option>
                            <option value="四川省" data-province-id="510000">四川省</option>
                            <option value="贵州省" data-province-id="520000">贵州省</option>
                            <%--${'云南省'.equals(orgInfo.orgAddress.orgAddrProvince)?'selected':''--%>
                            <option value="云南省" data-province-id="530000">云南省</option>
                            <option value="西藏自治区" data-province-id="540000">西藏自治区</option>
                            <option value="陕西省" data-province-id="610000">陕西省</option>
                            <option value="甘肃省" data-province-id="620000">甘肃省</option>
                            <option value="青海省" data-province-id="630000">青海省</option>
                            <option value="宁夏回族自治区" data-province-id="640000">宁夏回族自治区</option>
                            <option value="新疆维吾尔自治区" data-province-id="650000">新疆维吾尔自治区</option>
                        </select>
                    </div>
                    <%--市--%>
                    <div class="ad_new_item layui-form">
                        <select id="city_2" name="quiz2" lay-filter="city2">
                            <option value="">请选择市</option>
                        </select>
                    </div>
                    <%--区--%>
                    <div class="ad_new_item layui-form">
                        <select id="county_2" name="quiz3" lay-filter="county2">
                            <option value="">请选择县/区</option>
                        </select>
                    </div>

                </div>
                <s id="orgAd2Tip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请补全机构所在地址</s>
            </div>
            <%--机构所在地详细地址--%>
            <div class="item">
                <span>详细地址<em>*</em>：</span>
                <input id="addressDetail_2" onblur="updateJingWeiDu()" maxlength="100" class="ipt_base" type="text"
                       placeholder="请输入详细地址" style="float: left;">
                <s id="orgDetailTip2" class="error_tip rt_tip"
                   style="line-height: 38px;margin-left: 10px;display: none;float: left">请输入所在地详细地址</s>
            </div>
            <%--机构所在地地址经纬度--%>
            <div class="item">
                <span>地址经纬度<em>*</em>：</span>
                <input onfocus="clearLatTip()" id="longitude2" class="ipt_base" type="text" placeholder="东经"
                       style="width: 100px;float: left;margin-right: 15px">
                <input onfocus="clearLatTip()" id="latitude2" class="ipt_base" type="text" placeholder="北纬" style="width: 100px;float: left;;">
                <s id="orgJWD2" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请补全经纬度</s>
            </div>
            <%--机构座机--%>
            <div class="item">
                <span>机构座机：</span>
                <div id="addCall" class="org_call">
                    <input onclick="clearFixedPhoneTip()" class="ipt_base" type="text" placeholder="请输入机构座机">
                    <span id="addCallBtn" class="icon_box" style="float: left;">
                        <i class="up_icon lab-add_type1" onclick="addCallRow()"></i>
                        <i class="down_icon lab-del_type1" onclick="delCallRow()"></i>
                    </span>
                    <s id="fixedPhoneErrorTip" class="error_tip rt_tip"
                       style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">座机格式错误</s>
                </div>
            </div>
            <%--机构邮编--%>
            <div class="item">
                <span>机构邮编：</span>
                <input id="orgPostcode" class="ipt_base" type="text" placeholder="请输入机构邮编">
                <s id="orgPostCodeTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请输入正确的邮编格式</s>
            </div>
            <%--机构网址--%>
            <div class="item">
                <span>机构网址：</span>
                <input id="orgWeb" class="ipt_base" type="text" placeholder="请输入机构网址">
                <s id="orgWebTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请输入正确的机构网址</s>
            </div>
            <%--机构传真--%>
            <div class="item">
                <span>机构传真：</span>
                <input id="orgFax" class="ipt_base" type="text" placeholder="请输入机构传真">
                <s id="orgFaxTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">传真号码格式错误</s>
            </div>
            <%--机构邮箱--%>
            <div class="item">
                <span>机构邮箱：</span>
                <input id="orgEmail" maxlength="50" class="ipt_base" type="text" placeholder="请输入机构邮箱">
                <s id="orgEmailTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">邮箱格式错误</s>
            </div>
            <%--联系方式--%>
            <div class="item">
                <span>联系方式<em>*</em>：</span>
                <div class="org_person" id="orgPeople">
                    <%--联系人1--%>
                    <div class="person_item">
                        <div class="person_name">
                            <input class="ipt_base" type="text" style="float: left;" placeholder="联系人姓名">
                            <s class="error_tip name_error_tip" style="display:none;right:-232px;">请输入姓名</s>
                        </div>
                        <span class="icon_box" style="float: left;">
                            <i class="up_icon lab-add_type1" onclick="addPersonRow()"></i>
                            <%--<i class="down_icon lab-addicon"></i>--%>
                         </span>
                        <%--联系人电话号码--%>
                        <div class="person_phone">
                            <div>
                                <input class=" ipt_base" type="text" placeholder="联系人号码" style="float: left;">
                                <s class="error_tip phone_error_tip" style="display:none;right:-197px;">请输入正确的手机号码</s>
                            </div>
                            <span class="icon_box" style="position: absolute;right: -68px;top: 0">
                                 <i class="up_icon lab-add_type1" onclick="addPersonPhone(this)"></i>
                                 <i class="down_icon lab-del_type1" onclick="delPersonPhone(this)"></i>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <%--机构来源--%>
            <div class="item">
                <span>机构来源<em>*</em>：</span>
                <div class="layui-form" style="width: 198px;float: left;">
                    <select id="orgOrigin" name="city" lay-verify="" lay-filter="orgOrigin">
                        <option value="">请选择机构来源</option>
                        <option value="0">线下活动</option>
                        <option value="1">运营拓展</option>
                        <option value="2">线上平台</option>
                    </select>
                </div>
                <s id="orgOriginTip" class="error_tip rt_tip"
                   style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请选择机构来源</s>
            </div>
            <%--机构资质--%>
            <div class="item">
                <span>机构资质：</span>
                <div class="org_zz">
                    <div class="zz_ctro">
                        <button type="button" onclick="choseTagFactory()">请选择资质</button>
                        <span>
                            图片大小限制5M内<br/>
                            支持格式jpg、jpeg、png、bmp
                        </span>
                        <s id="zzTip" class="error_tip rt_tip"
                           style="display:none;bottom: 2px;line-height: 72px;margin-left: 10px;">请补全相关资质图片</s>
                    </div>
                    <div id="identifyList" class="zz_box">
                        <%--<div class="img_item">--%>
                        <%--<label class="ipt_lable">--%>
                        <%--<span></span>--%>
                        <%--<img data-load-type="0" src="${rlab}/front/imgs/icon/2_2/add_type2.png" alt="">--%>
                        <%--<input type="file">--%>
                        <%--</label>--%>
                        <%--<i>资质1</i>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <%--机构简介--%>
            <div class="item" onclick="clearIntroTip()">
                <span>机构简介<em>*</em>：</span>
                <div class="org_intro">
                    <textarea class="layui-textarea" id="LAY_demo1" style="display: none"></textarea>
                    <s id="orgIntroTip" class="error_tip rt_tip"
                       style="display:none;height: 38px;line-height: 38px;">机构简介不能为空</s>
                </div>
            </div>
            <%--提交申请--%>
            <div class="cfm">
                <button type="button" onclick="putFormToService()">提交申请</button>
            </div>
        </div>

    </div>
    <div id="baidumap"></div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
<%--<script src="${rlab}/front/js/view/facilitator_prove.js"></script>--%>
<script type="text/javascript">
    var layer, layedit, ditIndex;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;
        // 监听省1（注册地）
        form.on('select(province1)', function (data) {
            $("#orgAd1Tip").hide();// 隐藏error提示

            $("#city_1").html('<option value="">请选择市</option>'); // 初始化市
            $("#county_1").html('<option value="">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province_1").find("option:selected").data("provinceId");
            dealProvinceId(provinceId, function (cityList) {
                fillCity1(cityList);
            });

        });

        // 监听市1（注册地）
        form.on('select(city1)', function (data) {
            $("#orgAd1Tip").hide();// 隐藏error提示
            if (!data.value || data.value == 0) {
                return false;
            }


            $("#county_1").html('<option value="">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city_1").find("option:selected").data("cityId");
            getCity(cityId, function (countyList) {
                fillCounty1(countyList);
            })
        });

        // 监听县1（注册地）
        form.on('select(county1)', function (data) {
            $("#orgAd1Tip").hide();// 隐藏error提示

        });

        // 监听省2（所在地）
        form.on('select(province2)', function (data) {
            $("#orgAd2Tip").hide();// 隐藏error提示


            // 更新经纬度
            var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
            if (!flag) {
                searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
            }
            $("#orgJWD2").hide();

            $("#city_2").html('<option value="">请选择市</option>'); // 初始化市
            $("#county_2").html('<option value="">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province_2").find("option:selected").data("provinceId");

            dealProvinceId(provinceId, function (cityList) {
                fillCity2(cityList);
            });

        });

        // 监听市2（所在地）
        form.on('select(city2)', function (data) {
            $("#orgAd2Tip").hide();// 隐藏error提示

            if (!data.value || data.value == 0) {
                return false;
            }


            // 更新经纬度
            var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
            if (!flag) {
                searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
            }
            $("#orgJWD2").hide();

            $("#county_2").html('<option value="">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city_2").find("option:selected").data("cityId");
            getCity(cityId, function (countyList) {
                fillCounty2(countyList);
            })

        });

        // 监听县2（所在地）
        form.on('select(county2)', function (data) {
            $("#orgAd2Tip").hide();// 隐藏error提示
            // 更新经纬度
            var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
            if (!flag) {
                searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
            }
            $("#orgJWD2").hide();
        });

        // 机构性质监听
        form.on('select(orgNature)', function (data) {
            $("#orgNatureTip").hide();

        });
        // 机构来源
        form.on('select(orgOrigin)', function (data) {

            $("#orgOriginTip").hide();

        });

        // 构建一个编辑器
        ditIndex = layedit.build('LAY_demo1', {
            height: 245,
            color: "#333",
            tool: ['strong', 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'image'],
            uploadImage: {
                url: BASE_URL + '/front/file/upload/richText',
                type: 'post', //默认post
                before: function (input) {
                    //返回的参数item，即为当前的input DOM对象
                    console.log('文件上传中');
                },
                success: function (res) {
                    console.log('文件上传成功');
                    console.log(res);
                }
            }
        });
        if (isLtIE9) {
            JPlaceHolder.init();

        }

    });

    /*
     ** 发送Ajax获取城市列表
     */
    function getCity(cityId, cb) {
        $.ajax({
            url: BASE_URL + '/bg/org/city?id=' + cityId,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if (data.code === 0 && data.payload.length > 0) {
                    cb(data.payload);
                } else {
                    // layer.msg("网络繁忙，请重新选择城市");
                }
            },
            error: function (err) {
                // layer.msg("网络繁忙，请重新选择城市");
            }

        });

    }
    /*
     ** 处理省ID
     */
    function dealProvinceId(provinceId, cb) {
        var cityList;

        if (provinceId == 110000) {
            cityList = [{
                name: "北京市",
                id: 110000
            }]
            cb(cityList);
        } else if (provinceId == 120000) {
            cityList = [{
                name: "天津市",
                id: 120000
            }]
            cb(cityList);
        } else if (provinceId == 310000) {
            cityList = [{
                name: "上海市",
                id: 310000
            }]
            cb(cityList);

        } else if (provinceId == 500000) {
            cityList = [{
                name: "重庆市",
                id: 500000
            }]
            cb(cityList);

        } else {

            getCity(provinceId, function (cityList) {
                cb(cityList);
            })

        }
    }
    /**
     * 填充城市（市级别 注册地）
     */
    function fillCity1(cityList) {

        var cityDom = $("#city_1");

        for (var i = 0; i < cityList.length; i++) {
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
        }

        form.render("select");
    }
    /**
     * 填充城市（县级别 注册地）
     */
    function fillCounty1(countyList) {

        var countyDom = $("#county_1");

        for (var i = 0; i < countyList.length; i++) {
            countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
        }

        form.render("select");
    }
    /**
     * 填充城市（市级别 所在地）
     */
    function fillCity2(cityList) {

        var cityDom = $("#city_2");

        for (var i = 0; i < cityList.length; i++) {
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
        }

        form.render("select");
    }
    /**
     * 填充城市（县级别 所在地）
     */
    function fillCounty2(countyList) {

        var countyDom = $("#county_2");

        for (var i = 0; i < countyList.length; i++) {
            countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
        }

        form.render("select");
    }
    // 按鈕切換
    function changeCheck($this) {
        var checkedFlag = $($this).prop("checked");

        var $_this = $($this);
        if (checkedFlag) {
            $_this.parent().removeClass("checkbox_cancel").addClass("checkbox_checked");
        } else {
            $_this.parent().removeClass("checkbox_checked").addClass("checkbox_cancel");
        }
    }
    // 三证合一
    function slideUp($_this) {
        if ($($_this).prop("checked")) {
            $("#orgPapers2").hide();
            $("#orgPapers3").hide();
        } else {
            $("#orgPapers2").show();
            $("#orgPapers3").show();
        }
    }

    var map = initMap();
    searchByStationName('初始化');
    // 失去详细地址的焦点时触发
    function updateJingWeiDu() {
        var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
        if (!flag) {
            searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
        }
    }

    /**
     * 初始化Map
     * @returns {BMap.Map}
     */
    function initMap() {
        var map = new BMap.Map("baidumap");    // 创建Map实例
        map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);
        return map;
    }
    /**
     * 搜索名字
     * @param map
     * @param site
     */
    function searchByStationName(keyword, orginBoxType) {
        var localSearch = new BMap.LocalSearch(map);
        localSearch.setSearchCompleteCallback(function (searchResult) {
            try {
                var poi = searchResult.getPoi(0);
            } catch (e) {
                return false;
            }
            if (!poi) {
                return false;
            }
            if (keyword != "初始化") {
                $("#longitude2").val(poi.point.lng.toFixed(2));// 更新视图
                $("#latitude2").val(poi.point.lat.toFixed(2));// 更新视图
            } else {
                return;
            }

            map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);// 添加标注
        });
        localSearch.search(keyword);// 启动查询
        return true;
    }
    // 选择资质事件
    function choseTagFactory() {
        var html = '<div class="zz_modal">\
            <p class="zz_title">选择机构资质：（可多选）</p>\
            <div class="zz_main">\
             <div class="zz_xiao_main">\
                <ul id="filedList">\
                </ul>\
            </div>\
            </div>\
            <div class="zz_add">\
            <p class="add">添加资质</p>\
            <div class="ipt">\
            <div style="float: left;">\
            <input id="addFiledIpt" type="text" placeholder="请输入新的资质">\
            </div>\
            <span id="addFiled" class="add_btn" style="float: left">添加</span>\
            </div>\
            </div>\
            <div class="zz_btn">\
            <button id="closeZzModal" type="button"  style="background: #fff;color: #666;border: 1px solid #c1c1c1;">取消</button>\
            <button id="saveZzModal" type="button" style="margin-left: 60px;background: #508df0;color: #fff;">保存</button>\
            </div>\
            </div>';

        //页面层-自定义
        var my_layer = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: false,
            skin: 'my_zz_modal',
            content: html
        });

        $("#closeZzModal").off("click").on("click", function () {
            layer.close(my_layer)
        })

        $("#saveZzModal").off("click").on("click", function () {
            var flag = saveIdentify();// 保存资质
            if (flag) {
                layer.close(my_layer);
            }

        })
        // 初始化时，是从后台拿数据的，拿数据时判断一下是否和这里面的三个值相等，相等的话就渲染为checked 默认选中
        getIdentify(function (data) {
            var fileList = $("#filedList");
            var qftLists = $("#identifyList .img_item");
//            var checkedsIpt = $("#filedList .ckbox  input:checked");
//            var qftList = $("#identifyList");
            for (var i = 0; i < data.length; i++) {
                // 筛选出已选中的资质，标记为选中状态
                var flag = true;// 重置标记
                qftLists.each(function () {
                    var this_name, this_load_type, this_origin_src = "";
                    this_name = $.trim($(this).children("i").text());
                    this_load_type = $(this).find("input").data("loadType");

                    if (this_load_type == 2) {
                        this_origin_src = $(this).find("img").attr("src");
                    }
                    // 判断是否一致
                    if (this_name == data[i].orgCertificateName) {
                        fileList.append(
                            '<li>\
                                <label class="ckbox checkbox_checked">\
                                  <input data-load-type="' + this_load_type + '" data-origin-src="' + this_origin_src + '" type="checkbox" onclick="changeCheck(this)" checked>\
                                </label>\
                                <span>' + data[i].orgCertificateName + '</span>\
                        </li>'
                        );
                        flag = false;
                        return false;
                    }
                });

                // 不在已选择的资质库中
                if (flag) {
                    fileList.append(
                        '<li>\
                            <label class="ckbox checkbox_cancel">\
                              <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this)">\
                            </label>\
                            <span>' + data[i].orgCertificateName + '</span>\
                        </li>'
                    );
                }

            }
//            var flag = true;// 标记状态，默认为选中
//            if (data.code === 0 && data.payload.length > 0) {
//
//            }

        });

        // 給添加按钮注册事件
        $("#addFiled").off("click").on("click", function () {
            var iptVal = $.trim($("#addFiledIpt").val()),
                isExisting = false;

            // 校验是否为空
            if (iptVal == '') {
                layer.msg("新标签名不能为空");
                return false;
            }

            // 校验是否重复
            $("#filedList li > span ").each(function (index, val) {
                if (iptVal === $(this).text()) {
                    isExisting = true;
                    return false;
                }
            })

            if (isExisting) {
                layer.msg("该标签名已存在");
                return false;
            }

            // 发送ajax，成功回调里添加到页面中；
            addIdentify(iptVal, function (data) {
                if (data.code === 0) {
                    if ($("#filedList .ckbox  input:checked").length < 8) {

                        $("#filedList").append(
                            '<li>\
                            <label class="ckbox checkbox_checked">\
                              <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this) " checked>\
                            </label>\
                            <span>' + iptVal + '</span>\
                        </li>'
                        )

                    } else {

                        $("#filedList").append(
                            '<li>\
                            <label class="ckbox checkbox_cancel">\
                              <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this) ">\
                            </label>\
                            <span>' + iptVal + '</span>\
                        </li>'
                        )
                    }

                    $("#addFiledIpt").val("");// 情空输入框
                } else {
                    layer.msg("添加失败");
                }
            })

        });
    }
    /*
     ** 勾选资质，并点击保存资质
     */
    function saveIdentify() {
        var checkedsIpt = $("#filedList .ckbox  input:checked");
        var qftList = $("#identifyList");

        var html = '';
        if (checkedsIpt.length > 8) {
            layer.msg("最多选择8条资质")
            return false;
        }

        qftList.empty();// 清空列表

        for (var i = 0; i < checkedsIpt.length; i++) {
            var originSrc = $(checkedsIpt[i]).data("originSrc") ? $(checkedsIpt[i]).data("originSrc") : BASE_URL + "/front/imgs/icon/2_2/add_type2.png";
            var loadType = $(checkedsIpt[i]).data("loadType");// 点击选择，初始化列表时，把loadType初始化上去；

            var html =
                '<div class="img_item">\
                     <label class="ipt_lable">\
                           <span></span>\
                           <img  src="' + originSrc + '">\
                         <form method="post" enctype="multipart/form-data">\
                             <input data-load-type="' + loadType + '"  data-spin="' + BASE_URL + '/front/imgs/icon/2_2/add_type2_loading.gif"  type="file" name="file" onchange="uploadLogos(this)" onclick="clearErrorZZ(this)">\
                         </form>\
                     </label>\
                     <i>' + $(checkedsIpt[i]).parent().parent().find("span").text() + '</i>\
               </div>';

            qftList.append(html);
        }
        return true;
    }
    // 获取资质库
    /*
     ** 获取资质库的所有资质
     */
    function getIdentify(success, error) {
        $.ajax({
            url: BASE_URL + "/bg/org/OrgcertificateTmp/query",
            type: 'get',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                if (data.code === 0) {
                    success(data.payload);
                } else if (data.code === 1012) {
                    layer.msg("账户未登录或登录超时，请重新登录");
                } else{
                    layer.msg("网络繁忙，请重新操作");
                }
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
    }
    /*
     ** 添加一条资质到资质库
     */
    function addIdentify(name, success, error) {
        $.ajax({
            url: BASE_URL + "/bg/org/OrgcertificateTmp/add?name=" + name,
            type: 'post',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                success(data);
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
    }
    $("input").on("focus", function () {
        var errTag = $(this).next("s.error_tip");
        var flag = errTag.length >= 1 ? true : false;
        if (flag) {
            errTag.hide();
        } else if (isLtIE9 && $(this).parent().parent().next("s.error_tip")) {
            errTag = $(this).parent().parent().next("s.error_tip");
            errTag.hide();
        }
    })


    // 机构座机添加，删除
    function addCallRow() {
        var callItem = '<input onclick="clearFixedPhoneTip()" class="ipt_base" type="text" placeholder="请输入机构座机">';
        var itemNum = $(".org_call > input").length;
        if (itemNum <= 4) {
            $("#addCallBtn").before($(callItem));
        } else {
            layer.msg("最多添加5个手机号");
        }
    }
    function delCallRow() {
        var itemNum = $(".org_call > input").length;
        if (itemNum > 1) {
            $(".org_call input").last().remove();
        }
    }
    // 联系人添加
    function addPersonRow() {

        var personNum = $(".org_person .person_item").length;
        if (personNum >= 5) {
            layer.msg("最多添加5个联系人");
            return false;
        }

        var html =
            '<div class="person_item">\
            <div class="person_name">\
            <input class="ipt_base" type="text" style="float: left;" placeholder="联系人姓名">\
            <s class="error_tip name_error_tip" style="right:-232px;display: none;">请输入姓名</s>\
            </div>\
            <span class="icon_box" style="float: left;">\
               <i class="down_icon lab-del_type1" onclick="delPersonRow(this)" style="width: 45px;"></i>\
            </span>\
            <div class="person_phone">\
            <div>\
            <input class=" ipt_base" type="text" placeholder="联系人号码" style="float: left;">\
            <s class="error_tip phone_error_tip" style="right:-194px;display: none">请输入正确的手机号码</s>\
            </div>\
            <span class="icon_box" style="position: absolute;right: -68px;top: 0">\
                <i class="up_icon lab-add_type1" onclick="addPersonPhone(this)"></i>\
                <i class="down_icon lab-del_type1" onclick="delPersonPhone(this)"></i>\
            </span>\
            </div>\
            </div>';

        $(".org_person").append(html);

    }
    // 联系人方式添加：
    function delPersonRow($_this) {
        $($_this).parent().parent().remove();
    }
    function addPersonPhone($_this) {
        var dom = $($_this).parent();
        var callItem =
            '<div>\
            <input class=" ipt_base" type="text" placeholder="联系人号码" style="float: left;">\
            <s  class="error_tip phone_error_tip" style="right:-140px;display: none;">请输入正确的手机号码</s>\
            </div>';


        var itemNum = dom.parent().find("input.ipt_base").length;

        if (itemNum <= 4) {
            dom.before(callItem);
        } else {
            layer.msg("每个联系人，最多添加5个手机号");
        }
    }
    function delPersonPhone($_this) {
        var dom = $($_this).parent();

        var itemNum = dom.parent().find("div").length;
        if (itemNum > 1) {
            dom.parent().find("div").last().remove();
        }
    }

    //  上传
    function uploadLogos($_this) {
        var $fileInput = $($_this),// file input dom
            $form = $fileInput.parent(),// form dom
            $img = $form.parent().find("img"),
            $spinSrc = $fileInput.data("spin"),
            $originSrc = $img.attr("src");
        originLoadType = $fileInput.data("loadType");// 上传前状态

        // 状态判断拦截
        if (originLoadType == 1) {
            layer.msg("请勿频繁操作上传！")
            return false;
        }

        // 前端文件内容获取和非法拦截
        var files = $_this.files;
        var fileName, fileSize;
        if (files) {
            var file = files[0];
            fileName = file.name;
            fileSize = file.size;
        } else {
            fileName = $_this.value;
        }

        if (fileSize && fileSize > 1048576 * 5) {
            layer.msg("文件大小不能超过5M");
            return false;
        }


        if (!verifyFileSuffx("jpg|jpeg|png", fileName)) {
            layer.msg("请上传jpg、jpeg或png格式的图片");
            return false;
        }

        // 表单ajax配置对象
        var fileAjaxOption = {
            url: BASE_URL + "/front/file/ie/upload/image",//form 的action
            type: "post",
            resetForm: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            beforeSend: function () {
                $fileInput.data("loadType", 1);// 设置其上传状态为1（上传中）
                $img.attr("src", $spinSrc);// 上传中的菊花转（不同比例，所以传进来）
            },
            success: function (data) {  //表单提交成功后执行的函数
                try {
                    data = JSON.parse(data);
                } catch (e) {
                    console.log("请求被拦截，返回JSON字符串");
                }
                console.log(data);
                if (data.code == 0) {
                    if (data.size > 1048576 * 5) {
                        layer.msg("文件大小不能超过5M");
                        $fileInput.data("loadType", originLoadType);// 文件过大处理失败，回置上传状态；
                        $img.attr("src", $originSrc);// 回置SRC
                    } else {
                        // success
                        $fileInput.data("loadType", 2);// 更新上传状态为2（上传成功）；
                        $img.attr("src", data.payload);// 更新src
                    }
                } else {
                    $fileInput.data("loadType", originLoadType);// 上传处理失败，回置上传状态；
                    $img.attr("src", $originSrc);// 回置SRC
                }

//                data = JSON.parse(data);
//                if (data.size > 1048576 * 10) {
//                    progress.remove();
//                    layer.msg("文件大小不能超过10M");
//                    return;
//                }

//                progress.find(".probarbul").animate({"width": "100%"}, 500);
//                progress.data("fileUrl", data.payload);
//                layer.msg("上传成功");
            },
            error: function () {
                $fileInput.data("loadType", originLoadType);// 上传失败，回置上传状态；
                $img.attr("src", $originSrc);// 回置SRC
            }

        }
        $($_this).parent().ajaxSubmit(fileAjaxOption);// 提交表单
        return false;
    }

    // 检查文件后缀
    function verifyFileSuffx(format, fileName) {
        var index = fileName.lastIndexOf("."),
            suffix = fileName.slice(index + 1),
            formatArr = format.split("|"),
            flag = false;

        for (var i = 0; i < formatArr.length; i++) {
            if (formatArr[i] === suffix) {
                flag = true;
                break;
            }
        }

        return flag;
    }

    // 清除身份证的error提示
    function clearErrorTipIdCard($_this) {
        if ($($_this).data("loadType") == 0) {
            $("#idCardTip").hide();
        }
    }
    function clearFixedPhoneTip() {
        $("#fixedPhoneErrorTip").hide();
    }
    // 清除机构logo的errortip
    function clearLogoTip($_this) {
        $("#logoErrorTip").hide();//  todo
    }
    // 清除简介
    function clearIntroTip() {
        $("#orgIntroTip").hide();
    }
    // 清除营业执照副本的ErrorTip
    function clearId($_this) {
        $("#orgInfoErrorTip").hide();//  todo
    }

    // 清除经纬度Tp
    function clearLatTip() {
        $("#orgJWD2").hide();
    }
    // 清除机构材料tip
    function clearErrorPaper($_this) {
        var flag = $("#szhy").prop("checked");
        if (flag) {
            $("#orgInfoErrorTip").hide();
        } else {
            if ($($_this).data("loadType") == 0) {
                $("#orgInfoErrorTip").hide();
            }
        }

    }
    // 清除资质tip
    function clearErrorZZ($_this) {
        if ($($_this).data("loadType") == 0) {
            $("#zzTip").hide();
        }
    }
    // 大表单提交
    function putFormToService() {
        var REG = {
            phone400: /^400[0-9]{7}/,
            phone800: /^800[0-9]{7}/,
            phone11: /^1(3|4|7|5|8)([0-9]{9})/,
//            fixedPhone: /([0-9]{3,4}-)?[0-9]{7,8}/,
            fixedPhone: /^[0-9]{3,4}-[0-9]{7,8}$/,
        }

        var FLAG = true;
        // 真实姓名*
        var uName = $.trim($("#uName").val());
        var uNameTip = $("#uNameTip");

        // 真实姓名校验:为空
        if (uName === "") {
            uNameTip.text("请输入姓名");
            uNameTip.show();
            FLAG = false;
        }

        // 真实姓名校验:2-10位中文
        if (!/^[\u4e00-\u9fa5]{2,11}$/.test(uName)) {
            uNameTip.text("请输入正确的姓名");
            uNameTip.show();
            FLAG = false;
        }

        // 身份证号码*
        var uIdCard = $("#uIdCard").val();
        var uIdCardTip = $("#uIdCardTip");

        if (uIdCard === "") {
            uIdCardTip.text("请输入身份证号");
            uIdCardTip.show();
            FLAG = false;
        }

        if (!/^\d{15}$|^\d{17}(\d|x|X)$/.test(uIdCard)) {
            uIdCardTip.text("您输入的大陆身份证号格式错误");
            uIdCardTip.show();
            FLAG = false;
        }

        // 身份证照片*
        var idCardFrontImgSrc = $("#idCardFront").attr("src");// 正面
        var idCardFrontInput = $("#idCardFrontInput").data("loadType");
        var idCardVersoImgSrc = $("#idCardVerso").attr("src");// 反面
        var idCardVersoInput = $("#idCardVersoInput").data("loadType");
        var idCardTip = $("#idCardTip");
        if (idCardFrontInput != 2 || idCardVersoInput != 2) {
            idCardTip.show();
            FLAG = false;
        }
        // 机构logo*
        var logoImg = $("#logoImg").attr("src");
        var logoInput = $("#logoInput").data("loadType");
        var logoErrorTip = $("#logoErrorTip");
        if (logoInput == 1) {
            layer.msg("请等待图片完成上传后提交");
            FLAG = false;
        }else if(logoInput == 0){
            logoImg = null;
        }

        // 机构材料*
        var szhy = $("#szhy").prop("checked");// 为true为三证合一
        var orgCard1Img = $("#orgCard1Img").attr("src");//1
        var orgCard1Input = $("#orgCard1Input").data("loadType");
        var orgCard2Img = $("#orgCard2Img").attr("src");//2
        var orgCard2Input = $("#orgCard2Input").data("loadType");
        var orgCard3Img = $("#orgCard3Img").attr("src");//3
        var orgCard3Input = $("#orgCard3Input").data("loadType");
        var orgInfoErrorTip = $("#orgInfoErrorTip");
        if (szhy) {
            orgCard2Img = null;
            orgCard3Img = null;
            if (orgCard1Input != 2) {
                orgInfoErrorTip.show();
                FLAG = false;
            }
        } else {
            if (orgCard1Input != 2 || orgCard2Input != 2 || orgCard3Input != 2) {
                orgInfoErrorTip.show();
                FLAG = false;
            }
        }

        // 机构名称*
        var orgName = $("#orgName").val();
        var orgNameTip = $("#orgNameTip");
        if (orgName == "") {
            orgNameTip.text("请输入机构名称");
            orgNameTip.show();
            FLAG = false;
        }

        // 组织机构代码*
        var orgCode = $("#orgCode").val();
        var orgCodeTip = $("#orgCodeTip");
        if (orgCode == "") {
            orgCodeTip.text("组织机构代码最低字符为10位");
            orgCodeTip.show();
            FLAG = false;
        }

        // 组织机构代码校验：
        if (!/^[\d|a-zA-Z|\-|_|—]{10,20}$/.test(orgCode)) {
            orgCodeTip.text("组织机构代码格式不正确");
            orgCodeTip.show();
            FLAG = false;
        }

        // 机构性质*
        var orgNature = $("#orgNature").val();
        var orgNatureTip = $("#orgNatureTip");
        if (orgNature == "") {
            orgNatureTip.show();
            FLAG = false;
        }
        // 机构注册地*;
        var province_1 = $("#province_1").val();
        var city_1 = $("#city_1").val();
        var county_1 = $("#county_1").val();
        var orgAd1Tip = $("#orgAd1Tip");
        if (province_1 == "" || city_1 == "" || county_1 == "") {
            orgAd1Tip.show();
            FLAG = false;
        }
        // 机构注册地详细地址*
        var orgDetail_1 = $("#orgDetail_1").val();
        var orgDetailTip1 = $("#orgDetailTip1");

        if (orgDetail_1.length < 5) {
            orgDetailTip1.text("详细地址最少为5个字符");
            orgDetailTip1.show();
            FLAG = false;
        }

        // 机构所在地*
        var province_2 = $("#province_2").val();
        var city_2 = $("#city_2").val();
        var county_2 = $("#county_2").val();
        var orgAd2Tip = $("#orgAd2Tip");
        if (province_2 == "" || city_2 == "" || county_2 == "") {
            orgAd2Tip.show();
            FLAG = false;
        }
        // 机构所在地详细地址*
        var addressDetail_2 = $("#addressDetail_2").val();
        var orgDetailTip2 = $("#orgDetailTip2");
        if (addressDetail_2.length < 5) {
            orgDetailTip2.text("详细地址最少为5个字符");
            orgDetailTip2.show();
            FLAG = false;
        }

        // 机构所在地经纬度*
        var longitude2 = $("#longitude2").val();// 东经
        var latitude2 = $("#latitude2").val();// 北纬
        var orgJWD2 = $("#orgJWD2");// tip

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(longitude2) || /^[0-9]{1,3}$/.test(longitude2))) {
            orgJWD2.text("请填写正确的经纬度")
            orgJWD2.show();
            FLAG = false;
        }

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(latitude2) || /^[0-9]{1,3}$/.test(latitude2))) {
            orgJWD2.text("请填写正确的经纬度")
            orgJWD2.show();
            FLAG = false;
        }

        // 机构座机
        var addCallList = $("#addCall input");// list
        // 校验固定电话
        var orgCallArr = "";
        var curIndex = 0;
        addCallList.each(function (i) {
            var curFixedPhone = $(this).val();
            if (curFixedPhone == "" || REG.fixedPhone.test(curFixedPhone)) {
                if (i === curIndex) {
                    if (curFixedPhone == "") {
                        curIndex++;
                    } else {
                        orgCallArr = curFixedPhone;
                    }

                } else {
                    if (curFixedPhone != "") {
                        orgCallArr += "," + curFixedPhone;
                    }
                }

            } else {
                $("#fixedPhoneErrorTip").text("电话格式存在错误");
                $("#fixedPhoneErrorTip").show();
                FLAG = false;
            }

        })

        // 机构邮编
        var orgPostcode = $("#orgPostcode").val();
        if (!/^[0-9]{6}$/.test(orgPostcode) && orgPostcode != "") {
            $("#orgPostCodeTip").text("邮编格式错误");
            $("#orgPostCodeTip").show();
            FLAG = false;
        }
        // 机构网址
        var orgWeb = $("#orgWeb").val();
        if (orgWeb.length < 5 && orgWeb != "") {
            $("#orgWebTip").text("请输入正确的机构网址");
            $("#orgWebTip").show();
            FLAG = false;
        }

        // 机构传真
        var orgFax = $("#orgFax").val();
        if (!REG.fixedPhone.test(orgFax) && orgFax != "") {
            $("#orgFaxTip").text("传真号码格式错误");
            $("#orgFaxTip").show();
            FLAG = false;
        }

        // 机构邮箱
        var orgEmail = $("#orgEmail").val()
        if (!/^[a-zA-Z0-9\._-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(orgEmail) && orgEmail != "") {
            $("#orgEmailTip").text("请输入正确的邮箱地址");
            $("#orgEmailTip").show();
            FLAG = false;
        }

        if (orgEmail.length <= 5 && orgEmail != "") {
            $("#orgEmailTip").text("请输入正确的邮箱地址");
            $("#orgEmailTip").show();
            FLAG = false;
        }

        if (orgEmail.length > 50 && orgEmail != "") {
            $("#orgEmailTip").text("请输入正确的邮箱地址");
            $("#orgEmailTip").show();
            FLAG = false;
        }

        // 联系人信息*
        var orgPeopleList = $("#orgPeople .person_item");
        var orgPeopleArr = [];// 联系人数据容器
        orgPeopleList.each(function () {
            var item = {
                conName: "",
                conPhone: "",
            }
            // 处理联系人姓名：
            var orgPeopleName = $(this).find(".person_name input");
            var orgPeopleNameTip = $(this).find(".name_error_tip");
            if (!/^[\u4e00-\u9fa5]{2,5}$/.test(orgPeopleName.val())) {
                orgPeopleNameTip.text("请输入正确的姓名");
                orgPeopleNameTip.show();
                FLAG = false;
            }

            item.conName = orgPeopleName.val();// 更新name

            var personPhoneList = $(this).find(".person_phone input");
            personPhoneList.each(function (i) {
                var curPhone = $(this).val();
                var curTip = $(this).parent().parent().parent().find(".phone_error_tip").eq(i);
                if (curPhone == "") {
                    curTip.text("请输入正确的联系电话");
                    curTip.show();
                    FLAG = false;
                }

                if (!REG.fixedPhone.test(curPhone) && !REG.phone11.test(curPhone)) {
                    curTip.text("请输入正确的联系电话");
                    curTip.show();
                    FLAG = false;
                }

                if (i === 0) {
                    item.conPhone = curPhone;
                } else {
                    item.conPhone += ',' + curPhone;
                }
            })

            orgPeopleArr.push(item);// 将该条联系人信息push到数组里
        })

        // 机构来源*
        var orgOrigin = $("#orgOrigin").val();
        var orgOriginTip = $("#orgOriginTip")
        if (orgOrigin == "") {
            orgOriginTip.show();
            FLAG = false;
        }
        // 机构资质
        var zzList = $("#identifyList .img_item");
        //  $("#identifyList .img_item img");
        //  $("#identifyList .img_item input");
        var zzArr = [];
        zzList.each(function () {
            var curImgSrc = $(this).find("img").attr("src");
            var curIptLoadType = $(this).find("input").data("loadType");
            var curZZname = $(this).children("i").text();
            var item = {
                orgCertificateName: curZZname,
                orgCertificatePic: curImgSrc
            };
            zzArr.push(item);
            if (curIptLoadType != 2) {
                $("#zzTip").show();
                FLAG = false;
            }
        });

        // 机构简介
        // todo 机构简介
        var orgDescription = layedit.getContent(ditIndex);
        var orgDescriptionTxt = layedit.getText(ditIndex);
        if ($.trim(orgDescription).length == 0) {
            $("#orgIntroTip").text("机构简介不能为空");
            $("#orgIntroTip").show();
            FLAG = false;
        } else if ($.trim(orgDescriptionTxt).length > 5000) {
            $("#orgIntroTip").text("简介文字不能超过5000字");
            $("#orgIntroTip").show();
            FLAG = false;
        } else {
            clearIntroTip();// 清除机构简介弹窗
        }

        var formData = {
            orgLicense: {
                orgPerson: uName,
                identificationNumber: uIdCard,
                legalPersonPic1: idCardFrontImgSrc,// 身份证正面
                legalPersonPic2: idCardVersoImgSrc,// 身份证反面
                taxEnrolCertificatePic: orgCard3Img,// 税务登记证书
                orgLicensePic: orgCard1Img,// 营业执照证书
                orgAddrProvince: province_1,
                orgAddrCity: city_1,
                orgAddrDistrict: county_1,
                orgAddress: orgDetail_1
            },
            orgCodeObject: {
                orgCodePic: orgCard2Img,//
                orgCode: orgCode,
            },
            orgName: orgName,// 机构名称
            orgLogo: logoImg,//机构LOGO
            orgCategoryId: orgNature,// 机构性质ID
            orgAddress: {
                orgAddrProvince: province_2,// 省
                orgAddrCity: city_2,// 市
                orgAddrDistrict: county_2,// 县
                orgAddrStreet: addressDetail_2,// 详细地址
                orgAddrLongitude: longitude2,// 经度
                orgAddrLatitude: latitude2,// 维度
                orgZipcode: orgPostcode
            },
            orgContacts: {
                conPhone: orgCallArr,// 机构联系人电话
                conEmail: orgEmail,// 机构联系人邮箱
                conFax: orgFax// 机构联系人传真
            },
            orgContactsList: orgPeopleArr,// 联系人和联系人电话
            orgWeb: orgWeb,// 机构网址
            orgCode: orgCode,// 组织机构代码
            orgSource: orgOrigin,// 机构来源
            orgCertificateList: zzArr,// 机构资质
            orgDescription: orgDescription // 富文本编辑
        }

        if (FLAG) {
            postPutForm(formData, function (data) {
                location.href = BASE_URL + "/front/provider/search/" + data.payload.orgOid;
            })
        } else {
            layer.msg("添加失败，请检查表单");
        }

//    /application
    }
    /*
     ** 发送Ajax获取城市列表
     */
    var FLAG_PUT = true;
    function postPutForm(formData, cb) {
        if(FLAG_PUT) {
            $.ajax({
                url: BASE_URL + '/front/provider/application',
                type: 'POST',
                data: JSON.stringify(formData),
                dataType: "json",
                contentType: "application/json",
                beforesend:function () {
                    FLAG_PUT = false;
                },
                success: function (data) {
                    if (data.code == 0) {
                        cb(data);
                    } else if (data.code == 1012) {
                        layer.msg("登陆超时，即将跳转登录页面");
                        setTimeout(function () {
                            logins();
                        }, 1000);
                    } else if (data.code == 1013) {
                        layer.msg("机构已存在");
                        $("orgNameTip").text("机构名已存在");
                        $("orgNameTip").show();
                    } else if (data.code === 1000) {
                        layer.msg("用户超时，即将跳转认证申请记录界面");
                        setTimeout(function () {
                            location.href = BASE_URL + "/front/provider/search?pageNo=1&pageSize=49";
                        }, 1000);
                    }else if(data.code === 2001){
                        layer.msg("组织机构代码重复，请查看表单");
                        $("#orgCodeTip").text("组织机构代码已存在");
                        $("#orgCodeTip").show();
                    }

                },
                error: function (err) {
                    layer.msg("提交失败");
                },
                complete:function () {
                    FLAG_PUT = true;
                }

            });
        }


    }



</script>

</body>
</html>
