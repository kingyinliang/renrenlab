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
        .ct_box {
            padding-top: 10px;
            color: #4e4e4e;
            font-size: 16px;
            overflow: hidden;
        }
        /*END 内容部分公用样式*/

        /*纯文本*/
        .ct_box span.text {
            line-height: 22px;
        }
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

        /*服务特点*/
        .trait {
            margin-right: 26px;
        }
        /*服务图片*/
        .svc_img {
            width: 102px;
            height: 102px;
            float: left;
            margin-right: 20px;
        }

        .svc_img > img {
            width: 100%;
            height: 100%;
        }
        /*资质*/
        .org_zz {
            overflow: hidden;
        }

        .org_zz .img_item {
            float: left;
            margin-right: 12px;
        }

        .org_zz .img_item > i {
            line-height: 40px;
            height: 40px;
            text-align: center;
            display: block;
        }

        .org_zz .img_item > label {

        }

        .org_zz .img_item img {
            width: 163px;
            height: 115px;
        }
        /*联系人图表*/
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

        table.linkman tbody tr {
            background: #fff;
            height: 38px;
        }

        table.linkman tbody tr.even {
            background-color: #fafafa;
        }

        table.linkman tbody td {
            text-align: center;
        }

        /*百度地图*/
        .baidu_map {
            width: 438px;
            height: 244px;
            overflow: hidden;
        }

        .baidumaps {
            width: 438px;
            height: 294px;
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
            <h4 class="tit">服务管理 > 服务详情</h4>
            <%--服务基本信息--%>
            <div class="secent_tit">
                服务基本信息
            </div>
            <%--服务编号--%>
            <div class="item">
                <span>服务编号：</span>
                <div class="ct_box">
                    <span class="text">${serviceDetail.serviceId}</span>
                </div>
            </div>
            <%--服务名称--%>
            <div class="item">
                <span>服务名称：</span>
                <div class="ct_box">
                    <span class="text">${serviceDetail.serviceName}</span>
                </div>
            </div>
            <%--所属机构--%>
            <div class="item">
                <span>所属机构：</span>
                <div class="ct_box">
                    <span class="text">${serviceDetail.orgName}</span>
                </div>
            </div>
            <%--服务图片--%>
            <div class="item">
                <span>服务图片：</span>
                <div class="ct_box">
                    <c:forEach var="item" items="${serviceDetail.servicePics}">
                        <div class="svc_img">
                            <img src="${item}500_500"
                                 alt="">
                        </div>
                    </c:forEach>
                    <c:if test="${serviceDetail.servicePics.size() <= 0}">
                        暂无
                    </c:if>
                </div>
            </div>
            <%-- 运营人员给修改了，则有特点，没修改则没有--%>
            <div class="item">
                <span>服务特点：</span>
                <div class="ct_box">
                    <c:forEach var="item" items="${serviceDetail.serviceFeature}">
                        <span class="trait">${item}</span>
                    </c:forEach>
                    <c:if test="${serviceDetail.serviceFeature.size() <= 0}">
                        暂无
                    </c:if>
                </div>
            </div>
            <%--服务资质--%>
            <div class="item">
                <span>服务资质：</span>
                <div class="org_zz" style="padding-top: 10px;">
                    <c:forEach var="item" items="${serviceDetail.serviceCredit}">
                        <span class="trait">${item}</span>
                    </c:forEach>
                    <c:if test="${serviceDetail.serviceCredit.size() <= 0}">
                        暂无
                    </c:if>
                </div>
            </div>
            <%--参考价格--%>
            <div class="item">
                <span>参考价格：</span>
                <div class="ct_box">
                    <span class="text">
                        <c:if test="${serviceDetail.servicePrice.flag == 1}">
                            ￥${serviceDetail.servicePrice.accPrice} / ${serviceDetail.servicePrice.unit}
                        </c:if>
                        <c:if test="${serviceDetail.servicePrice.flag == 2}">
                            <c:choose>
                                <c:when test='${serviceDetail.servicePrice.scopeHighPrice.equals("0")}'>
                                    ￥${serviceDetail.servicePrice.scopeLowPrice}/${serviceDetail.servicePrice.unit}起
                                </c:when>
                                <c:otherwise>
                                    ￥${serviceDetail.servicePrice.scopeLowPrice}-￥${serviceDetail.servicePrice.scopeHighPrice}/${serviceDetail.servicePrice.unit}
                                </c:otherwise>
                            </c:choose>
                        </c:if>
                        <c:if test="${serviceDetail.servicePrice.flag == 3}">
                            面议
                        </c:if></span></span>
                </div>
            </div>
            <%--报价说明--%>
            <div class="item">
                <span>报价说明：</span>
                <div class="ct_box">
                    <span class="text">${serviceDetail.servicePrice.remark}</span>
                    <c:if test="${''.equals(serviceDetail.servicePrice.remark) || serviceDetail.servicePrice.remark == null}">
                        暂无
                    </c:if>
                </div>
            </div>
            <%--服务详细信息--%>
            <div class="secent_tit">
                服务详细信息
            </div>
            <%--服务简介--%>
            <div class="item">
                <span>服务简介：</span>
                <div class="ct_box">
                    <span class="text">${serviceDetail.serviceDes}</span>
                    <c:if test="${''.equals(serviceDetail.serviceDes) || serviceDetail.serviceDes == null}">
                        暂无
                    </c:if>
                </div>
            </div>
            <%--服务领域--%>
            <%--<div class="item" style="display: none">--%>
            <%--<span>服务领域：</span>--%>
            <%--<div class="ct_box">--%>
            <%--<span class="text">--%>
            <%--<c:forEach items="${serviceDetail.serviceScope}" var="item">--%>
            <%--${item}--%>
            <%--</c:forEach>--%>
            <%--</span>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--使用设备--%>
            <div class="item">
                <span>使用设备：</span>
                <div class="ct_box">
                    <span class="text">
                    <c:forEach items="${serviceDetail.serviceMachine}" var="item">
                        ${item}
                    </c:forEach>
                    <c:if test="${serviceDetail.serviceMachine.size() <= 0}">
                        暂无
                    </c:if>
                    </span>
                </div>
            </div>
            <%--依据方法--%>
            <div class="item">
                <span>依据方法:</span>
                <div class="ct_box">
                    <span class="text">
                    ${serviceDetail.serviceMethod}
                    <c:if test="${''.equals(serviceDetail.serviceMethod) || serviceDetail.serviceMethod == null}">
                        暂无
                    </c:if>
                    </span>
                </div>
            </div>
            <%--服务周期--%>
            <div class="item">
                <span>服务周期：</span>
                <div class="ct_box">
                    <span class="text">
                        ${serviceDetail.servicePeriod}
                        <c:if test="${''.equals(serviceDetail.servicePeriod) || serviceDetail.servicePeriod == null}">
                            暂无
                        </c:if>
                    </span>
                </div>
            </div>
            <%--其他备注--%>
            <div class="item">
                <span>其他备注：</span>
                <div class="ct_box">
                    <span class="text">
                        ${serviceDetail.serviceNote}
                        <c:if test="${''.equals(serviceDetail.serviceNote) || serviceDetail.serviceNote == null}">
                            暂无
                        </c:if>
                    </span>
                </div>
            </div>
            <%--联系方式--%>
            <div class="item">
                <span>联系方式：</span>
                <div class="ct_box">
                    <table class="linkman">
                        <thead>
                        <tr>
                            <th>联系人姓名</th>
                            <th>联系电话</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${serviceDetail.serviceContacts}">
                            <tr>
                                <td>${item.conName}</td>
                                <td>${item.conPhone}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--联系地址--%>
            <div class="item">
                <span>联系地址：</span>
                <div class="ct_box">
                    <span class="text">
                        ${serviceDetail.serviceProvince}${serviceDetail.serviceCity}${serviceDetail.serviceDistrict}${serviceDetail.serviceAddress}
                    </span>
                </div>
            </div>
            <%--地址经纬度--%>
            <div class="item">
                <span>地址经纬度：</span>
                <div class="ct_box">
                    <span class="text">
                    东京：${serviceDetail.serviceLon}&nbsp;&nbsp;&nbsp;&nbsp;北纬 ${serviceDetail.serviceLat}
                    </span>
                </div>
            </div>
            <%--地图--%>
            <div class="item" style="margin-bottom: 100px;">
                <span>地图：</span>
                <div class="ct_box">
                    <div class="baidu_map">
                        <div class="baidumaps" id="baidumap"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script src="${rlab}/front/js/util/baiduMap.js?v_=20170905"></script>

<%--<script src="${rlab}/front/js/view/facilitator_prove.js"></script>--%>
<script>
    setBaiduMap("${serviceDetail.serviceAddress}");
    // 设置百度地图
    function setBaiduMap(adress) {
        loadJScriptMove(adress, ${serviceDetail.serviceLon}, ${serviceDetail.serviceLat});
    }
</script>
</body>
</html>
