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

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">


    <script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
    <script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>

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

        /*END 内容部分公用样式*/

        /*START 服务，控制部分*/
        .svc_panel {
            overflow: hidden;
        }

        .svc_panel > div {
            float: left;
            overflow: hidden;
        }

        /*.搜索框*/
        .svc_panel .svc_sc {
            width: 370px;
            height: 48px;
            border-radius: 2px 2px 2px 2px;
            border: 1px solid #a2c2f7;
            position: relative;
            overflow: hidden;
            margin-right: 12px;
        }

        .svc_panel .svc_sc input {
            width: 324px;
            height: 46px;
            line-height: 46px;
            border: 0 none;
            outline: 0 none;
            position: absolute;
            padding-left: 14px;
            font-size: 16px;
            color: #333;
            left: 0;
            top: 0;
            top: 0;
        }

        .svc_panel .svc_sc span {
            display: block;
            float: right;
            width: 42px;
            border-left: 1px solid #eee;
            height: 48px;
            line-height: 46px;
            text-align: center;
            cursor: pointer;
        }

        .svc_panel .svc_sc span i {
            color: #000;
            font-size: 16px;
        }

        .svc_panel .svc_sc span:active {
            background-color: #eee;
        }

        /*日期*/
        .svc_date {
            width: 262px;
            color: #333;
            font-size: 16px;
            border: 1px solid #a2c2f7;
            float: left;
            height: 48px;
            -webkit-border-radius: 2px;
            -moz-border-radius: 2px;
            border-radius: 2px;
        }

        .svc_date button {
            height: 46px;
            width: 260px;
            outline: 0 none;
            border: 0 none;
            line-height: 48px;
            color: #333;
            background: #fff;
        }

        .svc_date button i {
            font-size: 20px;
            font-weight: 700;
            color: #508DF0;
            position: relative;
            right: -8px;
        }

        .svc_btn {
            margin-left: 12px;
        }

        .svc_btn button {
            float: left;
            height: 48px;
            width: 108px;
            line-height: 46px;
            outline: 0 none;
            border: 0 none;
            font-size: 16px;
        }

        .show_all_btn {
            background: #edf4ff;
            border-radius: 2px 2px 2px 2px;
            border: 1px solid #a2c2f7 !important;
            color: #508DF0;
            margin-right: 14px;
        }

        .show_all_btn:active {
            background: #d9e7fc;
        }

        .put_service_btn {
            background: #508DF0;
            border-radius: 2px 2px 2px 2px;
            color: #fff;
        }

        .put_service_btn a {
            color: #fff;
        }

        .put_service_btn:active {
            background: #3e72c0;
        }

        /*END 服务，控制部分*/

        /*START 服务头部*/

        .list_header {
            margin-top: 19px;
        }

        .w1 {
            display: block;
            width: 64px;
            border-right: 1px solid #f4f4f4;
        }

        .w2 {
            display: block;
            width: 171px;
            border-right: 1px solid #f4f4f4;
        }

        .w3 {
            display: block;
            width: 109px;
            border-right: 1px solid #f4f4f4;
        }

        .w4 {
            display: block;
            width: 105px;
            border-right: 1px solid #f4f4f4;
        }

        .w5 {
            display: block;
            width: 154px;
            border-right: 1px solid #f4f4f4;
        }

        .w6 {
            display: block;
            width: 76px;
            border-right: 1px solid #f4f4f4;
        }

        .w7 {
            display: block;
            width: 208px;
        }

        .list_header .w1, .list_header .w2, .list_header .w3, .list_header .w4, .list_header .w5, .list_header .w6, .list_header .w7 {
            border-right: 1px solid #4c87e5;
        }

        .list_header > span, ul.svc_list > li > span {
            float: left;
            height: 50px;
            line-height: 50px;
            text-align: center;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }

        .list_header > span {
            background-color: #508df0;
            color: #fff;
            font-size: 14px;
        }

        ul.svc_list {
            /*overflow: hidden;*/
        }

        ul.svc_list > li span {
            font-size: 13px;
            color: #333;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        ul.svc_list > li button {
            font-size: 13px;
            color: #333;
            outline: 0 none;
            border: 0 none;
            background-color: #fff;
        }

        ul.svc_list > li button:hover {
            text-decoration: underline;
        }

        ul.svc_list > li button.t1 {
            margin-left: 15px;
            width: 70px;
        }

        ul.svc_list > li button a {
            color: #333;
        }

        ul.svc_list > li button.t2 {
            width: 52px;
        }

        ul.svc_list > li button.t3 {
            width: 53px;
        }

        ul.svc_list > li {
            float: left;
            overflow: hidden;
        }

        ul.svc_list > li.even {
            background-color: #fafafa;
        }

        ul.svc_list > li.even button {
            background-color: #fafafa;
        }

        /*END 服务头部*/
        /*分页样式*/
        .paging {
            margin-top: 50px;
        }

        .paging .page_list {
            float: right;
        }

        .paging .page_list > li {
            float: left;
            list-style: none;
            text-indent: 0;
            /*width: 26px;*/
            min-width: 26px;
            max-width: 50px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
            margin-left: 5px;
            margin-right: 5px;
        }

        .paging .page_list > li a {
            color: #7a7a7a;
        }

        .paging .page_list > li.active a {
            color: #508df0;
        }

        .paging .page_list > li:active a {
            color: #508df0;
        }

        .paging .page_list > button {
            float: left;
            outline: 0 none;
            border: 0 none;
            width: 30px;
            height: 30px;
            font-size: 10px;
            color: #508df0;
            text-align: center;
            line-height: 30px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            cursor: pointer;
        }

        .paging .page_list > button:active {
            background: #508DF0;
            color: #fff;
        }

        .paging .page_list > button.disabled:active {
            background: #fff;
            color: #b5b5b5;
        }

        .paging .page_list > button.disabled {
            color: #b5b5b5;
        }

        /*筛选框*/
        .all_btn {
            position: relative;
            z-index: 2;
        }

        .all_btn:hover {
            box-shadow: 0px 0px 12px 0px rgba(11, 5, 8, 0.15);
        }

        ul.all_slide {
            position: absolute;
            z-index: 20;
            box-shadow: 0px 0px 12px 0px rgba(11, 5, 8, 0.15);
            background: #fff;
        }

        ul.all_slide li {
            display: block;
            width: 76px;
            height: 28px;
            line-height: 28px;
            border-bottom: 1px solid #fafafa;
            color: #333;
        }

        ul.all_slide li.cur {
            color: #508DF0;
        }

        ul.all_slide li:hover {
            opacity: 0.5;
        }

        .updateDate {
            position: relative;
            z-index: 1;
        }

        .updateDate:active {
            box-shadow: 0px 0px 12px 0px rgba(11, 5, 8, 0.15);
            z-index: 3;
        }

        /*placeholder提示覆盖*/
        .svc_panel .svc_sc SPAN.placehodle {
            width: auto !important;
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
            <div class="svc_panel">
                <%--搜索框--%>
                <div class="svc_sc">
                    <input id="shareInsKeyword" type="text" placeholder="服务编号/服务名称"
                           value="<c:out value="${keyword}" escapeXml="true"/>" escapeXml="true">
                    <span onclick="searchData()">
                         <i class="lab-search"></i>
                    </span>
                </div>
                <%--选择日期--%>
                <div class="svc_date">
                    <button type="button" class="" id="daterange-btn">
                            <span>
                              请选择日期
                            </span>
                        <%--<i class="fa fa-caret-down"></i>--%>
                        <i class="layui-icon date_icon">&#xe637;</i>
                    </button>
                </div>
                <div class="svc_btn">
                    <button onclick="showAll()" class="show_all_btn" type="button">显示所有</button>
                    <button onclick="toServiceAddPage()" class="put_service_btn" type="button">
                        上传服务
                    </button>
                </div>
            </div>
            <div class="clearfix list_header">
                <span class="w1">编号</span>
                <span class="w2">服务名称</span>
                <span class="w3">机构名称</span>
                <span class="w4">参考价格</span>
                <span id="updateDate" class="w5 updateDate" style="cursor: pointer;" onclick="timeSwich()">
                    更新时间
                    <i class="lab-order_1" style="margin-left: 5px;font-size: 12px;"></i>
                </span>
                <span id="allBtn" class="w6 all_btn" style="cursor: pointer;">
                    <div id="states" class="state">
                        <c:if test="${''.equals(state) || state == null}">
                            <span id="stateText">全部</span>
                        </c:if>
                       <c:if test="${state == 1}">
                           <span id="stateText">待审核</span>
                       </c:if>
                       <c:if test="${state == 0}">
                           <span id="stateText">已通过</span>
                       </c:if>
                       <c:if test="${state == 3}">
                           <span id="stateText">已拒绝</span>
                       </c:if>
                       <c:if test="${state == 4}">
                           <span id="stateText">已上架</span>
                       </c:if>
                        <c:if test="${state == 2}">
                            <span id="stateText">已下架</span>
                        </c:if>
                    <i id="up" class="lab-xiala_small_2" style="font-size: 12px;"></i>
                    </div>

                    <%--<i id="down" class="lab-shangla_small_3" style="font-size: 12px;position: relative;top: 1px;"></i>--%>
                    <ul id="allSildeBar" class="all_slide" style="display: none;">
                        <li onclick="changeSate(this)" data-state=""
                            class="${"".equals(state) || state == null ? 'cur':''}">全部</li>
                        <li onclick="changeSate(this)" data-state="1" class="${state == "1" ? 'cur':''}">待审核</li>
                        <li onclick="changeSate(this)" data-state="0" class="${state == "0" ? 'cur':''}">已通过</li>
                        <li onclick="changeSate(this)" data-state="3" class="${state == "3" ? 'cur':''}">已拒绝</li>
                        <li onclick="changeSate(this)" data-state="4" class="${state == "4" ? 'cur':''}">已上架</li>
                        <li onclick="changeSate(this)" data-state="2" class="${state == "2" ? 'cur':''}">已下架</li>
                    </ul>
                </span>
                <span class="w7">操作</span>
            </div>
            <ul class="svc_list clearfix">
                <c:forEach var="item" items="${infos.list}" varStatus="status">
                    <li class="${status.index%2 == 1?'even':''}">
                        <span class="w1">${item.serviceId}</span>
                        <span class="w2">${item.serviceName}</span>
                        <span class="w3">
                                ${item.orgName}
                        </span>

                        <span class="w4">
                            <c:if test="${item.servicePrice.flag == 1}">
                                ￥${item.servicePrice.accPrice} / ${item.servicePrice.unit}
                            </c:if>
                                <c:if test="${item.servicePrice.flag == 2}">
                                    <c:choose>
                                        <c:when test='${item.servicePrice.scopeHighPrice.equals("0")}'>
                                            ￥${item.servicePrice.scopeLowPrice}/${item.servicePrice.unit}起
                                        </c:when>
                                        <c:otherwise>
                                            ￥${item.servicePrice.scopeLowPrice}-￥${item.servicePrice.scopeHighPrice}/${item.servicePrice.unit}
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:if test="${item.servicePrice.flag == 3}">
                                    面议
                                </c:if></span>
                        <span class="w5">${item.modifyTimeStr}</span>
                        <span class="w6">${item.stateStr}</span>
                        <span class="w7" style="text-align:left">
                        <c:if test="${item.serviceState == 0}">
                            <button class="t1" type="button" onclick="toDetailPage(this)"
                                    data-service-id="${item.serviceId}">
                                查看详情
                            </button>
                            <button class="t2" type="button" onclick="toAlterPage(this)"
                                    data-service-id="${item.serviceId}">
                                修改
                            </button>
                            <button data-service-id="${item.serviceId}" class="t3" type="button"
                                    onclick="openService(this)">
                                开启
                            </button>
                            <c:if test="${state == 4}">
                                <button data-service-id="${item.serviceId}" class="t3" type="button"
                                        onclick="closeService(this)">
                                    关闭
                                </button>
                            </c:if>
                        </c:if>
                        <c:if test="${item.serviceState == 1}">
                            <button class="t1" type="button" onclick="toDetailPage(this)"
                                    data-service-id="${item.serviceId}">
                               查看详情
                            </button>
                            <button class="t2" type="button" onclick="toAlterPage(this)"
                                    data-service-id="${item.serviceId}">
                                修改
                            </button>
                        </c:if>
                        <c:if test="${item.serviceState == 2}">
                            <button class="t1" type="button" onclick="toDetailPage(this)"
                                    data-service-id="${item.serviceId}">
                                查看详情
                            </button>
                            <button class="t2" type="button" onclick="toAlterPage(this)"
                                    data-service-id="${item.serviceId}">
                                修改
                            </button>
                            <button data-service-id="${item.serviceId}" class="t3" type="button"
                                    onclick="openService(this)">开启</button>
                        </c:if>
                        <c:if test="${item.serviceState == 3}">
                            <button class="t1" type="button" onclick="toDetailPage(this)"
                                    data-service-id="${item.serviceId}">
                              查看详情
                            </button>
                            <button class="t2" type="button" onclick="toAlterPage(this)"
                                    data-service-id="${item.serviceId}">
                                修改
                            </button>
                        </c:if>
                        <c:if test="${item.serviceState == 4}">
                            <button class="t1" type="button" onclick="toDetailPage(this)"
                                    data-service-id="${item.serviceId}">
                                查看详情
                            </button>
                            <button class="t2" type="button" onclick="toAlterPage(this)"
                                    data-service-id="${item.serviceId}">
                               修改
                            </button>
                            <button data-service-id="${item.serviceId}" class="t3" type="button"
                                    onclick="closeService(this)">关闭</button>
                        </c:if>
                    </span>
                    </li>
                </c:forEach>
                <c:if test="${infos.list.size() <= 0}">
                    <div style="width: 100%;text-align: center">
                            <%--<img width="600px;" src="${rlab}/front/imgs/default_no_concat.png" alt="">--%>
                        <div style="margin-top: 50px;">
                            <img style="width: 180px;" src="${rlab}/front/imgs/empty-2.png" alt="">
                        </div>
                        <div style="color: #777;">
                            抱歉，您没有相关的服务
                        </div>
                    </div>
                </c:if>
            </ul>

            <%--START分页--%>
            <div class="paging" style="display: ${infos.total > 10? "block" : "none"}">
                <div id="page_container" class="page_list"></div>
            </div>
            <%--END分页--%>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<!--my common js-->
<script src="${rlab}/front/js/util/pagination.js?v_=20170905"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script>
    var layer;
    layui.use(['layer'], function () {
        layer = layui.layer;
    })
    var uid = '${sessionScope.uid}'
    controlSlide();
    // 控制状态筛选的下拉
    function controlSlide() {
        $("#allBtn").hover(function () {
            $("#allSildeBar").stop().slideDown(200);
        }, function () {
            $("#allSildeBar").stop().slideUp();

        })
    }

    /**
     * 跳转到添加服务页面
     */
    function toServiceAddPage() {
        var isCertification = '${isCertification}';
        if (isCertification === "true") {
            location.href = BASE_URL + "/user/service_upload_page";
        } else {
            layer.msg("您还没有创建服务机构");
        }

    }

    /**
     * 初始化分页
     */
        <%--var PAGE_NO = ${infos.pageNum == null ? 1:infos.pageNum},--%>
        <%--PAGE_SIZE = 10;--%>
    var keyword = '${keyword}', state = '${state}', beginTime = '${requestScope.get("beginTime")}',
        endTime = '${requestScope.get("endTime")}', pageNo = 1,
        pageSize = 10, order = '${order}';
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';

    showPages(${infos.total}, (${infos.pageNum}-1) * 10, pageSize, function (from, max) {
        pageNo = from / 10 + 1;
        // keyword = $("#shareInsKeyword").val();
        // beginTime = startDate;
        // endTime = endDate;
        toServiceList();
    }, "page_container");

    /**
     * 点击搜索
     */
    function searchData() {
        keyword = $("#shareInsKeyword").val();
        keyword = keyencode(keyword);// 获取关键字
        pageNo = 1;// 重置页码
        order = null;// 重置顺序
        state = '';// 重置状态
        toServiceList();
    }

    /**
     * 按时间排序切换
     */
    function timeSwich() {
        keyword = $("#shareInsKeyword").val();
        keyword = keyencode(keyword);
        pageNo = 1;

        if (order == 'ASC') {
            order = null;
        } else {
            order = 'ASC';
        }
        toServiceList();
    }

    /**
     * 切换状态
     */
    function changeSate($this) {
        console.log("changeSate");
        var $this = $($this);
        var curState = $this.data("state");
        $this.parent().find("li").removeClass("cur");
        $this.addClass("cur");
        $("#stateText").text($this.text());
        $("#allSildeBar").hide();
        state = curState;
        pageNo = 1;// 重置
        toServiceList();
    }
    /**
     * 跳转列表页面（所有参数拼接）
     */
    function toServiceList() {
        var url = BASE_URL + '/user/service_list?keyword=' + keyword + '&state=' + state + '&beginTime=' + beginTime + '&endTime=' + endTime + '&pageNo=' + pageNo + '&pageSize=' + pageSize;

        if (order !== null && order != "") {
            url += "&order=" + order;
        }

        window.location.href = url;

    }
    initDateForm();// 初始化时间组件
    /**
     * 初始化日期表单
     */
    function initDateForm() {
        var curStartDate = '2017-10-01';
        var curEndDate = moment().format('YYYY-MM-DD');

        if (startDate != "") {
            curStartDate = startDate;
        }
        if (endDate != "") {
            curEndDate = endDate;
        }

        $('#daterange-btn').daterangepicker({
//                startDate: moment().subtract(7, "days").format('YYYY-MM-DD'),
                startDate: curStartDate,
                endDate: curEndDate,
                minDate: '2015-10-24',
                maxDate: new Date()
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
                beginTime = start.format('YYYY-MM-DD');
                endDate = end.format('YYYY-MM-DD');
            }
        );

        $('#daterange-btn span').html(curStartDate.split("-").join("/") + ' - ' + curEndDate.split("-").join("/"));
    }
    function showAll() {
        window.location.href = '${rlab}/user/service_list';
    }
    function keyencode(key) {
        var keyword_input = key
        keyword_input = encodeURI(keyword_input);
        keyword_input = keyword_input.replace(/\\$/g, "%24");
        keyword_input = keyword_input.replace(/\+/g, "%2B");
        keyword_input = keyword_input.replace(/#/g, "%23");
        keyword_input = keyword_input.replace(/&/g, "%26");
        keyword_input = keyword_input.replace(/@/g, "%40");
        keyword_input = keyword_input.replace(/\//g, "%2f");
        keyword_input = keyword_input.replace(/;/g, "%3b");
        keyword_input = keyword_input.replace(/\?/g, "%3f");
        keyword_input = keyword_input.replace(/'/g, "%27");
        return keyword_input;
    }

    /**
     * 开启服务
     */
    function openService($this) {
        var params = {
            serviceId: $($this).data("serviceId"),
            serviceState: 4
        }
        updateState(params, function (data) {
            console.log(data)
            if (data.code === 0) {
                location.reload();
            }
        })
    }

    /**
     * 关闭服务
     */
    function closeService($this) {
        var params = {
            serviceId: $($this).data("serviceId"),
            serviceState: 2
        }
        updateState(params, function (data) {
            console.log(data)
            if (data.code === 0) {
                location.reload();
            }
        })
    }

    /**
     * 更新状态（发送HTTP）
     */
    function updateState(param, success) {
        $.ajax({
            // url: BASE_URL + "/bg/org/OrgcertificateTmp/add?name=" + name,
            url: BASE_URL + "/user/change_state",
            type: 'post',
            data: JSON.stringify(param),
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {
                success(data);
            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        })
    }

    /**
     * 跳转到详情页面
     */
    function toDetailPage($this) {
        var serviceId = $($this).data("serviceId");
        window.location.href = BASE_URL + '/user/service_detail_page?serviceId=' + serviceId;
    }
    /**
     * 跳转到修改页面
     */
    function toAlterPage($this) {
        var serviceId = $($this).data("serviceId");
        window.location.href = BASE_URL + '/user/service_modify_page?serviceId=' + serviceId;
    }
</script>
</body>
</html>
