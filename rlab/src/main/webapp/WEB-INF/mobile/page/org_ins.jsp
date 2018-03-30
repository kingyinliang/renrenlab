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

        html, body {
            width: 100%;
            height: 100%;
            background: #f5f6fa;
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

        .content {
            margin-top: 1.173rem;
        }

        .org_list {
            padding: 0 0.32rem;
            padding-bottom: 1rem;
        }

        .org_list .totals {
            font-size: 0.32rem;
            color: #7a7a7a;
            line-height: 1rem;
        }

        .org_list .totals span {
            color: #4f8df0;
        }

        /*列表页面*/
        .goods_list {
        }

        /*仪器卡片*/
        .goods_list .item {
            padding: 0.32rem 0.267rem;
            margin-top: 0.267rem;
            padding-left: 2.67rem;
            height: 2.67rem;
            position: relative;
            background: #fff;
            border-radius: 0.13rem;
            -webkit-border-radius: 0.13rem;
            -moz-border-radius: 0.13rem;
            border-radius: 0.13rem;
        }

        .goods_list .item .lft_img {
            position: absolute;
            left: 0;
            top: 0;
            width: 2.67rem;
            height: 100%;
            text-align: center;
            padding-top: 0.267rem;
        }

        .goods_list .lft_img img {
            width: 2.06rem;
            height: 2.06rem;
            border: 1px solid #eee;
        }

        [data-dpr="1"] .goods_list .lft_img img {
            border: 1px solid #eee;
        }

        [data-dpr="2"] .goods_list .lft_img img {
            border: 2px solid #eee;
        }

        [data-dpr="3"] .goods_list .lft_img img {
            border: 3px solid #eee;
        }

        .goods_list .rt_info {
            position: relative;
            height: 100%;
        }

        .goods_list .rt_info .int_name {
            font-size: 0.373rem;
            color: #4E4E4E;
            position: absolute;
            top: 0.56rem;
            left: 0;
        }

        .goods_list .rt_info .int_type {
            margin-top: 0.266rem;
            color: #7A7A7A;
            font-size: 0.32rem;
        }

        .goods_list .rt_info .int_about {
            width: 100%;
            max-height: 0.4rem;
            overflow: hidden;
            position: absolute;
            bottom: 0;
            left: 0;
            font-size: 0.32rem;
            color: #7A7A7A;
        }

        .goods_list .rt_info .int_about > span.price {
            position: absolute;
            right: 0;
            top: 0;
            color: #db3636;
        }

        .goods_list .int_about > span.price > i {
            color: #7A7A7A;
        }

        /*START 分页样式  [徐志响，2017-09-08]*/
        .paging {
            margin-top: 0.43rem;
        }

        .paging .page_list {
            position: relative;
            text-align: center;
            height: 0.86rem;
            line-height: 0.86rem;
        }

        .paging .page_list > li {
            font-size: 0.32rem;
            color: #4E4E4E;
        }

        .paging .page_list button {
            width: 4.13rem;
            height: 0.86rem;
            outline: 0 none;
            border: 0 none;
            font-size: 0.32rem;
            -webkit-border-radius: 0.2rem;
            -moz-border-radius: 0.2rem;
            border-radius: 0.2rem;
        }

        .paging .page_list .pre {
            background: #fff;
            color: #4E4E4E;
            position: absolute;
            left: 0;
            top: 0;
        }

        .paging .page_list .pre:active {
            background: #e6e7ee;
        }

        /*上一页禁用状态*/
        .paging .page_list button.disabled {
            background: #e4e7f2;
        }

        /*下一页禁用状态*/
        .paging .page_list button.disabled {
            background: #e4e7f2;
        }

        .paging .page_list .next {
            background: #4f8df0;
            color: #fff;
            position: absolute;
            right: 0;
            top: 0;
        }

        .paging .page_list .next:active {
            background: #2b6ed8;
        }

        /*END 分页样式  [徐志响，2017-09-08]*/

    </style>
</head>
<body>
<div id="main" class="org_list">
    <%--START 头部样式引入（中间带logo）--%>
    <div class="header_three">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()"><img
                src="${rlab}/mobile/imgs/home_logo.png"/></a></p>
        <c:choose>
            <%--登录--%>
            <c:when test="${sessionScope.uid != null}">
                <p class="user-img" onclick="toCenter()">
                    <i>
                        <c:choose>
                            <c:when test="${sessionScope.avatar != null}">
                                <img src="${sessionScope.avatar}" alt="用户头像">
                            </c:when>
                            <c:otherwise>
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg"
                                     alt="用户头像">
                            </c:otherwise>
                        </c:choose>
                    </i>
                </p>
            </c:when>
            <%--未登录--%>
            <c:otherwise>
                <a class="users lab-user" id="gouser" href="javascript:void (0)" onclick="toCenter()"></a>
            </c:otherwise>
        </c:choose>
    </div>
    <%--END 头部样式引入（中间带logo）--%>
    <div class="totals">
        共：<span>${total}</span>条仪器信息
    </div>
    <%--仪器列表开始--%>
    <div class="goods_list">
        <c:forEach items="${InsListInfoList}" var="info">
            <div class="item" data-goods-id="${info.mapId}" onclick="toGoodsDetail(this)">
                <div class="lft_img">
                    <c:if test="${info.insPic == null}">
                        <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                    </c:if>
                    <c:if test="${info.insPic != null}">
                        <%--该仪器图片存在时--%>
                        <img onerror="imgOnError(this)" src="${info.insPic}" alt="商品图片">
                    </c:if>
                </div>

                <div class="rt_info">
                        <%--仪器名称--%>
                    <p class="int_name">
                        <c:out value="${info.insName.length() > 15 ? info.insName.substring(0,14).concat('...') :info.insName }"
                               escapeXml="true"/>
                    </p>
                    <p class="int_about">
                         <%--仪器地址--%>
                        <span class="ad">
                            <c:out value="${info.orgAddrProvince}" escapeXml="true"/><c:out value="${info.orgAddrCity}" escapeXml="true"/>
                        </span>
                        <%--仪器价格--%>
                        <span class="price">
                           <c:choose>
                               <c:when test="${info.price.flag == 1}">
                                   <c:if test='${"无".equals(info.price.unit)}'>
                                       ￥${info.price.accPrice}
                                   </c:if>
                                   <c:if test='${!"无".equals(info.price.unit)}'>
                                       ￥${info.price.accPrice}<i>/${info.price.unit}</i>
                                   </c:if>
                               </c:when>
                               <c:when test="${info.price.flag == 2}">
                                   <c:if test='${info.price.scopeHighPrice.equals("0")}'>
                                       <c:if test='${"无".equals(info.price.unit)}'>
                                           ￥${info.price.scopeLowPrice}起
                                       </c:if>
                                       <c:if test='${!"无".equals(info.price.unit)}'>
                                           ￥${info.price.scopeLowPrice}<i>/${info.price.unit}</i>起
                                       </c:if>
                                   </c:if>

                                   <c:if test='${!info.price.scopeHighPrice.equals("0")}'>
                                       <c:if test='${"无".equals(info.price.unit)}'>
                                           ￥${info.price.scopeLowPrice} - ${info.price.scopeHighPrice}
                                       </c:if>
                                       <c:if test='${!"无".equals(info.price.unit)}'>
                                           ￥${info.price.scopeLowPrice} - ${info.price.scopeHighPrice}
                                           <i>/${info.price.unit}</i>
                                       </c:if>
                                   </c:if>
                               </c:when>
                               <c:when test="${info.price.flag == 3}">
                                   面议
                               </c:when>
                           </c:choose>
                         </span>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>
    <%--仪器列表结束--%>
    <%-- 分页开始--%>
    <div class="paging" style="display: ${total > 10? "block" : "none"};">
        <%--<div class="paging" style="display:block" >--%>
        <div id="page_container" class="page_list"></div>
    </div>
    <%-- 分页结束--%>
</body>
<script src="${rlab}/mobile/assets/fenye/pagination.js"></script>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">

    setCallbackUrl();// 设置登录时回跳路径
    /**
     * 初始化分页
     */
    // 初始化页面分页
    var backFlag = '${backFlag}';
    showPages('${total}', ('${pageNo}' - 1) * 10, 10, function (from, max) {
            backFlag ++;
            PAGE_NO = from / 10 + 1;
        window.location.href = BASE_URL + '/org/${oid}/ins?pageNo=' + PAGE_NO + '&pageSize=10&backFlag=' + backFlag;
        }, "page_container"
    )

    /**
     * 返回历史上一页
     */
    function goBack() {
        if(backFlag){
            history.go(-backFlag);
        }else {
            history.go(-1);
        }
    }

</script>
</html>

