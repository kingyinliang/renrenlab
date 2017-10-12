<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
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
    <link rel="stylesheet" href="${rlab}/front/css/org_home.css">

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
        body,html {
            background-color: #f3f6f9!important;
        }
        .wrapper{
            background-color:#f3f6f9!important;
        }
        /*共享指数*/
        .org_title {
            line-height: 104px;
            background: #fff;
            overflow: hidden;
        }

        .org_title > div {
            height: 104px;
            width: 1120px;
            margin: 0 auto;
        }

        .org_title .org_info {
            float: left;
            position: relative;
        }

        .org_title .org_info img.logo {
            height: 40px;
            vertical-align: middle;
        }

        .org_title .org_info span {
            font-size: 20px;
            color: #4E4E4E;
            position: relative;
        }

        .org_title .org_info img.approve {
            width: 20px;
            height: 20px;
            position: absolute;
            right: -26px;
            top: -6px;
        }

        .org_title .exponent {
            float: right;
            font-size: 12px;
            color: #4E4E4E;
        }

        .org_title .share {
            overflow: hidden;
            float: left;
            position: relative;
            margin-left: 24px;
        }

        .org_title .share > div {
            float: left;
        }

        .org_title .share > div.num {
            /*font-size: 50px;*/
            /*font-family: "779-CAI978";*/
            /*color: #ed6a5f;*/
            /*line-height:88px;*/
            /*overflow: hidden;*/
            /*position: re;*/
            /*top: 10px;*/
            /*left: 10px;*/
            height: 104px;
            position: relative;
            margin-left: 16px;
        }

        .org_title .share > div.num > div {
            position: relative;
            top: 50%;
            margin-top: -22px;
            overflow: hidden;
        }

        .org_title .share > div.num img {
            float: left;
            vertical-align: middle;

        }

        /*机构tab栏*/
        .org_tab {
            border-bottom: 2px solid #508DF0;
            line-height: 44px;
            height: 46px;
        }

        .org_tab ul {
            list-style: none;
            width: 1120px;
            margin: 0 auto;
            line-height: 44px;
        }

        .org_tab li {
            font-size: 16px;
            float: left;
            margin-right: 45px;
        }

        .org_tab li a {
            color: #4E4E4E;

        }

        .org_tab li.actived a {
            color: #508DF0;
        }
        .button {
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            color: white;
            font-size: 16px;
            width: 100%;
            height: 100%;
            background-color: #508DF0;
            text-align: center;
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="wrapper" style="background-color: white">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--模块-->
    <div class="user_center user_content clearfix" style="width: 100%; background-color: #f3f6f9; padding-bottom: 30px">
        <%--机构标题--%>
        <div class="org_title">
            <div>
                <div class="org_info">
                    <c:if test="${orgInfo.orgLogo !=null && orgInfo.orgLogo != ''}">
                        <img class="logo" src="${orgInfo.orgLogo}">
                    </c:if>
                    <span>
                        ${orgInfo.orgName}
                        <c:if test="${orgInfo.orgIdentification == 1}">
                            <i class="lab-renzheng_1"
                               style="color: #f4af71;font-size: 12px;position: absolute;top: 0;right: -16px;font-size: 16px;"></i>
                        </c:if>
                    </span>
                </div>
                <div class="exponent">
                    <div class="share share_rank">
                        <div>排名 | No.</div>
                        <div class="num">
                            <div>
                                <c:forEach items="${orgInfo.orgRankList}" var="item" varStatus="status">
                                    <c:choose>
                                        <c:when test="${'.'.equals(item)}">
                                            <img src='${rlab}/front/imgs/share/index_d.jpg'>
                                        </c:when>
                                        <c:otherwise>
                                            <img src='${rlab}/front/imgs/share/index_${item}.jpg'>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>

                        </div>
                    </div>
                    <div class="share share_index">
                        <div>共享指数 |</div>
                        <div class="num">
                            <div>
                                <c:forEach items="${orgInfo.orgShareIndexList}" var="item" varStatus="status">
                                    <c:choose>
                                        <c:when test="${'.'.equals(item)}">
                                            <img src='${rlab}/front/imgs/share/d.jpg'>
                                        </c:when>
                                        <c:otherwise>
                                            <img src='${rlab}/front/imgs/share/${item}.jpg'>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <%--机构tab栏   --%>
        <div class="org_tab">
            <ul>
                <li class="actived">
                    <a href="${rlab}/front/org/${orgInfo.orgOid}">机构首页</a>
                </li>
                <li>
                    <a href="${rlab}/front/org/${orgInfo.orgOid}/ins?pageNo=1&pageSize=10">持有仪器(${orgInfo.orgInsCount})</a>
                </li>
            </ul>
        </div>
        <div style="width: 1120px; margin: 0 auto">
            <div style="overflow: hidden">
                <div style="width: 450px;  margin-top: 45px; overflow: hidden; float: left">
                    <div class="radius" style="padding-bottom: 20px;background-color: white;  overflow: hidden">
                        <div class="org_info" style="margin-left: 30px">
                            <h2 style="margin-top: 30px">机构信息</h2>
                            <p style="margin-top: 30px">
                                <i>机构性质：</i>
                                <span>${orgInfo.orgCategory != null ? orgInfo.orgCategory:"其他"}</span>
                            </p>
                            <p style="">
                                <i>机构网址：</i>
                                <span>${orgInfo.orgWeb == null || ''.equals(orgInfo.orgWeb)? "未知" : orgInfo.orgWeb}</span>
                            </p>
                            <p>
                                <i>机构邮编：</i>
                                <span>${orgInfo.orgAddress.orgZipcode == null || ''.equals(orgInfo.orgAddress.orgZipcode)?  "暂无"  :  orgInfo.orgAddress.orgZipcode == null ? "暂无" : orgInfo.orgAddress.orgZipcode}</span>
                            </p>
                            <p>
                                <i>机构地址：</i>
                                <span>${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrStreet}</span>
                            </p>
                        </div>

                        <c:if test="${orgInfo.orgAddress.orgAddrProvince != null}">
                            <div class=""
                                 style="overflow: hidden;padding: 0 30px 0 25px;margin-top: 30px;height: 280px;">
                                <div class="baidumap" id="baidumap" style="height: 330px;width: 396px;">

                                </div>
                            </div>
                        </c:if>

                    </div>
                    <c:if test="${sessionScope.uid != null}">
                        <div class="radius"
                             style="height: 170px; background-color: white; margin-top: 30px; overflow: hidden;">
                            <div class="org_info" style="margin-left: 30px">
                                <h2 style="margin-top: 30px">机构联系方式</h2>
                                <p style="margin-top: 20px">
                                    <i>机构传真：</i>
                                    <span>${orgInfo.orgContacts.conFax == null || ''.equals(orgInfo.orgContacts.conFax)?  "暂无"  :  orgInfo.orgContacts.conFax == null ? "暂无" : orgInfo.orgContacts.conFax}</span>
                                </p>
                                <p>
                                    <i>机构邮箱：</i>
                                    <span>${orgInfo.orgContacts.conEmail == null || ''.equals(orgInfo.orgContacts.conEmail)?  "暂无"  :  orgInfo.orgContacts.conEmail == null ? "暂无" : orgInfo.orgContacts.conEmail}</span>
                                </p>
                                <p>
                                    <i>机构电话：</i>
                                    <span>${orgInfo.orgContacts == null ?  "暂无"  :  orgInfo.orgContacts.conPhone == null ? "暂无" : orgInfo.orgContacts.conPhone}</span>
                                </p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.uid == null}">
                        <div style="margin-top: 30px; background-color: #508DF0; height: 50px">
                            <button class="button" onclick="toLogin()">查看机构联系方式</button>
                        </div>
                    </c:if>
                </div>
                <div style="width: 650px; float: right; margin-top: 45px">
                    <div class="radius" style=" background-color: white; overflow: hidden; padding: 0 30px 30px 30px">
                        <h2 style="margin-top: 30px">机构简介</h2>
                        <p style="font-size: 14px; margin-top: 20px">
                            <c:choose>
                                <c:when test="${orgInfo.orgDescription != null && orgInfo.orgDescription != ''}">
                                    ${orgInfo.orgDescription.length() > 4000?orgInfo.orgDescription.substring(0,4000).concat('...'):orgInfo.orgDescription}
                                </c:when>
                                <c:otherwise>
                                    暂无
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                    <c:if test="${orgInfo.orgCertificateList != null && orgInfo.orgCertificateList.size() > 0}">
                        <div class="radius"
                             style=" background-color: white; padding-bottom: 30px; margin-top: 30px; overflow: hidden">
                            <div style="margin-left: 30px; margin-top: 30px">
                                <h2>机构资质</h2>
                                <c:forEach var="orgCertificate" items="${orgInfo.orgCertificateList}">
                                    <img src="${orgCertificate.orgCertificatePic == null ? '' : orgCertificate.orgCertificatePic}"
                                         style="width: 190px; height: 250px; margin-top: 20px">
                                </c:forEach>
                            </div>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="${rlab}/front/js/common/main.js"></script>
<script src="${rlab}/front/js/util/baiduMap.js?v_=20170829"></script>

<script type="text/javascript">
    // 设置百度地图
    function setBaiduMap(adress) {
        loadJScriptMove(adress, 0, 0);
    }
    try {
        setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrStreet}');
    } catch (e) {
        setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict == '未知'?'':orgInfo.orgAddress.orgAddrDistrict}');
    }

    function toLogin() {
        logins();
    }
</script>
</body>
</html>
