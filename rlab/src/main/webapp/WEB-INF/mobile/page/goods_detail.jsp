<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <%--<meta name="format-detection" content="telephone=no">--%>
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%@ include file="../../config/taglibs.jsp" %>
    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_640X424.jpg")
        }

    </script>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <script src="${rlab}/mobile/assets/flexible/flexible.js"></script>
    <script src="${rlab}/mobile/assets/flexible/flexible_css.js"></script>


    <!--my CSS start-->
    <%--<link rel="stylesheet" href="${rlab}/common/fonts/font.css">--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css">

    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <%--layer--%>
    <style>
        .wrapper {
            background: #f5f6fa;
            padding-bottom: 0.5rem;
        }

        /* START底部悬浮弹窗样式2*/
        .more_ins_info {
            position: fixed;
            height: 1.175rem;
            width: 100%;
            background: #49494b;
            bottom: -0.02rem;
            left: 0;
            z-index: 1;
        }

        .more_ins_info button {
            float: right;
            height: 100%;
            width: 5rem;
            background: #4f8df0;
            outline: 0 none;
            border: 0 none;
            color: #fff;
            font-size: 0.37rem;
            text-align: center;
            line-height: 1.175rem;
        }

        .more_ins_info button:active {
            background: #3e72c0;
        }

        /*机构信息弹窗*/
        .my_modal {
            height: auto !important;
            padding: 0 !important;
        }

        /* END底部悬浮弹窗样式2*/

        /*内容部分-仪器信息*/
        .main {

        }

        .main .goods_img {
            background: #f5f6fa;
            width: 100%;
            /*height:200px;*/
            /*margin-bottom: 50%;*/
            padding-bottom: 66%;
            box-sizing: border-box;
            position: relative;
            overflow: hidden;
        }

        .main .goods_img > div {
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            width: 1000%;
        }

        .main .goods_img img {
            width: 10%;
            height: 100%;
            float: left;
        }

        /*商品信息排版*/
        .main .goods_info {

        }

        .main .goods_info .goods_title {
            min-height: 0.7rem;
            line-height: 0.7rem;
            font-size: 0.43rem;
            color: #333;
            padding: 0.4rem 0.32rem;
            -ms-word-wrap: break-word;
            word-wrap: break-word;
        }

        .main .goods_info .goods_param {
            padding: 0 0.32rem;
        }

        .main .goods_info .goods_param > p {
            /*line-height: ;*/
            padding: 0.13rem 0.4rem;
            position: relative;
        }

        .goods_info .goods_param > p i {
            position: absolute;
            left: 0.133rem;
            font-size: 0.08rem;
            color: #4063a3;
            line-height: 0.5rem;
        }

        .goods_info .goods_param > p s {
            color: #999;
            position: absolute;
            left: 0.5rem;
            top: 0.13rem;
        }

        .goods_info .goods_param > p span {
            color: #4e4e4e;
            display: block;
            padding-left: 1.8rem;
            max-width: 98%;
            -ms-word-wrap: break-word;
            word-wrap: break-word;
        }

        .main .goods_info .goods_price {
            text-align: center;
            height: 1.55rem;
            line-height: 1.55rem;
            font-size: 0.43rem;
            color: #de5a5b;
        }

        .main .goods_info .goods_price i {
            color: #4E4E4E;
        }

        .main .goods_info .goods_remark {
            padding: 0 1.2rem;
            font-size: 0.32rem;
            color: #B5B5B5;
            text-align: center;
        }

        .company_name {
            text-align: left;
            background: #fff;
            min-height: 1.17rem;
            line-height: 0.6rem;
            margin-top: 0.5rem;
            padding: 0.32rem 0.4rem;
        }

        .company_name > span {
            display: block;
            position: relative;
            font-size: 0.32rem;
            color: #4E4E4E;
            padding-left: 0.45rem;
            -ms-word-wrap: break-word;
            word-wrap: break-word;
        }

        .company_name > span > i {
            position: absolute;
            left: 0;
            top: 0;
            line-height: 0.6rem;
            color: #4F8DF0;
        }

        .goods_state {
            padding: 0 0.32rem;
            margin-bottom: 1.5rem;
        }

        .goods_state > h3 {
            font-size: 0.32rem;
            color: #4e4e4e;
            height: 1.17rem;
            line-height: 1.17rem;
        }

        .goods_state .st_list {
            background: #fff;
            padding: 0.1rem 0.48rem;
            -webkit-border-radius: 0.15rem;
            -moz-border-radius: 0.15rem;
            border-radius: 0.15rem;
        }

        .goods_state .st_list > div.item {
            padding: 0.32rem 0;
            font-size: 0.35rem;
            border-bottom: 2px solid #f0f0f0;
        }

        .goods_state .st_list > div.last_item {
            border-bottom: 0 none;
        }

        .goods_state .st_list > div.last {
            border-bottom: 0 none;
        }

        .goods_state .st_list .item > h4 {
            color: #4E4E4E;
            position: relative;
        }

        .goods_state .st_list .item > h4 i {
            position: absolute;
            left: -0.2rem;
            top: 0.06rem;
            display: block;
            height: 0.35rem;
            width: 0.054rem;
            background: #4F8DF0;
            line-height: 0.4rem;

        }

        .goods_state .st_list .item > p {
            padding: 0.2rem 0;
            color: #666;
        }

        /*START 机构20170907*/
        .org_info {
            min-height: 2.66rem;
            padding: 0 0.32rem;
            overflow: hidden;
            margin-top: 0.5rem;
        }

        .org_main {
            background-color: #fff;
            padding: 0.293rem 0.266rem;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }

        .org_main .org_avatar {
            float: left;
            position: relative;
        }

        .org_main .org_avatar > i {
            font-size: 0.42rem;
            color: #ffbc00;
            position: absolute;
            right: -0.13rem;
            top: -0.13rem;
            -webkit-border-radius: 2rem;
            -moz-border-radius: 2rem;
            border-radius: 2rem;
            background-color: #fff;
        }

        .org_main .org_avatar img {
            width: 2rem;
            height: 2rem;
        }

        [data-dpr="1"] .org_main .org_avatar img {
            border: 1px solid #f5f5f5;
        }

        [data-dpr="2"] .org_main .org_avatar img {
            border: 2px solid #f5f5f5;
        }

        [data-dpr="3"] .org_main .org_avatar img {
            border: 3px solid #f5f5f5;
        }

        .org_main .share_num {
            float: left;
            margin-left: 0.32rem;
            max-width: 5rem;
        }

        .org_main .share_num p {
            line-height: 1.2rem;
            height: 1.2rem;
            font-size: 0.37rem;
            color: #4e4e4e;
        }

        .org_main .share_num span {
            display: inline-block;
            padding: 0 0.18rem;
            font-size: 0.32rem;
            color: #8ad656;
            -webkit-border-radius: 0.30rem;
            -moz-border-radius: 0.30rem;
            border-radius: 0.30rem;
            line-height: 0.53rem;
        }

        [data-dpr="1"] .org_main .share_num span {
            border: 2px solid #89d556;
        }

        [data-dpr="2"] .org_main .share_num span {
            border: 4px solid #89d556;
        }

        [data-dpr="3"] .org_main .share_num span {
            border: 6px solid #89d556;
        }

        .org_main .link_org {
            float: right;
            line-height: 2rem;
            font-size: 0.38rem;
            font-weight: 700;
        }

        .org_main > s {
            background: url("${rlab}/mobile/imgs/icon/share_bg_@2x.png");
            display: block;
            position: absolute;
            width: 1.3rem;
            height: 0.72rem;
            font-size: 0.29rem;
            color: #fff;
            text-align: center;
            line-height: 0.56rem;
            right: 0.52rem;
            top: 0;
        }

        /*END 机构详情20170907*/

        /*START 仪器使用联系方式*/
        .ins_add_main {
            margin: 0.16rem 0;
        }

        .ins_address .add {
            font-size: 0.32rem;
            color: #4b4b4b;
            padding: 0.35rem 0;
            padding-left: 0.4rem;
            position: relative;
            line-height: 0.5rem;
        }

        .ins_address .add s {
            position: absolute;
            left: 0;
            top: 0.42rem;
        }

        .ins_address .phone {
            font-size: 0.32rem;
            color: #4b4b4b;
            line-height: 0.64rem;
            padding-left: 1.7rem;
            position: relative;
        }

        .ins_address .phone a {
            color: #4b4b4b;
            margin-right: 0.4rem;
        }

        .ins_address .phone span {
            position: absolute;
            left: 0.4rem;
        }

        /*END 仪器使用联系方式*/
        /* START底部悬浮弹窗样式1*/
        .open_phone {
            font-size: 0.37rem;
            background-color: #4f8df0;
            line-height: 1.15rem;
            height: 1.15rem;
            width: 100%;
            border: 0 none;
            outline: 0 none;
            color: #fff;
            position: fixed;
            bottom: -0.02rem;
            left: 0;
            z-index: 1;
        }

        /* START底部悬浮弹窗样式2*/
        /*START登录弹窗*/
        .login_modal {
            background-color: #fff;
            /*position: fixed;*/
            top: 100px;
            width: 6.9rem;
            text-align: center;
            -webkit-border-radius: 0.26rem;
            -moz-border-radius: 0.26rem;
            border-radius: 0.26rem;
            overflow: hidden;
        }

        .login_modal .tips {
            height: 1.58rem;
            margin-top: 1.33rem;
            font-size: 1.2rem;
            color: #4f8df0;
        }

        .login_modal p {
            font-size: 0.45rem;
            color: #333;
            line-height: 0.60rem;
        }

        .login_modal p.fast {
            margin-top: 0.45rem;
        }

        .login_modal p.last {
            padding-bottom: 0.84rem;
        }

        [data-dpr="1"] .login_modal p.last {
            border-bottom: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal p.last {
            border-bottom: 2px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal p.last {
            border-bottom: 4px solid #bfbfbf;
        }

        .login_modal .btn {
            height: 1.33rem;
            overflow: hidden;
        }

        .login_modal .btn button {
            height: 1.33rem;
            width: 50%;
            float: left;
            background-color: #fff;
            outline: 0 none;
            border: 0 none;
            font-size: 0.45rem;
            text-align: center;
            color: #4f8df0;
            box-sizing: border-box;
        }

        [data-dpr="1"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        .layui-m-layercont {
            padding: 0 !important;
        }

        /*END 登录弹窗*/

    </style>
<body>
<div class="wrapper" id="main">
    <%--START 头部公用部分引入--%>
    <%@ include file="../template/header_two.jsp" %>
    <%--END 头部公用部分引入--%>
    <div class="main clearfix">
        <%-- 仪器图片 --%>
        <div class="goods_img">
            <div>
                <c:choose>
                    <c:when test="${detail.insPic == null || detail.insPic.size() == 0}">
                        <img onerror="imgOnError(this)" src="${rlab}/common/common_img/default/ins_640X424.jpg"
                             alt="商品默认图片">
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${detail.insPic}" var="item">
                            <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                <img onerror="imgOnError(this)" src="${item}960_636" alt="商品图片1">
                            </c:if>
                            <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                <img onerror="imgOnError(this)" src="${item}960_636" alt="商品图片2">
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <%--<img onerror="imgOnError(this)" src="${rlab}/common/common_img/default/ins_640X424.jpg" alt="商品默认图片">--%>


        </div>
        <%-- 仪器信息 --%>
        <div class="goods_info">
            <%--仪器名字--%>
            <div class="goods_title"><c:out value="${detail.insName}" escapeXml="true"/></div>
            <%-- 仪器参数 --%>
            <div class="goods_param">
                <%--仪器编号--%>
                <c:if test="${detail.mapId != null && !''.equals(detail.mapId)}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i><s>仪器编号：</s><span><c:out value="${detail.mapId}"
                                                                          escapeXml="true"/></span>
                    </p>
                </c:if>
                <%--仪器型号--%>
                <c:if test="${detail.insMode != null && !''.equals(detail.insMode)}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i>
                        <s>仪器型号：</s>
                        <span>
                        <c:out value="${detail.insMode}" escapeXml="true"/>
                    </span>
                    </p>
                </c:if>
                <%--仪器品牌 --%>
                <c:if test="${detail.insBrand != null && !''.equals(detail.insBrand)}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i>
                        <s>仪器品牌：</s>
                        <span>
                            <c:out value="${detail.insBrand}" escapeXml="true"/>
                        </span>
                    </p>
                </c:if>
                <%--仪器产地--%>
                <c:if test="${detail.insOrigin != null && !''.equals(detail.insOrigin)}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i>
                        <s>仪器产地：</s>
                        <span>
                    <c:out value="${detail.insOrigin}" escapeXml="true"/>
                     </span>
                    </p>
                </c:if>
                <%--仪器分类--%>
                <c:if test="${detail.insCategory != null && detail.insCategory.size() > 0}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i>
                        <s>仪器分类：</s>
                        <span>
                            <c:forEach items="${detail.insCategory}" var="scope" varStatus="status">
                                <c:if test="${status.last}">
                                    ${scope}
                                </c:if>
                                <c:if test="${!status.last}">
                                    ${scope}>
                                </c:if>
                            </c:forEach>
                         </span>
                    </p>
                </c:if>
                <%--应用领域--%>
                <c:if test="${detail.insScope != null && detail.insScope.size() > 0}">
                    <p class="clearfix">
                        <i class="lab-dot-1"></i>
                        <s>应用领域：</s>
                        <span>
                       <c:forEach items="${detail.insScope}" var="scope" varStatus="status">
                           <c:if test="${status.first}">
                               ${scope}
                           </c:if>
                           <c:if test="${!status.first}">
                               ,${scope}
                           </c:if>
                       </c:forEach>
                    </span>
                    </p>
                </c:if>
            </div>
            <%--价格区域--%>
            <div class="goods_price">
                <c:choose>
                    <c:when test="${detail.price.flag == 1}">
                        <c:if test='${"无".equals(detail.price.unit)}'>
                            ￥${detail.price.accPrice}
                        </c:if>
                        <c:if test='${!"无".equals(detail.price.unit)}'>
                            ￥${detail.price.accPrice}/${detail.price.unit}
                        </c:if>
                    </c:when>
                    <c:when test="${detail.price.flag  == 2}">
                        <c:if test='${detail.price.scopeHighPrice.equals("0")}'>
                            <c:if test='${"无".equals(detail.price.unit)}'>
                                ￥${detail.price.scopeLowPrice}起
                            </c:if>
                            <c:if test='${!"无".equals(detail.price.unit)}'>
                                ￥${detail.price.scopeLowPrice}/${detail.price.unit}起
                            </c:if>
                        </c:if>
                        <c:if test='${!detail.price.scopeHighPrice.equals("0")}'>
                            <c:if test='${"无".equals(detail.price.unit)}'>
                                ￥${detail.price.scopeLowPrice} ~ ${detail.price.scopeHighPrice}
                            </c:if>
                            <c:if test='${!"无".equals(detail.price.unit)}'>
                                ￥${detail.price.scopeLowPrice} ~ ${detail.price.scopeHighPrice}/${detail.price.unit}
                            </c:if>
                        </c:if>
                    </c:when>
                    <c:when test="${detail.price.flag  == 3}">
                        面议
                    </c:when>
                </c:choose>
            </div>
            <%--备注信息--%>
            <div class="goods_remark">
                <span>
                    <c:out value="${price.remark.length() > 15 ? price.remark.substring(0,15).concat('...') :price.remark}"
                           escapeXml="true"/>
                </span>
            </div>
        </div>
        <%--机构信息--%>
        <div class="org_info">
            <div class="org_main" onclick="push()">
                <%--机构头像/机构认证--%>
                <div class="org_avatar">
                    <c:choose>
                        <c:when test="${orgInfo.orgLogo != null && orgInfo.orgLogo.trim()  != ''}">
                            <c:if test="${orgInfo.orgPositionList !=null && orgInfo.orgPositionList.size() > 0}">
                                <img src='${orgInfo.orgLogo}?x-oss-process=image/crop,x_${orgInfo.orgPositionList.get(0)},y_${orgInfo.orgPositionList.get(1)},w_${orgInfo.orgPositionList.get(2)},h_${orgInfo.orgPositionList.get(3)}'>
                            </c:if>
                            <c:if test="${orgInfo.orgPositionList.size() <= 0 || orgInfo.orgPositionList == null}">
                                <img src="${orgInfo.orgLogo}">
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <img src="${rlab}/front/imgs/icon/org_logo_default.png">
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${orgInfo.orgIdentification == 1}">
                        <i class="lab-renzheng_1"></i>
                    </c:if>
                </div>
                <%--共享指数--%>
                <div class="share_num">
                    <p><c:out
                            value="${orgInfo.orgName.length() > 13? orgInfo.orgName.substring(0,12).concat('...') :orgInfo.orgName}"
                            escapeXml="true"/></p>
                    <c:if test="${orgInfo.orgShareIndex != null}">
                        <span>共享指数&nbsp;${orgInfo.orgShareIndexStr}<s></s></span>
                    </c:if>
                </div>
                <%--跳转机构--%>
                <div class="link_org" onclick="toOrgHome(this)" data-org-oid="${orgInfo.orgOid}">
                    <i class="lab-youjian_1"></i>
                </div>
                <%--共享排名--%>
                <c:if test="${orgInfo.orgRank != null}">
                    <s>
                        No.${orgInfo.orgRank}
                    </s>
                </c:if>

            </div>

        </div>
        <%--仪器使用联系方式--%>
        <c:if test="${sessionScope.uid != null}">
            <div class="goods_state ins_add_main">
                <div class="st_list">
                    <div class="item last_item ins_address">
                        <h4><i></i>仪器使用联系方式</h4>
                        <div class="add">
                            <s class="lab-zuobiao"></s>
                                ${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}
                        </div>
                        <div class="phone">
                            <c:forEach items="${detail.conId}" var="item" varStatus="status">
                                <c:choose>
                                    <c:when test="${!status.last}">
                                        <span>${item.conName}：</span>
                                        <a href="tel:${item.conPhone}">${item.conPhone}</a>
                                        <br>
                                    </c:when>
                                    <c:otherwise>
                                        <span>${item.conName}：</span>
                                        <a href="tel:${item.conPhone}">${item.conPhone}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <%--详情简介--%>
        <div class="goods_state">
            <h3>详情介绍</h3>
            <div class="st_list">
                <c:forEach items="${detail.insDescription}" var="item" varStatus="status">

                    <c:choose>
                        <c:when test="${status.last && detail.insCoreParam == null}">
                            <div class="item last_item">
                                <h4><i></i>${item.title}</h4>
                                <p>
                                    <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                                </p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="item">
                                <h4><i></i>${item.title}</h4>
                                <p>
                                    <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                                </p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:forEach items="${detail.insCoreParam}" var="item" varStatus="sataus">
                    <c:if test="${sataus.last}">
                        <div class="item last_item">
                            <h4><i></i>${item.title}</h4>
                            <p>
                                <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                            </p>
                        </div>
                    </c:if>
                    <c:if test="${!sataus.last}">
                        <div class="item">
                            <h4><i></i>${item.title}</h4>
                            <p>
                                <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                            </p>
                        </div>
                    </c:if>
                </c:forEach>
                <%--<c:forEach items="${detail.mapDescription}" var="item" varStatus="index">--%>
                <%--<div class="item <c:if test="${index.last}">last</c:if>">--%>
                <%--<h4><i></i>${item.title}</h4>--%>
                <%--<p>--%>
                <%--<c:forEach items="${item.content}" var="con">${con}</c:forEach>--%>
                <%--</p>--%>
                <%--</div>--%>
                <%--</c:forEach>--%>
            </div>
        </div>
    </div>
</div>
<c:if test="${sessionScope.uid == null}">
    <button class="open_phone" type="button" onclick="showModalToLogin()">查看联系方式</button>
</c:if>
<%--查看联系方式悬浮1--%>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

<%--底部悬浮2：停用--%>
<%--<div class="more_ins_info" style="display: none;">--%>
<%--&lt;%&ndash;<div class="tits">--%>
<%--<p>服务商联系方式和位置信息</p>--%>
<%--</div>&ndash;%&gt;--%>
<%--<c:choose>--%>
<%--<c:when test="${sessionScope.uid == null}">--%>
<%--<button onclick="toLogin()" type="button">--%>
<%--查看机构联系方式--%>
<%--</button>--%>
<%--</c:when>--%>
<%--<c:otherwise>--%>
<%--<button id="getCompanyInfo" type="button"--%>
<%--data-org-name="${orgInfo.orgName}"--%>
<%--data-org-address="${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrStreet}"--%>
<%--data-org-phone="${orgInfo.orgContacts.conPhone}"--%>
<%--data-user-name="${detail.conId[0].conName}"--%>
<%--data-user-phone="${detail.conId[0].conPhone}"--%>
<%-->查看机构联系方式--%>
<%--</button>--%>
<%--</c:otherwise>--%>
<%--</c:choose>--%>
<%--</div>--%>
<%--登录弹窗：注释--%>
<%--<div class="login_modal">--%>
<%--<div class="tips">--%>
<%--<i class="lab-tip"></i>--%>
<%--</div>--%>
<%--<p class="fast">需要登录</p>--%>
<%--<p class="last">才可查看联系方式</p>--%>
<%--<div class="btn">--%>
<%--<button type="button">取消</button>--%>
<%--<button type="button" class="rt">登录</button>--%>
<%--</div>--%>
<%--</div>--%>
</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script type="text/javascript">

    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }



    (function () {
        setCallbackUrl();// 设置登录时回跳路径
    })();
    function toOrgHome($this) {
        location.href = BASE_URL + "/front/org/" + $($this).data("orgOid");
    }
    function showModalToLogin() {
        var html =
            '<div class="login_modal">\
            <div class="tips">\
            <i class="lab-gantanhao"></i>\
            </div>\
            <p class="fast">需要登录</p>\
            <p class="last">才可查看联系方式</p>\
            <div class="btn">\
            <button id="cancelModal" type="button">取消</button>\
            <button id="toLogin" type="button" class="rt">登录</button>\
            </div>\
            </div>';

        var layer_1 = layer.open({
            style: 'padding:0;width:auto;',
            shadeClose: false,
            content: html
        })

        $("#cancelModal").off("click").on("click", function () {
            layer.close(layer_1);
        });

        $("#toLogin").off("click").on("click", function () {
            toLogin();
        });
    }

    function push() {
        window.location.href = BASE_URL + "/front/org/" + ${detail.orgOid};
    }

    //    $("#getCompanyInfo").on("click", function () {
    //        $("body,html").css("overflow", "hidden");
    //        var $this = $(this);
    //        var orgName = $this.data("orgName");
    //        var orgAddress = $this.data("orgAddress");
    //        var userName = $this.data("userName");
    //        var phone = $this.data("orgPhone") + "";
    //        var userPhone = $this.data("userPhone") + "";
    ////
    ////        if (orgAddress.length > 16) {
    ////            orgAddress = orgAddress.slice(0, 10) + "..." + orgAddress.slice(orgAddress.length - 10);
    ////        }
    //
    //        phone = phone.replace(/ /g, "");
    //        phone = phone.replace(/\n/g, "");
    //        userPhone = userPhone.replace(/ /g, "");
    //        userPhone = userPhone.replace(/\n/g, "");
    //
    //        if (phone == "") {
    //            phone = "联系客服咨询详情";
    //        }
    //
    //        if (userPhone == "") {
    //            userPhone = "联系客服咨询详情";
    //        }
    //
    ////        var html =
    ////            '<div id="orgInfoModal" class="org_info" style="display: block">\
    ////                <div class="title">\
    ////                <span>' + orgName + '</span>\
    ////            <i id="closeModal" class="lab-close-1"></i>\
    ////            </div>\
    ////            <div class="page">\
    ////            <div class="org">\
    ////            <p>\
    ////            <i class="lab-phone"></i><span>' + phone + '</span>\
    ////            </p>\
    ////            <p>\
    ////            <i class="lab-adress"></i><span>' + orgAddress + '</span>\
    ////            </p>\
    ////            </div>\
    ////            <div class="legal">\
    ////            <h3>机构联系人</h3>\
    ////            <div class="clearfix">\
    ////            <div class="u_name">\
    ////            <i class="lab-user"></i><span>' + userName + '</span>\
    ////            </div>\
    ////            <div class="u_phone">\
    ////                 <i class="lab-phone"></i><span>' + userPhone + '</span>\
    ////            </div>\
    ////            <div class="call_phone">\
    ////                 <i class="lab-phone-2"></i><a href="tel:' + userPhone + '">拨打电话</a>\
    ////            </div>\
    ////            </div>\
    ////            </div>\
    ////            </div>\
    ////            <div class="txt">\
    ////            关注“人人实验”服务号，体验VIP专业定制服务\
    ////        </div>\
    ////        </div>';
    //
    //        //页面层
    //        var layer_1 = layer.open({
    //            type: 1,
    //            content: "",
    //            anim: 'up',
    //            className: 'my_modal',
    //            style: 'position:fixed; bottom:0; left:0; width: 100%; height: auto; padding:0; border:0 none;',
    //            end: function () {
    //                $("body,html").css("overflow", "visible");
    //            }
    //        });
    //
    //        layer.open({
    //            style: 'border:none; background-color:#78BA32; color:#fff;',
    //            content:'内容'
    //        })
    ////        $("#closeModal").off().on("click", function () {
    ////            layer.close(layer_1);
    ////            $("body,html").css("overflow", "visible");
    ////        })
    //
    //    });

</script>
</html>