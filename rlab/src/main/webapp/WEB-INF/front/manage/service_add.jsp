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
            line-height: 46px;
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
            padding-bottom: 1px;
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
            width: 200px;
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
            /*width: 140px;*/
            /*height: 48px;*/
            /*background: #49aaff;*/
            /*color: #fff;*/
            /*outline: 0 none;*/
            /*border: 0 none;*/
            /*float: left;*/
            /*margin-right: 30px;*/
            /*cursor: pointer;*/

            float: left;
            display: inline-block;
            width: 100px;
            height: 30px;
            border: solid 1px #508DF0;
            line-height: 30px;
            background-color: #fff;
            font-size: 13px;
            color: #508DF0;
            border-radius: 2px 2px 2px 2px;
            cursor: pointer;
            margin-top: 5px;
        }

        .org_zz .zz_ctro > button:active {
            background: #d9e7fc;

        }

        .org_zz .zz_ctro > span {
            display: block;
            float: left;
            font-size: 12px;
            color: #c7c7c7;
            line-height: 18px;
            vertical-align: bottom;
            padding-top: 3px;
            margin-left: 27px;
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

        /* ------------ 服务上传 ------------------*/

        /*START 服务图片上传*/
        ul.img_list {
            float: left;
        }

        ul.img_list li {
            display: block;
            float: left;
            width: 115px;
            height: 115px;
            margin-right: 14px;
            position: relative;
            margin-bottom: 10px;
        }

        ul.img_list li s.close {
            display: block;
            background: url("${rlab}/front/imgs/close_t1.png") no-repeat 0 0;
            width: 19px;
            height: 19px;
            position: absolute;
            right: -9px;
            top: -6px;
            cursor: pointer;
        }

        .svc_img img {
            width: 115px;
            height: 115px;
        }

        .svc_img > label {
            width: 115px;
            height: 115px;
            float: left;
        }

        /*END 服务图片上传*/
        /*参考价格*/
        .price_panel {
            height: 38px;
            line-height: 38px;

        }

        .price_panel p {
            float: left;
            padding-left: 20px;
            position: relative;
            margin-right: 34px;
        }

        .price_panel p label {
            position: absolute;
            left: 0px;
            top: 50%;
            margin-top: -6.5px;
            display: block;
            width: 13px;
            height: 13px;
            background-color: darkred;
            background: url("${rlab}/front/imgs/unChecked.png") no-repeat 0 0;
            cursor: pointer;
            overflow: hidden;
        }

        .price_panel p label.cur_checked {
            background: url("${rlab}/front/imgs/checked.png") no-repeat 0 0;

        }

        .price_panel p label input {
            position: absolute;
            left: -20px;
            top: 20px;
        }

        .price_panel p span {
            font-size: 14px;
            color: #999;
        }

        .price_ipt {
            margin-top: 10px;
        }

        .price_ipt p {
            /*display: block;*/
            /*position: relative;*/
            /*float: left;*/
            /*height: 63px;*/
            /*width: 203px;*/
            /*background: green;*/
            float: left;
            line-height: 40px;
            font-size: 16px;
            color: #4E4E4E;
        }

        .price_ipt p.span {
            width: 46px;
            text-align: center;
        }

        .price_ipt p input {
            color: #333;
            border: solid 1px #e3e3e3;
            height: 38px;
            width: 120px;
            line-height: 38px;
            padding-left: 7px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            /*position: absolute;*/
            /*left: 0;*/
            /*top: 0;*/
        }

        .price_ipt p > span {
            display: block;
            height: 26px;
            font-size: 14px;
            color: #ee7979;
            position: relative;
            padding-left: 15px;
            position: absolute;
            bottom: -28px;
        }

        .price_ipt p > span i {
            position: absolute;
            left: 0;
            font-size: 12px;
            top: 6px;
        }

        /*报价说明、服务简介*/
        .svc_textarea {
            width: 350px;
            height: 80px;
            overflow: hidden;
            border: 1px solid #ebebeb;
        }

        .svc_textarea textarea {
            /*width: 360px;*/
            /*height: 90px;*/
            border: 0 none;
            outline: 0 none;
            padding: 10px 35px 10px 10px;
            font-size: 14px;
            color: #4e4e4e;
        }

        /*START 使用设备*/
        .svc_ins_list {

        }

        .svc_ins_list > p {
            float: left;
            margin-bottom: 15px;
            position: relative;
        }

        .svc_ins_list > p > input {
            width: 138px;
            height: 39px;
            font-size: 16px;
            color: #4e4e4e;
            margin-right: 14px;
        }

        .svc_ins_list > p > img {
            position: absolute;
            right: 6px;
            top: -7px;
            cursor: pointer;
        }

        .svc_ins_list > p > img:active {

        }

        .svc_ins_list button {
            /*float: left;*/
            /*display: inline-block;*/
            /*width: 100px;*/
            /*height: 30px;*/
            /*border: solid 1px #508DF0;*/
            /*line-height: 30px;*/
            /*background-color: #fff;*/
            /*font-size: 13px;*/
            /*color: #508DF0;*/
            /*border-radius: 2px 2px 2px 2px;*/
            /*cursor: pointer;*/
            /*margin-top: 5px;*/
        }

        /*END 使用设备*/

        /*START 服务特点*/
        .svc_specialty {
            line-height: 40px;
        }

        .svc_specialty span {
            float: left;
            margin-right: 32px;
            font-size: 16px;
            color: #4e4e4e;
        }

        /*END 服务特点*/

        /* START 联系人图表*/
        table.linkman {

        }

        table.linkman thead {

        }

        table.linkman thead tr {
            background-color: #efefef;
        }

        table.linkman thead th {
            min-width: 160px;
            height: 38px;
        }

        table.linkman tbody {

        }

        table.linkman tbody input {
            border: 0 none;
            outline: 0 none;
            text-align: center;
        }

        table.linkman tbody tr {
            background: #fff;
            height: 38px;
        }

        table.linkman tbody tr.even {
            background-color: #fafafa;
        }

        table.linkman tbody tr.even input {
            background-color: #fafafa;
        }

        table.linkman tbody td {
            text-align: center;
        }

        .phone_header {
            overflow: hidden;
            margin-bottom: 20px;
        }

        .phone_header > p {
            float: left;
            line-height: 38px;
            margin-right: 66px;
        }

        .phone_header > p > img {
            color: #508DF0;
            vertical-align: middle;
            cursor: pointer;
        }

        .phone_header i.delete {
            font-size: 18px;
            color: #e3e3e3;

        }

        /* END 联系人图表*/

        /*公用按钮    */
        .common_btn {
            float: left;
            display: inline-block;
            width: 100px;
            height: 30px;
            border: solid 1px #508DF0;
            line-height: 30px;
            background-color: #fff;
            font-size: 13px;
            color: #508DF0;
            border-radius: 2px 2px 2px 2px;
            cursor: pointer;
            margin-top: 5px;
        }

        .common_btn:active {
            background-color: #d9e7fc;
        }

        /* ------------ 服务上传 ------------------*/

        /*百度地图*/
        .baidu_map {
            overflow: hidden;
            width: 437px;
            height: 243px;
        }

        .baidumaps {
            width: 437px;
            height: 295px;
        }

        /*所属机构*/
        .svc_org_item {
            width: 350px;
            float: left;
            margin-right: 16px;
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
            <jsp:param name="firstMenu" value="6"/>
        </jsp:include>
        <div class="user_main">
            <%--服务管理、上传服务--%>
            <h4 class="tit">服务管理 > 上传服务</h4>
            <div class="secent_tit">
                服务基本信息
            </div>

            <%--服务名称--%>
            <div class="item">
                <span>服务名称<em>*</em>：</span>
                <input maxlength="100" id="serviceName" class="ipt_base" type="text" placeholder="请输入服务名称"
                       style="float: left" onfocus="clearServiceTip()">
                <s id="svcNameTip" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">
                    <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请输入服务名称
                </s>
            </div>
            <%--所属机构--%>
            <div class="item">
                <span>所属机构<em>*</em>：</span>
                <div class="svc_org_item layui-form">
                    <select id="serviceOrg" lay-filter="svcOrg">
                        <option value="">请选择机构</option>
                        <c:forEach items="${orgNames}" var="item">
                            <option value="${item.orgoid}">${item.orgname}</option>
                        </c:forEach>
                    </select>
                </div>
                <s id="svcOrgTip" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">
                    <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请选择机构
                </s>
            </div>

            <%--服务图片--%>
            <div class="item">
                <span>服务图片：</span>
                <div class="svc_img  clearfix">
                    <ul id="imgList" class="img_list clearfix">
                        <%--<li>--%>
                        <%--<img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/image/2017/02/06/015c7552-d9a7-4b59-a024-9f44e31ccef1.jpg"--%>
                        <%--alt="">--%>
                        <%--<s class="close" onclick="delteCurSvImg(this)"></s>--%>
                        <%--</li>--%>
                        <label id="iptLable" class="ipt_lable" style="float: left;z-index: 2;">
                            <span></span>
                            <img id="logoImg" src="${rlab}/front/imgs/icon/2_2/add_type1.png" alt="">
                            <form method="post" enctype="multipart/form-data">
                                <input id="logoInput" data-load-type="0"
                                       data-spin="${rlab}/front/imgs/icon/2_2/add_type1_loading.gif"
                                <%--type="file" name="file" onchange="uploadLogos(this)" onclick="clearLogoTip(this)">--%>
                                       type="file" name="file" onchange="putServiceImg(this)">
                            </form>
                        </label>
                    </ul>

                    <%--<s id="logoErrorTip" class="error_tip rt_tip"--%>
                    <%--style="display:none;right:-232px;height: 38px;line-height: 38px;margin-left: 10px;">请上传服务图片</s>--%>


                </div>
            </div>
            <%--服务特点--%>
            <div class="item">
                <span>服务特点：</span>
                <div class="svc_specialty clearfix">
                    <div id="traitListUl" class="clearfix" style="float: left;">
                        <%--<span>特点3</span>--%>
                        <%--<span>特点4</span>--%>
                        <%--<span>特点5</span>--%>
                    </div>
                    <button onclick="choseServiceTrait(this)" type="button" class="common_btn">选择服务特点</button>
                </div>
            </div>

            <%--服务资质--%>
            <div class="item">
                <span>服务资质：</span>
                <div class="svc_specialty clearfix">
                    <div id="zzList" class="clearfix" style="float: left;">

                        <button onclick="choseTagFactory(this)" type="button" class="common_btn">选择服务资质</button>
                    </div>
                </div>
            </div>

            <%--服务资质--%>
            <div class="item" style="display: none">
                <span>机构资质：</span>
                <div class="org_zz">
                    <div class="zz_ctro">
                        <button type="button">请选择资质</button>
                        <span>
                            图片大小限制5M内<br/>
                            支持格式jpg、jpeg、png、bmp
                        </span>
                        <s id="zzTip" class="error_tip rt_tip"
                           style="display:block;bottom: 2px;line-height: 28px;margin-left: 360px;">
                            <i class="lab-gantanhao" style="margin-right: 5px;"></i>请补全相关资质图片
                        </s>
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
            <%--参考报价--%>
            <div class="item">
                <span>参考价格<em>*</em>：</span>
                <div class="svc_price clearfix">
                    <div id="pricePanel" class="price_panel clearfix">
                        <p>
                            <label>
                                <input data-origin="all" type="radio" name="price" onclick="switchRadio(this)"
                                       onchange="clearPriceTip()">
                            </label>
                            <span>面议</span>
                        </p>
                        <p>
                            <label class="cur_checked">
                                <input data-origin="fixed" type="radio" name="price" checked
                                       onclick="switchRadio(this)" onchange="clearPriceTip()">
                            </label>
                            <span>具体价格</span>
                        </p>
                        <p>
                            <label>
                                <input data-origin="range" type="radio" name="price" onclick="switchRadio(this)"
                                       onchange="clearPriceTip()">
                            </label>
                            <span>价格范围</span>
                        </p>

                    </div>
                    <div id="fixedPrice" class="price_ipt clearfix">
                        <p>
                            <input id="fixedPriceP" type="text" placeholder="具体价格" onfocus="clearPriceTip()">
                        </p>
                        <p class="span">元/</p>
                        <p>
                            <input id="fixedUnit" type="text" maxlength="10" placeholder="单位" onfocus="clearPriceTip()">
                        </p>
                    </div>
                    <div id="rangPrice" style="display: none" class="price_ipt clearfix">
                        <p>
                            <input id="rangeSubPrice" type="text" placeholder="最低价" onfocus="clearPriceTip()">
                            <%--<span><i class="lab-gantanhao"></i>最高价需大于最低价</span>--%>
                        </p>
                        <p class="span">元&nbsp;~</p>
                        <p>
                            <input id="rangeSupPrice" type="text" placeholder="最高价" onfocus="clearPriceTip()">
                            <%--<span><i class="lab-gantanhao"></i>最高价需大于最低价</span>--%>
                        </p>
                        <p class="span">元/</p>
                        <p for="">
                            <input id="rangeUnit" maxlength="10" type="text" placeholder="单位">
                            <%--<span><i class="lab-gantanhao"></i>请选择</span>--%>
                        </p>
                    </div>
                    <s id="svcPriceTip" class="error_tip rt_tip"
                       style="display:none;line-height: 38px;float: left">
                        <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>
                    </s>
                </div>
            </div>
            <%--报价说明--%>
            <div class="item">
                <span>报价说明：</span>
                <div class="svc_textarea">
                    <textarea id="priceInfos" cols="45" rows="4" maxlength="200"></textarea>
                </div>
            </div>
            <%--机构信息--%>
            <div class="secent_tit">
                服务详细信息
            </div>
            <%--服务简介--%>
            <div class="item">
                <span>服务简介：</span>
                <div class="svc_textarea">
                    <textarea id="serviceInfo" cols="45" rows="4" maxlength="5000"></textarea>
                </div>
            </div>
            <%--使用设备--%>
            <div class="item">
                <span>使用设备：</span>
                <div class="svc_ins clearfix">
                    <div id="insList" class="svc_ins_list clearfix">
                        <%--<p>--%>
                        <%--<input class="ipt_base" type="text" placeholder="请输入使用设备">--%>
                        <%--<img onclick="delteCurIns(this)" src="${rlab}/front/imgs/close_t1.png">--%>
                        <%--</p>--%>
                        <button onclick="addIns(this)" type="button" class="common_btn">新增</button>
                    </div>

                </div>
            </div>
            <%--依据方法--%>
            <div class="item">
                <span>依据方法：</span>
                <input id="serviceMethos" maxlength="200" class="ipt_base" type="text" placeholder="方法、标准、技术规范"
                       style="float: left">
                <s class="error_tip rt_tip" style="display:none;line-height: 38px;margin-left: 10px;float: left">请输入正确的服务名称</s>
            </div>
            <%--服务周期--%>
            <div class="item">
                <span>服务周期：</span>
                <input id="serviceCycle" maxlength="200" class="ipt_base" type="text" placeholder="请输入服务周期"
                       style="float: left">
                <s class="error_tip rt_tip" style="display:none;line-height: 38px;margin-left: 10px;float: left">请输入正确的服务名称</s>
            </div>
            <%--其他备注--%>
            <div class="item">
                <span>其他备注：</span>
                <div class="svc_textarea">
                    <textarea id="otherInfo" cols="45" rows="4" maxlength="1000"></textarea>
                </div>
            </div>
            <%--联系方式--%>
            <div class="item">
                <span>联系方式<em>*</em>：</span>
                <div class="ct_box">
                    <div class="phone_header">
                        <p>
                            <img onclick="addPhoneList()" src="${rlab}/front/imgs/add_type_1.png">
                            <span>添加一行</span>
                        </p>
                        <p>
                            <img onclick="deltePhoneList()" src="${rlab}/front/imgs/delete_type_1.png">
                            <span>减少一行</span>
                        </p>
                        <p>
                            <s id="noPeopleTip" class="error_tip rt_tip"
                               style="display:none;line-height: 38px;float: left">
                                <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请添加联系方式
                            </s>
                        </p>
                    </div>
                    <table class="linkman" style="display: none;">
                        <thead>
                        <tr>
                            <th>联系人姓名</th>
                            <th>联系电话</th>
                        </tr>
                        </thead>
                        <tbody id="phoneList">
                        </tbody>
                    </table>
                </div>
            </div>
            <%--联系地址--%>
            <div class="item">
                <span>联系地址<em>*</em>：</span>
                <div class="" style="float: left;">
                    <%--省--%>
                    <div class="ad_new_item layui-form" style="">
                        <select id="province_1" name="quiz2" lay-filter="province1" style="width: 114px;">
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
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">
                    <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请补全机构所在地址
                </s>
            </div>
            <%--详细地址--%>
            <div class="item">
                <span>详细地址<em>*</em>：</span>
                <input id="addressDetail_1" onblur="updateJingWeiDu()" maxlength="50" class="ipt_base" type="text"
                       placeholder="请输入详细地址" style="float: left;">
                <s id="addDetailTip" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">
                    <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请输入所在地详细地址
                </s>
            </div>
            <%--地址经纬度--%>
            <div class="item">
                <span>地址经纬度<em>*</em>：</span>
                <input onfocus="clearLatTip()" id="longitude" class="ipt_base" type="text" placeholder="东经"
                       style="width: 100px;float: left;margin-right: 15px">
                <input onfocus="clearLatTip()" id="latitude" class="ipt_base" type="text" placeholder="北纬"
                       style="width: 100px;float: left;;">
                <s id="orgJwd" class="error_tip rt_tip"
                   style="display:none;line-height: 38px;margin-left: 10px;float: left">
                    <i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请补全经纬度
                </s>
            </div>
            <%--联系地址地图--%>
            <div class="item" style="margin-bottom: 100px;">
                <span>地图：<em>*</em></span>
                <div class="ct_box">
                    <div class="baidu_map">
                        <div class="baidumaps" id="baidumap"></div>
                    </div>
                </div>
            </div>
            <%--提交申请--%>
            <div class="cfm">
                <button type="button" onclick="putOrgForm()">上传服务</button>
            </div>
        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="${rlab}/common/assets/layui/layui.js"></script>
<!--my common js-->
<script type="text/javascript" src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<%--<script src="${rlab}/front/js/view/facilitator_prove.js"></script>--%>
<script type="text/javascript">
    // 清除服务名称提示
    function clearServiceTip() {
        $("#svcNameTip").hide();
    }

    // 清除服务参考价格提示
    function clearPriceTip($_this) {
        $("#svcPriceTip").hide();
    }

    // 清除资质tip
    function clearErrorZZ($_this) {
        if ($($_this).data("loadType") == 0) {
            $("#zzTip").hide();
        }
    }
    var layer, layedit, ditIndex;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;
        // 监听所属机构下拉
        form.on('select(svcOrg)', function (data) {
            $("#svcOrgTip").hide();
        })

        // 监听省1（ 注 册 地）
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

            // 更新地图
            var flag = searchByStationName(map, $("#province_1").val() + $("#city_1").val() + $("#county_1").val() + $("#addressDetail_1").val());
            if (!flag) {
                searchByStationName(map, $("#province_1").val() + $("#city_1").val());
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
            // 更新地图
            var flag = searchByStationName(map, $("#province_1").val() + $("#city_1").val() + $("#county_1").val() + $("#addressDetail_1").val());
            if (!flag) {
                searchByStationName(map, $("#province_1").val() + $("#city_1").val());
            }

            $("#orgAd1Tip").hide();// 隐藏error提示
        });

        if (isLtIE9) {
            JPlaceHolder.init();
        }

    })

    /**
     * 详细地址失去焦点
     */
    function updateJingWeiDu() {
        // 更新地图
        var flag = searchByStationName(map, $("#province_1").val() + $("#city_1").val() + $("#county_1").val() + $("#addressDetail_1").val());
        if (!flag) {
            searchByStationName(map, $("#province_1").val() + $("#city_1").val());
        }

    }
    var map = initMap();

    searchByStationName(map, '中国',function () {
        $("#longitude").val("");
        $("#latitude").val("");
    });


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
    function searchByStationName(map, site,callback) {
        var localSearch = new BMap.LocalSearch(map);
        map.clearOverlays();//清空原来的标注

        var keyword = site;
        localSearch.setSearchCompleteCallback(function (searchResult) {
            try {
                var poi = searchResult.getPoi(0);
                poi.point.lng.toFixed(2);

            } catch (e) {
                return false;
            }

            $("#longitude").val(poi.point.lng.toFixed(2));// 更新视图
            $("#latitude").val(poi.point.lat.toFixed(2));// 更新视图
            map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);// 添加标注

            //  var content = keyword + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
            //  var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
            //  marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
            // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
            if(callback){
                callback()
            }
        });

        localSearch.search(keyword);// 启动查询


        return true;
    }

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
    // 删除服务的图片
    function delteCurSvImg($this) {
        $this = $($this);
        $this.parent().remove();
    }
    /*
     ** 添加一行联系人
     */
    function addPhoneList() {
        $("#noPeopleTip").hide();

        $("table.linkman").show();
        var phoneListLength = $("#phoneList tr").length;
        if (phoneListLength > 2) {
            layer.msg("联系人最多添加3个");
            return false;
        }

        if ((phoneListLength + 1) % 2 == 0) {

            $("#phoneList").append('<tr class="even">\
                <td class="name">\
                <input onfocus="clearPeopleTip(this)" type="text" value="" placeholder="请输入联系人姓名">\
                </td>\
                <td class="phone">\
                <input onfocus="clearPeopleTip(this)" type="text" value="" placeholder="请输入联系人电话">\
                </td>\
                <td style="background-color: #fff;">\
                <s class="error_tip rt_tip" style="display:block;line-height: 38px;float: left;display: none;">\
                     <i class="lab-gantanhao" style="padding-left:10px;margin-right: 5px;vertical-align: middle;"></i>联系人或联系方式格式错误\
                </s>\
                </td>\
                </tr>');

        } else {
            $("#phoneList").append('<tr class="">\
                <td class="name">\
                <input  onfocus="clearPeopleTip(this)" type="text" value="" placeholder="请输入联系人姓名">\
                </td>\
                <td class="phone">\
                <input  onfocus="clearPeopleTip(this)" type="text" value="" placeholder="请输入联系人电话">\
                </td>\
                <td style="background-color: #fff;">\
                <s class="error_tip rt_tip" style="display:block;line-height: 38px;float: left;display: none">\
                     <i class="lab-gantanhao" style="padding-left:10px;margin-right: 5px;vertical-align: middle;"></i>联系人或联系方式格式错误\
                </s>\
                </td>\
                </tr>');
        }

    }

    /*
     ** 减少一行联系人
     */
    function deltePhoneList() {
        $("#noPeopleTip").hide();


        var lastTr = $("#phoneList tr").last();
        var TrLen = $("#phoneList tr").length;
        if (TrLen < 2) {
            $("table.linkman").hide();
        }
        lastTr.remove();

    }

    /*
     ** 删除设备
     */
    function delteCurIns($this) {
        $this = $($this);
        $this.parent().remove();
    }

    /*
     ** 新增设备
     */
    function addIns($this) {
        $this = $($this);
        var pListLength = $("#insList").find("p").length;
        if (pListLength > 4) {
            layer.msg("最多添加5个设备");
            return false;
        }

        var itemHtml =
            $('<p>\
                <input maxlength="100" class="ipt_base" type="text" placeholder="请输入使用设备">\
                <img onclick="delteCurIns(this)" src="${rlab}/front/imgs/close_t1.png">\
            </p>');

        itemHtml.insertBefore($this);
    }

    //  上传服务图片
    function putServiceImg($_this) {
        var imgLen = $("#imgList li").length;
        if (imgLen > 7) {
            layer.msg("最多可以添加8个图片");
            return false;
        }
        var $fileInput = $($_this),// file input dom
            $form = $fileInput.parent(),// form dom
            $img = $form.parent().find("img"),
            $spinSrc = $fileInput.data("spin"),
            $originSrc = $img.attr("src");

        var curItem = $("<li class='svc_img'></li>");
        var curImg = $('<img src="' + $spinSrc + '" alt="">');
        curItem.append(curImg);
        curItem.append('<s class="close" onclick="delteCurSvImg(this)"></s>');
        //   originLoadType = $fileInput.data("loadType");// 上传前状态

        // 状态判断拦截
        //  if (originLoadType == 1) {
        //      layer.msg("请勿频繁操作上传！")
        //      return false;
        //  }

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
                // $fileInput.data("loadType", 1);// 设置其上传状态为1（上传中）
                // $img.attr("src", $spinSrc);// 上传中的菊花转（不同比例，所以传进来）
                curImg.attr("src", $spinSrc);
                $("#imgList").append(curItem);
                curItem.insertBefore($("#iptLable"));
            },
            success: function (data) {
                // 表单提交成功后执行的函数
                try {
                    data = JSON.parse(data);
                } catch (e) {
                    console.log("请求被拦截，返回JSON字符串");
                }

                if (data.code == 0) {
                    if (data.size > 1048576 * 5) {
                        layer.msg("文件大小不能超过5M");
                        curItem.remove();// 一處
                    } else {
                        // success
                        // $fileInput.data("loadType", 2);// 更新上传状态为2（上传成功）；
                        // $img.attr("src", data.payload);// 更新src
                        curImg.attr("src", data.payload);
                    }
                } else {
                    $fileInput.data("loadType", originLoadType);// 上传处理失败，回置上传状态；
                    $img.attr("src", $originSrc);// 回置SRC
                }

            },
            error: function () {
                $fileInput.data("loadType", originLoadType);// 上传失败，回置上传状态；
                $img.attr("src", $originSrc);// 回置SRC
            }
        }

        $($_this).parent().ajaxSubmit(fileAjaxOption);// 提交表单
        return false;

    }
    //  上传资质
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

    //  ---------------- 选择服务特点 --------------
    function choseServiceTrait() {

        var html =
            '<div class="zz_modal">\
             <p class="zz_title">选择服务特点：（可多选，最多选择3个）</p>\
             <div class="zz_main">\
                <div class="zz_xiao_main">\
                    <ul id="traitList">\
                    </ul>\
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
            var flag = saveTrait();// 保存资质
            if (flag) {
                layer.close(my_layer);
            }
        })

        // 初始化时，是从后台拿数据的，拿数据时判断一下是否和这里面的三个值相等，相等的话就渲染为checked 默认选中
        getTrait(function (data) {
            var fileList = $("#traitList");
            var qftLists = $("#traitListUl span");

            for (var i = 0; i < data.length; i++) {
                // 筛选出已选中的资质，标记为选中状态
                var flag = true;// 重置标记
                qftLists.each(function () {
                    var this_name;
                    this_name = $.trim($(this).text());
                    // 判断是否一致
                    if (this_name == data[i].featureName) {
                        fileList.append(
                            '<li>\
                                <label class="ckbox checkbox_checked">\
                                  <input type="checkbox" onclick="changeCheck(this)" checked>\
                                </label>\
                                <span>' + data[i].featureName + '</span>\
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
                            <span>' + data[i].featureName + '</span>\
                        </li>'
                    );
                }

            }

//            var flag = true;// 标记状态，默认为选中
//            if (data.code === 0 && data.payload.length > 0) {
//
//            }

        });

    }

    /**
     * 获取服务特点
     */
    function getTrait(success) {
        $.ajax({
            url: BASE_URL + "/user/service_feature",
            type: 'get',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                success(data.payload);
            },
            error: function () {
                layer.msg("服务特点获取失败");
            }
        })
    }
    /*
     ** 勾选特点，保存特点
     */
    function saveTrait() {

        var checkedsIpt = $("#traitList .ckbox  input:checked");

//        var qftList = $("#traitList");
        var traitList = $("#traitListUl");

        var html = '';
        if (checkedsIpt.length > 3) {
            layer.msg("最多选择3个特点")
            return false;
        }

        traitList.empty();// 清空列表

        for (var i = 0; i < checkedsIpt.length; i++) {
            var html = '<span>' + $(checkedsIpt[i]).parent().parent().find("span").text() + '</span>'
            traitList.append(html);
        }

        return true;
    }
    // ---------------------资质相关--------------------------
    // 选择资质事件
    function choseTagFactory() {
        var html = '<div class="zz_modal">\
            <p class="zz_title">选择服务资质：（可多选，最多选择5个）</p>\
            <div class="zz_main">\
             <div class="zz_xiao_main">\
                <ul id="filedList">\
                </ul>\
            </div>\
            </div>\
            <div class="zz_add" style="display: none;">\
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
            var qftLists = $("#zzList span");

            for (var i = 0; i < data.length; i++) {

                // 筛选出已选中的资质，标记为选中状态
                var flag = true;// 重置标记
                qftLists.each(function () {
                    var this_name = $.trim($(this).text());
                    console.log(this_name);
                    // 判断是否一致
                    if (this_name == data[i].aptitudeName) {
                        fileList.append(
                            '<li>\
                                <label class="ckbox checkbox_checked">\
                                  <input  type="checkbox" onclick="changeCheck(this)" checked>\
                                </label>\
                                <span>' + data[i].aptitudeName + '</span>\
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
                              <input type="checkbox" onclick="changeCheck(this)">\
                            </label>\
                            <span>' + data[i].aptitudeName + '</span>\
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

    // 选择资质事件
    function choseTagFactoryOld() {
        var html = '<div class="zz_modal">\
            <p class="zz_title">选择服务资质：（可多选，最多选择8个）</p>\
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
                    if (this_name == data[i].aptitudeName) {
                        fileList.append(
                            '<li>\
                                <label class="ckbox checkbox_checked">\
                                  <input data-load-type="' + this_load_type + '" data-origin-src="' + this_origin_src + '" type="checkbox" onclick="changeCheck(this)" checked>\
                                </label>\
                                <span>' + data[i].aptitudeName + '</span>\
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
                            <span>' + data[i].aptitudeName + '</span>\
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
        var qftList = $("#zzList");

        var html = '';
        if (checkedsIpt.length > 5) {
            layer.msg("最多选择5条资质")
            return false;
        }

        qftList.empty();// 清空列表

        for (var i = 0; i < checkedsIpt.length; i++) {
            var originSrc = $(checkedsIpt[i]).data("originSrc") ? $(checkedsIpt[i]).data("originSrc") : BASE_URL + "/front/imgs/icon/2_2/add_type2.png";
            var loadType = $(checkedsIpt[i]).data("loadType");// 点击选择，初始化列表时，把loadType初始化上去；
//            var html =
//                '<div class="img_item">\
//                     <label class="ipt_lable">\
//                           <span></span>\
//                           <img  src="' + originSrc + '">\
//                         <form method="post" enctype="multipart/form-data">\
//                             <input data-load-type="' + loadType + '"  data-spin="' + BASE_URL + '/front/imgs/icon/2_2/add_type2_loading.gif"  type="file" name="file" onchange="uploadLogos(this)" onclick="clearErrorZZ(this)">\
//                         </form>\
//                     </label>\
//                     <i>' +  + '</i>\
//               </div>';

            var html = '<span>' + $(checkedsIpt[i]).parent().parent().find("span").text() + '</span>'

            qftList.append(html);
        }
        qftList.append('<button onclick="choseTagFactory(this)" type="button" class="common_btn">选择服务资质</button>');

        return true;
    }

    // 获取资质库
    /*
     ** 获取资质库的所有资质
     */
    function getIdentify(success, error) {
        $.ajax({
            // url: BASE_URL + "/bg/org/OrgcertificateTmp/query",
            url: BASE_URL + "/user/service_aptitude",
            type: 'get',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                if (data.code === 0) {
                    success(data.payload);
                } else if (data.code === 1012) {
                    layer.msg("账户未登录或登录超时，请重新登录");
                } else {
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
            // url: BASE_URL + "/bg/org/OrgcertificateTmp/add?name=" + name,
            url: BASE_URL + "/user/service_aptitude",
            type: 'post',
            dataType: 'json',
            contentType: 'application/json',
            data: name,
            success: function (data) {
                success(data);
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
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

    // 单选按钮切换
    function switchRadio($this) {
        $this = $($this);
        var origin = $this.data("origin");
        var labels = $this.parent().parent().parent().find("label");
        labels.removeClass("cur_checked");
        $this.parent().addClass("cur_checked");
        console.log($this)
        if (origin == "all") {
            $("#fixedPrice").hide();
            $("#rangPrice").hide();
        }

        if (origin == "fixed") {
            $("#fixedPrice").show();
            $("#rangPrice").hide();
        }

        if (origin == "range") {
            $("#fixedPrice").hide();
            $("#rangPrice").show();
        }
    }


    /*
     **  提交表单
     */
    var PUT_FLAG = true;

    function putOrgForm() {
        var ERROR_FLAG = true;
        if (!PUT_FLAG) {
            layer.msg("请不要重复提交");
        }
        // 服务名称
        console.log("服务名称:");
        var serviceName = $("#serviceName").val()
        console.log(serviceName);
        if (serviceName == "") {
            ERROR_FLAG = false;
            $("#svcNameTip").show();
            $("#svcNameTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请输入服务名称');
        }

        // 服务对应机构名称
        console.log("机构名:");
        var orgOid = $("#serviceOrg").val();
        console.log(orgOid);
        if (orgOid === '') {
            ERROR_FLAG = false;
            $("#svcOrgTip").show();
            $("#svcOrgTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请选择机构');
        }

        // 服务图片
        console.log("服务图片:");
        var serviceImgList = $("#imgList .svc_img img");
        var servicePics = [];
        serviceImgList.each(function () {
            var imgSrc = $(this).attr("src");
            servicePics.push(imgSrc);
        });
        console.log(serviceImgList);

        // 服务特点
        console.log("服务特点:");
        var traitList = $("#traitListUl span");
        var serviceFeature = [];
        traitList.each(function () {
            serviceFeature.push($(this).text());
        })
        console.log(serviceFeature);

        // 获取资质
        console.log("获取资质:");
        var qftList = $("#zzList  span");
        var serviceCredit = [];
        qftList.each(function () {
            serviceCredit.push($(this).text())
        })
        console.log(serviceCredit);

        // 参考价格 - 报价说明
        console.log("参考价格");
        var priceType = $("input[name=price]:checked").data("origin");// 服务类型
        var priceInfo = $("#priceInfos").val();// 服务说明
        var servicePrice = null;// 服务数据

        if (priceType == "all") {
            servicePrice = {
                "flag": 3,
                'remark': priceInfo
            }

        } else if (priceType == "fixed") {
            var accPrice = $("#fixedPriceP").val();
            var fixedUnit = $("#fixedUnit").val();

//            if(/^[0-9]*$/.test(fixedUnit)){
//                ERROR_FLAG = false;
//                $("#svcPriceTip").show();
//                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>单位应为1-10个汉字、字母或符号')
//            }

            if (fixedUnit.length >= 11 || fixedUnit.length <= 0 || /^[0-9]*$/.test(fixedUnit)) {
                ERROR_FLAG = false;
                $("#svcPriceTip").show();
                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>输入单位应为1-10个字符')
            }

            // 单位控制
            if (fixedUnit == "") {
                ERROR_FLAG = false;
                $("#svcPriceTip").show();
                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请输入单位')
            }

            if (accPrice == "" || accPrice > 200000 || accPrice < 1 || !/^\d{0,6}$/.test(accPrice)) {
                ERROR_FLAG = false;
                $("#svcPriceTip").show();
                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>价格区间为1-200000')
            }

            // 具体价格
            servicePrice = {
                'flag': '1',
                'remark': priceInfo,
                'accPrice': accPrice * 100,
                'unit': fixedUnit
            }

        } else {
            var scopeLowPrice = $("#rangeSubPrice").val();
            var scopeHighPrice = $("#rangeSupPrice").val();
            var rangeUnit = $("#rangeUnit").val();

            if (rangeUnit.length >= 11 || rangeUnit.length <= 0 || /^[0-9]*$/.test(rangeUnit)) {
                ERROR_FLAG = false;
                $("#svcPriceTip").show();
                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>输入单位应为1-10个字符')
            }


            // 单位控制
            if (rangeUnit == "") {
                ERROR_FLAG = false;
                $("#svcPriceTip").show();
                $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请输入单位')
            }

            // todo:最高价不填写的情况
            if ($.trim(scopeHighPrice) == "") {
                if (scopeLowPrice < 1 || !/^\d{0,6}$/.test(scopeLowPrice)) {
                    ERROR_FLAG = false;
                    $("#svcPriceTip").show();
                    $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>价格应为1-200000的正整数')
                }
            } else {

                if (scopeLowPrice - scopeHighPrice >= 0) {
                    ERROR_FLAG = false;
                    $("#svcPriceTip").show();
                    $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>最高价必须大于最低价')
                }

                if (scopeHighPrice > 200000 || scopeLowPrice < 1 || !/^\d{0,6}$/.test(scopeHighPrice) || !/^\d{0,6}$/.test(scopeLowPrice)) {
                    ERROR_FLAG = false;
                    $("#svcPriceTip").show();
                    $("#svcPriceTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>价格应为1-200000的正整数')
                }

            }


            // 价格范围
            servicePrice = {
                'flag': '2',
                'remark': priceInfo,
                'scopeLowPrice': scopeLowPrice * 100,
                'scopeHighPrice': scopeHighPrice * 100,
                'unit': rangeUnit
            }

        }

        console.log("价格对象:")
        console.log(servicePrice);

        // 服务简介
        console.log("服务简介:");
        var serviceDes = $("#serviceInfo").val();
        console.log(serviceDes);
        // 使用设备
        var insList = $("#insList input");
        var serviceMachine = [];
        insList.each(function () {
            if ($.trim($(this).val()) != "") {
                serviceMachine.push($(this).val());
            }
        })
        console.log("使用设备:");
        console.log(serviceMachine);

        // 依据方法
        console.log("依据方法:");
        var serviceMethod = $("#serviceMethos").val();
        console.log(serviceMethod);

        // 服务周期
        console.log("服务周期：");
        var servicePeriod = $("#serviceCycle").val();
        console.log(servicePeriod);

        // 其他备注
        console.log("其他备注:");
        var serviceNote = $("#otherInfo").val();
        console.log(serviceNote);

        //
        // 联系方式
        var phoneList = $("#phoneList tr");
        var orgContactsList = []; // 联系人联系方式容器

        // 无联系方式的提醒
        if (phoneList.length <= 0) {
            ERROR_FLAG = false;
            $("#noPeopleTip").show();
            $("#noPeopleTip").html('<i class="lab-gantanhao" style="margin-right: 5px;vertical-align: middle;"></i>请添加联系方式');
        }

        var REG = {
            phone400: /^400[0-9]{7}/,
            phone800: /^800[0-9]{7}/,
            phone11: /^1(3|4|7|5|8)([0-9]{9})/,
//            fixedPhone: /([0-9]{3,4}-)?[0-9]{7,8}/,
            fixedPhone: /^[0-9]{3,4}-[0-9]{7,8}$/,
        }

        phoneList.each(function () {
            var contactItem = {
                conName: null,
                conPhone: null,
            }
            var orgPeopleNameTip = $(this).find(".error_tip ");
            var curName = $(this).find(".name input").val();
            var curPhone = $(this).find(".phone input").val();
            contactItem.conName = curName;
            contactItem.conPhone = curPhone;

            if (curPhone == "") {
                orgPeopleNameTip.html('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请输入正确的联系电话');
                orgPeopleNameTip.show();
                ERROR_FLAG = false;
            }

            if (!REG.fixedPhone.test(curPhone) && !REG.phone11.test(curPhone)) {
                orgPeopleNameTip.html('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请输入正确的联系电话');
                orgPeopleNameTip.show();
                ERROR_FLAG = false;
            }

            // 联系人姓名提示
            if (!/^[\u4e00-\u9fa5]{2,5}$/.test(curName)) {
                orgPeopleNameTip.html('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请输入正确的姓名');
                orgPeopleNameTip.show();
                ERROR_FLAG = false;
            }

            orgContactsList.push(contactItem);
        })

        console.log("联系方式：");
        console.log(orgContactsList);

        // todo
        // 联系地址省市区
        var province = $("#province_1").val();
        var city = $("#city_1").val();
        var county = $("#county_1").val();
        console.log("省市区：");
        console.log(province);
        console.log(city);
        console.log(county);

        if (province == "" || city == "" || county == "") {
            $("#orgAd1Tip").html('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请选择城市');
            $("#orgAd1Tip").show();
            ERROR_FLAG = false;
        }

        // 详细地址
        console.log("详细地址：");
        var serviceAddress = $("#addressDetail_1").val();
        console.log(serviceAddress);

        if (serviceAddress == "") {
            ERROR_FLAG = false;
            $("#addDetailTip").html('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请输入详细地址');
            $("#addDetailTip").show();
        }

        // 地址经纬度
        console.log("经纬度:");
        var serviceLon = $("#longitude").val();
        var serviceLat = $("#latitude").val();
        console.log(serviceLon);
        console.log(serviceLat);

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(serviceLon) || /^[0-9]{1,3}$/.test(serviceLon))) {
            $("#orgJwd").text('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请填写正确的经纬度');
            $("#orgJwd").show();
            ERROR_FLAG = false;
        }

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(serviceLat) || /^[0-9]{1,3}$/.test(serviceLat))) {
            $("#orgJwd").text('<i class="lab-gantanhao" style="margin-left: 10px;margin-right:5px;vertical-align: middle;"></i>请填写正确的经纬度');
            $("#orgJwd").show();
            ERROR_FLAG = false;
        }

        var formData = {
            serviceName: serviceName,// 服务名
            orgOid: orgOid,// 机构ID
            servicePics: JSON.stringify(servicePics),// 数组服务图片
            // servicePics: servicePics,// 数组服务图片
            serviceFeature: JSON.stringify(serviceFeature),// 服务特点
            // serviceFeature: serviceFeature,// 服务特点
            serviceCredit: JSON.stringify(serviceCredit),// 服务资质
            // serviceCredit: serviceCredit,// 服务资质
            servicePrice: JSON.stringify(servicePrice),// 参考价格
            // servicePrice: servicePrice,// 参考价格
            serviceDes: serviceDes,// 服务简介
            serviceMachine: JSON.stringify(serviceMachine),// 使用设备
//            serviceMachine: serviceMachine,// 使用设备
            serviceMethod: serviceMethod,// 依据方法
            servicePeriod: servicePeriod,// 服务周期
            serviceNote: serviceNote,// 其他备注
            serviceContacts: orgContactsList,// 联系方式
            serviceProvince: province,// 省
            serviceCity: city,// 市
            serviceDistrict: county,// 区
            serviceAddress: serviceAddress,// 详细地址
            serviceLon: serviceLon,// 东经
            serviceLat: serviceLat,// 北纬
            serviceSubmiter: ${sessionScope.uid},
            serviceIsManager: 0 // 用户端传0 ，服务端传1
        }
        console.log(formData);
        if (ERROR_FLAG) {
            putService(formData);
        } else {
            layer.msg("提交失败，请检查表单");
        }
    }

    function putService(formData) {
        PUT_FLAG = false;// 更新提交状态
        $.ajax({
            url: BASE_URL + '/user/service_upload',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (data) {
                if (data.code === 0) {
                    location.href = BASE_URL + "/user/service_detail_page?serviceId=" + data.payload;
                } else if (data.code === 5001) {
                    layer.msg(data.message);
                    PUT_FLAG = true;
                } else {
                    PUT_FLAG = true;
                }
            },
            error: function (err) {
                PUT_FLAG = true;
            }
        });

    }

    $("input").on("focus", function () {
        $(this).parent().find("s.error_tip").hide();
    })

    // 清理联系人提示
    function clearPeopleTip($this) {
        $($this).parent().parent().find("s.error_tip").hide();
    }
</script>
</body>
</html>
