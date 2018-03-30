<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202 ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <style type="text/css">
        /*头部样式在base.css*/
        * {
            margin: 0;
            padding: 0;
        }

        a {
            text-decoration: none !important;
        }

        a:hover {
            text-decoration: none !important;
        }

        a:link {
            text-decoration: none !important;
        }

        .closes {
            float: right;
            width: 0.5rem;
            font-size: 0.5rem;
            line-height: 1rem;
            color: #4E4E4E;
        }

        #echart {
            width: 100%;
            height: 10rem;
            font-size: 0.2rem;
        }

        #footer {
            text-align: center;
            line-height: 1rem;
            background: #F5F6FA;
            padding-top: 0.89rem;
        }

        #footer p {
            margin: 0;
            font-size: 0.267rem;
            color: #b5b5b5;
        }

        #footer img {
            width: 2.13rem;
            height: 0.56rem;
        }

        #footer p img {
            width: 2.6rem;
            height: 2.6rem;
            margin-bottom: 0.5rem;
        }

        /*super_search主页面*/
        .sp_main {
        }

        .sp_ctnt {
            padding: 0 0.32rem;
        }

        .sp_ctnt > .tip {
            font-size: 0.32rem;
            color: #4083ef;
            border: 1px solid;
        }

        .bb {
            margin-top: 0.3rem;
            margin-bottom: 0.4rem;
        }

        .bb a {
            line-height: 0.62rem;
            font-size: 0.32rem;
            background: #4f8df0;
            border-radius: 0.31rem;
            color: white;
            display: inline-block;
            padding: 0 0.26rem;
            margin: 0 0.2rem;
        }
    </style>
</head>
<body>
<div id="main" class="sp_main">
    <%--START 头部公用部分引入--%>
    <%@ include file="../template/header_two.jsp" %>
    <%--END 头部公用部分引入--%>
    <div class="content" style="padding-bottom: 1.6rem; overflow: hidden">
        <div style="margin: 0.4rem 0.333rem 0 0.333rem; background-color: white; padding-bottom: 0.2666rem; overflow: hidden; border-radius: 0.2rem">
            <div style="border: 1px solid #f5f5f5; margin: 0.333rem 0 0.333rem 0.2666rem; width: 2rem; height: 2rem; float: left; position: relative">
                <c:choose>
                    <c:when test="${orgInfo.orgLogo != null && orgInfo.orgLogo.trim()  != ''}">
                        <c:if test="${orgInfo.orgPositionList !=null && orgInfo.orgPositionList.size() > 0}">
                            <img src='${orgInfo.orgLogo}?x-oss-process=image/crop,x_${orgInfo.orgPositionList.get(0)},y_${orgInfo.orgPositionList.get(1)},w_${orgInfo.orgPositionList.get(2)},h_${orgInfo.orgPositionList.get(3)}'
                                 style="width: 2rem; height: 2rem">
                        </c:if>
                        <c:if test="${orgInfo.orgPositionList.size() <= 0 || orgInfo.orgPositionList == null}">
                            <img src="${orgInfo.orgLogo}" style="width: 2rem; height: 2rem">
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <img src="${rlab}/front/imgs/icon/org_logo_default.png" style="width: 2rem; height: 2rem">
                    </c:otherwise>
                </c:choose>
                <c:if test="${orgInfo.orgType == 2}">
                    <i class="lab-renzheng_1" style="color: #f4af71; position: absolute; right: 0; top: 0;"></i>
                </c:if>
            </div>
            <div style="float: right; margin: 0 0.2666rem 0 0.4666rem; width: 6.2666rem">
                <div style="float: right; width: 1.4rem; height: 0.7333rem; position: relative">
                    <img src="${rlab}/front/imgs/m_rank.png" style="width: 100%; height: 100%;">
                    <p style="color: white; position: absolute; top: 0.1rem; width: 100%; text-align: center">
                        NO.${orgInfo.orgRank}</p>
                </div>
                <p style="margin-top: 0.8rem; color: #4e4e4e; font-size: 0.373rem">
                    ${orgInfo.orgName}</p>
                <p style="height: 0.5rem; line-height: 0.5rem;color: #89d556; margin-top: 0.2666rem; font-size: 0.32rem;display: ${orgInfo.orgShareIndexStr=='0'?'none':'block'}">
                    共享指数 ${orgInfo.orgShareIndexStr}</p>
                <div style="float: right; height: 0.4rem; line-height: 0.4rem" class="bb">
                    <%--<p onclick="toOrgInsList(this)" data-org-oid="${orgInfo.orgOid}"
                       style="float: left; font-size: 0.32rem; height: 0.4rem; line-height: 0.4rem">持有仪器 ${orgInfo.orgInsCount}</p>
                    <i class="lab-youjian_1" style="float: left; font-size: 0.4rem"></i>--%>
                    <a onclick="toOrgInsList(this)" data-total="${orgInfo.orgInsCount}" data-org-oid="${orgInfo.orgOid}" href="javascript:void(0)">
                        持有仪器${orgInfo.orgInsCount}
                    </a>
                    <a onclick="toOrgServiceList(this)" data-total="${serviceCounts}" data-org-oid="${orgInfo.orgOid}" href="javascript:void(0)">
                        拥有服务${serviceCounts}
                    </a>
                    <%--<img src="${rlab}/front/imgs/m_arrow.png" style="float: right; margin: 0 0 0 0.1333rem; width: 0.1333rem; height: 0.2666rem; vertical-align:middle">--%>
                </div>
            </div>
        </div>
        <div style="margin: 0.8rem 0.4666rem 0 0.4666rem; overflow: hidden">
            <div style="height: 0.4rem; margin-top: 0.1333rem">
                <i class="lab-dot-1"
                   style="font-size: 0.3rem; color: #204993; float: left;-webkit-transform: scale(0.6,0.6);-moz-transform: scale(0.6,0.6);-ms-transform: scale(0.6,0.6);-o-transform: scale(0.6,0.6);transform: scale(0.6,0.6);"></i>
                <%--<label style="width: 0.1rem; height: 0.1rem; background-color: #204993; float: left; line-height: 0.4rem"></label>--%>
                <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #898988; margin-left: 0.2666rem">
                    机构性质：</p>
                <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #262626">
                    ${orgInfo.orgCategory != null ? orgInfo.orgCategory:"其他"}</p>
            </div>
            <c:if test="${orgInfo.orgWeb != null}">
                <div style="height: 0.4rem; margin-top: 0.1333rem">
                    <i class="lab-dot-1"
                       style="font-size: 0.3rem; color: #204993; float: left;-webkit-transform: scale(0.6,0.6);-moz-transform: scale(0.6,0.6);-ms-transform: scale(0.6,0.6);-o-transform: scale(0.6,0.6);transform: scale(0.6,0.6);"></i>
                    <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #898988; margin-left: 0.2666rem">
                        机构网址：</p>
                    <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #262626">
                            ${orgInfo.orgWeb == null?'数据更新中': orgInfo.orgWeb}</p>
                </div>
            </c:if>
            <c:if test="${orgInfo.orgAddress.orgZipcode != null} && ${orgInfo.orgAddress.orgZipcode != ''} && ${orgInfo.orgAddress.orgZipcode != '数据更新中'}">
                <div style="height: 0.4rem; margin-top: 0.1333rem">
                    <i class="lab-dot-1"
                       style="font-size: 0.3rem; color: #204993; float: left;-webkit-transform: scale(0.6,0.6);-moz-transform: scale(0.6,0.6);-ms-transform: scale(0.6,0.6);-o-transform: scale(0.6,0.6);transform: scale(0.6,0.6);"></i>
                    <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #898988; margin-left: 0.2666rem">
                        机构邮编：</p>
                    <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #262626">
                            ${orgInfo.orgAddress.orgZipcode == null || ''.equals(orgInfo.orgAddress.orgZipcode)?  "数据更新中"  :  orgInfo.orgAddress.orgZipcode == null ? "数据更新中" : orgInfo.orgAddress.orgZipcode}</p>
                </div>
            </c:if>
            <div style="min-height: 0.4rem; margin-top: 0.1333rem">
                <i class="lab-dot-1"
                   style="font-size: 0.3rem; color: #204993; float: left;-webkit-transform: scale(0.6,0.6);-moz-transform: scale(0.6,0.6);-ms-transform: scale(0.6,0.6);-o-transform: scale(0.6,0.6);transform: scale(0.6,0.6);"></i>
                <p style="float: left; height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #898988; margin-left: 0.2666rem">
                    机构地址：</p>
                <p style="float: left; min-height: 0.4rem; line-height: 0.4rem; font-size: 0.29333rem; color: #262626; width: 6.5rem">
                    ${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrStreet}</p>
            </div>
        </div>
        <div style="background-color: white; border-radius: 0.2rem; margin: 0.66666rem 0.333rem 0 0.333rem; overflow: hidden; padding-bottom: 0.4rem">
            <c:if test="${sessionScope.uid != null}">
                <%-- 机构联系方式 --%>
                <div style="margin: 0.6rem 0 0 0.2666rem">
                    <div style="height: 0.4rem">
                        <label style="background-color: #4083ef; height: 0.4rem; width: 3px; float: left"></label>
                        <p style="height: 0.4rem; float: left; margin-left: 0.2rem; color: #262626; font-size: 0.3466rem">
                            机构联系方式</p>
                    </div>
                    <p style="color: #4b4b4b; font-size: 0.32rem; margin: 0.4rem 0 0 0.5333rem">
                        <span>机构传真：</span>${orgInfo.orgContacts.conFax == null || ''.equals(orgInfo.orgContacts.conFax)?  "数据更新中"  :  orgInfo.orgContacts.conFax == null ? "数据更新中" : orgInfo.orgContacts.conFax}
                    </p>
                    <p style="color: #4b4b4b; font-size: 0.32rem; margin: 0.2666rem 0 0 0.5333rem">
                        <span>机构邮箱：</span>${orgInfo.orgContacts.conEmail == null || ''.equals(orgInfo.orgContacts.conEmail)?  "数据更新中"  :  orgInfo.orgContacts.conEmail == null ? "数据更新中" : orgInfo.orgContacts.conEmail}
                    </p>
                    <p style="color: #4b4b4b; font-size: 0.32rem; margin: 0.2666rem 0 0 0.5333rem">
                        <span>机构电话：</span>${orgInfo.orgContacts == null ?  "数据更新中"  :  orgInfo.orgContacts.conPhone == null ? "数据更新中" : orgInfo.orgContacts.conPhone}
                    </p>
                    <div style="height: 1px; margin: 0.5333rem 0.5333rem 0 0.5333rem; background-color: #f0f0f0"></div>
                </div>
            </c:if>
            <%-- 机构简介 --%>
            <div style="margin: 0.6rem 0 0 0.2666rem">
                <div style="height: 0.4rem">
                    <label style="background-color: #4083ef; height: 0.4rem; width: 3px; float: left"></label>
                    <p style="height: 0.4rem; float: left; margin-left: 0.2rem; color: #262626; font-size: 0.3466rem">
                        机构简介</p>
                </div>
                <p style="color: #4b4b4b; font-size: 0.32rem; margin: 0.4rem 0.5333rem 0 0.5333rem">
                    <c:choose>
                        <c:when test="${orgInfo.orgDescription != null && orgInfo.orgDescription != ''}">
                            ${orgInfo.orgDescription.length() > 2000?orgInfo.orgDescription.substring(0,2000).concat('...'):orgInfo.orgDescription}
                        </c:when>
                        <c:otherwise>
                            数据更新中
                        </c:otherwise>
                    </c:choose>
                </p>
                <div style="height: 1px; margin: 0.5333rem 0.5333rem 0 0.5333rem; background-color: #f0f0f0"></div>
            </div>
            <%-- 机构资质 --%>
            <c:if test="${orgInfo.orgCertificateList != null}">
                <div style="margin: 0.6rem 0 0 0.2666rem">
                    <div style="height: 0.4rem">
                        <label style="background-color: #4083ef; height: 0.4rem; width: 3px; float: left"></label>
                        <p style="height: 0.4rem; float: left; margin-left: 0.2rem; color: #262626; font-size: 0.3466rem">
                            机构资质</p>
                    </div>
                    <div style="">
                        <c:forEach var="orgCertificate" items="${orgInfo.orgCertificateList}">
                            <img src="${orgCertificate.orgCertificatePic == null ? '' : orgCertificate.orgCertificatePic}"
                                 style="width: 3.8rem; height: 5.333rem; border: 1px solid #f0f0f0; float: left; margin: 0.4rem 0 0 0.4rem">
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
        <c:if test="${sessionScope.uid == null}">
            <div style="background-color: #508DF0; width: 100%; height: 1.2rem; position: fixed; bottom: 0; text-align: center"
                 onclick="login()">
                <p style="color: white; font-size: 0.37333rem; height: 1.2rem; line-height: 1.2rem">查看联系方式</p>
            </div>
        </c:if>
    </div>

</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<%--<script type="text/javascript" src="${rlab}/front/js/common/main.js"></script>--%>
<script type="text/javascript">
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }

    setCallbackUrl();// 设置登录时回跳路径

    function toOrgInsList($this) {
        var total =  $($this).data("total") - 0;
        if(total <= 0){
            return false;
        }
        var url = BASE_URL + "/org/" + $($this).data("orgOid") + "/ins?backFlag=1&pageNo=1&pageSize=10";
        location.href = url;
    }

    function login() {
        toLogin();
    }

    function toOrgServiceList($this) {
        var total =  $($this).data("total") - 0;
        if(total <= 0){
            return false;
        }
        var url = BASE_URL + "/org/" + $($this).data("orgOid") + "/service?backFlag=1&pageNo=1&pageSize=10";
        window.location.href = url;
    }
</script>
</html>