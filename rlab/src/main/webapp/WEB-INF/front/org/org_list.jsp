<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/10/20 0020
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <%--<link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170622">--%>
    <link rel="stylesheet" href="${rlab}/front/css/ins_list.css?v_=20180330">

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

    <style type="text/css">
        .ins_info .label {
            height: 34px !important;
            padding-top: 5px;
        }

        .ins_info .intro {
            line-height: 14px !important;;
            margin-top: 6px;

        }

        .paging {
            margin-top: 46px;
            margin-bottom: 121px;
        }

        .list_wrapper {
            /*margin-top: 15px;*/
        }

        /*高级搜索样式*/
        .super_sch {
            height: 56px;
            background: #fff;
            width: 1120px;
            margin: 0 auto;
            margin-top: 15px;
            position: relative;
            margin-bottom: 15px;
        }

        .super_sch h4 {
            float: left;
            display: block;
            width: 144px;
            height: 56px;
            text-align: center;
            line-height: 56px;
            font-size: 12px;
            color: #999;

        }

        .super_sch ul {
            position: absolute;
            height: 24px;
            width: 860px;
            top: 50%;
            margin-top: -12px;
            left: 144px;
            list-style: none;
            overflow: hidden;
        }

        .super_sch ul li {
            color: #ed6a5f;
            border: 1px solid #ed6a5f;
            float: left;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 11.5px;
            padding: 0 12px;
            margin-right: 13px;
            margin-bottom: 30px;
            cursor: pointer;
        }

        .super_sch ul li:hover {
            background: #ffeeed;
        }

        .super_sch > a {
            float: right;
            display: block;
            height: 56px;
            width: 96px;
            line-height: 56px;
            color: #508DF0;
            font-size: 12px;
            text-align: center;
        }

        .super_sch > a:hover {
            text-decoration: underline;
        }

        .item{
            width: 1120px;
            margin: auto;
            background: white;
            overflow: hidden;
            margin-bottom: 20px;
            border: 1px solid #e6e6e6;
        }
        .item:hover {
            -webkit-box-shadow: 0 6px 16px 0 #d6e0e8;
            -moz-box-shadow: 0 6px 16px 0 #d6e0e8;
            box-shadow: 0 6px 16px 0 #d6e0e8;
            border: 1px solid #fff;
        }
         .itemImg img{
             width: 100%;
             height: 100%;
         }
         .itemImg{
             width: 170px;
             height: 170px;
             margin: 24px;
             float: left;
             cursor: pointer;
         }
        .itemText p span{
            margin-left: 5px;
        }
        .itemText p{
            font-size: 14px;
            color: #5e5e5e;
            line-height: 33px;
        }
        .itemText{
            margin: 17px 0;
            max-width: 650px;
            float: left;
        }
        .itemText .itemTit{
            font-size: 18px;
            color: #4d4d4d;
            cursor: pointer;
        }
        .itemNum p span{
            display: block;
        }
        .itemNum p{
            display: inline-block;
            margin: auto;
        }
        .itemNum{
            width: 161px;
            margin-right: 60px;
            float: right;
            color: white;
            text-align: center;
        }
        .godetail{
            width: 100%;
            height: 45px;
            background: #588eff;
            color: white;
            line-height: 45px;
            text-align: center;
            display: block;
            margin-top: 67px;
            cursor: pointer;
        }
        .ranking img{
            width: 100%;
            position: absolute;
            bottom: -11px;
            left: 0;
        }
        .ranking{
            width: 67px;
            height: 55px;
            font-size: 14px;
            background: #f5a761;
            position: relative;
        }
        .itemNum .index{
            background: #9bd468;
            margin-left: 5px;
            width: 83px;
        }
        .sort {
            width: 1120px;
            margin: auto;
            margin-bottom: 10px;
            margin-top: 25px;
        }

        .sort a label {
            margin-left: 5px;
        }

        .sort .sortSelected {
            color: #588eff;
        }

        .sort a {
            cursor: pointer;
            font-size: 14px;
            display: block;
            padding: 0 15px 0 0;
            text-align: left;
            color: #717171;
            float: left;
        }
        #head{
            margin-bottom: 100px!important;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="2"/>
    </jsp:include>
    <%-- START高级搜索--%>
    <c:if test="${interestArr.size() > 0}">
        <div class="super_sch">
            <h4>您可能感兴趣的内容</h4>
            <ul>
                <c:forEach items="${interestArr}" var="item" varStatus="status">
                    <c:if test="${not empty item}">
                        <li onclick="toSearchFromSuper('${item}',3)">${item}</li>
                    </c:if>
                </c:forEach>
            </ul>
            <a href="javascript:void(0);" target="_blank" onclick="toKejso()">
                点击查看更多
            </a>
        </div>
    </c:if>

    <%-- END高级搜索--%>
    <%-- START仪器筛选--%>
<c:if test="${districts.size() > 0}">
    <div class="ins_filter">
        <%--筛选条件部分1--%>
        <div class="filter">
            <%--已选条件--%>
            <div class="condition p" style="margin-top: 24px">
                <i>已选条件</i>
                <div id="checkedLabel" class="checked_label">
                    <%--市区--%>
                    <c:if test="${district != null && district != ''}">
                        <span data-type="district">
                            ${district}
                            <i onclick="clearCurFilter(this)" data-type="district" class="lab-close-1"></i>
                        </span>
                    </c:if>
                    <s onclick="clearAllFilter()" class="clear_label">
                        <i class="lab-del"></i>
                        清空选项
                    </s>
                </div>
            </div>
            <%--所在地区筛选--%>
            <div class="normal p" style="display: ${districts.size() > 0? 'block': 'none'};">
                <i>所在地区</i>
                <div id="district">
                    <span class="${district == null ? 'actived': ''}">不限</span>
                    <c:if test="${districts.size() > 0}">
                        <c:forEach items="${districts}" var="item">
                            <span class="${district != null && district.equals(item.orgAddrDistrict)? 'actived': ''}">${item.orgAddrDistrict}</span>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <%-- END仪器筛选--%>
</c:if>
    <%-- START第三种搜索结果--%>
    <c:if test="${other == 1 || other == 2 || other == 3}">
        <div class="other_resault">
            <img src="${rlab}/front/imgs/icon/newplot-404-3.png" alt="未搜到结果">
            <span>当前区域未匹配到结果，为您推荐其他地区匹配结果</span>
        </div>
    </c:if>
    <%-- END第三种搜索结果--%>

    <%--SATRT搜索有结果--%>
    <div class="sort clearfix">
        <p style="float: left;display: ${empty keyword?"block":"none"}">
            <a data-sort-type="2" class="${order==2?'sortSelected':''}">按共享指数排列<label
            class="lab-down"></label></a><a class="${order==1?'sortSelected':''}" data-sort-type="1">按距离排列<label class="lab-down"></label></a>
            <%--<a data-sort-type="0" class="${order==0?'sortSelected':''}">默认排序</a><a class="${order==1?'sortSelected':''}" data-sort-type="1">按距离排列<label class="lab-down"></label></a><a data-sort-type="2" class="${order==2?'sortSelected':''}">按共享指数排列<label--%>
            <%--class="lab-down"></label></a>--%>
        </p>
        <p style="font-size: 12px;text-align: right;float: right">共<span style="color: #508df0;">${infos.total}</span>条结果</p>
    </div>

        <div id="listContent" class="list_wrapper">
                <%-- 列表 --%>
        <c:forEach items="${infos.list}" var="item">
            <div class="item clearfix">
                <div class="itemImg">
                    <c:if test="${empty item.orgLogo}">
                        <img data-map-id="${item.orgOid}" onclick="goorg(this)"
                             src="${rlab}/front/imgs/icon/org_logo_default.png" alt="商品图片" class="itemimg">
                    </c:if>
                    <c:if test="${not empty item.orgLogo }">
                        <img data-map-id="${item.orgOid}" onclick="goorg(this)"
                             src="${item.orgLogo}" alt="商品图片" class="itemimg">
                    </c:if>
                    <%--<img src="${rlab}/common/common_img/default/ins_140X110.jpg" alt="">--%>
                </div>
                <div class="itemText">
                    <p class="itemTit" data-map-id="${item.orgOid}" onclick="goorg(this)">${item.orgName}</p>
                    <p>机构性质   <span>${item.orgCategoryName}</span></p>
                    <p>持有仪器   <span>${item.orgInsCount}台</span></p>
                    <p>发布服务   <span>${item.orgServiceCount}条</span></p>
                    <p>所在地区   <span>${item.orgAddrProvince}${item.orgAddrCity}${item.orgAddrDistrict}</span></p>
                </div>
                <div class="itemNum">
                    <div style="display: ${item.orgShareIndexStr!='0'?'block':'none'}">
                        <p class="ranking index">
                            <span style="font-size: 24px">${item.orgShareIndexStr}</span>
                            <span>共享指数</span>
                            <img src="${rlab}/front/imgs/icon/share_num_bg.jpg" alt="">
                        </p>
                        <p class="ranking">
                            <span style="font-size: 24px">${item.orgRank}</span>
                            <span>共享排名</span>
                            <img src="${rlab}/front/imgs/icon/share_num_bg_yl.jpg" alt="">
                        </p>
                    </div>
                    <div style="background: url('${rlab}/front/imgs/icon/share_num_bg0.png') no-repeat;color: white;height: 66px;line-height: 55px;text-align: center;display: ${item.orgShareIndexStr=='0'?'block':'none'}"><p>暂无排名</p></div>
                    <a class="godetail" data-map-id="${item.orgOid}" onclick="goorg(this)">查看详情</a>
                </div>
            </div>
        </c:forEach>
        </div>
    <%-- END搜索结果页面（有结果）--%>

    <%-- START无结果--%>
    <c:if test="${other == 4}">
        <div class="list_default" style="display: block;margin-bottom: 100px;">
            <div class="default_icon">
                <img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">
            </div>
            <div class="default_txt">
                <br><br><br>
                    <h3>抱歉，没有找到与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                        escapeXml="true"/>”相关的机构</h3>
                    <p>1.您可以核对输入的文字是否正确；</p>
                    <p>2.您可以更换一下关键词，或适当扩大您的搜索范围；</p>
                    <p>3.您可以关注“人人实验服务号”，客服为您解决。</p>
                <br>
                    <c:choose>
                        <c:when test="${insSize != 0 && serviceSize != 0}">
                            我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                            escapeXml="true"/>”相关的仪器（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                            ${insSize}个</a>）和服务（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                            ${serviceSize}个</a>）
                            <br>
                        </c:when>
                        <c:when test="${insSize != 0 && serviceSize == 0}">
                            我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                            escapeXml="true"/>”相关的仪器（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                            ${insSize}个</a>）
                            <br>
                        </c:when>
                        <c:when test="${insSize == 0 && serviceSize != 0}">
                            我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                            escapeXml="true"/>”相关的服务（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                            ${serviceSize}个</a>）
                            <br>
                        </c:when>
                    </c:choose>
                    </br>
                    <p>为您找到了“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                    escapeXml="true"/>”的相关知识,<a href="javascript:void(0);" target="_blank" onclick="toKejso()">
                        了解请点击</a></p>
                </div>
            </div>
        </div>
    </c:if>
    <%-- END无结果--%>

    <%--START分页--%>
    <div class="paging" style="display: ${total > 10? "block" : "none"}">
        <div id="page_container" class="page_list"></div>
    </div>
    <%--END分页--%>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/front/js/util/pagination.js?v_=20171108"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    // 定义URL参数
    var PAGE_NO = '${pageNo}' || 1,// 初始化当前页数
        INS_TOTAL = '${total}',
        FROM_NO = (PAGE_NO - 1) * 10,
        KEY_WORD = $("#search").val(),// 关键字
        SERCH_TYPE=3,
        SORT_TYPE=${order};

    // 初始化
    (function () {
        navDropDownList();
        initDropdown();
        initFilterEvent();
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

    // 初始化筛选事件
    function initFilterEvent() {

        $(".normal > div > span,.normal > div > button").on("click", function () {
            // 处理价格筛选
            if ($.trim($(this).text()) === '确定') {
                if ($("#lowPrice").val() === '' && $("#hightPrice").val() === '') {
                    return false;// 未输入价格时不跳转
                }
            }

            // 处理跳转前筛选框样式
            $(this).parent().find("span").removeClass("actived");
            $(this).addClass("actived");


            PAGE_NO = 1;// 查询条件变化，默认查第一页
            var labelArr = [];
            labelArr = dealUrlFilterParams();// 处理参数
            // 处理更新已选条件
            if (labelArr.length > 0) {

                var $box = $("<div></div>");
                $.each(labelArr, function (index, value) {
                    var curItem = $('<span data-type=' + value.type + '>' + value.txt + '<i class="lab-close-1"></i></span>');
                    $box.append(curItem);
                })
                $box.append('<s onclick="clearAllFilter()" class="clear_label"> <i class="lab-del"></i>清空选项 </s>');
                $("#checkedLabel").empty();
                $("#checkedLabel").html($box.html());

            } else {
                $("#checkedLabel").html('<span style="">不限</span>');
            }
            SERCH_TYPE=3;
            toGoodsList();
        })

    }

    /**
     * 列表页，处理各种筛选参数
     */
    function dealUrlFilterParams() {

        KEY_WORD = $("#search").val();// 重新获取关键字
        // 筛选：地区
        var district = $("#district").find("span.actived").text();

        // 更新：URL参数
        var labelArr = [];
        if (district !== '不限') {
            labelArr.push({
                txt: district,
                type: "district"
            })
            CUR_DISTRICT = district;
        }

        var address = $("#adCurrent").text();
        dealCity(address);// 处理直辖市

        return labelArr;
    }

    // 初始化页面分页
    showPages(INS_TOTAL, FROM_NO, 10, function (from, max) {
            PAGE_NO = from / 10 + 1;
            dealUrlFilterParams();
            SERCH_TYPE=3;
            toGoodsList();
        }, "page_container"
    )

    function initCurAdd() {

    }

    /**
     * 初始化城市下拉列表
     */
    function initDropdown() {

        var urlAddress = null, currentAddress = null;
        <c:choose>
        <c:when test='${("".equals(province) || province == null) && city !=null }'>
        urlAddress = "${city}";
        </c:when>
        <c:when test='${("".equals(city) || city == null) && province != null}'>
        urlAddress = "${province}";
        </c:when>
        <c:otherwise>
        urlAddress = null;
        </c:otherwise>
        </c:choose>

        // 地址處理：优先看url地址，其次看缓存，再其次看定位
        if (urlAddress != null) {

            if (urlAddress === "") {
                currentAddress = "全国";
            } else if (urlAddress.slice(-1) === "市") {
                currentAddress = urlAddress.slice(0, -1);
            } else {
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

        if ($("#listContent").length > 0) {
            initDistrict();
            PAGE_NO = 1;// 查询条件变化，默认查第一页
            dealUrlFilterParams();
            SERCH_TYPE=3;
            toGoodsList();
        }

    }

    /**
     * 导航下拉列表
     */
    function navDropDownList() {
        dropDownFn({"box": $('#dorpBox'), "target": $('#adCurrent'), "list": $('#dorpDown')});
    }


    function initDistrict() {
        // 初始化区
        $("#district > span").removeClass("actived");
        $("#district > span").eq(0).addClass("actived");
    }


    function clearAllFilter() {
        initDistrict()
        PAGE_NO = 1;
        dealUrlFilterParams();
        SERCH_TYPE=3;
        toGoodsList();
    }

    function clearCurFilter($_this) {
        var $_this = $($_this);
        var type = $_this.data("type");
        $_this.append().parent().remove();
        if (type == 'district') {
            initDistrict();
        }
        if (type == 'insServiceType') {
            initInsServiceType();
        }
        if (type == 'priceFilter') {
            initPriceFilter();
        }
        if (type == 'category1') {
            initCategory1();
        }
        if (type == 'category2') {
            initCategory2()
        }

        PAGE_NO = 1;
        dealUrlFilterParams();
        SERCH_TYPE=3;
        toGoodsList();
    }

    /**
     * 跳转高级搜索页面
     */
    function toKejso() {

        var keyword = $("#search").val();
        if (keyword === "") {
            keyword = "仪器"
        }

        keyword = encodeURI(keyword);
        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/</g, "%3c");
        keyword = keyword.replace(/>/g, "%3e");

        var URL = '${rlab}/front/superSearch/search?flag=2&query=' + keyword;
        window.open(URL);

    }
    function toSearchFromSuper(keywords,flag) {
        if(flag==1){
            //1服务
            var URL = BASE_URL + "/service/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }else if(flag==2){
            //2仪器
            var URL = BASE_URL + "/instrument/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }else{
            //3机构
            var URL = BASE_URL + "/org/query?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }
//        var URL = BASE_URL + "/org/query?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";

        var address = getCurremtAdress();
        if (address !== -1) {
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
                    CUR_CITY = address;
                }
            }


            if (CUR_PROVINCE !== null) {
                // province
                // formData.province = CUR_PROVINCE;
                URL = URL + "&province=" + CUR_PROVINCE
            }

            if (CUR_CITY !== null) {
                // city
                // formData.city = CUR_CITY;
                URL = URL + "&city=" + CUR_CITY
            }
        }

        window.open(URL);
    }
    $(".sort a").on("click",function () {
        SORT_TYPE=$(this).data("sortType");
        dealUrlFilterParams();
        toGoodsList();
    })
    function goorg($this) {
        $this=$($this);
        window.location.href = "${rlab}/org/" + $this.data("mapId");
    }
</script>
</body>
</html>
