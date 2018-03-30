<%--
  Created by IntelliJ IDEA.
  User: ChenXuan
  Date: 2017/9/19 0019
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <%--<script src="https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v" type="text/javascript"></script>--%>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/ins_share_base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/component_base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css">
    <style>
        .logoModal input.jcrop-keymgr {
            display: none !important;
        }

        .lab_p {
            margin-top: 26px;
        }

        .lab_p .lft {
            min-width: 100px;
            float: left;
            font-size: 18px;
            color: #7b8da0;
        }

        .lab_p .rt {
            float: left;

        }

        .lab_p h5 span {
            color: #ff4747;
        }

        /*todo*/
        .parent_org .layui-form-select .layui-input {
            width: 755px !important;
        }

        .lab_p .layui-form-select .layui-input {
            border: 0 none;
            line-height: 50px;
            height: 50px;
            width: 300px;
        }

        input, textarea {
            color: #4c5e70;
        }

        .lab_p .rt {
            color: #788491;
        }

        .lab_p .layui-layedit {
            width: 700px;
            background: #fff;
        }

        .city_select input {
            width: 190px !important;

        }

        .phone_row button ,.rowphone button{
            background: #f2f5f8;
            line-height: 50px;
            border: 0 none;
            padding: 0 10px;
            padding-right: 20px;
            color: #49aaff;
            cursor: pointer;

        }

        .phone_row button i ,.rowphone button i{
            color: orangered;
            font-size: 20px;
        }

        .put_form {
            margin-left: 100px;
            margin-top: 100px;
        }

        /*资质*/
        .org_qua {
            margin-top: 20px;
        }

        .org_qua .item {
            float: left;
            margin-right: 15px;
        }

        .org_qua .item .qualification {
            position: relative;
        }

        .org_qua .item .qualification > i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 30px;
            z-index: 3;
            cursor: pointer;
        }

        .org_qua .item .qualification > i:active {
            color: rgba(59, 63, 68, 0.9);
        }

        .org_qua p {
            line-height: 30px;
            color: #FF5722;
        }

        .org_qua img {
            width: 110px;
            height: 110px;
        }

        .org_load {
            width: 200px;
            height: 200px;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .org_load img {
            width: 200px;
            height: 200px;
            position: absolute;
            top: 0;
            left: 0;
            background: #fff;
            z-index: 2;
        }

        .org_load i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 30px;
            z-index: 3;
            cursor: pointer;
        }

        .org_load input {
            position: absolute;
            z-index: 3;
            height: 250px;
            width: 200px;
            display: block;
            top: -50px;
            left: 0;
            cursor: pointer;
        }

        /*营业执照*/
        .license {
            width: 299px;
            /*height: 288px;*/
            height: 203px;
            overflow: hidden;
            position: relative;
        }

        .license_remove {

        }

        .license_remove:active {
            color: rgba(59, 63, 68, 0.9);
        }

        .license i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 28px;
            cursor: pointer;
            z-index: 4;
        }

        .license img {
            width: 299px;
            height: 200px;
            background: #fff;
            position: absolute;
            left:0;
            top:0;
            z-index: 3;
        }

        .license input {
            position: absolute;
            /*cursor: pointer;*/
            /*height: 258px;*/
            /*width: 299px;*/
            top: 30px;
            /*left: 0;*/
        }

        /*资质图片上传*/
        .qualification {
            width: 110px;
            height: 110px;
            position: relative;
            overflow: hidden;
        }

        .qualification img {
            width: 110px;
            height: 110px;
            background: #fff;
        }

        .orgMessage .qualification input {
            position: absolute;
            cursor: pointer;
            height: 130px;
            width: 110px;
            top: -30px;
            left: 0;
        }

        /*logomodal覆盖*/
        .logoModal {
            width: initial !important;
        }
        .sech{
            padding: 20px 0;
            border-bottom: 1px dashed #dce3ea;
        }
        .sech input{
            height: 50px;
            width: 300px;
            font-size: 16px;
            background-color: white;
            padding-left: 10px;
            margin-left: 20px;
        }
        .sech p{
            line-height: 50px;
        }
        .main p em{
            color: red;
        }
        .orgCorporation,.orgMessage{
            border-bottom: 1px dashed  #dce3ea;
            padding: 20px 0;
        }
        .orgCorporation p,.orgMessage p{
            line-height: 50px;
            font-size: 14px;
            color: #7b8da0;
            padding-left: 15px;
            margin: 10px 0;
        }
        .orgCorporation .tit,.orgMessage .tit{
            color: #333;padding: 0;font-size: 16px;
            margin-bottom: 10px;
        }
        .orgCorporation input,.orgMessage input{
            width: 500px;
            padding-left: 15px;
            height: 50px;
            border-radius: 5px;
        }
        .titinp{
            width: 130px;
            display: inline-block;
        }
        .lonlat input{
            width: 100px;
            margin: 0 10px;
        }
        #source{
            width: 500px;
            float: left;
        }
        .lab_p .layui-form-select .layui-input{
            width: 500px;
        }
        .item p{
            line-height: 20px;
            text-align: center;
            padding: 0;
        }
        #logo img{
            width: 140px;
            height: 140px;
            background: #fff;
            cursor: pointer;
        }
        #logo{
            position: relative;
        }
        .orgMessage #logoInp{
            position: absolute;
            top:0;
            left: 0;
            padding: 0;
            z-index: -1;
        }
        .identity input{
            position: absolute;
            top:0;
            left: 0;
            padding: 0;
            z-index: -1;
        }
        .identity img{
            width: 240px;
            height: 148px;
        }
        .files input{
            position: absolute;
            top:0;
            left: 0;
            padding: 0;
            z-index: -1;
        }
        .files img{
            cursor: pointer;

        }
        .rowphone input{
            width: 180px;
        }
        .rowphone .people,.phone{
            float: left;
        }
        .files{
            margin-right: 10px;
        }
        .sech dl{
            width: 500px;
        }
        .sech input{
            margin: 0;
            padding: 0 0 0 20px;
        }
        .rowphone{
            margin-bottom: 10px;
        }
    </style>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>

    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="6"/>
                <jsp:param name="secondMenu" value=""/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                    <a><cite>服务商管理</cite></a>
                    <a><cite>服务商信息修改</cite></a>
                </span>
            </div>

            <div class="orgCorporation">
                    <p class="tit">机构法人信息：</p>
                    <p><span class="titinp">真实姓名<em>**</em>：</span><input type="text" placeholder="请输入真实姓名" id="userName" value="${orgInfo.orgLicense.orgPerson}" maxlength="10"></p>
                    <p><span class="titinp">身份证号码<em>**</em>：</span><input type="text" placeholder="请输入身份证号码" id="userNum" value="${orgInfo.orgLicense.identificationNumber}"></p>
                    <div class="lab_p clearfix identity">
                        <p style="float: left;margin: 0"><span class="titinp">身份证照片<em>**</em>：</span></p>
                        <div class="rt" style="margin-right: 10px;position: relative">
                            <label>
                                <c:if test="${orgInfo.orgLicense != null}">
                                    <img src="${orgInfo.orgLicense.legalPersonPic1}" style="margin-right: 10px;width: 240px">
                                </c:if>
                                <c:if test="${orgInfo.orgLicense == null}">
                                    <img src="${rlab}/bg/img/usercard1.png" alt="" style="margin-right: 10px;width: 240px">
                                </c:if>
                                <input data-up-type="identity" onchange="uploadImg(this)" name="logoFile" id="identity1" accept="image/jpg,image/jpeg,image/png" type="file" data-img-src="${orgInfo.orgLicense.legalPersonPic1}">
                            </label>
                        </div>
                        <div class="rt" style="position: relative">
                            <label>
                                <c:if test="${orgInfo.orgLicense != null}">
                                    <img src="${orgInfo.orgLicense.legalPersonPic2}" style="margin-right: 10px;width: 240px">
                                </c:if>
                                <c:if test="${orgInfo.orgLicense == null}">
                                    <img src="${rlab}/bg/img/usercard2.png" alt="" style="margin-right: 10px;width: 240px">
                                </c:if>
                                <input data-up-type="identity" onchange="uploadImg(this)" name="logoFile" id="identity2" accept="image/jpg,image/jpeg,image/png" type="file" data-img-src="${orgInfo.orgLicense.legalPersonPic2}">
                            </label>
                        </div>
                    </div>
            </div>
            <div class="orgMessage">
                <form class="layui-form" action="">
                    <p class="tit" style="margin-top: 20px;width: auto;float: none">机构信息：</p>
                    <p><span class="titinp">机构名称<em>**</em>：</span><input id="orgName" type="text" placeholder="请输入机构名称" value="${orgInfo.orgName}" maxlength="100"></p>
                    <%--机构logo--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">机构logo：</span></p>
                        <div class="rt" id="logo">
                            <label>
                                <c:if test="${orgInfo.orgLogo != null}">
                                    <img class="org_logo" src="${orgInfo.orgLogo}" style="width: 140px">
                                </c:if>
                                <c:if test="${orgInfo.orgLogo == null}">
                                    <img class="org_logo" src="${rlab}/front/imgs/icon/org_logo_default.png" style="width: 140px">
                                </c:if>
                                <input data-up-type="orgimage" onchange="uploadImg(this)" name="logoFile" id="logoInp" accept="image/jpg,image/jpeg,image/png" type="file">
                            </label>
                        </div>
                    </div>
                    <p><span class="titinp">组织机构代码<em>**</em>：</span><input type="text" placeholder="请输入组织机构代码" id="orgCode" value="${orgInfo.orgCode}"></p>
                    <%--机构性质--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">机构性质<em>*</em>：</span></p>
                        <div class="rt">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="orgCategoryId" name="modules" lay-verify="required" lay-search="">
                                        <option value="">请选择...</option>
                                        <option value="1" ${orgInfo.orgCategoryId==1?"selected":""}>科研院所</option>
                                        <option value="2" ${orgInfo.orgCategoryId==2?"selected":""}>高等院校</option>
                                        <option value="3" ${orgInfo.orgCategoryId==3?"selected":""}>国有企业</option>
                                        <option value="4" ${orgInfo.orgCategoryId==4?"selected":""}>民营企业</option>
                                        <option value="5" ${orgInfo.orgCategoryId==5?"selected":""}>第三方检测</option>
                                        <option value="6" ${orgInfo.orgCategoryId==6?"selected":""}>军队</option>
                                        <option value="99" ${orgInfo.orgCategoryId==99?"selected":""}>其他</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--机构注册地--%>
                    <div class="lab_p clearfix">
                        <p style="float: left"><span class="titinp">机构注册地<em>**</em>：</span></p>
                        <div class="rt">
                            <%--START三级联动--%>
                            <div class="layui-form-item city_select">

                                <div class="layui-input-inline">
                                    <select id="province1" name="quiz1" lay-filter="province1">
                                        <option value="">请选择省</option>
                                        <option value="北京市" data-province-id="110000" ${orgInfo.orgLicense.orgAddrProvince=="北京市"?"selected":""}>北京市</option>
                                        <option value="天津市" data-province-id="120000" ${orgInfo.orgLicense.orgAddrProvince=="天津市"?"selected":""}>天津市</option>
                                        <option value="河北省" data-province-id="130000" ${orgInfo.orgLicense.orgAddrProvince=="河北省"?"selected":""}>河北省</option>
                                        <option value="山西省" data-province-id="140000" ${orgInfo.orgLicense.orgAddrProvince=="山西省"?"selected":""}>山西省</option>
                                        <option value="内蒙古自治区" data-province-id="150000" ${orgInfo.orgLicense.orgAddrProvince=="内蒙古自治区"?"selected":""}>内蒙古自治区</option>
                                        <option value="辽宁省" data-province-id="210000" ${orgInfo.orgLicense.orgAddrProvince=="辽宁省"?"selected":""}>辽宁省</option>
                                        <option value="吉林省" data-province-id="220000" ${orgInfo.orgLicense.orgAddrProvince=="吉林省"?"selected":""}>吉林省</option>
                                        <option value="黑龙江省" data-province-id="230000" ${orgInfo.orgLicense.orgAddrProvince=="黑龙江省"?"selected":""}>黑龙江省</option>
                                        <option value="上海市" data-province-id="310000" ${orgInfo.orgLicense.orgAddrProvince=="上海市"?"selected":""}>上海市</option>
                                        <option value="江苏省" data-province-id="320000" ${orgInfo.orgLicense.orgAddrProvince=="江苏省"?"selected":""}>江苏省</option>
                                        <option value="浙江省" data-province-id="330000" ${orgInfo.orgLicense.orgAddrProvince=="浙江省"?"selected":""}>浙江省</option>
                                        <option value="安徽省" data-province-id="340000" ${orgInfo.orgLicense.orgAddrProvince=="安徽省"?"selected":""}>安徽省</option>
                                        <option value="福建省" data-province-id="350000" ${orgInfo.orgLicense.orgAddrProvince=="福建省"?"selected":""}>福建省</option>
                                        <option value="江西省" data-province-id="360000" ${orgInfo.orgLicense.orgAddrProvince=="江西省"?"selected":""}>江西省</option>
                                        <option value="山东省" data-province-id="370000" ${orgInfo.orgLicense.orgAddrProvince=="山东省"?"selected":""}>山东省</option>
                                        <option value="河南省" data-province-id="410000" ${orgInfo.orgLicense.orgAddrProvince=="河南省"?"selected":""}>河南省</option>
                                        <option value="湖北省" data-province-id="420000" ${orgInfo.orgLicense.orgAddrProvince=="湖北省"?"selected":""}>湖北省</option>
                                        <option value="湖南省" data-province-id="430000" ${orgInfo.orgLicense.orgAddrProvince=="湖南省"?"selected":""}>湖南省</option>
                                        <option value="广东省" data-province-id="440000" ${orgInfo.orgLicense.orgAddrProvince=="广东省"?"selected":""}>广东省</option>
                                        <option value="广西壮族自治区" data-province-id="450000" ${orgInfo.orgLicense.orgAddrProvince=="广西壮族自治区"?"selected":""}>广西壮族自治区</option>
                                        <option value="海南省" data-province-id="460000" ${orgInfo.orgLicense.orgAddrProvince=="海南省"?"selected":""}>海南省</option>
                                        <option value="重庆市" data-province-id="500000" ${orgInfo.orgLicense.orgAddrProvince=="重庆市"?"selected":""}>重庆市</option>
                                        <option value="四川省" data-province-id="510000" ${orgInfo.orgLicense.orgAddrProvince=="四川省"?"selected":""}>四川省</option>
                                        <option value="贵州省" data-province-id="520000" ${orgInfo.orgLicense.orgAddrProvince=="贵州省"?"selected":""}>贵州省</option>
                                        <%--${'云南省'.equals(orgInfo.orgAddress.orgAddrProvince)?'selected':''--%>
                                        <option value="云南省" data-province-id="530000" ${orgInfo.orgLicense.orgAddrProvince=="云南省"?"selected":""}>云南省</option>
                                        <option value="西藏自治区" data-province-id="540000" ${orgInfo.orgLicense.orgAddrProvince=="西藏自治区"?"selected":""}>西藏自治区</option>
                                        <option value="陕西省" data-province-id="610000" ${orgInfo.orgLicense.orgAddrProvince=="陕西省"?"selected":""}>陕西省</option>
                                        <option value="甘肃省" data-province-id="620000" ${orgInfo.orgLicense.orgAddrProvince=="甘肃省"?"selected":""}>甘肃省</option>
                                        <option value="青海省" data-province-id="630000" ${orgInfo.orgLicense.orgAddrProvince=="青海省"?"selected":""}>青海省</option>
                                        <option value="宁夏回族自治区" data-province-id="640000" ${orgInfo.orgLicense.orgAddrProvince=="宁夏回族自治区"?"selected":""}>宁夏回族自治区</option>
                                        <option value="新疆维吾尔自治区" data-province-id="650000" ${orgInfo.orgLicense.orgAddrProvince=="新疆维吾尔自治区"?"selected":""}>新疆维吾尔自治区</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="city1" name="quiz2" lay-filter="city1">
                                        <option value="">请选择市</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="county1" name="quiz3" lay-filter="county1">
                                        <option value="">请选择县/区</option>
                                    </select>
                                </div>
                            </div>
                            <%--END三级联动--%>
                        </div>
                    </div>

                    <p><span class="titinp">详细地址<em>**</em>：</span><input type="text" placeholder="请输入详细地址" maxlength="100" id="addressDetail1" value="${orgInfo.orgLicense.orgAddress}"></p>
                    <%--机构所在地--%>
                    <div class="lab_p clearfix">
                        <p style="float: left"><span class="titinp">机构所在地<em>*</em>：</span></p>
                        <div class="rt">
                            <%--START三级联动--%>
                            <div class="layui-form-item city_select">

                                <div class="layui-input-inline">
                                    <select id="province" name="quiz1" lay-filter="province">
                                        <option value="">请选择省</option>
                                        <option value="北京市" data-province-id="110000" ${orgInfo.orgAddress.orgAddrProvince=="北京市"?"selected":""}>北京市</option>
                                        <option value="天津市" data-province-id="120000" ${orgInfo.orgAddress.orgAddrProvince=="天津市"?"selected":""}>天津市</option>
                                        <option value="河北省" data-province-id="130000" ${orgInfo.orgAddress.orgAddrProvince=="河北省"?"selected":""}>河北省</option>
                                        <option value="山西省" data-province-id="140000" ${orgInfo.orgAddress.orgAddrProvince=="山西省"?"selected":""}>山西省</option>
                                        <option value="内蒙古自治区" data-province-id="150000" ${orgInfo.orgAddress.orgAddrProvince=="内蒙古自治区"?"selected":""}>内蒙古自治区</option>
                                        <option value="辽宁省" data-province-id="210000" ${orgInfo.orgAddress.orgAddrProvince=="辽宁省"?"selected":""}>辽宁省</option>
                                        <option value="吉林省" data-province-id="220000" ${orgInfo.orgAddress.orgAddrProvince=="吉林省"?"selected":""}>吉林省</option>
                                        <option value="黑龙江省" data-province-id="230000" ${orgInfo.orgAddress.orgAddrProvince=="黑龙江省"?"selected":""}>黑龙江省</option>
                                        <option value="上海市" data-province-id="310000" ${orgInfo.orgAddress.orgAddrProvince=="上海市"?"selected":""}>上海市</option>
                                        <option value="江苏省" data-province-id="320000" ${orgInfo.orgAddress.orgAddrProvince=="江苏省"?"selected":""}>江苏省</option>
                                        <option value="浙江省" data-province-id="330000" ${orgInfo.orgAddress.orgAddrProvince=="浙江省"?"selected":""}>浙江省</option>
                                        <option value="安徽省" data-province-id="340000" ${orgInfo.orgAddress.orgAddrProvince=="安徽省"?"selected":""}>安徽省</option>
                                        <option value="福建省" data-province-id="350000" ${orgInfo.orgAddress.orgAddrProvince=="福建省"?"selected":""}>福建省</option>
                                        <option value="江西省" data-province-id="360000" ${orgInfo.orgAddress.orgAddrProvince=="江西省"?"selected":""}>江西省</option>
                                        <option value="山东省" data-province-id="370000" ${orgInfo.orgAddress.orgAddrProvince=="山东省"?"selected":""}>山东省</option>
                                        <option value="河南省" data-province-id="410000" ${orgInfo.orgAddress.orgAddrProvince=="河南省"?"selected":""}>河南省</option>
                                        <option value="湖北省" data-province-id="420000" ${orgInfo.orgAddress.orgAddrProvince=="湖北省"?"selected":""}>湖北省</option>
                                        <option value="湖南省" data-province-id="430000" ${orgInfo.orgAddress.orgAddrProvince=="湖南省"?"selected":""}>湖南省</option>
                                        <option value="广东省" data-province-id="440000" ${orgInfo.orgAddress.orgAddrProvince=="广东省"?"selected":""}>广东省</option>
                                        <option value="广西壮族自治区" data-province-id="450000" ${orgInfo.orgAddress.orgAddrProvince=="广西壮族自治区"?"selected":""}>广西壮族自治区</option>
                                        <option value="海南省" data-province-id="460000" ${orgInfo.orgAddress.orgAddrProvince=="海南省"?"selected":""}>海南省</option>
                                        <option value="重庆市" data-province-id="500000" ${orgInfo.orgAddress.orgAddrProvince=="重庆市"?"selected":""}>重庆市</option>
                                        <option value="四川省" data-province-id="510000" ${orgInfo.orgAddress.orgAddrProvince=="四川省"?"selected":""}>四川省</option>
                                        <option value="贵州省" data-province-id="520000" ${orgInfo.orgAddress.orgAddrProvince=="贵州省"?"selected":""}>贵州省</option>
                                        <%--${'云南省'.equals(orgInfo.orgAddress.orgAddrProvince)?'selected':''--%>
                                        <option value="云南省" data-province-id="530000" ${orgInfo.orgAddress.orgAddrProvince=="云南省"?"selected":""}>云南省</option>
                                        <option value="西藏自治区" data-province-id="540000" ${orgInfo.orgAddress.orgAddrProvince=="西藏自治区"?"selected":""}>西藏自治区</option>
                                        <option value="陕西省" data-province-id="610000" ${orgInfo.orgAddress.orgAddrProvince=="陕西省"?"selected":""}>陕西省</option>
                                        <option value="甘肃省" data-province-id="620000" ${orgInfo.orgAddress.orgAddrProvince=="甘肃省"?"selected":""}>甘肃省</option>
                                        <option value="青海省" data-province-id="630000" ${orgInfo.orgAddress.orgAddrProvince=="青海省"?"selected":""}>青海省</option>
                                        <option value="宁夏回族自治区" data-province-id="640000" ${orgInfo.orgAddress.orgAddrProvince=="宁夏回族自治区"?"selected":""}>宁夏回族自治区</option>
                                        <option value="新疆维吾尔自治区" data-province-id="650000" ${orgInfo.orgAddress.orgAddrProvince=="新疆维吾尔自治区"?"selected":""}>新疆维吾尔自治区</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="city" name="quiz2" lay-filter="city">
                                        <option value="">请选择市</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="county" name="quiz3" lay-filter="county">
                                        <option value="">请选择县/区</option>
                                    </select>
                                </div>
                            </div>
                            <%--END三级联动--%>
                        </div>
                    </div>
                    <p><span class="titinp">详细地址<em>*</em>：</span><input type="text" placeholder="请输入详细地址" maxlength="100" id="addressDetail" value="${orgInfo.orgAddress.orgAddrStreet}"></p>
                    <p><span class="titinp">地址经纬度<em>*</em>：</span><span class="lonlat">东经<input type="text" placeholder="请输入.." id="longitude" value="${orgInfo.orgAddress.orgAddrLongitude}">北纬<input type="text" placeholder="请输入.." id="latitude" value="${orgInfo.orgAddress.orgAddrLatitude}"></span></p>
                    <div id="baidumap" class="" style="height: 300px;width: 600px;margin-top: 20px;"></div>
                    <%--机构电话--%>
                    <div class="lab_p clearfix">
                        <p style="float: left"><span class="titinp">机构座机：</span></p>
                        <div id="orgPhone" class="rt">
                            <a href="javascript:void (0)" onclick="addRowPhone()"
                               style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加一行</a>
                            <c:forEach items="${orgInfo.orgContacts.conPhoneList}" var="arr">
                                <div class="phone_row" style="margin-bottom: 10px">
                                    <input value="${arr}" class="lab_input_base lab_input_middle" type="text"
                                           placeholder="电话..." maxlength="20">
                                    <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除
                                    </button>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <p><span class="titinp">机构邮编：</span><input type="text" placeholder="请输入机构邮编" id="orgZipcode" value="${orgInfo.orgAddress.orgZipcode}"></p>
                    <p><span class="titinp">机构网址：</span><input type="text" placeholder="请输入机构网址" id="orgWeb" value="${orgInfo.orgWeb}"></p>
                    <p><span class="titinp">机构传真：</span><input type="text" placeholder="请输入机构传真" id="conFax" value="${orgInfo.orgContacts.conFax}"></p>
                    <p><span class="titinp">机构邮箱：</span><input type="text" placeholder="请输入机构邮箱" id="conEmail" value="${orgInfo.orgContacts.conEmail}"></p>
                    <%--联系方式--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">联系方式<em>*</em>：</span></p>
                        <div class="rt">
                            <a href="javascript:void (0)" onclick="addRow()" style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加联系人</a>
                            <div class="orgPhone">
                                <c:forEach items="${orgInfo.orgContactsList}" var="arr" varStatus="st">
                                    <c:if test="${st.index==0}">
                                        <div class="rowphone clearfix">
                                            <div class="people">
                                                <input type="text" placeholder="联系人.." class="userNames" value="${arr.conName}">
                                            </div>
                                            <div class="phone" style="margin-left: 90px">
                                                <c:forEach items="${arr.conPhoneList}" var="conPhone" varStatus="ind">
                                                    <c:if test="${ind.index==0}">
                                                        <div style="">
                                                            <input type="text" placeholder="手机号..." class="userPhone" value="${conPhone}">
                                                            <a href="javascript:void (0)" onclick="addPhone(this)" style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加手机号</a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ind.index!=0}">
                                                        <div style="margin-top: 10px">
                                                            <input type="text" placeholder="手机号..." class="userPhone" value="${conPhone}">
                                                            <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${st.index!=0}">
                                        <div class="rowphone clearfix">
                                            <div class="people">
                                                <input type="text" placeholder="联系人.." class="userNames" value="${arr.conName}">
                                                <button onclick="removeRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>
                                            </div>
                                            <div class="phone">
                                                <c:forEach items="${arr.conPhoneList}" var="conPhone" varStatus="ss">
                                                    <c:if test="${ss.index==0}">
                                                        <div>
                                                            <input type="text" placeholder="手机号..." class="userPhone" value="${conPhone}">
                                                            <a href="javascript:void (0)" onclick="addPhone(this)" style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加手机号</a>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${ss.index!=0}">
                                                        <div style="margin-top: 10px">
                                                            <input type="text" placeholder="手机号..." class="userPhone" value="${conPhone}">
                                                            <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                    <%--机构来源--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">机构来源<em>**</em>：</span></p>
                        <div class="rt">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="orgSource" name="source" lay-verify="source" lay-search="">
                                        <option value="">请选择...</option>
                                        <option value="1" ${orgInfo.orgSource==1?"selected":""}>推广活动</option>
                                        <option value="0" ${orgInfo.orgSource==0?"selected":""}>线下拓展</option>
                                        <option value="2" ${orgInfo.orgSource==2?"selected":""}>线上平台</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--机构资质--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">机构资质：</span></p>
                        <div class="rt">
                            <div id="box ">
                                <button onclick="choseTagFactory()" id="selectStatus" type="button" class="layui-btn">
                                    选择资质
                                </button>
                            </div>
                            <div id="qftList" class="org_qua">
                                <c:if test="${orgInfo.orgCertificateList.size() > 0}">

                                    <c:forEach items="${orgInfo.orgCertificateList}" var="gfitList">

                                        <div class="item">
                                            <p>${gfitList.orgCertificateName}</p>
                                            <div class="qualification">
                                                <i class="layui-icon" onclick="removeImgSrc(this,event)"
                                                   data-default-src="${rlab}/bg/img/add_status_default.png">&#x1007;</i>
                                                <img src="${gfitList.orgCertificatePic != null && !''.equals(gfitList.orgCertificatePic)?gfitList.orgCertificatePic:'/bg/img/add_status_default.png'}">
                                                <input data-up-type="other"
                                                       data-qft-name="${gfitList.orgCertificateName}"
                                                       data-qft-id="${gfitList.orgCertificateId}"
                                                       onchange="uploadImg(this)" name="qualifications"
                                                       accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">
                                            </div>
                                        </div>

                                    </c:forEach>

                                </c:if>
                            </div>
                        </div>
                    </div>
                    <%--机构材料--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">机构材料<em>**</em>：</span></p>
                        <div class="rt">
                            <%--营业执照副本--%>
                            <div class="rt files businessLicense">
                                <label>
                                    <c:if test="${orgInfo.orgLicense.orgLicensePic != null}">
                                        <img class="org_logo" src="${orgInfo.orgLicense.orgLicensePic}" style="width: 140px" id="businessLicensepic">
                                    </c:if>
                                    <c:if test="${orgInfo.orgLicense.orgLicensePic == null}">
                                        <img class="org_logo" src="${rlab}/bg/img/add_status_default.png" style="width: 140px" id="businessLicensepic">
                                    </c:if>
                                    <input data-up-type="other" onchange="uploadImg(this)" name="logoFile" id="businessLicense" accept="image/jpg,image/jpeg,image/png" type="file">
                                </label>
                                <p style="margin: 0;padding: 0;text-align: center"><span class="titinp">营业执照副本<em>**</em></span></p>
                            </div>
                            <%--组织机构代码证--%>
                            <div class="rt files orgCodes" style="display: ${empty orgInfo.orgLicense.taxEnrolCertificatePic && empty orgInfo.orgCodeObject.orgCodePic ? "none":"block"}">
                                <label>
                                    <c:if test="${orgInfo.orgCodeObject.orgCodePic != null}">
                                        <img class="org_logo" src="${orgInfo.orgCodeObject.orgCodePic}" style="width: 140px" id="orgCodespic">
                                    </c:if>
                                    <c:if test="${orgInfo.orgCodeObject.orgCodePic == null}">
                                        <img class="org_logo" src="${rlab}/bg/img/add_status_default.png" style="width: 140px" id="orgCodespic">
                                    </c:if>
                                    <input data-up-type="other" onchange="uploadImg(this)" name="logoFile" id="orgCodes" accept="image/jpg,image/jpeg,image/png" type="file">
                                </label>
                                <p style="margin: 0;padding: 0;text-align: center"><span class="titinp">组织机构代码证<em>**</em></span></p>
                            </div>
                            <%--税务登记证--%>
                            <div class="rt files orgTax" style="display: ${empty orgInfo.orgLicense.taxEnrolCertificatePic && empty orgInfo.orgCodeObject.orgCodePic ? "none":"block"}">
                                <label>
                                    <c:if test="${orgInfo.orgLicense.taxEnrolCertificatePic != null}">
                                        <img class="org_logo" src="${orgInfo.orgLicense.taxEnrolCertificatePic}" style="width: 140px" id="orgTaxpic">
                                    </c:if>
                                    <c:if test="${orgInfo.orgLicense.taxEnrolCertificatePic == null}">
                                        <img class="org_logo" src="${rlab}/bg/img/add_status_default.png" style="width: 140px" id="orgTaxpic">
                                    </c:if>
                                    <input data-up-type="other" onchange="uploadImg(this)" name="logoFile" id="orgTax" accept="image/jpg,image/jpeg,image/png" type="file">
                                </label>
                                <p style="margin: 0;padding: 0;text-align: center"><span class="titinp">税务登记证<em>**</em></span></p>
                            </div>
                        </div>
                        <input type="checkbox" name="syncretic" id="syncretic" title="三证合一" lay-filter="syncretic" ${empty orgInfo.orgLicense.taxEnrolCertificatePic && empty orgInfo.orgCodeObject.orgCodePic ? "checked":""}>
                    </div>

                    <div class="lab_p clearfix">
                        <p style="float: left">机构简介<em>*</em>：</p>
                        <div class="rt">
                            <textarea class="layui-textarea" id="LAY_demo1" style="display: none">${orgInfo.orgDescription}</textarea>
                        </div>
                    </div>
                </form>
            </div>
            <%--START操作按鈕--%>
            <div class="share_btn" style="text-align: center;margin-top: 50px">
                <button class=" layui-btn layui-btn-normal" type="button" id="putForm" onclick="putOrgForm()">提交申请</button>
            </div>
            <%--END操作按钮--%>

        </div>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<%--<script src="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>--%>
<script src="${rlab}/bg/js/main.js"></script>
<script src="${rlab}/bg/js/myJcropCofig.js"></script>
<script src="${rlab}/bg/js/orgInfoCommon.js"></script>
<script>


    // 修改机构时独有字段
    <%--JcropResult = {--%>
        <%--x: '${orgInfo.orgPositionList.get(0) != null && orgInfo.orgPositionList.get(0) != ''?orgInfo.orgPositionList.get(0):''}',--%>
        <%--y: '${orgInfo.orgPositionList.get(1) != null && orgInfo.orgPositionList.get(1) != ''?orgInfo.orgPositionList.get(1):''}',--%>
        <%--w: '${orgInfo.orgPositionList.get(2) != null && orgInfo.orgPositionList.get(2) != ''?orgInfo.orgPositionList.get(2):''}',--%>
        <%--h: '${orgInfo.orgPositionList.get(3) != null && orgInfo.orgPositionList.get(3) != ''?orgInfo.orgPositionList.get(3):''}',--%>
        <%--src: '${orgInfo.orgLogo != null && orgInfo.orgLogo != "" ? orgInfo.orgLogo:""}'--%>
    <%--};--%>

    // 配置参数
    var MAP_CONFIG = {
        ADDRESS: '${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}'
    }
    var OTHER_CONFIG = {
        PARENT_NAME_ORG_NAME: '${orgInfo.parentOrgName}'
    }

    var ADDRESS_CONFIG = {
        INIT_PROVINCE: '${orgInfo.orgAddress.orgAddrProvince}',
        INIT_CITY: '${orgInfo.orgAddress.orgAddrCity}',
        INIT_CONUNTY: '${orgInfo.orgAddress.orgAddrDistrict}'
    }
    var ADDRESS_CONFIG1 = {
        INIT_PROVINCE: '${orgInfo.orgLicense.orgAddrProvince}',
        INIT_CITY: '${orgInfo.orgLicense.orgAddrCity}',
        INIT_CONUNTY: '${orgInfo.orgLicense.orgAddrDistrict}'
    }
    /*initOrgList();// 初始化机构*/

    var orgID;
    var check=false;
    if(${empty orgInfo.orgLicense.taxEnrolCertificatePic?"true":"false"} && ${empty orgInfo.orgCodeObject.orgCodePic?"true":"false"}){
        check=true;
    }
    //添加机构联系人
    function addRow() {
        if($(".rowphone").length>4){
            layer.msg("最多添加五个联系人");
            return;
        }
        $(".orgPhone").append('<div class="rowphone clearfix" style="margin-top: 10px">\
                                    <div class="people">\
                                        <input type="text" placeholder="联系人.." class="userNames">\
                                        <button onclick="removeRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>\
                                    </div>\
                                    <div class="phone">\
                                        <div>\
                                            <input type="text" placeholder="手机号..." class="userPhone">\
                                            <a href="javascript:void (0)" onclick="addPhone(this)" style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加手机号</a>\
                                        </div>\
                                    </div>\
                                </div>')
    }
    //添加机构联系人手机号
    function addPhone($this) {
        $this=$($this);
        if( $this.parent().parent().find('div').length>4){
            layer.msg("最多添加五个手机号")
            return;
        }else {
            $this.parent().parent().append('<div style="margin-top: 10px">\
                                                <input type="text" placeholder="手机号..." class="userPhone">\
                                                <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>\
                                            </div>')
        }
    }
    //删除机构联系人
    function removeRow($this) {
        $this=$($this);
        $this.parent().parent().remove();
    }
    var form, layedit, ditIndex, layer;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;

        // 构建一个编辑器
        ditIndex = layedit.build('LAY_demo1', {
            height: 300,
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
        //监听指定开关
        form.on('checkbox(syncretic)', function(data){
            if(data.elem.checked){
                check=true;
                $(".orgTax").hide();
                $(".orgCodes").hide();
            }else {
                check=false;
                $(".orgTax").show();
                $(".orgCodes").show();
            }
        });
        //机构列表
        form.on('select(orgList)', function (data) {
            orgID=data.value
        });
        // 监听省
        form.on('select(province1)', function (data) {

            $("#city1").html('<option value="">请选择市</option>'); // 初始化市
            $("#county1").html('<option value="">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province1").find("option:selected").data("provinceId");

            dealProvinceId(provinceId, function (cityList) {
                fillCity1(cityList);
            });

        });

        // 监听市
        form.on('select(city1)', function (data) {

            if (!data.value || data.value == 0) {
                return false;
            }

            $("#county1").html('<option value="">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city1").find("option:selected").data("cityId");
            getCity(cityId, function (countyList) {
                fillCounty1(countyList);
            })

        });


        // 监听省
        form.on('select(province)', function (data) {
            // 更新地图
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#city").html('<option value="">请选择市</option>'); // 初始化市
            $("#county").html('<option value="">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province").find("option:selected").data("provinceId");

            dealProvinceId(provinceId, function (cityList) {
                fillCity(cityList);
            });

        });

        // 监听市
        form.on('select(city)', function (data) {

            if (!data.value || data.value == 0) {
                return false;
            }


            // 更新地图
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#county").html('<option value="">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city").find("option:selected").data("cityId");
            getCity(cityId, function (countyList) {
                fillCounty(countyList);
            })

        });

        // 监听县
        form.on('select(county)', function (data) {
            // 地图变更
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

        });

        // 监听详细地址
        $("#addressDetail").on("blur", function () {

            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

        })



        // 初始化默认地址
        $("#province1").find("option").each(function () {

            if ($.trim($(this).val()) === ADDRESS_CONFIG1.INIT_PROVINCE) {
                $(this).attr("selected", true);
                form.render();
                // 更新市列表
                dealProvinceId($(this).data("provinceId"), function (cityList) {
                    fillCity1(cityList);
                    // 初始化县列表
                    $("#city1").find("option").each(function (index) {

                        if ($.trim($(this).val()) === ADDRESS_CONFIG1.INIT_CITY) {
                            $(this).attr("selected", true);
                            form.render();
                            getCity($(this).data("cityId"), function (cityList) {
                                fillCounty1(cityList);
                                // 初始化区县
                                $("#county1").find("option").each(function () {
                                    if ($.trim($(this).val()) === ADDRESS_CONFIG1.INIT_CONUNTY) {
                                        $(this).attr("selected", true);
                                        form.render();
                                        return false;
                                    }
                                })
                            })

                        } else if ($(this).data("cityId") === 110000 || $(this).data("cityId") === 120000 || $(this).data("cityId") === 310000 || $(this).data("cityId") === 500000) {

                            if (index == 1) {
                                $(this).attr("selected", true);
                                form.render();
                                // 初始化区县
                                getCity($(this).data("cityId"), function (countyList) {
                                    fillCounty1(countyList);
                                    $("#county1").find("option").each(function () {
                                        if ($.trim($(this).val()) === ADDRESS_CONFIG1.INIT_CITY) {
                                            $(this).attr("selected", true);
                                            form.render();
                                            return false;
                                        }
                                    })

                                })

                            }

                        }
                    })

                });
                return false;
            }
        })



        // 初始化默认地址
        $("#province").find("option").each(function () {

            if ($.trim($(this).val()) === ADDRESS_CONFIG.INIT_PROVINCE) {
                $(this).attr("selected", true);
                form.render();
                // 更新市列表
                dealProvinceId($(this).data("provinceId"), function (cityList) {
                    fillCity(cityList);
                    // 初始化县列表
                    $("#city").find("option").each(function (index) {

                        if ($.trim($(this).val()) === ADDRESS_CONFIG.INIT_CITY) {
                            $(this).attr("selected", true);
                            form.render();
                            getCity($(this).data("cityId"), function (cityList) {
                                fillCounty(cityList);
                                // 初始化区县
                                $("#county").find("option").each(function () {
                                    if ($.trim($(this).val()) === ADDRESS_CONFIG.INIT_CONUNTY) {
                                        $(this).attr("selected", true);
                                        form.render();
                                        return false;
                                    }
                                })
                            })

                        } else if ($(this).data("cityId") === 110000 || $(this).data("cityId") === 120000 || $(this).data("cityId") === 310000 || $(this).data("cityId") === 500000) {

                            if (index == 1) {
                                $(this).attr("selected", true);
                                form.render();
                                // 初始化区县
                                getCity($(this).data("cityId"), function (countyList) {
                                    fillCounty(countyList);
                                    $("#county").find("option").each(function () {
                                        if ($.trim($(this).val()) === ADDRESS_CONFIG.INIT_CITY) {
                                            $(this).attr("selected", true);
                                            form.render();
                                            return false;
                                        }
                                    })

                                })

                            }

                        }
                    })

                });
                return false;
            }
        })

    });

    /*
     ** 上传图片
     */
    function uploadImg($this) {
        var files = $this.files;
        $this=$($this);
        // 兼容触发change事件，却没有选择文件的情况
        if (files.length <= 0) {
            return false;
        }

        var file = files[0],
            fileName = file.name,
            fileSize = file.size,
            $img = $($this).parent().find("img"),
            $imgSrc = $img.attr("src");


        // 校验图片格式
        if (!verifyFileSuffx("png|jpg|jpeg", fileName)) {
            layer.msg("只能上传图片格式");
            return false;
        }

        if (!verifyFileSize(fileSize, 5)) {
            layer.msg("文件大小不能超过5M");
            return false;
        }

        // file文件配置项
        var fileOption = {
            file: file,
            name: "file",
            type: $($this).data("upType")
        }

        // 开始上传时的回调
        var beforeSend = function () {
            $img.attr("src", BASE_URL + "/common/common_img/icon/loading_200_200.gif");// 菊花转
        }

        // 上传完毕的回调
        var success = function (data) {
            if (data.code === 0) {
                $img.attr("src", data.payload);// 更新上传图片
                $this.data("imgSrc",data.payload);
            } else {
                $img.attr("src", $imgSrc);// 变回原来的图片
            }
        }

        var error = function () {
            $img.attr("src", $imgSrc);// 变回原来的图片
        }

        postUploadImg(fileOption, beforeSend, success, error);
    }

    /*
     ** 发送图片字节流到后台
     */
    function postUploadImg(fileOption, beforeSend, success) {
        var formdata = new FormData();
        formdata.append(fileOption.name, fileOption.file);

        $.ajax({
            url: '${rlab}/bg/file/upload/' + fileOption.type,
            type: 'POST',
            data: formdata,
            contentType: false,
            processData: false,
            beforeSend: function () {
                beforeSend();
            },
            success: function (data) {
                success(data);
            },
            error: function () {
                error();
            }

        })
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
    function searchByStationName(map, site) {
        var localSearch = new BMap.LocalSearch(map);
        map.clearOverlays();//清空原来的标注

        var keyword = site;
        localSearch.setSearchCompleteCallback(function (searchResult) {
            try {
                var poi = searchResult.getPoi(0);
            } catch (e) {
                return false;
            }

            $("#longitude").val(poi.point.lng.toFixed(2));// 更新视图
            $("#latitude").val(poi.point.lat.toFixed(2));// 更新视图

            map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);// 添加标注

//            var content = keyword + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
//            var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
//            marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
            // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        });

        localSearch.search(keyword);// 启动查询
        return true;
    }

    var map = initMap();
    if (MAP_CONFIG.ADDRESS != undefined && MAP_CONFIG.ADDRESS !== "" && MAP_CONFIG.ADDRESS != null) {
        try {
            searchByStationName(map, MAP_CONFIG.ADDRESS);
        } catch (e) {
            searchByStationName(map, '中国');
        }
    } else {
        searchByStationName(map, '中国');
    }

    /*
     ** 保存提交表单
     */
    function putOrgForm() {

        $("#box").html(layedit.getContent(ditIndex));
        var userName=$("#userName").val();//法人名字
        var userNum=$("#userNum").val();// 法人身份证
        var identity1=$("#identity1").data("imgSrc");// 身份证正面
        var identity2=$("#identity2").data("imgSrc");// 身份证反面

        var orgName = $.trim($("#orgName").val());// 机构名字
        var orgLogo = $("#logoInp").data("imgSrc");// 机构logo路径
        var orgCode = $("#orgCode").val();//组织机构代码
        var orgCategoryId = $("#orgCategoryId").val();// 机构性质（分类）

        var orgAddrProvince1 = $("#province1").val();// 注册地省份
        var orgAddrCity1 = $("#city1").val();// 注册地市区
        var orgAddrDistrict1 = $("#county1").val();// 注册地县
        var orgAddrStreet1 = $("#addressDetail1").val();// 注册地详细地址

        var orgAddrProvince = $("#province").val();// 所在地省份
        var orgAddrCity = $("#city").val();// 所在地市区
        var orgAddrDistrict = $("#county").val();// 所在地县
        var orgAddrStreet = $("#addressDetail").val();// 所在地详细地址

        var orgAddrLongitude = $("#longitude").val();// 经度
        var orgAddrLatitude = $("#latitude").val();// 纬度

        // OrgContacts联系人部分
        var conPhone = "";// 机构电话“,”

        var orgPhoneIpts = $("#orgPhone input");

        for (var j = 0; j < orgPhoneIpts.length; j++) {
            if ($.trim($(orgPhoneIpts[j]).val()) !== "") {
                if(!/^([0-9]{3,4}-[0-9]{7,8})|(1[34578]\d{9})$/.test($(orgPhoneIpts[j]).val())){
                    alert("机构固话电话格式错误，请填写11位手机号或座机号!");
                    return false;
                }
                if (j === 0) {
                    conPhone = $.trim($(orgPhoneIpts[j]).val());
                } else {
                    conPhone = conPhone + ',' + $.trim($(orgPhoneIpts[j]).val());
                }

            }
        }

        var orgZipcode = $("#orgZipcode").val();// 机构邮编
        var orgWeb = $("#orgWeb").val();// 机构网址
        var conFax = $("#conFax").val(); // 机构传真
        var conEmail = $("#conEmail").val();// 机构邮箱
        var orgSource = $("#orgSource").val();// 机构来源

        var orgContactsList=[];//联系人手机号
        for (var i=0;i<$(".rowphone ").length;i++) {
            var userNames=$(".rowphone ").eq(i).find(".userNames").val();
            if(!userNames){
                alert("请填写完整联系人");
                return;
            }
            if(!/^[\u4e00-\u9fa5]{2,10}$/.test(userNames)){
                alert("联系人姓名格式错误");
                return;
            }
            var userPhone="";
            for (var j=0;j<$(".rowphone ").eq(i).find(".userPhone").length;j++) {
                if (j==0) {
                    if(!/^([0-9]{3,4}-[0-9]{7,8})|(1[34578]\d{9})$/.test($(".rowphone ").eq(i).find(".userPhone").eq(j).val())){
                        alert("请输入正确联系人手机号");
                        return;
                    }else {
                        userPhone=$(".rowphone ").eq(i).find(".userPhone").eq(j).val();
                    }
                }else {
                    if(!/^([0-9]{3,4}-[0-9]{7,8})|(1[34578]\d{9})$/.test($(".rowphone ").eq(i).find(".userPhone").eq(j).val())){
                        alert("请输入正确联系人手机号");
                        return;
                    }else {
                        userPhone=userPhone+","+$(".rowphone ").eq(i).find(".userPhone").eq(j).val();
                    }
                }
                if(!userPhone){
                    alert("请填写完整联系人");
                    return;
                }
            }
            var objs={
                conName:userNames,
                conPhone:userPhone,
            }
            orgContactsList.push(objs);
        }
        //var orgContactsLists=JSON.stringify(orgContactsList);

        var orgLicensePic = "";// 营业制造副本
        if (isDefaultImg($("#businessLicensepic").attr("src"))) {
            orgLicensePic = $("#businessLicensepic").attr("src");
        }
        var orgCodePic = "";// 组织机构代码证
        if (isDefaultImg($("#orgCodespic").attr("src"))) {
            orgCodePic = $("#orgCodespic").attr("src");
        }
        var taxEnrolCertificatePic = "";// 税务登记证
        if (isDefaultImg($("#orgTaxpic").attr("src"))) {
            taxEnrolCertificatePic = $("#orgTaxpic").attr("src");
        }

        var orgCertificateList = [];// 机构资质 [{},{}]orgCertificateName   orgCertificatePic
        var itemList = $("#qftList .item");
        itemList.each(function () {
            var certificateSrc = $(this).find("img").attr("src");

            if (isDefaultImg(certificateSrc)) {
                certificateSrc = $(this).find("img").attr("src");
            } else {
                certificateSrc = "";
            }
            orgCertificateList.push({
                orgCertificateName: $(this).find("p").text(),
                orgCertificatePic: certificateSrc
            })
        })

        var orgDescription = layedit.getContent(ditIndex);// 机构简介
        $("#qftList item").each(function () {

        })

        if(orgDescription.toString().length==0){
            alert("机构简介不能为空");
            return;
        }
        var formData = {
            orgOid:${orgInfo.orgOid},
            orgLicense:{
                orgPerson:userName,
                identificationNumber:userNum,
                legalPersonPic1:identity1,
                legalPersonPic2:identity2,
                taxEnrolCertificatePic:taxEnrolCertificatePic,
                orgLicensePic:orgLicensePic,
                orgAddrProvince:orgAddrProvince1,
                orgAddrDistrict:orgAddrDistrict1,
                orgAddrCity:orgAddrCity1,
                orgAddress:orgAddrStreet1,

            },
            orgSource:orgSource,
            orgCodeObject:{
                orgCodePic:orgCodePic,
                orgCode:orgCode,
            },
            orgName: orgName,// 机构名称
            orgLogo: orgLogo,//机构LOGO
            orgCategoryId: orgCategoryId,// 机构性质ID
            orgAddress: {
                orgAddrId:${orgInfo.orgAddress.orgAddrId},//机构地址ID
                orgAddrProvince: orgAddrProvince,// 省
                orgAddrCity: orgAddrCity,// 市
                orgAddrDistrict: orgAddrDistrict,// 县
                orgAddrStreet: orgAddrStreet,// 详细地址
                orgAddrLongitude: orgAddrLongitude,// 经度
                orgAddrLatitude: orgAddrLatitude,// 维度
                orgZipcode: orgZipcode//机构邮编
            },
            orgContacts: {
                conId: "${orgInfo.orgContacts.conId}",
                conPhone: conPhone,// 机构联系人电话
                conEmail: conEmail,// 机构联系人邮箱
                conFax: conFax// 机构联系人传真
            },
            orgContactsList:orgContactsList,
            orgWeb: orgWeb,// 机构网址
            orgCode: orgCode,// 组织机构代码
            /*orgLicensePic: orgLicensePic,// 营业制造副本*/
            orgCertificateList: orgCertificateList,
            orgDescription: orgDescription // 富文本编辑

        }

        if (formData.orgName.length == 0) {
            alert("机构名称不能为空");
            return false;
        } else if (formData.orgCategoryId == "") {
            alert("机构性质不能为空");
            return false;
        } else if (formData.orgAddress.orgAddrProvince.length == 0 || formData.orgAddress.orgAddrCity.length == 0 || formData.orgAddress.orgAddrDistrict.length == 0 || formData.orgAddress.orgAddrStreet.length == 0) {
            alert("机构地址不能为空");
            return false;
        }  else if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(formData.orgAddress.orgAddrLongitude) || /^[0-9]{1,3}$/.test(formData.orgAddress.orgAddrLongitude))) {
            alert("经度格式错误");
            return false;
        } else if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(formData.orgAddress.orgAddrLatitude) || /^[0-9]{1,3}$/.test(formData.orgAddress.orgAddrLatitude))) {
            alert("纬度格式错误");
            return false;
        }else if (formData.orgAddress.orgAddrLongitude.length == 0 || formData.orgAddress.orgAddrLatitude.length == 0) {
            alert("经纬度不能为空");
            return false;
        }else if(!/^[\u4e00-\u9fa5]{2,11}$/.test(formData.orgLicense.orgPerson)){
            alert("请输入正确的姓名");
            return false;
        }else if(formData.orgLicense.identificationNumber.length == 0){
            alert("请输入身份证号");
            return false;
        }else if(formData.orgCodeObject.orgCode.length == 0){
            alert("组织机构代码不能为空");
            return false;
        }else if(!/^[\d|a-zA-Z|\-|_|—]{10,20}$/.test(formData.orgCodeObject.orgCode)){
            alert("组织机构代码格式不正确");
            return false;
        }else if(formData.orgLicense.orgAddress.length < 5){
            alert("机构注册地详细地址不能为空最少为5个字符");
            return false;
        }else if(formData.orgAddress.orgAddrStreet.length < 5){
            alert("机构所在地详细地址不能为空最少为5个字符");
            return false;
        }else if(formData.orgSource.length == 0){
            alert("机构来源不能为空");
            return false;
        }else if(formData.orgLicense.orgAddrProvince.length == 0){
            alert("机构注册地省份不能为空");
            return false;
        }else if(formData.orgLicense.orgAddrCity.length == 0){
            alert("机构注册地城市不能为空");
            return false;
        }else if(formData.orgLicense.orgAddrDistrict.length == 0){
            alert("机构注册地区不能为空");
            return false;
        } else if(formData.orgAddress.orgAddrProvince.length == 0){
            alert("机构所在地省份不能为空");
            return false;
        }else if(formData.orgAddress.orgAddrCity.length == 0){
            alert("机构所在地城市不能为空");
            return false;
        }else if(formData.orgAddress.orgAddrDistrict.length == 0){
            alert("机构所在地区不能为空");
            return false;
        }else if(formData.orgLicense.identificationNumber.length == 0){
            alert("法人身份证号码不能为空");
            return false;
        }else if(!/^\d{15}$|^\d{17}(\d|x|X)$/.test(formData.orgLicense.identificationNumber)){
            alert("法人身份证号码格式错误");
            return false;
        }

        if(check){
            formData.orgLicense.taxEnrolCertificatePic=null;
            formData.orgCodeObject.orgCodePic=null;
            if(formData.orgLicense.orgLicensePic.length == 0){
                alert("请上传营业执照副本");
                return false;
            }
        }else {
            if(formData.orgLicense.orgLicensePic.length == 0){
                alert("请上传营业执照副本");
                return false;
            }
            if(formData.orgCodeObject.orgCodePic.length == 0){
                alert("请上传组织机构代码证");
                return false;
            }
            if(formData.orgLicense.taxEnrolCertificatePic.length == 0){
                alert("请上传税务登记证");
                return false;
            }
        }


        if (formData.orgAddress.orgZipcode.length != 0) {
            if (!/^[0-9]{6}$/.test(formData.orgAddress.orgZipcode)) {
                alert("机构邮编格式错误");
                return false;
            }
        }

        if (formData.orgContacts.conEmail.length != 0) {
            if (!/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(formData.orgContacts.conEmail)) {
                alert("机构邮箱格式错误");
                return false;
            }
        }
        if (formData.orgContacts.conFax.length != 0) {
            if (!/^[0-9]{3,4}-[0-9]{7,8}$/.test(formData.orgContacts.conFax)) {
                console.log(formData.orgContacts.conFax);
                alert("机构传真格式错误");
                return false;
            }
        }


        if (formData.orgWeb.length != 0) {
            if (!/^(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/.test(formData.orgWeb)) {
                alert("机构网址格式错误");
                return false;
            }
        }
        console.log(formData);
        $.ajax({
            url: BASE_URL + '/bg/provider/application',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (data) {

                if (data.code === 0) {
                    if (data.payload.orgIdentification==2){
                        location.href = BASE_URL + "/bg/provider/detail/certificated/" + data.payload.orgOid;
                    }else {
                        location.href = BASE_URL + "/bg/provider/detail/uncertificated/" + data.payload.orgOid;
                    }


                } else if (data.code === 1013) {
                    //墨绿深蓝风
                    layer.alert('机构名已存在，请更换', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                }else if (data.code === 2001) {
                    //墨绿深蓝风
                    layer.alert('组织机构代码重复，请更换', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                } else {
                    alert(data.description);
                }

            },
            error: function (err) {
                //  layer.msg("网络繁忙，请重新选择城市");
            }
        });
    }

</script>
</html>


