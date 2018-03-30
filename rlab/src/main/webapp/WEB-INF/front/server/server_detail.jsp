<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/10/20 0020
  Time: 15:38
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
    <%--jquer相关--%>
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script type="text/javascript">
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_280x280.jpg")
        }

    </script>
    <%--layer--%>
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20170905">
    <%--<link rel="stylesheet" href="${rlab}/front/css/goods_detail.css?v_=20170622">--%>
    <link rel="stylesheet" href="${rlab}/front/css/ins_detail.css?v_=20170905">

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
    <style>
        .ins_detail .info .ins_info {
            padding: 30px 25px;
        }
        .trait{
            display: block;
            float: left;
            padding: 0 10px;
            border: 1px solid #588eff;
            color: #588eff;
            margin-bottom: 5px;
            margin-right: 5px;
            border-radius: 2px;
        }
        #head{
            margin-bottom: 35px!important;
        }
        .tp1{
            background-color: #8cc932;
        }
        .tp2{
            background-color: #0cbcef;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="${flag=='zhiliang'?'6':flag=='keyan'?'3':''}"/>
    </jsp:include>
    <!--详情模块-->
    <div class="ins_detail">
        <%--仪器和机构信息--%>
        <div class="info clearfix">
            <div class="ins_info br_4">

                <div class="clearfix">
                    <div class="ins_img">
                        <ul id="imgeList">
                            <c:choose>
                                <c:when test="${serviceInfo.servicePics == null || serviceInfo.servicePics.size() == 0}">
                                    <li>
                                        <img onerror="imgOnError(this)"
                                             src="${rlab}/common/common_img/default/ins_280x280.jpg" alt="商品默认图片">
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${serviceInfo.servicePics}" var="item">
                                        <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${fn:substringBefore(item, "?")}" target="_blank">
                                                    <img onerror="imgOnError(this)" src="${item}500_500" alt="商品图片1">
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${item}" target="_blank">
                                                    <img onerror="imgOnError(this)" src="${item}" alt="商品图片2">
                                                </a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                        <div class="num">
                            <c:if test="${serviceInfo.servicePics != null && serviceInfo.servicePics.size() > 1}">
                                <c:forEach items="${serviceInfo.servicePics}" var="item" varStatus="status">
                                    <span class='${status.index == 0?"cur":""}'></span>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="ins_txt">
                        <h4 style="margin-bottom: 25px"><a title="${serviceInfo.serviceName}">${serviceInfo.serviceName.length() > 25? serviceInfo.serviceName.substring(0,25).concat('...') :serviceInfo.serviceName}</a></h4>
                        <div class="p">
                            <span>服务编号：</span>
                            <div>
                                ${serviceInfo.serviceId}
                            </div>
                        </div>
                        <div class="p">
                            <span>所在地区：</span>
                            <div>
                                <c:choose>
                                    <c:when test="${empty serviceInfo.serviceProvince||serviceInfo.serviceProvince=='未知'}">
                                        未知
                                    </c:when>
                                    <c:otherwise>
                                        ${serviceInfo.serviceCity}${serviceInfo.serviceDistrict}
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="p">
                            <span>服务热线：</span>
                            <div>
                                400-102-9559
                            </div>
                        </div>
                        <div class="p" style="margin-top: 15px">
                            <div>
                                <c:forEach items="${serviceInfo.serviceFeature}" var="feature">
                                    <i class="trait">${feature}</i>
                                </c:forEach>
                            </div>
                            <span>服务特点：</span>
                        </div>
                        <div class="p" style="margin-top: 5px">
                            <span>服务资质：</span>
                            <div class="ins_feature">
                                <c:forEach items="${serviceInfo.serviceCredit}" var="credit">
                                    <c:choose>
                                        <c:when test="${fn:length(credit) == 4}">
                                            <i class="tp2">${credit}</i>
                                        </c:when>
                                        <c:when test="${fn:length(credit) == 3}">
                                            <i class="tp1">${credit}</i>
                                        </c:when>
                                        <c:otherwise>
                                            <i class="tp1">${credit}</i>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <div>
                            <a class="maapp" onclick="maapp()" style="margin-top: 6px">立即预约</a>
                            <div class="refer" style="float: left;margin-left: 20px;">
                            <c:choose>
                                <c:when test="${serviceInfo.servicePrice.flag == 1}">
                                    <c:if test='${"无".equals(serviceInfo.servicePrice.unit)}'>
                                        ¥<span style="font-size: 26px">${serviceInfo.servicePrice.accPrice}</span>
                                    </c:if>
                                    <c:if test='${!"无".equals(serviceInfo.servicePrice.unit)}'>
                                        ¥<span style="font-size: 26px">${serviceInfo.servicePrice.accPrice}</span>/${serviceInfo.servicePrice.unit}

                                    </c:if>
                                </c:when>
                                <c:when test="${serviceInfo.servicePrice.flag  == 2}">
                                    <c:if test='${serviceInfo.servicePrice.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(serviceInfo.servicePrice.unit)}'>
                                            ¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeLowPrice}</span>起
                                        </c:if>
                                        <c:if test='${!"无".equals(serviceInfo.servicePrice.unit)}'>
                                            ¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeLowPrice}</span>/${serviceInfo.servicePrice.unit}起
                                        </c:if>
                                    </c:if>
                                    <c:if test='${!serviceInfo.servicePrice.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(serviceInfo.servicePrice.unit)}'>
                                            ¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeLowPrice}</span>-¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeHighPrice}</span>

                                        </c:if>
                                        <c:if test='${!"无".equals(serviceInfo.servicePrice.unit)}'>
                                            ¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeLowPrice}</span>-¥<span style="font-size: 26px">${serviceInfo.servicePrice.scopeHighPrice}</span>/${serviceInfo.servicePrice.unit}
                                        </c:if>
                                    </c:if>
                                </c:when>
                                <c:when test="${serviceInfo.servicePrice.flag  == 3}">
                                    <span style="font-size: 26px">面议</span>
                                </c:when>
                            </c:choose>
                            <%--<p class="money">${serviceInfo.servicePrice.remark}</p>--%>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="org_info br_4" style="position: relative">
                <div class="clearfix">
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
                </div>
                <p class="img" style="position: relative;">
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
                        <i class="lab-renzheng_1"
                           style="color: #f4af71;font-size: 12px;position: absolute;top: 0;font-size: 20px;top: -5px;left: 180px;background: white;border-radius: 10px;"></i>
                    </c:if>

                </p>
                <p class="org_name">
                    <a href="${rlab}/org/${orgInfo.orgOid}" target="_blank">
                        ${orgInfo.orgName.length() > 20? orgInfo.orgName.substring(0,18).concat('...') :orgInfo.orgName}
                    </a>
                </p>
                <p style="position: absolute;bottom: 40px;width: 100%">
                    <%--${detail.conId.conPhone}--%>
                    <c:choose>
                        <c:when test="${sessionScope.uid != null}">
                            <button onclick="showOrgInfoModal(this)"
                                    class="init-btn bg-blue"
                                    type="button"
                                    data-org-name="${orgInfo.orgName}"
                                    data-org-province="${orgInfo.orgAddress.orgAddrProvince}"
                                    data-org-city="${orgInfo.orgAddress.orgAddrCity}"
                                    data-org-district="${orgInfo.orgAddress.orgAddrDistrict}"
                                    data-org-street="${orgInfo.orgAddress.orgAddrStreet}"
                                    data-org-phone="${orgInfo.orgContacts.conPhone}"
                                    data-org-ins-phone='[
                                    <c:forEach items="${serviceInfo.serviceContacts}" var="item" varStatus="status">
                                        <c:choose>
                                            <c:when test="${!status.last}">
                                                {"phone":"${item.conPhone}","name":"${item.conName}"},
                                            </c:when>
                                            <c:otherwise>
                                                {"phone":"${item.conPhone}","name":"${item.conName}"}
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    ]'
                            >查看机构联系方式
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="logins()" class="init-btn bg-blue" type="button">查看机构联系方式</button>
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="tip" style="position: absolute;bottom: 10px;width: 100%">
                    机构的联系方式登录后可以查看
                </p>
            </div>
        </div>
        <%--核心参数--%>
        <%--<c:if test="${detail.insCoreParam != null &&  detail.insCoreParam.size() > 0}">--%>
            <%--<div class="ins_core br_4">--%>
                <%--<h4>核心参数</h4>--%>
                <%--<div class="tb left br_6">--%>
                    <%--<c:forEach items="${detail.insCoreParam}" var="coreParam" varStatus="status">--%>
                        <%--<c:if test="${status.index <= detail.insCoreParam.size()/2 || detail.insCoreParam.size() == 1}">--%>
                            <%--<p class="tr">--%>
                                <%--<span title="${coreParam.title}">${coreParam.title}</span>--%>
                                <%--<a href="javascript:void(0);"--%>
                                   <%--title="${coreParam.content}">${coreParam.content.length() > 16? coreParam.content.substring(0,16).concat('...') :coreParam.content}</a>--%>
                            <%--</p>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                <%--</div>--%>

                <%--<div class="tb right br_6">--%>
                    <%--<c:forEach items="${detail.insCoreParam}" var="coreParam" varStatus="status">--%>
                        <%--<c:if test="${status.index > detail.insCoreParam.size()/2 &&  detail.insCoreParam.size() > 1}">--%>
                            <%--<p class="tr">--%>
                                <%--<span title="${coreParam.title}">${coreParam.title}</span>--%>
                                <%--<a href="javascript:void(0);" title="实验室">${coreParam.content}</a>--%>
                            <%--</p>--%>
                        <%--</c:if>--%>
                    <%--</c:forEach>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</c:if>--%>
        <%--简介--%>
        <div class="goods_intro" style="margin-bottom: 100px;">
            <div class="intro_title">
                详情简介
            </div>

            <div class="item">
                <h3 class="item_title">服务简介：</h3>
                <p class="item_txt">
                    ${empty serviceInfo.serviceDes?"数据更新中":serviceInfo.serviceDes}
                </p>
            </div>
            <%--<div class="item">
                <h3 class="item_title">适用领域：</h3>
                <p class="item_txt">
                    <c:forEach items="${serviceInfo.serviceScope}" var="scope">${scope}、</c:forEach>
                </p>
            </div>--%>
            <div class="item">
                <h3 class="item_title">使用设备：</h3>
                <p class="item_txt">
                    <c:forEach items="${serviceInfo.serviceMachine}" var="machine">${machine}、</c:forEach>
                </p>
            </div>
            <div class="item">
                <h3 class="item_title">依据方法：</h3>
                <p class="item_txt">
                    ${empty serviceInfo.serviceMethod?"数据更新中":serviceInfo.serviceMethod}
                </p>
            </div>
            <div class="item">
                <h3 class="item_title">服务周期：</h3>
                <p class="item_txt">
                    ${empty serviceInfo.servicePeriod?"数据更新中":serviceInfo.servicePeriod}
                </p>
            </div>
            <div class="item">
                <h3 class="item_title">报价说明：</h3>
                <p class="item_txt">
                    ${empty serviceInfo.servicePrice.remark?"数据更新中":serviceInfo.servicePrice.remark}
                </p>
            </div>
            <div class="item">
                <h3 class="item_title">其他备注：</h3>
                <p class="item_txt">
                    ${empty serviceInfo.serviceNote?"数据更新中":serviceInfo.serviceNote}
                </p>
            </div>

        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script src="${rlab}/front/js/util/baiduMap.js?v_=20170905"></script>
<%--<script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h" type="text/javascript"></script>--%>
<script>

    chuantong(300, 4000, 324);

    // 轮播
    function chuantong(speed, intervalTime, width) {

        //全局变量
        var nowimg = 0;		//信号量，当前显示的图片序号
        //得到图片的总数量
        var imageAmount = $("#imgeList li").length;

        // 克隆第一张图片，然后追加到最后一张去
        if (imageAmount > 1) {

            $("#imgeList li:first").clone().appendTo("#imgeList");
            //得到所有元素，给变量名之前加$，是个约定。一眼就能知道，这个变量存放着jQuery元素。
            var $imagesList = $("#imgeList");
            var $circles = $(".num span");
            console.log($circles);
            //右按钮的事件
            $(".rightBtn").click(rightBtnFunc);	//有名函数，不要加圆括号！！

            // 我们把右按钮要做的事情，单独提炼出一个函数。起名字。
            // 这么做的原因，是为了定时器的调用。
            function rightBtnFunc() {

                if (!$imagesList.is(":animated")) {
                    // 分类讨论，现在到底到没到最后一张
                    if (nowimg < imageAmount - 1) {
                        nowimg++;
                        //普通运动，拉到第nowimg这张图片上
                        normalAnimate();	//调用函数，普通运动
                    } else {
                        nowimg = 0;
                        //往第5张（假0）身上拉，然后瞬间切换到0。
                        $imagesList.animate({"left": imageAmount * -width}, speed, "linear", function () {
                            //回调函数
                            $(this).css("left", 0);	//css是瞬间的
                        });
                    }
                    changeCircle();	//调用函数，小圆点
                }
            }

            //左按钮
            $(".leftBtn").click(function () {

                if (!$imagesList.is(":animated")) {
                    //分类，判断现在是不是到头了
                    if (nowimg > 0) {
                        nowimg--;
                        normalAnimate();	//调用函数，普通运动
                    } else {
                        nowimg = imageAmount - 1;
                        //到头了，让假0替换真0
                        $imagesList.css("left", imageAmount * -width);
                        normalAnimate();	//调用函数，普通运动
                    }
                    changeCircle();	//调用函数，小圆点
                }

            });

            //小圆点的点击
            $(".num span").click(function () {
                if (!$imagesList.is(":animated")) {
                    nowimg = $(this).index();
                    //  setBigSrc(nowimg);// 更新放大镜大图
                    normalAnimate();//调用函数，普通运动
                    changeCircle();	//调用函数，小圆点
                }
            });

            // 普通运动，让火车往信号上拉
            function normalAnimate() {
                $imagesList.animate({"left": nowimg * -width}, speed, "linear");
            }

            //小圆点函数，让信号量那个小圆点有cur，其余没有cur
            function changeCircle() {
                $circles.eq(nowimg).addClass("cur").siblings().removeClass("cur");
            }

            //定时器的业务
            var timer = setInterval(rightBtnFunc, intervalTime);

            //鼠标进入，停止
            $(".carousel").mouseenter(function () {
                clearInterval(timer);
            });

            //鼠标离开，继续
            $(".carousel").mouseleave(function () {
                clearInterval(timer);
                timer = setInterval(rightBtnFunc, intervalTime);
            });

        }


    }

    // 设置百度地图
    function setBaiduMap(adress) {
        loadJScriptMove(adress, 0, 0);
    }


    //    if (MAP_CONFIG.ADDRESS != undefined && MAP_CONFIG.ADDRESS !== "" && MAP_CONFIG.ADDRESS != null) {
    //        try {
    //            searchByStationName(map, MAP_CONFIG.ADDRESS);
    //        } catch (e) {
    //            searchByStationName(map, '中国');
    //        }
    //    } else {
    //        searchByStationName(map, '中国');
    //    }

    /**
     * 查看机构信息
     */
    function showOrgInfoModal($_this) {
        var $_this = $($_this);
        var data = $_this.data();

        var html =
            '<div class="company_info">\
                <div style="padding: 0 50px;">\
                    <div class="title">\
                        <div>\
                            <h6>持有机构</h6>\
                            <span>联系我时请说明是从人人实验看到的信息呦！</span>\
                        </div>\
                        <p>' + data.orgName + '</p>\
                          <i id="closeLayerInfo" class="lab-close-1"></i>\
                    </div>\
                    <div class="org_infos">\
                        <p class="org_add">\
                        <i class="lab-adress"></i><span>' + data.orgProvince + data.orgCity + data.orgCity + data.orgDistrict + data.orgStreet + '</span>\
                        </p>\
                        <div class="org_phone">\
                        <i class="lab-phone"></i>\
                        <span >\
                        <s>办公电话</s>400-102-9559</span>\
                        <p id="userPhone" style="overflow: hidden;">\
                        </p>\
                    </div>\
                    </div>\
                    <div class="baidu_map">\
                    <div class="baidumap" id="baidumap" style="height: 187px;">\
                    </div>\
                    </div>\
                    </div>\
                    <div class="compay_infos bg-blue">\
                    <div class="about_me">\
                    <img src="http://www.renrenlab.com/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="人人实验服务号二维码">\
                    </div>\
                    <div class="txt">\
                    <p>如您有其他需要，您可以关注</p>\
                <p>人人实验服务号，咨询人工客服</p>\
                </div>\
                </div>\
                </div>';

        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        try {
            setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}');
        } catch (e) {
            setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}');
        }

//        var map = initMap();
//        searchByStationName(map, data.orgStreet);

//        for (var i = 0; i < data.orgInsPhone.length; i++) {
//            $("#userPhone").append('<span style="float: left;">\
//                                <s>' + data.orgInsPhone[i].name + '</s>\
//                                <em>' + data.orgInsPhone[i].phone + '</em>\
//                            </span>');
//        }

        $("#closeLayerInfo").off("click").on("click", function () {
            layer.close(layer_info);
        })

    }
    /**
     * 立即预约
     */

    function maapp() {
        var html= '<div class="maappCmp">\
                        <h3>在线咨询</h3>\
                        <img src="${rlab}/front/imgs/3.0/lablogintop.png" alt="">\
                        <label class="lab-close-1"></label>\
                        <p style="margin-top: 25px;">联系人<i>*</i></p>\
                        <input type="text" id="contactName">\
                        <p>联系电话<i>*</i></p>\
                        <input type="text" id="contactPhone">\
                        <p>留言备注<i>*</i></p>\
                        <textarea name="" id="contactContent" cols="30" rows="10" placeholder="150字之内" maxlength="150"></textarea>\
                        <a onclick="subtext()">提交信息</a>\
                        <span>温馨提示：成功提交留言信息后，客服人员会第一时间给您满意答复，感谢您对人人实验的信赖！</span>\
                    </div>';
        //页面层-自定义
        var layer_info1 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });
        $(".maappCmp label").off("click").on("click", function () {
            layer.close(layer_info1);
        })
    }
    function subtext() {
        if($("#contactName").val()==''){
            alert("联系人不能为空");
            return;
        }
        if($("#contactPhone").val()==''){
            alert("联系电话不能为空");
            return;
        }
        if($("#contactContent").val()==''){
            alert("留言备注不能为空");
            return;
        }
        var contactContent=$("#contactContent").val()
        var data={
            productId:${serviceInfo.serviceId},
            productName : '${serviceInfo.serviceName}',
            productType : 1,
            contactName : $("#contactName").val(),
            contactPhone : $("#contactPhone").val(),
            contactContent: contactContent,
        }
        data= JSON.stringify(data);
        $.ajax({
            url: BASE_URL + '/front/leavemessage/addMessage',
            type: 'POST',
            dataType: "json",
            data:data,
            contentType: "application/json",
            async: true,
            beforeSend: function () {
                GET_AJAX_FLAG = false;
            },
            success: function (data) {
                alert("提交成功");
                location.reload();
            },
            error: function () {
                GET_AJAX_FLAG = true;
            }
        })
    }


</script>
</body>
</html>

