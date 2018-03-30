<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%@ include file="../../config/taglibs.jsp" %>
    <!--my CSS start-->
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <script src="${rlab}/mobile/assets/flexible/flexible.js"></script>
    <script src="${rlab}/mobile/assets/flexible/flexible_css.js"></script>
    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_300X300.jpg")
        }

    </script>
    <style>
        body, html {
            height: 100%;
            background: #f5f6fa;
        }

        .wrapper {
            background: #f5f6fa;
            padding-bottom: 0.5rem;
        }

        /*START下拉地址样式*/
        .select_address {
            height: 1rem;
            line-height: 1rem;
            text-align: center;
            color: #B5B5B5;
            font-size: 0.37rem;
            background: #fff;
        }

        .select_address > span {
            position: absolute;
            display: block;
            left: 50%;
            height: 1rem;
            line-height: 1rem;
            /*transform: translateX(-50%);*/
            -webkit-transform: translateX(-50%);
            -moz-transform: translateX(-50%);
            -ms-transform: translateX(-50%);
            -o-transform: translateX(-50%);
            transform: translateX(-50%);
            margin-left: -0.2rem;
        }

        .select_address > span > i {
            position: absolute;
            display: block;
            top: 0;
            right: -0.5rem;
            height: 1rem;
            line-height: 0.98rem;
            font-size: 0.28rem;
            color: #4E4E4E;
        }

        /*END 下拉地址样式*/

        /*列表页面*/
        .goods_list {
            padding: 0 0.32rem;
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
            display: block;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 6rem;
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

        /*城市下拉*/
        /*选择城市*/
        .ad_header {
            height: 1.175rem;
            background: #fff;
            line-height: 1.175rem;
            text-align: center;
            color: #4e4e4e;
        }

        .ad_header i {
            float: left;
            display: block;
            height: 1.175rem;
            line-height: 1.175rem;
            margin-left: 0.3rem;
            color: #4e4e4e;
        }

        .ad_header div.hm > i {
            font-size: 0.45rem;
        }

        .ad_header div.hm {
            float: right;
            vertical-align: middle;
            padding-right: 0.26rem;
        }

        .ad_header div > img {
            width: 0.4rem;
            margin-right: 0.266rem;
            vertical-align: middle;
        }

        /*右下角固定提示栏*/
        .fixed_tip {
            position: fixed;
            bottom: 1.5rem;
            right: 0.32rem;

        }

        .fixed_tip .super_search {
            width: 1.36rem;
            height: 1.36rem;
            border-radius: 0.7rem;
            background: rgba(0, 0, 0, 0.5);
            /*background: #000;*/
            /*opacity: 0.5;*/
            padding: 0.21rem 0;
        }

        .fixed_tip .super_search p {
            color: rgba(255, 255, 255, 1);
            text-align: center;
            /*opacity: 1;*/
        }

        /*START 分页样式*/
        .paging {
            padding: 0 0.32rem;
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

        /*END 分页样式*/

        /*其他推荐*/
        .other_recommend {
            text-align: center;
            padding: 0.84rem 0;
        }

        .other_recommend img {
            margin-bottom: 0.68rem;
        }

        .other_recommend p {
            font-size: 0.32rem;
            height: 0.46rem;
            line-height: 0.46rem;
            color: #B6B7BB;
        }

        .other_recommend_tit {
            line-height: 0.8rem;
            height: 0.8rem;
            margin-top: 0.4rem;
            /*color: #2F2F31;*/
            font-size: 0.32rem;
            color: #4e4e4e;
            /*font-weight: 700;*/
        }

        /*无搜索结果缺省*/
        .list_default {
            text-align: center;
        }

        .list_default > img {
            margin-top: 2rem;
            margin-bottom: 1rem;
            width: 4rem;
        }

        .default_txt {
            text-align: center;
        }

        .default_txt h3 {
            font-size: 0.43rem;
            color: #666;
            margin-bottom: 0.35rem;
        }

        .default_txt p {
            font-size: 0.32rem;
            color: #666;
        }

        /*=START 城市下拉 [徐志响，2017-06-27]*/
        /*下拉标题*/
        .ls_t {
            color: #b9b9b9;
            background: #f5f6fa;
            height: 0.86rem;
            line-height: 0.86rem;
            font-size: 0.35rem;
            padding-left: 0.75rem;
        }

        /*当前定城市*/
        .cur_city {
            background: #fff;
            height: 0.94rem;
            line-height: 0.94rem;
            font-size: 0.34rem;
            padding-left: 0.85rem;
        }

        /*热门城市*/
        .hot_city {
            background: #fff;

        }

        .hot_city ul {
            width: 100%;
            overflow: hidden;
            padding-top: 0.32rem;
        }

        .hot_city ul > li {
            float: left;
            margin-left: 0.75rem;
            height: 0.666rem;
            line-height: 0.666rem;
            padding: 0 0.45rem;
            background: #f5f6fa;
            color: #000;
            margin-bottom: 0.32rem;
            -webkit-border-radius: 0.1rem;
            -moz-border-radius: 0.1rem;
            border-radius: 0.1rem;
            border: 1px solid #f2f3f6;
        }

        /*城市字母导航*/

        .city_nav {
            background: #fff;
        }

        .city_nav ul {
            width: 100%;
        }

        .city_nav ul > li {
            float: left;
            width: 16.66666666666667%;
        }

        .city_nav li > a {
            display: block;
            text-align: center;
            height: 1rem;
            line-height: 1rem;
            color: #6c6c6c;
            font-size: 0.4rem;
        }

        .city_nav li > a:link {
            text-decoration: none !important;
        }

        /*.city_nav li > a:active {*/
        /*background: #f5f6fa;*/
        /*text-decoration: none;*/
        /*}*/
        /**/
        /*城市分类列表*/
        .city_type {
            background: #fff;
        }

        .city_type ul {

        }

        .city_type ul > li {
            float: left;
            width: 25%;
            padding: 0.16rem 0;
        }

        .city_type ul > li > a {
            display: block;
            height: 0.64rem;
            line-height: 0.64rem;
            font-size: 0.43rem;
            color: #6c6c6c;
            text-align: center;
            border-right: 1px solid #e7e9ee;
        }

        .city_type li:nth-child(4n) > a, .city_type li:last-child > a {
            border: 0 none !important;
        }

        /*=END 城市下拉 [徐志响，2017-06-27]*/

        /*返回顶部*/
        .moveTotop {
            /*width: 1.06rem;*/
            /*height: 1.06rem;*/
            background: #fff;
            -webkit-border-radius: 0.6rem;
            -moz-border-radius: 0.6rem;
            border-radius: 0.6rem;
            position: fixed;
            bottom: 1.5rem;
            right: 0.32rem;
            z-index: 1000;
        }

        .moveTotop i {
            font-size: 1.06rem;
            color: rgba(0, 0, 0, 0.7);
            opacity: 0.7;
        }

        .moveTotop a:link {
            text-decoration: none;
        }

        #footer {
            text-align: center;
            line-height: 1rem;
            background: #F5F6FA;
            padding-top: 1.89rem;
            position: absolute;
            width: 8rem;
            margin-left: -4rem;
            left: 50%;
        }

        #footer p {
            margin: 0;
            font-size: 0.267rem;
        }

        #footer img {
            width: 2.13rem;
            height: 0.56rem;
            margin-bottom: 0.2rem;
        }

        #footer p img {
            width: 2.6rem;
            height: 2.6rem;
            margin-bottom: 0.5rem;
        }

        /*感兴趣的内容*/
        .funny_list {
            padding: 0 0.32rem;
        }

        .funny_list h4 {
            line-height: 1.14rem;
            height: 1.14rem;
            font-size: 0.32rem;
            color: #4e4e4e;
            /*font-weight: 500;*/

        }

        .funny_list > ul {
            overflow: hidden;
            max-height: 1.70rem;
            padding-right: 0.66rem;
            position: relative;

        }

        .funny_list > ul > li {
            display: block;
            float: left;
            padding: 0 0.4rem;
            background-color: #fff;
            line-height: 0.72rem;
            height: 0.72rem;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            margin-right: 0.21rem;
            margin-bottom: 0.21rem;
            font-size: 0.32rem;
        }

        .funny_list > ul > a {
            position: absolute;
            width: 0.66rem;
            height: 100%;
            right: 0;
            top: 0;
            text-align: center;
        }

        .funny_list > ul > a s {
            position: absolute;
            display: block;
            top: 50%;
            font-size: 0.40rem;
            margin-top: -0.20rem;
            color: #5a5b5b;
            font-weight: 600;
            right: 0;
        }

        /*仪器列表切换*/
        .goods_tab {
            display: -webkit-flex; /* Safari */
            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            justify-content: center;
        }

        .goods_tab > span {
            display: block;
            background: #fff;
            line-height: 1.06rem;
            width: calc((100%) / 3);
            width: -webkit-calc((100%) / 3);
            width: -moz-calc((100%) / 3);
            text-align: center;
        }

        .goods_tab > span.cur {
            border-bottom: 2px solid #588eff;
            color: #588eff;
        }

        [data-dpr="1"] .goods_tab > span {
            font-size: 14px;
        }

        [data-dpr="2"] .goods_tab > span{
            font-size: 28px;
        }

        [data-dpr="3"] .goods_tab > span{
            font-size: 42px;
        }

        [data-dpr="1"] .goods_tab > span.cur {
            border-bottom: 1px solid #588eff;
        }

        [data-dpr="2"] .goods_tab > span.cur {
            border-bottom: 2px solid #588eff;
        }

        [data-dpr="3"] .goods_tab > span.cur {
            border-bottom: 3px solid #588eff;
        }

    </style>
</head>
<body>
<%--搜索页面独有的头部--%>
<%--内容区域--%>
<div id="main" class="wrapper" style="display: block">
    <%--START 头部公用部分引入--%>
    <%@ include file="../template/header_one.jsp" %>
    <%--END 头部公用部分引入--%>
    <div class="goods_tab">
        <span onclick="choseInsList()" class="cur">仪器<i>&nbsp;(${total})</i></span>
        <span onclick="choseServiceList()" class="">服务<i>&nbsp;(${serviceSize})</i></span>
        <span onclick="choseOrgList()" class="">机构<i>&nbsp;(${orgSize})</i></span>
    </div>
    <%--START 地址下拉按钮--%>
    <div class="select_address">
        <span onclick="selectAddress()"> <s id="curAddressOrigin"></s><i class="lab-arrow-down"></i></span>
    </div>
    <%--END 地址下拉按钮--%>

    <%-- START感兴趣的内容--%>
    <c:if test="${interestArr.size() > 0}">
        <div class="funny_list">
            <h4>您可能感兴趣的内容</h4>
            <ul>
                <c:forEach items="${interestArr}" var="item" varStatus="status">
                    <li onclick="toSearch(this)">${item}</li>
                </c:forEach>
                <a href="javascript:void(0);" onclick="toSuperSearch('ins')">
                    <s class="lab-youjian_1"></s>
                </a>
            </ul>
        </div>
    </c:if>
    <%-- END感兴趣的内容--%>

    <%-- START仪器列表 --%>
    <div class="goods_list">
        <%--当前地区无结果，推荐其他地区结果--%>
        <c:if test="${other == 1 || other == 2 || other == 3}">
            <div class="other_recommend">
                <img src="${rlab}/mobile/imgs/fillup_img/noint-1-3@2x.png" alt="没有相关仪器">
                <p>当前区域未匹配到结果，为您推荐其他</p>
                <p>地区匹配结果。</p>
            </div>
            <h4 class="other_recommend_tit" style="">其他推荐</h4>
        </c:if>
        <%--有结果/有推荐结果--%>
        <c:if test="${other != 4}">
            <c:forEach items="${infos}" var="item">
                <div class="item" data-goods-id="${item.mapId}" onclick="toGoodsDetail(this)">

                    <div class="lft_img">
                        <c:if test="${item.insPic == null}">
                            <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                        </c:if>
                        <c:if test="${item.insPic != null}">
                            <%--该仪器图片存在时--%>
                            <img onerror="imgOnError(this)" src="${item.insPic}300_300" alt="商品图片">
                        </c:if>
                    </div>

                    <div class="rt_info">
                        <p class="int_name">
                            <c:out value="${ item.insName.length() > 15 ? item.insName.substring(0,14).concat('...') :item.insName }"
                                   escapeXml="true"/>
                        </p>
                            <%--<p class="int_type">型号：--%>
                            <%--<c:out value="${ item.insMode.length() > 15 ? item.insMode.substring(0,15).concat('...') :item.insMode }" escapeXml="true"/>--%>
                            <%--</p>--%>
                        <p class="int_about">
                            <span class="ad">
                                <%--<c:out value="${item.orgAddrProvince}" escapeXml="true"/>--%>
                                <c:out value="${item.orgAddrCity}" escapeXml="true"/>
                                <c:out value="${item.orgAddrDistrict}" escapeXml="true"/>
                            </span>
                            <span class="price">
                                   <c:choose>
                                       <c:when test="${item.price.flag == 1}">
                                           <c:if test='${"无".equals(item.price.unit)}'>
                                               ￥${item.price.accPrice}
                                           </c:if>
                                           <c:if test='${!"无".equals(item.price.unit)}'>
                                               ￥${item.price.accPrice}<i>/${item.price.unit}</i>
                                           </c:if>
                                       </c:when>
                                       <c:when test="${item.price.flag == 2}">
                                           <c:if test='${item.price.scopeHighPrice.equals("0")}'>
                                               <c:if test='${"无".equals(item.price.unit)}'>
                                                   ￥${item.price.scopeLowPrice}起
                                               </c:if>
                                               <c:if test='${!"无".equals(item.price.unit)}'>
                                                   ￥${item.price.scopeLowPrice}<i>/${item.price.unit}</i>起
                                               </c:if>
                                           </c:if>

                                           <c:if test='${!item.price.scopeHighPrice.equals("0")}'>
                                               <c:if test='${"无".equals(item.price.unit)}'>
                                                   ￥${item.price.scopeLowPrice} - ${item.price.scopeHighPrice}
                                               </c:if>
                                               <c:if test='${!"无".equals(item.price.unit)}'>
                                                   ￥${item.price.scopeLowPrice} - ${item.price.scopeHighPrice}
                                                   <i>/${item.price.unit}</i>
                                               </c:if>
                                           </c:if>
                                       </c:when>
                                       <c:when test="${item.price.flag == 3}">
                                           面议
                                       </c:when>
                                   </c:choose>
                            </span>
                        </p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <%--无结果--%>
        <c:if test="${other == 4}">
            <div class="list_default" style="display: block">
                <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="没有检索到搜索结果">
                <div class="default_txt">
                    <h3>抱歉，没有找到与“<span><c:out
                            value='${keyword.length() > 4 ? keyword.substring(0,3).concat("..."):keyword}'
                            escapeXml="true"/></span>”相关的仪器</h3>
                    <p>您可以更换一下关键词，或适当扩大您的搜索范围重新尝试 </p>
                </div>
                <div id="footer">
                    <img src="${rlab}/mobile/imgs/home_logo.png"/>
                    <p>关注“人人实验”服务号，体验VIP专业定制服务</p>
                    <p><img src="${rlab}/mobile/imgs/two.jpg"></p>
                </div>
            </div>
        </c:if>
    </div>
    <%-- END仪器列表 --%>

    <%-- START分页--%>
    <div class="paging" style="display: ${total > 10? "block" : "none"};">
        <div id="page_container" class="page_list"></div>
    </div>
    <%-- END分页--%>

</div>


<%--高级搜索--%>
<%--<div id="superSearch" class="fixed_tip" style="display: none">--%>
<%--<div onclick="toSuperSearch()" class="super_search">--%>
<%--<p>智能</p>--%>
<%--<p>搜索</p>--%>
<%--</div>--%>
<%--</div>--%>

<%--城市下拉列表--%>
<div class="moveTotop" id="div_moveToTop" style="display: none">
    <a href="#dropdown" class="mtop">
        <i class="lab-back_top"></i>
    </a>
</div>
<%@ include file="../template/city.jsp" %>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>

<script src="${rlab}/mobile/assets/fenye/pagination.js"></script>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script>
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */
    function goBack() {
        var url = BASE_URL + '/page/home';
        window.location.href = url;

    }

    // [#maidian] 搜索关键字埋点
    _dgt.push(['trackAttr', ['keywords'], ['${keyword}']]);
    setCallbackUrl();// 设置登录时回跳路径
    initDropdown();// 初始化城市下拉
    initPaging();// 初始化分页
    // 回到顶部
    $(window).scroll(function () {

        if ($("#dropdown").data("flag") == 1) {

            if ($(window).scrollTop() >= screen.availHeight * 2) {
                $('#div_moveToTop').show(1000);
            } else {
                $('#div_moveToTop').hide(1000);
            }

        }

    });


    /**
     * 初始化分页
     */
    function initPaging() {
        showPages(${total}, (${pageNo} -1) * 10, 10, function (from, max) {
            // 处理页码参数
            PAGE_NO = from / 10 + 1;

            // 处理地址参数（为当前已选择地址）
            // var address = $("#adCurrent").text();
            var address = $("#curAddressOrigin").text();
            if (address === "北京") {
                CUR_PROVINCE = "北京市";
            } else if (address === "上海") {
                CUR_PROVINCE = "上海";
            } else if (address === "重庆") {
                CUR_PROVINCE = "重庆";
            } else if (address === "天津") {
                CUR_PROVINCE = "天津";
            } else {
                if (address !== "全国") {
                    CUR_CITY = $("#curAddressOrigin").text();
                }
            }

            // 处理关键字参数
            KEY_WORD = $("#searchIpt").val();
            toGoodsList();// 跳转搜索结果页

        }, "page_container");
    }

    /**
     * 初始化地址下拉列表
     */
    function initDropdown() {

        var curAd = "";
        // 初始化城市下拉
        <c:choose>
        <c:when test="${province != null}">
        curAd = "${province}";
        </c:when>
        <c:when test="${city != null}">
        curAd = "${city}";
        </c:when>
        <c:otherwise>
        curAd = "全国";
        </c:otherwise>
        </c:choose>

        if (curAd === "北京市") {
            curAd = "北京";
        }
        $("#curAddressOrigin").text(curAd);
        $("#curAddress").text(curAd);
    }

    /**
     * 地址下拉选择
     */
    function selectAddress() {

        $("#main").hide(2000);
        $("#dropdown").show(2000);
        $("#dropdown").data("flag", 1);
        // $("#superSearch").hide();
//        $("#div_moveToTop").show();
    }

    /**
     * 从地址页跳转搜索页
     */
    function choseAddress($this) {

        // 控制样式
        var curAddress = $($this).text();

        $("#dropdown").hide(500);
        $("#dropdown").data("flag", 0);
        $("#curAddressOrigin").text(curAddress);
        $("#curAddress").text(curAddress);
        $("#main").show(1000);
        // $("#superSearch").show();
        $("#div_moveToTop").hide();

        // 将当前地址存到url上( 更新当前地址 )
        URL_CUR_CITY = curAddress;
        //   setAddressCookie(curAddress);
        // 处理地址
        var address = curAddress;
        if (address === "北京") {
            CUR_PROVINCE = "北京市";
        } else if (address === "上海") {
            CUR_PROVINCE = "上海";
        } else if (address === "重庆") {
            CUR_PROVINCE = "重庆";
        } else if (address === "天津") {
            CUR_PROVINCE = "天津";
        } else {
            if (address !== "全国") {
                CUR_CITY = $("#curAddressOrigin").text();
            }
        }

        choseAddress = ""
        // 处理页面
        pageNo = 1;
        // 处理关键字参数
        KEY_WORD = $("#searchIpt").val();
        // 跳转
        toGoodsList();
    }
    
    /**
     * 头部tab切换，点击仪器
     */
    function choseInsList() {
        dealParams();
        // 跳转服务页面
        toGoodsList();
    }

    /**
     * 头部tab切换，点击服务列表
     */
    function choseServiceList() {
        dealParams();
        toServiceList();
    }

    /**
     * 头部tab切换，点击机构列表
     */
    function choseOrgList() {
        dealParams();
        toOrgList();
    }

    /**
     * 头部tab切换，点击机构列表
     */
    function dealParams() {
        // 处理地址参数
        var curAddress = $("#curAddressOrigin").text();
        URL_CUR_CITY = curAddress;
        // 处理地址
        var address = curAddress;
        if (address === "北京") {
            CUR_PROVINCE = "北京市";
        } else if (address === "上海") {
            CUR_PROVINCE = "上海";
        } else if (address === "重庆") {
            CUR_PROVINCE = "重庆";
        } else if (address === "天津") {
            CUR_PROVINCE = "天津";
        } else {
            if (address !== "全国") {
                CUR_CITY = $("#curAddressOrigin").text();
            }
        }

        // 处理页面参数
        pageNo = 1;
        pageSize = 10;

        // 处理关键字参数
        KEY_WORD = $("#searchIpt").val();
    }

    /**
     * 从地址页返回搜索页
     */
    function cancelSelect() {
        $("#dropdown").hide(500);
        $("#dropdown").data("flag", 0);
        $("#main").show(1000);
        // $("#superSearch").show();
         $("#div_moveToTop").hide();
    }


</script>
</html>