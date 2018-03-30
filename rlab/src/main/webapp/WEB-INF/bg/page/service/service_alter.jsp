<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../../config/taglibs.jsp" %>

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/js/view/jq.form.js"></script>

    <%--<script src="https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v" type="text/javascript"></script>--%>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/ins_share_base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/component_base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css">
    <style type="text/css">
        .logoModal input.jcrop-keymgr {
            display: none !important;
        }

        .lab_p {
            margin-top: 26px;
            padding-left: 140px;
            position: relative;
        }

        .lab_p > p {
            float: left;
            width: 140px;
            position: absolute;
            left: 0;
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

        .phone_row button, .rowphone button {
            background: #f2f5f8;
            line-height: 50px;
            border: 0 none;
            padding: 0 10px;
            padding-right: 20px;
            color: #49aaff;
            cursor: pointer;

        }

        .phone_row button i, .rowphone button i {
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
            left: 0;
            top: 0;
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
            position: absolute;
            left: 0;
            top: 0;
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

        .sech {
            padding: 20px 0;
            border-bottom: 1px dashed #dce3ea;
        }

        .sech input {
            height: 50px;
            width: 300px;
            font-size: 16px;
            background-color: white;
            padding-left: 10px;
            margin-left: 20px;
        }

        .sech p {
            line-height: 50px;
        }

        .main p em {
            color: red;
        }

        .orgCorporation, .orgMessage {
            border-bottom: 1px dashed #dce3ea;
            padding: 20px 0;
        }

        .orgCorporation p, .orgMessage p {
            line-height: 50px;
            font-size: 14px;
            color: #7b8da0;
            padding-left: 15px;
            margin: 10px 0;
        }

        .orgCorporation .tit, .orgMessage .tit {
            color: #333;
            padding: 0;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .orgCorporation input, .orgMessage input {
            width: 316px;
            padding-left: 15px;
            height: 50px;
            border-radius: 5px;
        }

        .titinp {
            width: 130px;
            display: inline-block;
        }

        .lonlat input {
            width: 100px;
            margin: 0 10px;
        }

        #source {
            width: 500px;
            float: left;
        }

        .lab_p .layui-form-select .layui-input {
            width: 500px;
        }

        .item p {
            line-height: 20px;
            text-align: center;
            padding: 0;
        }

        #logo img {
            width: 140px;
            height: 140px;
            background: #fff;
            cursor: pointer;
        }

        #logo {
            position: relative;
        }

        .orgMessage #logoInp {
            position: absolute;
            top: 0;
            left: 0;
            padding: 0;
            z-index: -1;
        }

        .identity input {
            position: absolute;
            top: 0;
            left: 0;
            padding: 0;
            z-index: -1;
        }

        .identity img {
            width: 240px;
            height: 148px;
        }

        .files input {
            position: absolute;
            top: 0;
            left: 0;
            padding: 0;
            z-index: -1;
        }

        .files img {
            cursor: pointer;

        }

        .rowphone input {
            width: 180px;
        }

        .rowphone .people, .phone {
            float: left;
        }

        .files {
            margin-right: 10px;
        }

        .sech dl {
            width: 500px;
        }

        .sech input {
            margin: 0;
            padding: 0 0 0 20px;
        }

        .rowphone {
            margin-bottom: 10px;
        }

        /* START 20171018新增*/
        /*服务图片*/
        .service_img > div.svc_img {
            margin-right: 10px;
            float: left;
            margin-bottom: 10px;
        }

        .service_img > div.svc_img > img {
            width: 140px;
            height: 140px;
        }

        .service_img .svc_img {
            position: relative;
        }

        .service_img .svc_img s.close {
            display: block;
            background: url("${rlab}/front/imgs/close_t1.png") no-repeat 0 0;
            width: 19px;
            height: 19px;
            position: absolute;
            right: -9px;
            top: -6px;
            cursor: pointer;
        }

        .service_img .svc_add {
            width: 140px;
            height: 140px;
            overflow: hidden;
            float: left;
            position: relative;
            cursor: pointer;
        }

        .service_img .svc_add > label {
            width: 140px;
            height: 140px;
            display: block;
            float: left;
        }

        .service_img .svc_add label > img {
            width: 140px;
            height: 140px;
            background: #fff;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 3;
            cursor: pointer;
        }

        .service_img .img_item {
            float: left;
            margin-right: 20px;
        }

        .service_img button {
            width: 140px;
            height: 140px;
            border: 0 none;
            background: #D4DBE3;
            cursor: pointer;
            font-size: 38px;
            color: #888;
        }

        /*服务特点*/
        .svc_feature {

        }

        .feature_item span {
            display: inline-block;
            padding: 0 6px;
            border: 1px solid #0099FF;
            line-height: 20px;
            color: #0099FF;
            font-size: 12px;
            margin-right: 8px;
        }

        .svc_feature > div {
            line-height: 50px;

        }

        .svc_feature button {
            margin-left: -5px;
        }

        /*参考价格*/
        .price_radio {
            overflow: hidden;
        }

        .price_radio p {
            float: left;
            height: 40px;
            line-height: 40px;
            margin-right: 15px;
            padding-left: 0px;

        }

        .price_radio p input {
            width: 14px;
            height: 14px;
            cursor: pointer;
        }

        .price_main input {
            width: 120px;
        }

        .nomal_textarea {
            border: 0 none;
            padding: 10px;
        }

        /*使用设备*/
        .service_ins {

        }

        .service_ins .ins_box {
            overflow: hidden;
        }

        .service_ins button {
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .service_ins input {
        }

        /*删除按钮*/
        .delete_btn {
            background: #f2f5f8;
            line-height: 50px;
            border: 0 none;
            padding: 0 10px;
            padding-right: 20px;
            color: #49aaff;
            cursor: pointer;
        }

        .delete_btn i {
            color: orangered;
        }

        /* END 20171018新增*/

        /*添加联系人*/
        .phoneList > a {
            line-height: 40px;
        }

        /*机构名称*/
        #serviceOrg .layui-form-select dl {
            top: 52px !important;
            width: 500px;
        }
    </style>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>

    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="4"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                    <a><cite>服务管理</cite></a>
                    <a><cite>修改服务</cite></a>
                </span>
            </div>

            <%-- （二）服务基本信息--%>
            <div class="orgCorporation">
                <p class="tit">服务基本信息：</p>
                <%--1 服务名称--%>
                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0"><span class="titinp">服务名称<em>*</em>：</span></p>
                    <input value="${result.serviceName}" type="text" placeholder="请输入服务名称" id="serviceName"
                           maxlength="100">
                </div>

                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0"><span class="titinp">所属机构<em>*</em>：</span></p>
                    <div>
                        <form class="layui-form lab_select_search" action="javascript:void(0)">
                            <div class="layui-inline" style="width: 500px">
                                <div class="layui-input-inline" style="width: 500px">
                                    <select id="serviceOrg" name="modules" lay-verify="required" lay-search=""
                                            lay-filter="orgList">
                                        <option value="">请选择机构</option>
                                        <%--<c:forEach items="${providerInfo}" var="info">--%>
                                        <%--<option value="${info.orgOid}">${info.orgName}</option>--%>
                                        <%--</c:forEach>--%>
                                        <c:forEach items="${orgNames}" var="item">
                                            <option value="${item.orgoid}" ${item.orgoid == result.orgOid ? 'selected':''}>${item.orgname}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <%--2 服务图片--%>
                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0"><span class="titinp">服务图片：</span></p>
                    <div class="rt service_img" id="imgList">

                        <%--<div class="svc_img">--%>
                        <%--<img src="${rlab}/bg/img/logoDefault.jpg" alt="" style="width: 140px">--%>
                        <%--</div>--%>

                        <%--<div class="svc_img">--%>
                        <%--<img src="${rlab}/bg/img/logoDefault.jpg" alt="" style="width: 140px">--%>
                        <%--</div>--%>

                        <%--<div class="svc_img">--%>
                        <%--<img src="${rlab}/bg/img/logoDefault.jpg" alt="" style="width: 140px">--%>
                        <%--</div>--%>
                        <c:forEach items="${result.servicePics}" var="item">
                            <div class="svc_img">
                                <img src="${item}" alt="" style="width: 140px">
                                <s class="close" onclick="delteCurSvImg(this)"></s>
                            </div>
                        </c:forEach>
                        <div id="iptLable" class="svc_add">
                            <label>
                                <img src="${rlab}/front/imgs/icon/2_2/add_type1.png" alt="" alt="" style="width: 140px">
                                <form method="post" enctype="multipart/form-data">
                                    <input id="logoInput" name="file"
                                           data-spin="${rlab}/front/imgs/icon/2_2/add_type1_loading.gif"
                                           accept="image/jpg,image/jpeg,image/png" type="file"
                                           onchange="putServiceImg(this)">
                                </form>

                            </label>
                        </div>
                    </div>
                </div>
                <%--3 服务特点--%>
                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0"><span class="titinp">服务特点：</span></p>
                    <div class="rt svc_feature">
                        <div id="box">
                            <div id="traitList" class="feature_item" style="display: inline-block">
                                <c:forEach var="item" items="${result.serviceFeature}">
                                    <span>${item}</span>
                                </c:forEach>
                            </div>
                            <button onclick="choseServiceTrait()" type="button" class="layui-btn">
                                选择服务特点
                            </button>
                        </div>
                    </div>
                </div>
                <%--4 服务资质--%>
                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0"><span class="titinp">服务资质：</span></p>
                    <div class="rt">
                        <div id="box ">
                            <button onclick="choseTagFactory()" id="selectStatus" type="button" class="layui-btn">
                                选择资质
                            </button>
                        </div>
                        <div id="qftList" class="org_qua">
                            <c:forEach var="item" items="${result.serviceCredit}">
                                <div class="item">
                                    <span>${item}</span>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <%--5 参考价格--%>
                <div class="lab_p clearfix svc_price">
                    <p style="float: left;margin: 0">
                        <span class="titinp">参考价格<em>*</em>：</span>
                    </p>
                    <div class="rt">
                        <div class="price_radio">
                            <p>
                                <input ${result.servicePrice.flag == 3?"checked":""} data-origin="all" id="face"
                                                                                     type="radio" name="price"
                                                                                     onclick="switchRadio(this)">
                                <label for="face">面议</label>
                            </p>
                            <p>
                                <input  ${result.servicePrice.flag == 1?"checked":""} data-origin="fixed" id="specific"
                                                                                      type="radio" name="price"
                                                                                      onclick="switchRadio(this)">
                                <label for="specific">具体价格</label>
                            </p>
                            <p>
                                <input  ${result.servicePrice.flag == 2?"checked":""} data-origin="range" id="range"
                                                                                      type="radio" name="price"
                                                                                      onclick="switchRadio(this)">
                                <label for="range">价格范围</label>
                            </p>
                        </div>

                        <div class="price_main">


                            <c:choose>
                                <c:when test="${result.servicePrice.flag == 1}">
                                    <div id="fixedPrice" class="specific_main"
                                         style="display:block;">
                                        <input value="${result.servicePrice.accPrice}" id="fixedPriceP" type="text"
                                               placeholder="具体价格">
                                        &nbsp;元 /&nbsp;
                                        <input value="${result.servicePrice.unit}" id="fixedUnit" type="text"
                                             maxlength="10"  placeholder="单位">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div id="fixedPrice" class="specific_main"
                                         style="display:  none">
                                        <input id="fixedPriceP" type="text"
                                               placeholder="具体价格">
                                        &nbsp;元 /&nbsp;
                                        <input id="fixedUnit" maxlength="10" type="text" placeholder="单位">
                                    </div>
                                </c:otherwise>
                            </c:choose>

                            <c:choose>
                                <c:when test="${result.servicePrice.flag == 2}">
                                    <div id="rangPrice" class="range_main"
                                         style="display: block;">
                                        <input value="${result.servicePrice.scopeLowPrice}" id="rangeSubPrice"
                                               type="text"
                                               placeholder="最低价">&nbsp;元 ~&nbsp;
                                        <input value="${result.servicePrice.scopeHighPrice == 0?'':result.servicePrice.scopeHighPrice}" id="rangeSupPrice"
                                               type="text"
                                               placeholder="最高价">&nbsp;元 /&nbsp;
                                        <input value="${result.servicePrice.unit}" id="rangeUnit" type="text"
                                               placeholder="单位" maxlength="10">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div id="rangPrice" class="range_main"
                                         style="display: none;">
                                        <input id="rangeSubPrice" type="text"
                                               placeholder="最低价">&nbsp;元 ~&nbsp;
                                        <input id="rangeSupPrice" type="text"
                                               placeholder="最高价">&nbsp;元 /&nbsp;
                                        <input id="rangeUnit" maxlength="10" type="text" placeholder="单位">
                                    </div>
                                </c:otherwise>
                            </c:choose>


                        </div>
                    </div>
                </div>

                <%--6 报价说明--%>
                <div class="lab_p clearfix">
                    <p style="float: left;margin: 0">
                        <span class="titinp">报价说明：</span>
                    </p>
                    <div class="rt">
                        <textarea id="priceInfos" class="nomal_textarea" name="" maxlength="200" cols="60"
                                  rows="5">${result.servicePrice.remark}</textarea>
                    </div>

                </div>

            </div>
            <%-- （三）服务详细信息--%>
            <div class="orgMessage">
                <form class="layui-form" action="">
                    <p class="tit" style="margin-top: 20px;width: auto;float: none">服务详细信息：</p>
                    <%-- 服务简介 --%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">服务简介：</span></p>
                        <div class="rt">
                            <textarea class="nomal_textarea" name="" maxlength="5000" id="serviceInfo" cols="60"
                                      rows="5">${result.serviceDes}</textarea>
                        </div>

                    </div>

                    <%-- 适用领域 --%>
                    <%--<div class="lab_p clearfix">--%>
                    <%--<p style="float: left;margin: 0;"><span class="titinp">适用领域：</span></p>--%>
                    <%--<div class="rt svc_feature">--%>
                    <%--<div>--%>
                    <%--<div class="feature_item" style="display: inline-block">--%>
                    <%--<span>领域1</span>--%>
                    <%--<span>领域2</span>--%>
                    <%--<span>领域3</span>--%>
                    <%--<span>领域4</span>--%>
                    <%--<span>领域5</span>--%>
                    <%--</div>--%>
                    <%--<button onclick="choseTagFactory()" id="selectStatus" type="button" class="layui-btn">--%>
                    <%--选择服务领域--%>
                    <%--</button>--%>
                    <%--</div>--%>

                    <%--</div>--%>
                    <%--</div>--%>
                    <%-- 使用设备 --%>
                    <div class="lab_p service_ins clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">使用设备：</span></p>
                        <div class="rt">
                            <button onclick="addIns(this)" type="button" class="layui-btn">
                                新增使用设备
                            </button>
                            <div id="insList" class="ins_box">
                                <%--<div>--%>
                                <%--<input type="text" placeholder="请输入设备名称" maxlength="100">--%>
                                <%--<button class="delete_btn" onclick="removePhoneRow(this)"><i--%>
                                <%--class="layui-icon"></i> 删除--%>
                                <%--</button>--%>
                                <%--</div>--%>
                                <c:forEach var="item" items="${result.serviceMachine}">
                                    <div>
                                        <input value="${item}" type="text" placeholder="请输入设备名称" maxlength="100">
                                        <button class="delete_btn" onclick="removePhoneRow(this)"><i class="layui-icon"></i>
                                            删除
                                        </button>
                                    </div>
                                </c:forEach>


                            </div>


                        </div>
                    </div>

                    <%-- 依据方法 --%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">依据方法：</span></p>
                        <div class="rt">
                            <input value="${result.serviceMethod}" id="serviceMethos" type="text" placeholder="依据方法"
                                   maxlength="200">
                        </div>
                    </div>

                    <%-- 服务周期 --%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">服务周期：</span></p>
                        <div class="rt">
                            <input value="${result.servicePeriod}" id="serviceCycle" type="text" placeholder="服务周期"
                                   maxlength="200">
                        </div>
                    </div>

                    <%-- 其他备注 --%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">其他备注：</span></p>
                        <div class="rt">
                            <input value="${result.serviceNote}" id="otherInfo" type="text" placeholder="其他备注"
                                   maxlength="1000">
                        </div>
                    </div>
                    <%--联系方式--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0"><span class="titinp">联系方式<em>*</em>：</span></p>
                        <div class="rt">
                            <button onclick="addPhoneList()" type="button" class="layui-btn"
                                    style="margin-bottom: 15px;">
                                添加联系人
                            </button>
                            <div id="phoneList" class="orgPhone">

                                <c:forEach items="${result.serviceContacts}" var="item" varStatus="status">
                                    <c:if test="${status.first}">
                                        <div class="rowphone clearfix">
                                            <div class="people">
                                                <input value="${item.conName}" type="text" placeholder="联系人.."
                                                       class="userNames">
                                            </div>
                                            <div class="phone" style="margin-left: 90px">
                                                <div>
                                                    <input value="${item.conPhone}" type="text" placeholder="手机号..."
                                                           class="userPhone">
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>

                                    <c:if test="${!status.first}">
                                        <div class="rowphone clearfix">
                                            <div class="people">
                                                <input value="${item.conName}" type="text" placeholder="联系人.."
                                                       class="userNames">
                                            </div>
                                            <div class="phone" style="margin-left: 90px">
                                                <div>
                                                    <input value="${item.conPhone}" type="text" placeholder="手机号..."
                                                           class="userPhone">
                                                </div>
                                            </div>
                                            <button class="delete_btn" onclick="removePhoneRow(this)">
                                                <i class="layui-icon"></i> 删除
                                            </button>
                                        </div>
                                    </c:if>
                                </c:forEach>
                                <%--<button class="delete_btn" onclick="removePhoneRow(this)"><i--%>
                                <%--class="layui-icon"></i> 删除--%>
                                <%--</button>--%>
                            </div>
                        </div>
                    </div>
                    <%--联系地址--%>
                    <div class="lab_p clearfix">
                        <p style="float: left"><span class="titinp">机构所在地<em>*</em>：</span></p>
                        <div class="rt">
                            <%--START三级联动--%>
                            <div class="layui-form-item city_select">

                                <div class="layui-input-inline">
                                    <select id="province_1" name="quiz1" lay-filter="province1">
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

                                <div class="layui-input-inline">
                                    <select id="city_1" name="quiz2" lay-filter="city1">
                                        <option value="">请选择市</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="county_1" name="quiz3" lay-filter="county1">
                                        <option value="">请选择县/区</option>
                                    </select>
                                </div>
                            </div>
                            <%--END三级联动--%>
                        </div>
                    </div>

                    <%--联系详细地址--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">详细地址<em>*</em>：</span></p>
                        <div class="rt">
                            <input value="${result.serviceAddress}" maxlength="50" type="text"
                                   onblur="updateJingWeiDu()" placeholder="请输入详细地址"
                                   id="addressDetail_1">
                            </p>
                        </div>
                    </div>

                    <%--经纬度--%>
                    <div class="lab_p clearfix">
                        <p style="float: left;margin: 0;"><span class="titinp">经纬度<em>*</em>：</span></p>
                        <div class="rt">
                          <span class="lonlat">
                            东经<input value="${result.serviceLon}" type="text" placeholder="请输入.." id="longitude">
                            北纬<input value="${result.serviceLat}" type="text" placeholder="请输入.." id="latitude">
                            </span>
                        </div>
                    </div>

                    <%--&lt;%&ndash;经纬度&ndash;%&gt;--%>
                    <%--<p>--%>
                    <%--<span class="titinp">地址经纬度<em>*</em>：</span>--%>
                    <%--<span class="lonlat">--%>
                    <%--东经<input type="text" placeholder="请输入.." id="longitude">--%>
                    <%--北纬<input type="text" placeholder="请输入.." id="latitude">--%>
                    <%--</span>--%>
                    <%--</p>--%>
                    <%--百度地图--%>
                    <div id="baidumap" class="" style="height: 300px;width: 600px;margin-top: 20px;"></div>
                </form>
            </div>
            <%--（四）操作按钮--%>
            <div class="share_btn" style="text-align: center;margin-top: 50px">
                <button class=" layui-btn layui-btn-normal" type="button" id="putForm" onclick="putOrgForm()">修改服务
                </button>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<%--<script src="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>--%>
<script src="${rlab}/bg/js/main.js"></script>
<script src="${rlab}/bg/js/myJcropCofig.js"></script>
<%--<script src="${rlab}/bg/js/orgInfoCommon.js"></script>--%>
<script>
    // 初始化机构

    var form, layedit, ditIndex, ditOption, layer;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;
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

        initOrgList();
        initAddress();
    });

    function initAddress() {
        // 初始化默认地址
        $("#province_1").find("option").each(function () {

            if ($.trim($(this).val()) === '${result.serviceProvince}') {
                $(this).attr("selected", true);
                form.render();
                // 更新市列表
                dealProvinceId($(this).data("provinceId"), function (cityList) {
                    fillCity1(cityList);
                    // 初始化县列表
                    $("#city_1").find("option").each(function (index) {

                        if ($.trim($(this).val()) === '${result.serviceCity}') {
                            $(this).attr("selected", true);
                            form.render();
                            getCity($(this).data("cityId"), function (cityList) {
                                fillCounty1(cityList);
                                // 初始化区县
                                $("#county_1").find("option").each(function () {
                                    if ($.trim($(this).val()) === '${result.serviceDistrict}') {
                                        $(this).attr("selected", true);
                                        form.render();
                                        var flag = searchByStationName(map, "${result.serviceProvince}${result.serviceCity}${result.serviceDistrict}${result.serviceAddress}");
                                        if (!flag) {
                                            searchByStationName(map, "${result.serviceProvince}${result.serviceCity}");
                                        }
                                        return false;
                                    }
                                })
                            })

                        } else if ($(this).data("cityId") === 110000
                            || $(this).data("cityId") === 120000
                            || $(this).data("cityId") === 310000
                            || $(this).data("cityId") === 500000) {

                            if (index == 1) {
                                $(this).attr("selected", true);
                                form.render();
                                // 初始化区县
                                getCity($(this).data("cityId"), function (countyList) {
                                    fillCounty1(countyList);
                                    $("#county_1").find("option").each(function () {
                                        if ($.trim($(this).val()) === '${result.serviceDistrict}') {
                                            $(this).attr("selected", true);
                                            form.render();
                                            var flag = searchByStationName(map, "${result.serviceProvince}${result.serviceCity}${result.serviceDistrict}${result.serviceAddress}");
                                            if (!flag) {
                                                searchByStationName(map, "${result.serviceProvince}${result.serviceCity}");
                                            }
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
    }
    /*
     ** 添加一行联系人
     */
    function addPhoneList() {

        var phoneListLength = $("#phoneList .people").length;
        if (phoneListLength > 2) {
            layer.msg("联系人最多添加3个");
            return false;
        }

        $("#phoneList").append('<div class="rowphone clearfix">\
                <div class="people">\
                <input type="text" placeholder="联系人.." class="userNames">\
                </div>\
                <div class="phone" style="margin-left: 90px">\
                <div>\
                <input type="text" placeholder="手机号..." class="userPhone">\
                </div>\
                </div>\
                <button class="delete_btn" onclick="removePhoneRow(this)"><i class="layui-icon"></i> 删除</button>\
            </div>');


    }


    //  上传服务图片
    function putServiceImg($_this) {

        var imgLen = $("#imgList .svc_img").length;
        if (imgLen > 7) {
            layer.msg("最多可以添加8个图片");
            return false;
        }

        var $fileInput = $($_this),// file input dom
            $form = $fileInput.parent(),// form dom
            $img = $form.parent().find("img"),
            $spinSrc = $fileInput.data("spin"),
            $originSrc = $img.attr("src");

        var curItem = $("<div class='svc_img'></div>");
        var curImg = $('<img src="' + $spinSrc + '" alt="">');
        curItem.append(curImg);
        curItem.append('<s class="close" onclick="delteCurSvImg(this)"></s>');
//        curItem.append('<i class="license_remove layui-icon" onclick="delteCurSvImg(this)" data-orgin="" data-default-src="/bg/img/add_logo_default.png"></i>');
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

    // 删除服务的图片
    function delteCurSvImg($this) {
        $this = $($this);
        $this.parent().remove();
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
     ** 新增设备
     */
    function addIns($this) {
        $this = $($this);
        var pListLength = $("#insList > div").length;
        if (pListLength > 4) {
            layer.msg("最多添加5个设备");
            return false;
        }

        var itemHtml =
            $('<div>\
                    <input type="text" placeholder="请输入设备名称" maxlength="100">\
                    <button class="delete_btn" onclick="removePhoneRow(this)"><i class="layui-icon"></i> 删除\
                    </button>\
                </div>');
        $("#insList").append(itemHtml);

    }
    /**
     * 移除一行联系电话
     */
    function removePhoneRow($this) {
        var $this = $($this);
        $this.parent().remove();
    }
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
    searchByStationName(map, '中国');
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


    /**
     * 选择特点
     */
    function choseServiceTrait() {

        var fieldLayer = layer.open({
            title: false,
            type: 1,
            area: ['500px', '300px'],
            skin: 'label_modal',
            content: '\
                <div style="padding:0 20px;width: 600px; height: 400px; background-color: #fff; overflow: hidden;">\
                <p style=" margin-top: 10px">选择特点: (可多选，最多选择5个)</p>\
                <div id="traitfiledList" style=" margin-top: 5px;overflow-y:auto;height: 210px;background:#f4f5f5;">\
                </div>\
                    <div style="padding: 20px 0;border-top:1px solid #eee;border-bottom:1px solid #eee" >\
                        <p style="height: 30px; line-height: 30px; display: inline-block">添加服务特点: </p>\
                        <input id="addTraitFiledIpt" type="text" style="width: 100px; height: 30px; margin-left: 15px;border: 1px solid #b0b0b0;" maxlength="10">\
                        <button id="addTraitFiled" class="layui-btn layui-btn-small"  style="margin-left: 5px;">添 加</button>\
                    </div>\
                    <div style="margin: 0 auto;text-align:center;padding: 20px 0; overflow: hidden">\
                        <button id="traitCloseFiled" class="layui-btn layui-btn-primary" style="margin-right: 10px" >取消</button>\
                        <button id="traitSaveFiled" class="layui-btn layui-btn-normal">保存特点</button>\
                    </div>\
                </div>'
        });


        getTrait(function (data) {

            var flag = true;// 标记状态，默认为选中
            if (data.code === 0 && data.payload.length > 0) {

                var fileList = $("#traitfiledList");
                var qftLists = $("#traitList span");

                for (var i = 0; i < data.payload.length; i++) {
                    flag = true;

                    qftLists.each(function () {

                        if ($.trim($(this).text()) == data.payload[i].featureName) {
                            fileList.append(
                                '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                    <label>\
                                     <input data-qft-id="' + $(this).data('qftId') + '" data-src="' + $(this).prev("img").attr("src") + '" checked data-qft-name="' + data.payload[i].featureName + '"  type="checkbox" name="qualifications" value="' + data.payload[i].featureName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                  <p style="display: inline-block;">' + data.payload[i].featureName + '</p>\
                                  </label>\
                                </div>')
                            flag = false;
                            return false;
                        }
                    });

                    // 不是库里的
                    if (flag) {
                        fileList.append(
                            '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                            <label>\
                                <input  data-qft-id="' + data.payload[i].featureId + '" type="checkbox" name="qualifications" value="' + data.payload[i].featureName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                    <p style="display: inline-block;">' + data.payload[i].featureName + '</p>\
                             </label>\
                                </div>')
                    }

                }

            }

        })

        // 給添加按钮注册事件
        $("#addTraitFiled").off("click").on("click", function () {
            var iptVal = $.trim($("#addTraitFiledIpt").val()),
                isExisting = false;

            // 校验是否为空
            if (iptVal == '') {
                layer.msg("特点名不能为空");
                return false;
            }

            // 校验是否重复
            $("input[name=qualifications]").each(function (index, val) {
                if (iptVal === this.value) {
                    isExisting = true;
                    return false;
                }
            })

            if (isExisting === true) {
                layer.msg("该特点已存在");
                return false;
            }

            addTrait(iptVal, function (data) {
                if(data.code === 0){
                    if($("#traitfiledList input[name=qualifications]:checked").length < 5){
                        $("#traitfiledList").append(
                            '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">                            <label><input checked data-qft-id="1" type="checkbox" name="qualifications" value="'+ iptVal +'" style="display: inline-block;height: 14px;width: 14px;"><p style="display: inline-block;">'+ iptVal +'</p></label></div>')
                    }else {
                        $("#traitfiledList").append(
                            '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">                            <label><input  data-qft-id="1" type="checkbox" name="qualifications" value="'+ iptVal +'" style="display: inline-block;height: 14px;width: 14px;"><p style="display: inline-block;">'+ iptVal +'</p></label></div>')
                    }
                }
            })
            // 发送ajax，成功回调里添加到页面中；
//            addIdentify(iptVal, function (data) {
//
//                if (data.code === 0) {
//                    if ($("#filedList input[name=qualifications]:checked").length < 8) {
//                        $("#filedList").append('\
//                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
//                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block" checked>\
//                            <p style="display: inline-block">' + iptVal + '</p>')
//                    } else {
//
//                        $("#filedList").append('\
//                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
//                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block">\
//                            <p style="display: inline-block">' + iptVal + '</p>')
//                    }
//
//                }
//            })


        });

        // 给取消按钮注册事件
        $("#traitCloseFiled").off("click").on("click", function () {
            layer.close(fieldLayer);
        });

        // 给保存共享信息注册事件
        $("#traitSaveFiled").off("click").on("click", function () {
            var flag = saveTrait();
            if (flag) {
                layer.close(fieldLayer);
            }
        });

    }

    /**
     * 添加特点
     */
    function addTrait(traitName, success) {
        $.ajax({
            url: BASE_URL + "/bg/service/addFeature",
            type: 'post',
            dataType: 'json',
//            data:traitName,
            data: traitName,
            contentType: 'application/json',
            success: function (data) {
                success(data);
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
    }

    /**
     * 获取服务特点
     */
    function getTrait(success) {
        $.ajax({
            url: BASE_URL + "/bg/service/feature",
            type: 'get',
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

    /*
     ** 勾选资质，并点击保存资质
     */
    function saveTrait() {

        var checkedsIpt = $("#traitfiledList input[name=qualifications]:checked");
        var qftList = $("#traitList");
        var html = '';
        if (checkedsIpt.length > 5) {
            alert("最多选择5个特点");
            return false;
        }

        qftList.empty();// 清空列表
        for (var i = 0; i < checkedsIpt.length; i++) {
            html = '<span>' + checkedsIpt[i].value + '</span>';
            qftList.append(html);

        }

        return true;
    }
    var ORG_O_ID = "${result.orgOid}";
    /**
     * 初始化机构列表
     */
    function initOrgList() {
        $.ajax({
            url: BASE_URL + "/bg/share/queryorg?key=",
            type: 'get',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                var list;
                var orgListTag = $("#serviceOrg");
                var itemHtml;
                if (data.code === 0 && data.payload.length > 0) {
                    list = data.payload;
                    orgListTag.append('<option value="">请选择机构</option>');
                    for (var i = 0; i < list.length; i++) {
                        if (list[i].orgOid == ORG_O_ID) {
                            console.log(list[i].orgName);
                            console.log('哈哈哈哈');
                            itemHtml = '<option selected value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                        } else {
                            itemHtml = '<option  value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                        }
                        orgListTag.append(itemHtml);
                    }
                    form.render("select");
                } else {
                    layer.msg("机构获取失败，请刷新页面");

                }

            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        });
    }

    /**
     * 选择资质
     */
    function choseTagFactory() {

        var fieldLayer = layer.open({
            title: false,
            type: 1,
            area: ['500px', '300px'],
            skin: 'label_modal',
            content: '\
                <div style="padding:0 20px;width: 600px; height: 400px; background-color: #fff; overflow: hidden;">\
                <p style=" margin-top: 10px">选择资质: (可多选，最多选择5个)</p>\
                <div id="filedList" style=" margin-top: 5px;overflow-y:auto;height: 210px;background:#f4f5f5;">\
                </div>\
                    <div style="padding: 20px 0;border-top:1px solid #eee;border-bottom:1px solid #eee" >\
                        <p style="height: 30px; line-height: 30px; display: inline-block">添加资质: </p>\
                        <input id="addFiledIpt" type="text" style="width: 100px; height: 30px; margin-left: 15px;border: 1px solid #b0b0b0;" maxlength="10">\
                        <button id="addFiled" class="layui-btn layui-btn-small"  style="margin-left: 5px;">添 加</button>\
                    </div>\
                    <div style="margin: 0 auto;text-align:center;padding: 20px 0; overflow: hidden">\
                        <button id="closeFiled" class="layui-btn layui-btn-primary" style="margin-right: 10px" >取消</button>\
                        <button id="saveFiled" class="layui-btn layui-btn-normal">保存资质</button>\
                    </div>\
                </div>'
        });

        // 初始化时，是从后台拿数据的，拿数据时判断一下是否和这里面的三个值相等，相等的话就渲染为checked 默认选中
        getIdentify(function (data) {

            var flag = true;// 标记状态，默认为选中
            if (data.code === 0 && data.payload.length > 0) {
                var fileList = $("#filedList");
                var qftLists = $("#qftList .item span");

                for (var i = 0; i < data.payload.length; i++) {
                    flag = true;
                    qftLists.each(function () {
                        if ($.trim($(this).text()) == data.payload[i].aptitudeName) {
                            fileList.append(
                                '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                    <label>\
                                     <input  checked data-qft-name="' + data.payload[i].name + '"  type="checkbox" name="qualifications" value="' + data.payload[i].aptitudeName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                    <p style="display: inline-block;">' + data.payload[i].aptitudeName + '</p>\
                                  </label>\
                                </div>')
                            flag = false;
                            return false;
                        }
                    });

                    // 不是库里的
                    if (flag) {
                        fileList.append(
                            '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                            <label>\
                                <input  data-qft-id="' + data.payload[i].orgCertificateId + '" type="checkbox" name="qualifications" value="' + data.payload[i].aptitudeName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                    <p style="display: inline-block;">' + data.payload[i].aptitudeName + '</p>\
                             </label>\
                                </div>')
                    }

                }

            }

        });

        // 給添加按钮注册事件
        $("#addFiled").off("click").on("click", function () {
            var iptVal = $.trim($("#addFiledIpt").val()),
                isExisting = false;

            // 校验是否为空
            if (iptVal == '') {
                layer.msg("资质名不能为空");
                return false;
            }

            // 校验是否重复
            $("input[name=qualifications]").each(function (index, val) {
                if (iptVal === this.value) {
                    isExisting = true;
                    return false;
                }
            })

            if (isExisting === true) {
                layer.msg("该资质已存在");
                return false;
            }

            // 发送ajax，成功回调里添加到页面中；
            addIdentify(iptVal, function (data) {

                if (data.code === 0) {
                    if ($("#filedList input[name=qualifications]:checked").length < 5) {
                        $("#filedList").append('\
                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block" checked>\
                            <p style="display: inline-block">' + iptVal + '</p>')
                    } else {

                        $("#filedList").append('\
                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block">\
                            <p style="display: inline-block">' + iptVal + '</p>')
                    }

                }
            })


        });


        // 给取消按钮注册事件
        $("#closeFiled").off("click").on("click", function () {
            layer.close(fieldLayer);
        });

        // 给保存共享信息注册事件
        $("#saveFiled").off("click").on("click", function () {
            var flag = saveFiled();
            if (flag) {
                layer.close(fieldLayer);
            }
        });

    }


    /*
     ** 添加一条资质到资质库
     */
    function addIdentify(name, success, error) {
        $.ajax({
            url: BASE_URL + "/bg/service/addAptitude?featureName=" + name,
            type: 'post',
            dataType: 'json',
            data:name,
            contentType: 'application/json',
            success: function (data) {
                success(data);
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
    }


    /*
     ** 获取资质库的所有资质
     */
    function getIdentify(success, error) {
        $.ajax({
            url: BASE_URL + "/bg/service/aptitude",
            type: 'get',
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
    /*
     ** 勾选资质，并点击保存资质
     */
    function saveFiled() {

        var checkedsIpt = $("#filedList input[name=qualifications]:checked");
        var qftList = $("#qftList");
        var html = '';
        if (checkedsIpt.length > 5) {
            alert("最多选择5条资质");
            return false;
        }

        qftList.empty();// 清空列表
        for (var i = 0; i < checkedsIpt.length; i++) {
            var html = '<div class="item"><span>' + checkedsIpt[i].value + '</span></div>';//

//            if ($(checkedsIpt[i]).data("src")) {
//                html =
//                    ' <div class="item">\
//                        <p>' + checkedsIpt[i].value + '</p>\
//                    <div class="qualification">\
//                    <label>\
//                     <i class="layui-icon" onclick="removeImgSrc(this)" data-default-src="' + BASE_URL + '/bg/img/add_status_default.png">&#x1007;</i>\
//                     <img src="' + $(checkedsIpt[i]).data("src") + '">\
//                     <input data-qft-id="' + $(checkedsIpt[i]).data("qftId") + '" data-qft-name="' + checkedsIpt[i].value + '"  onchange="uploadImg(this)"   data-up-type="other" name="qualifications" accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">\
//                     </label>\
//                    </div>\
//                </div>';
//
//
//            } else {
//                html =
//                    ' <div class="item">\
//                     <p>' + checkedsIpt[i].value + '</p>\
//                    <div class="qualification">\
//                    <label>\
//                    <i class="layui-icon" onclick="removeImgSrc(this)" data-default-src="' + BASE_URL + '/bg/img/add_status_default.png">&#x1007;</i>\
//                    <img src="' + BASE_URL + '/bg/img/add_status_default.png">\
//                    <input  data-qft-name="' + checkedsIpt[i].value + '"  data-up-type="other"  onchange="uploadImg(this)" name="qualifications" accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">\
//                    <label>\
//                    </div>\
//                </div>';

//            }

            qftList.append(html);
        }

        return true;
    }
    /*
     ** 上传图片
     */
    function uploadImg($this) {
        var files = $this.files;

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
            url: BASE_URL + '/bg/file/upload/' + fileOption.type,
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
    /*
     **  提交表单
     */
    var PUT_FLAG = true;
    function putOrgForm() {
        if (!PUT_FLAG) {
            layer.msg("请不要重复提交");
        }
        // 服务名称
        console.log("服务名称");
        var serviceName = $("#serviceName").val()
        if (serviceName == "") {
            alert("服务名不能为空");
            return false;
        }

        // 服务对应机构名称
        var orgOid = $("#serviceOrg").val();
        if (orgOid === '') {
            alert("机构名不能为空，请输入服务名称");
            return false;
        }

        // 服务图片
        console.log("服务图片:");
        var serviceImgList = $("#imgList .svc_img img");
        var servicePics = [];
        serviceImgList.each(function () {
            var imgSrc = $(this).attr("src");
            imgSrc = dealSrc(imgSrc);
            servicePics.push(imgSrc);
        });
        // 处理SRC
        function dealSrc(imgSrc) {
            if(imgSrc.substring(imgSrc.length-7,imgSrc.length) == "500_500"){
                imgSrc = imgSrc.substring(0,imgSrc.length-7);
            }
            return imgSrc;
        }

        // 服务特点
        console.log("服务特点:");
        var traitList = $("#traitList span");
        var serviceFeature = [];
        traitList.each(function () {
            serviceFeature.push($(this).text());
        })
        console.log(serviceFeature);

        // 获取资质
        console.log("获取资质:");
        console.log($("#qftList .item span"));
        var qftList = $("#qftList .item span");
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
            // 具体价格
//            servicePrice = {
//                'flag': '1',
//                'remark': priceInfo,
//                'accPrice': $("#fixedPriceP").val() * 100,
//                'unit': $("#fixedUnit").val()
//            }

            var accPrice = $("#fixedPriceP").val() - 0;
            var fixedUnit = $("#fixedUnit").val();

            if (fixedUnit.length >= 11 || fixedUnit.length <= 0 || /^[0-9]*$/.test(fixedUnit)) {
                alert("参考价格输入错误，单位应为1-10个字符")
                return false;
            }

            // 单位控制
            if (fixedUnit == "") {
                alert("参考价格输入错误，请输入单位")
                return false;
            }

            if (accPrice == "" || accPrice > 200000 || accPrice < 1 || !/^\d{0,6}$/.test(accPrice)) {
                alert("参考价格输入错误，价格区间为1-200000")
                return false;
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
                alert("参考价格输入错误，输入单位应为1-10个字符")
                return false;
            }

            // 单位控制
            if (rangeUnit == "") {
                alert("参考价格输入错误，请输入单位")
                return false;
            }
            console.log("************************");
            console.log($.trim(scopeHighPrice));
            console.log($.trim(scopeHighPrice) == "");
            if ($.trim(scopeHighPrice) == "") {
                if (scopeLowPrice < 1 || !/^\d{0,6}$/.test(scopeLowPrice)) {
                    alert("价格应为1-200000的正整数")
                    return false;
                }
            } else {
                if (scopeLowPrice - scopeHighPrice >= 0) {
                    alert("参考价格输入错误，最高价必须大于最低价")
                    return false;
                }

                if (scopeHighPrice > 200000 || scopeLowPrice < 1 || !/^\d{0,6}$/.test(scopeHighPrice) || !/^\d{0,6}$/.test(scopeLowPrice)) {
                    alert("价格应为1-200000的正整数")
                    return false;
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
        console.log($("#serviceInfo").val());
        var serviceDes = $("#serviceInfo").val();

        // 使用设备
        console.log("使用设备");
        var insList = $("#insList  input");
        var serviceMachine = [];
        insList.each(function () {
            if ($.trim($(this).val()) != "") {
                serviceMachine.push($(this).val());
            }
        })
        console.log("使用设备:");
        console.log(serviceMachine);

        // todo
        // 依据方法
        console.log("依据方法:");
        console.log();
        var serviceMethod = $("#serviceMethos").val();
        // 服务周期
        console.log("服务周期：");
        var servicePeriod = $("#serviceCycle").val();
        console.log(servicePeriod);

        // 其他备注
        console.log("其他备注:");
        console.log(serviceNote);
        var serviceNote = $("#otherInfo").val();
        // 联系方式
        var phoneList = $("#phoneList .rowphone");
        var orgContactsList = []; // 联系人联系方式容器
        if (phoneList.length <= 0) {
            alert("请添加联系方式");
            return false;
        }
        var peopleFlag = false;
        phoneList.each(function () {
            var contactItem = {
                conName: null,
                conPhone: null,
            }

            var curName = $(this).find(".people input").val();
            var curPhone = $(this).find(".phone input").val();
            contactItem.conName = curName;
            contactItem.conPhone = curPhone;

            if (curPhone == "") {
                alert("请输入正确的联系电话");
                peopleFlag = true;
                return false;
            }
            var REG = {
                phone400: /^400[0-9]{7}/,
                phone800: /^800[0-9]{7}/,
                phone11: /^1(3|4|7|5|8)([0-9]{9})/,
//            fixedPhone: /([0-9]{3,4}-)?[0-9]{7,8}/,
                fixedPhone: /^[0-9]{3,4}-[0-9]{7,8}$/,
            }

            if (!REG.fixedPhone.test(curPhone) && !REG.phone11.test(curPhone)) {
                alert("请输入正确的联系电话");
                peopleFlag = true;
                return false;
            }

            // 联系人姓名提示
            if (!/^[\u4e00-\u9fa5]{2,5}$/.test(curName)) {
                alert("请输入正确的姓名");
                peopleFlag = true;
                return false;
            }
            orgContactsList.push(contactItem);
        })
        if (peopleFlag) {
            return false;
        }
        // 联系地址省市区
        var province = $("#province_1").val();
        var city = $("#city_1").val();
        var county = $("#county_1").val();
        console.log("省市区：");
        console.log(province);
        console.log(city);
        console.log(county);

        if (province == "" || city == "" || county == "") {
            alert("地址输入错误，请选择城市");
            return false;
        }

        // 详细地址
        console.log("详细地址1");
        var serviceAddress = $("#addressDetail_1").val();
        if (serviceAddress == "") {
            alert("地址输入错误，请输入详细地址");
            return false;
        }

        // 地址经纬度
        console.log("经纬度:");
        console.log();
        console.log();
        var serviceLon = $("#longitude").val();
        var serviceLat = $("#latitude").val();

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(serviceLon) || /^[0-9]{1,3}$/.test(serviceLon))) {
            alert("经纬度错误，请填写正确的经纬度");
            return false;
        }

        if (!(/^[0-9]{1,3}\.[0-9]{1,2}$/.test(serviceLat) || /^[0-9]{1,3}$/.test(serviceLat))) {
            alert("经纬度错误，请填写正确的经纬度");
            return false;
        }

        var formData = {
            serviceName: serviceName,// 服务名
            orgOid: orgOid,// 机构ID
            servicePics: JSON.stringify(servicePics),// 数组服务图片
            serviceFeature: JSON.stringify(serviceFeature),// 服务特点
            serviceCredit: JSON.stringify(serviceCredit),// 服务资质
            servicePrice: JSON.stringify(servicePrice),// 参考价格
            serviceDes: serviceDes,// 服务简介
            serviceMachine: JSON.stringify(serviceMachine),// 使用设备
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
            serviceIsManager: 1,
            serviceId: "${result.serviceId}"
        }
        console.log(formData);
        putService(formData);
    }

    function putService(formData) {
        PUT_FLAG = false;// 更新提交状态
        $.ajax({
            url: BASE_URL + '/bg/service/alter',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (data) {

                if (data.code === 0) {
                    console.log("请求成功，服务上传成功");
                    console.log(data);
                    location.href = BASE_URL + "/bg/service/detail?serviceId=${result.serviceId}"
                }else if (data.code === 5001) {
                    alert(data.message);
                    PUT_FLAG = true;
                } else {
                    PUT_FLAG = true;
                }

            },
            error: function (err) {
                console.log("修改失败,请重新提交");
                PUT_FLAG = true;
                //  layer.msg("网络繁忙，请重新选择城市");
            }
        });
    }
</script>
</html>
