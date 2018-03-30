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
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css">
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

    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_280x280.jpg")
        }

    </script>
    <style type="text/css">
        body, .wrapper {
            background-color: #f3f6f9 !important;
        }

        .org_main {
            margin-bottom: 80px;
        }

        /*START机构公用头部*/
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
        #head{
            margin-bottom: 100px!important;
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

        /*结果记录*/
        .org_result {
            font-size: 12px;
            color: #4E4E4E;
            line-height: 34px;
            width: 1120px;
            margin: 0 auto;
        }

        /*结果列表*/

        /*END机构公用头部*/
        .org_list {
            width: 1120px;
            margin: 0 auto;
        }

        /*SATART仪器列表公用部分*/
        /*item*/
        .org_list .item {
            background: #fff;
            overflow: hidden;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            margin-bottom: 12px;
            cursor: pointer;
            padding: 20px 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border: 1px solid #e6e6e6;
        }

        .org_list .item:hover {
            -webkit-box-shadow: 0 6px 16px 0 #d6e0e8;
            -moz-box-shadow: 0 6px 16px 0 #d6e0e8;
            box-shadow: 0 6px 16px 0 #d6e0e8;
            border: 1px solid #fff;
        }

        /*左侧图片*/
        .ins_img {
            width: 178px;
            text-align: center;
            float: left;
        }

        .ins_img img {
            vertical-align: middle;
            width: 140px;
            height: 110px;
            cursor: pointer;
            padding: 1px;
            border: 1px solid #eee;
        }

        /*右侧价格和操作按钮*/
        .ins_btn {
            height: 100px;
            margin-right: 34px;
            float: right;
            /*margin-top: 15px;*/
        }

        .ins_btn .price {
            height: 46px;
            line-height: 46px;
            font-size: 20px;
            color: #d40c04;
            text-align: center;
        }

        .ins_btn button {
            width: 104px;
            height: 40px;
            background: #508df0;
            outline: 0 none;
            border: 1px solid #A6CAFC;
            margin-top: 18px;
            text-align: center;
            color: #fff;
            cursor: pointer;
            float: right;
        }

        .ins_btn button:active {
            background: #3e72c0;
        }

        /*END仪器列表公用部分*/

        /*列表仪器信息部分*/
        .ins_info {
            float: left;
            width: 721px;

        }

        .ins_info .title a {
            font-size: 16px;
            color: #4e91fe;
            font-weight: 700;
        }

        .ins_info .info {
            line-height: 32px;
            font-size: 14px;
            color: #4E4E4E;
        }

        .ins_info .info span {
            margin-right: 40px;
        }

        .ins_info .info i {
            color: #999;
        }

        .ins_info .intro {
            line-height: 32px;

        }

        .ins_info .intro i {
            font-size: 16px;
            color: #4E4E4E;
        }

        .ins_info .intro s {
            font-size: 12px;
            color: #4E4E4E;
            margin-left: 10px;
        }

        .ins_info .label {
            height: 24px;
        }

        .ins_info .label span {
            display: inline-block;
            line-height: 22px;
            background: #8cc932;
            color: #fff;
            padding: 0 4px;
            font-size: 12px;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
        }

        .ins_info .label span.tp1 {
            background: #8cc932;
        }

        .ins_info .label span.tp2 {
            background: #0cbcef;
        }

        .paging {
            width: 1120px;
            margin: 0 auto;
            margin-top: 30px;
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
    <div class="org_main clearfix">
        <%--机构tab栏   --%>
        <div class="org_tab">
            <ul>
                <li>
                    <a href="${rlab}/org/${orgInfo.orgOid}">机构首页</a>
                </li>
                <li class="actived">
                    <a href="${rlab}/org/${orgInfo.orgOid}/ins?pageNo=1&pageSize=10">持有仪器(${orgInfo.orgInsCount})</a>
                </li>
                <li>
                    <a href="${rlab}/org/${orgInfo.orgOid}/service?pageNo=1&pageSize=10">发布服务(${serviceCounts})</a>
                </li>
            </ul>
        </div>
        <%-- 列表 --%>
        <div class="org_list" style="margin-top: 17px">
            <c:if test="${InsListInfoList != null}">
                <c:forEach items="${InsListInfoList}" var="info">
                    <div class="item">
                        <div class="ins_img">
                            <%--<c:if test="${info.insPic==null}">--%>
                                    <%--<img onclick="toGoodsDetail(this)" src="${rlab}/common/common_img/default/ins_140X110.jpg"  data-goods-id="${info.mapId}>--%>
                         <%--</c:if>--%>
                         <%--<c:if test="${info.insPic != null}">--%>
                              <%--<img src="" alt="">--%>
                         <%--</c:if>--%>
                            <c:choose>
                                <c:when test="${info.insPic == null}">
                                     <img onclick="toGoodsDetail(this)" src="${rlab}/common/common_img/default/ins_140X110.jpg"  data-goods-id="${info.mapId}" />
                            </c:when>
                            <c:otherwise>
                                <img onclick="toGoodsDetail(this)" src="${info.insPic}"  data-goods-id="${info.mapId}" onerror="imgOnError(this)"/>
                                <%--<c:if test="${fn:contains(item, 'http://renrenlab.oss')}">--%>
                                    <%--<li>--%>
                                        <%--<a href="${fn:substringBefore(item, "?")}" target="_blank">--%>
                                            <%--<img onerror="imgOnError(this)" src="${item}500_500" alt="商品图片1">--%>
                                        <%--</a>--%>
                                    <%--</li>--%>
                                <%--</c:if>--%>
                            </c:otherwise>
                        </c:choose>
                        </div>
                        <div class=" ins_info">
                            <div class="title">
                                <a onclick="toGoodsDetail(this)" href="javascript:void (0);"
                                   data-goods-id="${info.mapId}"> ${info.insName}</a>
                            </div>
                            <div class="info">
                                <span><i>型号：</i>${info.insMode == null?'未知': info.insMode}</span>
                                <span><i>品牌：</i>${info.insBrand == null?'未知': info.insBrand}</span>
                                <span><i>分类：</i>${info.insCategory[0]}->${info.insCategory[1]}</span>
                                <%--<br>--%>
                                <span><i>领域：</i>${info.insScopeName==null?'未知': info.insScopeName}</span>
                            </div>
                            <div class="intro">
                        <span>
                             <i class="lab-order"></i><s>${info.insServiceType}</s>
                        </span>
                            </div>
                            <div class="label">
                                <span class="tp1">${info.insFeatureName[0]}</span>
                                <span class="tp1">${info.insFeatureName[1]}</span>
                                <span class="tp2">${info.insFeatureName[2]}</span>
                            </div>
                        </div>
                        <div class="ins_btn">
                            <div class="price">
                                <c:if test="${info.price.flag == 1}">
                                    ${info.price.accPrice} 元/ ${info.price.unit}
                                </c:if>
                                <c:if test="${info.price.flag == 2}">
                                    <c:choose>
                                        <c:when test='${info.price.scopeHighPrice.equals("0")}'>
                                            ${info.price.scopeLowPrice} 元/ ${info.price.unit} 起
                                        </c:when>
                                        <c:otherwise>
                                            ${info.price.scopeLowPrice} - ${info.price.scopeHighPrice} 元/ ${info.price.unit}
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <c:if test="${info.price.flag == 3}">
                                    面议
                                </c:if>
                            </div>
                            <button class="to_deatil_btn" data-goods-id="${info.mapId}" onclick="toGoodsDetail(this)"
                                    type="button">
                                查看详情
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </c:if>


        </div>
        <%--分页--%>

        <div class="paging" style="display: ${total > 10?'block':'none'}">
            <div id="page_container" class="page_list"></div>
        </div>
        <%-- START无结果--%>
        <c:if test='${orgInfo.orgInsCount==0}'>
            <div class="list_default" style="width:1120px;display: block;margin: auto;margin-bottom: 100px;margin-top: 50px">
                <div class="default_icon">
                    <img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">
                </div>
                <div class="default_txt">
                    <div>
                        <h3>抱歉，该机构还没有共享过仪器</h3>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/front/js/util/pagination.js?v_=20170622"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">

    // 初始化页面分页
    showPages('${total}', ('${pageNo}' - 1) * 10, 10, function (from, max) {

            PAGE_NO = from / 10 + 1;
        window.location.href = '${rlab}/org/${oid}/ins?pageNo=' + PAGE_NO + '&pageSize=10'

        }, "page_container"
    )
</script>
</body>
</html>
