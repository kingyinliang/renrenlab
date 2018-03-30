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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
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
            margin: 20px 0 15px 0;
            overflow: hidden;
        }

        .org_title > div {
            height: 80px;
            width: 1120px;
            background: #fff;
            margin: auto;
        }

        .org_title .org_info {
            line-height: 80px;
            float: left;
            position: relative;
        }

        .org_title .org_info img.logo {
            margin-top: 17px;
            margin-left: 28px;
            float: left;
            height: 46px;
            vertical-align: middle;
        }

        .org_title .org_info span {
            font-size: 20px;
            line-height: 80px;
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
            line-height: 37px;
            height: 37px;
            background: white;
            width: 1120px;
            margin: auto;
            font-size: 14px;
        }

        .org_tab ul {
            list-style: none;
            width: 1120px;
            margin: 0 auto;
            line-height: 34px;
        }

        .org_tab li {
            text-align: center;
            font-size: 14px;
            float: left;
        }

        .org_tab li a {
            padding: 0 15px;
            display: block;
            color: #a9a9a9;
        }

        .org_tab li.actived a {
            border-bottom: 3px solid #588eff;
            color: #588eff;
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
        .ranking img{
            width: 100%;
        }
        .ranking span{
            display: block;
        }
        .orgmain .ranking{
            width: 60px;
            height: 60px;
            float: right;
            background: #f5a761;
            font-size: 14px;
            color: white;
            text-align: center;
        }

        .orgmain .index{
            background: #9bd468;
            margin-left: 10px;
            width: 83px;
            margin-right:35px;

        }
        .stand{
            width: 4px;
            height: 14px;
            line-height: 14px;
            float: left;
            background: #588eff;
            display: block;
            margin-left: -14px;
        }
        .aptitude p{
            text-align: center;
        }
        .aptitude{
            float: left;
            margin-right: 15px;
        }
        #head{
            margin-bottom: 100px!important;
        }
    </style>
</head>
<body>
<div class="wrapper" style="background-color: white">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="2"/>
    </jsp:include>
    <!--模块-->
    <div class="user_center user_content clearfix orgmain" style="width: 100%; background-color: #f3f6f9; padding-bottom: 30px">
        <%--机构tab栏   --%>
        <div class="org_tab">
            <ul>
                <li class="actived">
                    <a href="${rlab}/org/${orgInfo.orgOid}">机构首页</a>
                </li>
                <li>
                    <a href="${rlab}/org/${orgInfo.orgOid}/ins?pageNo=1&pageSize=10">持有仪器(${orgInfo.orgInsCount})</a>
                </li>
                <li>
                    <a href="${rlab}/org/${orgInfo.orgOid}/service?pageNo=1&pageSize=10">发布服务(${serviceCounts})</a>
                </li>
            </ul>
        </div>
        <%--机构标题--%>
        <div class="org_title">
            <div style="padding-left: 10px">
                <div class="org_info">
                    <c:if test="${orgInfo.orgLogo !=null && orgInfo.orgLogo != ''}">
                        <img class="logo" src="${orgInfo.orgLogo}" style="width: 46px;height: 46px;border-radius: 50%;overflow: hidden">
                    </c:if>
                    <span style="margin-left: 15px">
                        ${orgInfo.orgName}
                        <c:if test="${orgInfo.orgType == 2}">
                            <i class="lab-renzheng_1"
                               style="color: #f4af71;font-size: 12px;position: absolute;top: 0;right: -40px;font-size: 16px;"title="认证服务商"></i>
                        </c:if>
                        <c:if test="${orgInfo.orgType == 1 }">
                            <i class="lab-renzheng_1" title="服务商"
                               style="color: #7b8da0;font-size: 12px;position: absolute;top: 0;right: -40px;font-size: 16px;"></i
                        </c:if>
                    </span>
                </div>
                <%--<div class="exponent">--%>
                    <%--<p class="ranking index">--%>
                        <%--<span style="font-size: 22px">${orgInfo.orgShareIndex}</span>--%>
                        <%--<span>指数</span>--%>
                        <%--<img src="${rlab}/front/imgs/icon/share_num_bg.jpg" alt="">--%>
                    <%--</p>--%>
                    <%--<p class="ranking">--%>
                        <%--<span style="font-size: 22px">${orgInfo.orgRank}</span>--%>
                        <%--<span>排名</span>--%>
                        <%--<img src="${rlab}/front/imgs/icon/share_num_bg_yl.jpg" alt="">--%>
                    <%--</p>--%>
                <%--</div>--%>
                <div class="exponent">
<c:if test="${orgInfo.orgShareIndex != null}">
                    <p class="ranking index">
                        <span style="font-size: 22px">${orgInfo.orgShareIndexStr}</span>
                        <span>指数</span>
                        <img src="${rlab}/front/imgs/icon/share_num_bg.jpg" alt="">
                    </p>
</c:if>
<c:if test="${orgInfo.orgRank != null}">
                    <p class="ranking">
                        <span style="font-size: 22px">${orgInfo.orgRank}</span>
                        <span>排名</span>
                        <img src="${rlab}/front/imgs/icon/share_num_bg_yl.jpg" alt="">
                    </p>
</c:if>
                </div>
            </div>
<%--<div class="clearfix">
                    <c:if test="${orgInfo.orgRank != null}">
                        <div class="exponent" style="background: #f5a761;">
                            <p class="num">${orgInfo.orgRank}</p>
                            <p class="txt">排名</p>
                            <img src="${rlab}/front/imgs/icon/share_num_bg_yl.jpg" alt="">
                        </div>
                    </c:if>
                    <c:if test="${orgInfo.orgShareIndex != null}">
                        <div class="exponent">
                            <p class="num">${orgInfo.orgShareIndexStr}</p>
                            <p class="txt">共享指数</p>
                            <img src="${rlab}/front/imgs/icon/share_num_bg.jpg" alt="">
                        </div>
                    </c:if>
                </div>--%>
        </div>
        <div style="width: 1120px; margin: 0 auto">
            <div style="overflow: hidden">
                <div style="width: 450px; overflow: hidden; float: left">
                    <div class="radius" style="padding-bottom: 20px;background-color: white;  overflow: hidden">
                        <div class="org_info" style="margin-left: 30px">
                            <h2 style="margin-top: 30px;line-height: 14px"><span class="stand"></span>机构信息</h2>
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
                                <h2 style="margin-top: 30px;pxline-height: 14px"><span class="stand"></span>机构联系方式</h2>
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
                                    <span>${orgInfo.orgContacts == null ?  (orgInfo.orgContactsList==null? "暂无": orgInfo.orgContactsList[0].conPhone) :  orgInfo.orgContacts.conPhone == null ? "暂无" : orgInfo.orgContacts.conPhone}</span>
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
                <div style="width: 650px; float: right;">
                    <div class="radius" style=" background-color: white; overflow: hidden; padding: 0 30px 30px 30px">
                        <h2 style="margin-top: 30px;line-height: 14px"><span class="stand"></span>机构简介</h2>
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
                                <h2 style="line-height: 14px"><span class="stand"></span>机构资质</h2>
                                <c:forEach var="orgCertificate" items="${orgInfo.orgCertificateList}">
                                    <div class="aptitude">
                                        <img src="${orgCertificate.orgCertificatePic == null ? '' : orgCertificate.orgCertificatePic}"
                                             style="width: 190px; height: 250px; margin-top: 20px">
                                        <p>${orgCertificate.orgCertificateName}</p>
                                    </div>
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
<script type="text/javascript" src="${rlab}/front/js/common/main.js?v_=20180331"></script>
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
    console.log(11);
</script>
</body>
</html>
