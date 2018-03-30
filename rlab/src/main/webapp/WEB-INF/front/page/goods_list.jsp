<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="${rlab}/front/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>

    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_140X110.jpg")
        }

    </script>
    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170905">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style>
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
        }

    </style>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>

    <!--搜索结果列表-->
    <div id="listContent" class="list_wrapper">
        <!--提示栏-->
        <div class="resault_tip clearfix">
            <div class="lft_tip">
                <!--此处动态，结果1-->
                <!--<span>共<i>1069</i>条结果</span>-->
                <!--<span>不满意</span>-->
                <c:if test="${other == 0}">
                    <div class="lft_num">
                        共 <span>${total}</span>条结果
                    </div>
                </c:if>
                <div class="rt_tx">
                    没找到想要的？来<a href="${rlab}/instrument/qr" target="_blank" style="color: #508df0">“人人实验服务号”</a>，私人助手帮您快速解决！
                </div>
            </div>
            <div class="rt_tip">
                <div class="lab-tip"></div>
                <%--<div class="text">点这里查看<a href="JavaScript:location.href='${rlab}/front/kejso/search?query='+ encodeURI('<c:out value="${keyword}" escapeXml="true"/>');" target="_blank">“搜索词”相关资料</a>，帮你更精准定位所需仪器哦！</div>--%>
                <div class="text">点这里查看<a href="javascript:void(0)" onclick="toKejso()">
                   <c:choose>
                       <c:when test="${ ''.equals(keyword)}">“仪器”</c:when>
                       <c:otherwise>“<c:out value="${ keyword.length() > 8 ? keyword.substring(0,8).concat('...') :keyword }" escapeXml="true"/>”</c:otherwise>
                   </c:choose>
                    相关信息</a>，用人工智能找到所需仪器！</div>
            </div>
        </div>
        <%--第三种搜索结果--%>
        <c:if test="${other == 1}">
            <div class="other_resault">
                     <img src="${rlab}/front/imgs/icon/newplot-404-3.png" alt="未搜到结果">
                     <span>当前区域未匹配到结果，为您推荐其他地区匹配结果</span>
            </div>
        </c:if>

    <%--有结果--%>
        <c:if test="${other == 0 || other == 1}">
            <!--列表栏-->
            <div class="list" style="display: block;">

                <c:forEach items="${instrumentList}" var="item">

                    <div class="item_card cards">
                        <div class="goods_img">
                            <div>
                                <c:if test = "${item.insPic == null}">
                                    <img data-goods-id="${item.mapId}" onclick="toGoodsDetail(this)" src="${rlab}/common/common_img/default/ins_140X110.jpg" alt="商品图片">
                                </c:if>
                                <c:if test = "${item.insPic != null}">
                                    <%--该仪器图片存在时--%>
                                    <%--<img data-goods-id="${item.mapId}" onerror="imgOnError(this)" onclick="toGoodsDetail(this)" src="${item.insPic}?x-oss-process=image/resize,w_200" alt="商品图片">--%>
                                    <img data-goods-id="${item.mapId}" onerror="imgOnError(this)" onclick="toGoodsDetail(this)" src="${item.insPic}140_110" alt="商品图片">
                                </c:if>
                            </div>

                        </div>

                        <div class="goods_info">

                            <div class="title">
                                <h2><a href="javascript:void (0)" data-goods-id="${item.mapId}"  onclick="toGoodsDetail(this)"  title="${item.insName}"> <c:out value="${item.insName.length() > 25 ? item.insName.substring(0,25).concat('...') :item.insName}" escapeXml="true"/></a></h2>
                            </div>

                            <div class="info">
                                <span class="types">型号：</span>${ item.insMode.length() > 8 ? item.insMode.substring(0,8).concat("...") :item.insMode }
                                <span class="brand">品牌：</span>${ item.insBrand.length() > 8 ? item.insBrand.substring(0,8).concat("...") :item.insBrand }
                            </div>
                            <div class="intro">
                                <%--<a data-goods-id="${item.mapId}"  onclick="toGoodsDetail(this)"  href="javascript:void (0)" title="${ item.insDescription.length() > 300 ? item.insDescription.substring(0,300).concat(".....") :item.insDescription }">--%>
                                    <span style="color: #7a7a7a">简介：</span>${ item.insDescription.length() > 36 ? item.insDescription.substring(0,36).concat("...") :item.insDescription }
                                <%--</a>--%>
                            </div>
                            <div class="jg_adress">
                                <div class="city">
                                    <i class="lab-adress"></i>
                                    <span>${item.orgProvince}${item.orgCity}</span>
                                </div>
                                <div class="company">
                                    <i class="lab-company"></i>
                                    <span><c:out value="${item.orgName.length() > 25 ? item.orgName.substring(0,25).concat('...') :item.orgName}" escapeXml="true"/></span>
                                </div>
                            </div>
                        </div>

                        <div class="goods_btn">
                            <div class="price">
                                <c:choose>
                                    <c:when test="${item.insOrgPriceList.flag == 1}">
                                        <c:if test='${"无".equals(item.insOrgPriceList.unit)}'>
                                            ${item.insOrgPriceList.accPrice}元
                                        </c:if>
                                        <c:if test='${!"无".equals(item.insOrgPriceList.unit)}'>
                                            ${item.insOrgPriceList.accPrice}元/${item.insOrgPriceList.unit}
                                        </c:if>
                                    </c:when>
                                    <c:when test="${item.insOrgPriceList.flag == 2}">

                                        <c:if test='${item.insOrgPriceList.scopeHighPrice.equals("0")}'>
                                            <c:if test='${"无".equals(item.insOrgPriceList.unit)}'>
                                                ${item.insOrgPriceList.scopeLowPrice}元起
                                            </c:if>
                                            <c:if test='${!"无".equals(item.insOrgPriceList.unit)}'>
                                                ${item.insOrgPriceList.scopeLowPrice}元/${item.insOrgPriceList.unit}起
                                            </c:if>
                                        </c:if>
                                        <c:if test='${!item.insOrgPriceList.scopeHighPrice.equals("0")}'>
                                            <c:if test='${"无".equals(item.insOrgPriceList.unit)}'>
                                                ${item.insOrgPriceList.scopeLowPrice} - ${item.insOrgPriceList.scopeHighPrice}元

                                            </c:if>
                                            <c:if test='${!"无".equals(item.insOrgPriceList.unit)}'>
                                                ${item.insOrgPriceList.scopeLowPrice} - ${item.insOrgPriceList.scopeHighPrice}元/${item.insOrgPriceList.unit}
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${item.insOrgPriceList.flag == 3}">
                                        面议
                                    </c:when>
                                </c:choose>

                            </div>

                            <button class="to_deatil_btn" type="button" data-goods-id="${item.mapId}"  onclick="toGoodsDetail(this)">查看详情</button>
                        </div>

                    </div>

                </c:forEach>

                <div class="paging" style="display: ${total > 10? "block" : "none"};">
                    <div id="page_container" class="page_list"></div>
                </div>

            </div>
        </c:if>
        <%--无结果--%>
        <c:if test="${other == 2}">
            <div class="list_default" style="display: block">
                <div class="default_icon">
                    <img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">
                </div>
                <div class="default_txt">
                    <div >
                        <h3>抱歉，没有找到与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}' escapeXml="true"/>”相关的仪器</h3>
                        <p>1.您可以核对输入的文字是否正确；</p>
                        <p>2.您可以更换一下关键词，或适当扩大您的搜索范围；</p>
                        <p>3.您可以关注“人人实验服务号”，客服为您解决。</p>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/util/pagination.js?v_=20170905"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    _dgt.push(['trackAttr',['keywords'], ['${keyword}']]);
    (function () {
        // [#maidian] 搜索关键字埋点

        navDropDownList();
        initDropdown();
        $("#dorpBox").show();// 显示城市筛选列表
        $('#dorpUl').slimscroll({
            alwaysVisible: true,
            height: '100%', //可滚动区域高度
            size: '3px', //组件宽度
            color: '#a1a1a1', //滚动条颜色
            opacity: 0.3, //滚动条透明度
            allowPageScroll: false, //是否 使用滚轮到达顶端/底端时，滚动窗口
            wheelStep: 10, //滚轮滚动量
        });
    })();

    // jsp获取当前页数
    PAGE_NO = ${pageNo};
    <%--KEY_WORD = "<c:out value="${keyword}" escapeXml="true"/>";--%>
    KEY_WORD = $("#search").val();
    var FROM_NO = (PAGE_NO -1)*10;
    // 初始化页面分页
    showPages( ${total}, FROM_NO , 10, function (from, max) {

        PAGE_NO = from/10 + 1;
        var address = $("#adCurrent").text();
        if(address === "北京") {

            CUR_PROVINCE = "北京市";

        } else if(address === "上海"){

            CUR_PROVINCE = "上海";

        } else if(address === "重庆"){

            CUR_PROVINCE = "重庆";

        }else if(address === "天津"){

            CUR_PROVINCE = "天津";

        }else {

            if(address !== "全国") {
                CUR_CITY = $("#adCurrent").text();
            }
        }
        toGoodsList();

    }, "page_container");

//    $("#weiin").on("click",function(){
//        location.href=""
//    })

    /**
     * 跳转高级搜索页面
     */
    function toKejso() {

        var keyword = $("#search").val();
        if(keyword === "") {
            keyword = "仪器"
        }

        keyword = encodeURI(keyword);
        keyword=keyword.replace(/\+/g, "%2B");
        keyword=keyword.replace(/#/g, "%23");
        keyword=keyword.replace(/&/g, "%26");
        keyword=keyword.replace(/</g, "%3c");
        keyword=keyword.replace(/>/g, "%3e");

        var URL = '${rlab}/front/kejso/search?query='+ keyword;
        window.open(URL);

    }


    /**
     * 初始化城市下拉列表
     */
    function initDropdown() {
        <%--<div style="color:red;">province:${"".equals(province)}</div>--%>
        <%--<div style="color:red;">city:${city}</div>--%>

        var urlAddress = null, currentAddress = null;
        <%--console.log(1);--%>
        <%--console.log("${province}");--%>
        <%--console.log(2);--%>
        <%--console.log("${city}");--%>
        <c:choose>
            <c:when test='${("".equals(province) || province == null) && city !=null }'>
                urlAddress  = "${city}";
            </c:when>
            <c:when test='${("".equals(city) || city == null) && province != null}'>
                 urlAddress  = "${province}";
            </c:when>
            <c:otherwise>
                 urlAddress  = null;
             </c:otherwise>
        </c:choose>

        // 地址處理：优先看url地址，其次看缓存，再其次看定位
        if (urlAddress != null) {

            if(urlAddress === ""){
                currentAddress = "全国";
            }else if( urlAddress.slice(-1) === "市"){
                currentAddress = urlAddress.slice(0,-1);
            }else {
                currentAddress = urlAddress;
            }

        } else {
            // 这个应该先优先从
            currentAddress = getCurremtAdress();
            if (currentAddress === -1) {
                currentAddress = "全国";
            }
        }

        $("#adCurrent").text(currentAddress);// 设置title
        $("#dorpDown li").each(function () {
            var $this = $(this);
            $this.removeClass("active");
            if ($this.find("a").text() === currentAddress) {
                $this.addClass("active");
            }
        })

    }

    /**
     * 设置缓存当前地理位置
     * @param value string类型，传入的地理位置
     */
    function setCurrentAdress(value) {
        localStorage.setItem("curAdress", value);
    }

    /**
     * 获取当前地理位置
     * @returns {number}
     */
    function getCurremtAdress() {
        var curAdress = localStorage.getItem("curAdress");
        return curAdress ? curAdress : -1;
    }

    /**
     *选择位置
     * @param $this
     */
    function choseAddress($this) {

        $this = $($this);
        $("#dorpDown li").removeClass("active");
        $this.addClass("active");
        var choseCity = $this.find("a").text();
        $("#adCurrent").text(choseCity);
        $("#dorpDown").addClass("dn");
        setCurrentAdress(choseCity);

        if ( $("#listContent").length > 0) {

            var address = $("#adCurrent").text();
            if(address === "北京") {

                CUR_PROVINCE = "北京市";

            } else if(address === "上海"){

                CUR_PROVINCE = "上海";

            } else if(address === "重庆"){

                CUR_PROVINCE = "重庆";

            }else if(address === "天津"){

                CUR_PROVINCE = "天津";

            }else {

                if(address !== "全国") {
                    CUR_CITY = $("#adCurrent").text();
                }else{
                    IS_COUNTRY = "1";
                }

            }

            KEY_WORD = $("#search").val();
            PAGE_NO = 1;
            toGoodsList();
        }

    }

    /**
     * 导航下拉列表
     */
    function navDropDownList() {
        dropDownFn({"box": $('#dorpBox'), "target": $('#adCurrent'), "list": $('#dorpDown')});
    }

</script>
</body>
</html>