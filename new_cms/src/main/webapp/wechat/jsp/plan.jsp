<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <c:set var="contextPath"
    value="${pageContext.request.scheme}://${pageContext.request.serverName }:${pageContext.request.serverPort }${pageContext.request.contextPath }" />
<c:set var="path" value="${pageContext.request.contextPath }" /> --%>
<html lang="en" style="background-color: #ebebeb">
<head>
	<%@ include file="/common/taglibs.jsp"%>
	<meta charset="UTF-8">
	<title>推荐方案</title>
	<link rel="stylesheet"
		  href="${cms}/wechat/swiper-3.4.2/dist/css/swiper.min.css">
	<script
			src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
	<script src="${cms}/wechat/scripts/jquery-3.2.0.min.js"
			type="text/javascript"></script>
	<link rel="stylesheet" href="${cms}/wechat/css/plan.css">
	<script src="${cms}/wechat/swiper-3.4.2/dist/js/swiper.min.js"></script>
</head>
<body style="min-height: 13.33333rem">
<div id="tuijianPlan"></div>
<div id="left_button" class="left_button" style="display: none"><img style="vertical-align: middle; cursor: pointer" src="${cms}/wechat/img/arrowL.png">
</div>
<div id="right_button" class="right_button" style="display: none"><img style="vertical-align: middle; cursor: pointer"
																	   src="${cms}/wechat/img/arrow.png"></div>
<div id="slideBar" class="bottom">
	<div class="scheme" style="position: relative">
		<img class="slideBG" style="vertical-align: middle"
			 src="${cms}/wechat/img/home_bar.png"> <img class="point"
														src="${cms}/wechat/img/home_button.png">
		<div class="text">
			<!--<p>最佳匹配</p>-->
			<!--<p style="margin-left: 1.4rem;">距离最近</p>-->
		</div>
	</div>
</div>
<script>
    $(function () {
        getData();
    });
    var mySwiper;
    function renderSwiper(count) {
        console.log(4444);
        //翻译方案特色
        <c:forEach items="${schemes}" var="sch" varStatus="status">
        var f = ${sch.schFeature};
        switch(f){
            case 0:
                var str${status.index} = '<img src="${cms}/wechat/img/icon_best.png">最佳匹配方案';
                break;
            case 1:
                var str${status.index} = '<img src="${cms}/wechat/img/icon_short.png">距离最近方案';
                break;
            case 2:
                var str${status.index} = '<img src="${cms}/wechat/img/icon_good.png">评价最优方案';
                break;
            case 3:
                var str${status.index} = '<img src="${cms}/wechat/img/icon_cheap.png">价格最低方案';
                break;
            case 4:
                var str${status.index} = '<img src="${cms}/wechat/img/icon_fast.png">周期最短方案';
                break;
        }
        console.log(${status.index});
        console.log(str${status.index});
        </c:forEach>

        mySwiper = new Swiper('.swiper-container', {
            direction: 'horizontal',
            loop: false,
            // 如果需要分页器
            //            pagination: '.swiper-pagination',
            // 如果需要前进后退按钮
            nextButton: '.swiper-button-next',
            prevButton: '.swiper-button-prev',
            // 如果需要滚动条
            //            scrollbar: '.swiper-scrollbar',
            onSlideChangeStart: function (swiper) {
                console.log(swiper.activeIndex);
                $(".bottom .text p").css("color", "#999999");
                if (window.screen.width > 500) {
                    if (mySwiper.activeIndex == 0) {
                        $("#left_button").attr("style", "display: none");
                        $("#right_button").attr("style", "display: block");
                    } else if (mySwiper.activeIndex == count - 1) {
                        $("#left_button").attr("style", "display: block");
                        $("#right_button").attr("style", "display: none");
                    } else {
                        $("#left_button").attr("style", "display: block");
                        $("#right_button").attr("style", "display: block");
                    }
                    switch (count) {
                        case 5: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".plan_title p").html(str1);
                                    break;
                                case 2:
                                    $(".plan_title p").html(str2);
                                    break;
                                case 3:
                                    $(".plan_title p").html(str3);
                                    break;
                                case 4:
                                    $(".plan_title p").html(str4);
                            }
                        }
                            break;
                        case 4: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".plan_title p").html(str1);
                                    break;
                                case 2:
                                    $(".plan_title p").html(str2);
                                    break;
                                case 3:
                                    $(".plan_title p").html(str3);
                                    break;
                            }
                        }
                            break;
                        case 3: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".plan_title p").html(str0);
                                    console.log('------'+str0);
                                    break;
                                case 1:
                                    $(".plan_title p").html(str1);
                                    console.log('------'+str1);
                                    break;
                                case 2:
                                    $(".plan_title p").html(str2);
                                    console.log('------'+str2);
                                    break;
                            }
                        }
                            break;
                        case 2: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".plan_title p").html(str1);
                                    break;
                            }
                        }
                            break;
                    }
                } else {
                    switch (count) {
                        case 5: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".bottom .point").animate({"left": "0.4rem"}, 200, "swing");
                                    $(".bottom .text p").eq(0).css("color", "black");
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".bottom .point").animate({"left": "2.3rem"}, 200, "swing");
                                    $(".bottom .text p").eq(1).css("color", "black");
                                    $(".plan_title p").html(str1);
                                    break;
                                case 2:
                                    $(".bottom .point").animate({"left": "4.5rem"}, 200, "swing");
                                    $(".bottom .text p").eq(2).css("color", "black");
                                    $(".plan_title p").html(str2);
                                    break;
                                case 3:
                                    $(".bottom .point").animate({"left": "6.6rem"}, 200, "swing");
                                    $(".bottom .text p").eq(3).css("color", "black");
                                    $(".plan_title p").html(str3);
                                    break;
                                case 4:
                                    $(".bottom .point").animate({"left": "8.8rem"}, 200, "swing");
                                    $(".bottom .text p").eq(4).css("color", "black");
                                    $(".plan_title p").html(str4);
                            }
                        }
                            break;
                        case 4: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".bottom .point").animate({"left": "0.4rem"}, 200, "swing");
                                    $(".bottom .text p").eq(0).css("color", "black");
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".bottom .point").animate({"left": "3.1rem"}, 200, "swing");
                                    $(".bottom .text p").eq(1).css("color", "black");
                                    $(".plan_title p").html(str1);
                                    break;
                                case 2:
                                    $(".bottom .point").animate({"left": "5.9rem"}, 200, "swing");
                                    $(".bottom .text p").eq(2).css("color", "black");
                                    $(".plan_title p").html(str2);
                                    break;
                                case 3:
                                    $(".bottom .point").animate({"left": "8.8rem"}, 200, "swing");
                                    $(".bottom .text p").eq(3).css("color", "black");
                                    $(".plan_title p").html(str3);
                                    break;
                            }
                        }
                            break;
                        case 3: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".bottom .point").animate({"left": "2.3rem"}, 200, "swing");
                                    $(".bottom .text p").eq(0).css("color", "black");
                                    $(".plan_title p").html(str0);
                                    console.log('------'+str0);
                                    break;
                                case 1:
                                    $(".bottom .point").animate({"left": "4.6rem"}, 200, "swing");
                                    $(".bottom .text p").eq(1).css("color", "black");
                                    $(".plan_title p").html(str1);
                                    console.log('------'+str1);
                                    break;
                                case 2:
                                    $(".bottom .point").animate({"left": "6.9rem"}, 200, "swing");
                                    $(".bottom .text p").eq(2).css("color", "black");
                                    $(".plan_title p").html(str2);
                                    console.log('------'+str2);
                                    break;
                            }
                        }
                            break;
                        case 2: {
                            switch (swiper.activeIndex) {
                                case 0:
                                    $(".bottom .point").animate({"left": "3.3rem"}, 200, "swing");
                                    $(".bottom .text p").eq(0).css("color", "black");
                                    $(".plan_title p").html(str0);
                                    break;
                                case 1:
                                    $(".bottom .point").animate({"left": "5.8rem"}, 200, "swing");
                                    $(".bottom .text p").eq(1).css("color", "black");
                                    $(".plan_title p").html(str1);
                                    break;
                            }
                        }
                            break;
                    }
                }
//                $("#right_button").attr("style", "display: block");
//                $("#left_button").attr("style", "display: block");
            }
        });
    }
    function initArrow(count) {
//        if (count == 1) {
//            $("#right_button").attr("style", "display: none");
//            $("#left_button").attr("style", "display: none");
//        }
        if (count > 1) {
            $("#right_button").attr("style", "display: block");
        }
        $("#left_button").on("click", function () {
            mySwiper.slidePrev();
            if (mySwiper.activeIndex == 0) {
                $(this).attr("style", "display: none");
            }
            $("#right_button").attr("style", "display: block");
        });
        $("#right_button").on("click", function () {
            mySwiper.slideNext();
            if (mySwiper.activeIndex == count - 1) {
                $(this).attr("style", "display: none");
            }
            $("#left_button").attr("style", "display: block");
        });
    }
    function initBottomBar(count) {
        console.log('------' + $(window).width());
        <c:forEach items="${schemes}" var="sch" varStatus="status">
        var f = ${sch.schFeature};
        switch(f){
            case 0:
                var s${status.index} = '最佳匹配';
                break;
            case 1:
                var s${status.index} = '距离最近';
                break;
            case 2:
                var s${status.index} = '评价最优';
                break;
            case 3:
                var s${status.index} = '价格最低';
                break;
            case 4:
                var s${status.index} = '周期最短';
                break;
        }
        //console.log(${status.index});
        //console.log(s${status.index});
        </c:forEach>
        if (window.screen.width > 500) {
//            $("#right_button").attr("style", "display: block");
//            $("#left_button").attr("style", "display: block");
            initArrow(count);
            $("#slideBar").attr("style", "display: none");
        } else {
            switch (count) {
                case 1:
                    $("#slideBar").attr("style", "display: none");
                    break;
                case 2:
                    $("#slideBar .slideBG").attr("src", "${cms}/wechat/img/2.png");
                    $("#slideBar .slideBG").css("width", "30%");
                    $(".bottom .point").css("left", "3.3rem");
                    $(".bottom .text").append('<p style="color: black;">'+s0+'</p>')
                        .append('<p style="margin-left: 1.4rem;">'+s1+'</p>');
                    break;
                case 3:
                    $("#slideBar .slideBG").attr("src", "${cms}/wechat/img/3.png");
                    $("#slideBar .slideBG").css("width", "50%");
                    $(".bottom .point").css("left", "2.3rem");
                    $(".bottom .text").append('<p style="margin-left: 2.1rem; color: black">'+s0+'</p>')
                        .append('<p style="margin-left: 1.4rem;">'+s1+'</p>')
                        .append('<p style="margin-left: 1.4rem;">'+s2+'</p>');
                    break;
                case 4:
                    $("#slideBar .slideBG").attr("src", "${cms}/wechat/img/4.png");
                    $("#slideBar .slideBG").css("width", "90%");
                    $(".bottom .text").append('<p style="margin-left: 0.4rem; color: black">'+s0+'</p>')
                        .append('<p style="margin-left: 1.6rem;">'+s1+'</p>')
                        .append('<p style="margin-left: 1.8rem;">'+s2+'</p>')
                        .append('<p style="margin-left: 1.6rem;">'+s3+'</p>');
                    break;
                case 5:
                    $("#slideBar .slideBG").attr("src", "${cms}/wechat/img/home_bar.png");
                    $("#slideBar .slideBG").css("width", "90%");
                    $(".bottom .text").append('<p style="margin-left: 0.4rem; color: black">'+s0+'</p>')
                        .append('<p style="margin-left: 0.9rem;">'+s1+'</p>')
                        .append('<p style="margin-left: 1.1rem;">'+s2+'</p>')
                        .append('<p style="margin-left: 1.1rem;">'+s3+'</p>')
                        .append('<p style="margin-left: 0.9rem;">'+s4+'</p>');
                    break;
                default:
                    break;
            }
        }
    }
    function getData(){

        var f = ${schemes[0].schFeature};
        switch(f){
            case 0:
                var st = '<img src="${cms}/wechat/img/icon_best.png">最佳匹配方案';
                break;
            case 1:
                var st = '<img src="${cms}/wechat/img/icon_short.png">距离最近方案';
                break;
            case 2:
                var st = '<img src="${cms}/wechat/img/icon_good.png">评价最优方案';
                break;
            case 3:
                var st = '<img src="${cms}/wechat/img/icon_cheap.png">价格最低方案';
                break;
            case 4:
                var st = '<img src="${cms}/wechat/img/icon_fast.png">周期最短方案';
                break;
        }
        var html = '<div class="swiper-container">\
                    <div class="plan_title">\
                    <p >'+st+'</p>\
                    </div>\
                    <div class="swiper-wrapper" style="margin-top: -1.73333rem">';

        <c:forEach items="${schemes}" var="shceme" varStatus="status">
        var idvalue = 'cell' + ${status.index};
        html += '<div id="'+idvalue+'" class="swiper-slide" >\
                    <div class="page">\
                    <div class="project">\
                    <div>\
                    <div class="project_info">\
                    <div class="lft">'
        for (var i=1; i<6; i++){
            var n = ${shceme.schPraise} - 2*i;
            if (n >= 0 ){
                html +='<img src="${cms}/wechat/img/comment_star_default.png">';
            }else if(n > -2){
                html +='<img src="${cms}/wechat/img/comment_star_half.png">';
            }else {
                html +='<img src="${cms}/wechat/img/comment_star_normal.png">';
            }
        }
        var ss =${shceme.schPrice/100 };
        if(ss==0){
            ss = "面议";
        }else{
            ss=<fmt:formatNumber type="number" value="${shceme.schPrice/100+1}" pattern="0.00"/>;
            ss=ss.toFixed(2);
            ss=ss-1;
            ss=ss.toFixed(2);
        }
        html +='</div>\
                    <div class="rt">\
                    <span style="font-size: 0.64rem; color: #2fcba8; margin-left: 0.2rem"><fmt:formatNumber type="number" value="${shceme.schPraise/2}" pattern="0.0"/></span>\
                    </div>\
                    <div class="distance">\
                    ${shceme.schDistance eq "0.0"? "距离未知":"距离您".concat(shceme.schDistance).concat("KM")}\
                    </div>\
                    </div>\
                    </div>\
                    <div class="info_text">使用标准:&nbsp;&nbsp;<span>${shceme.schStandard eq ""? "未知":shceme.schStandard}</span></div>\
            <div class="info_text">使用仪器:&nbsp;&nbsp;<span>${shceme.schInstrument eq ""? "未知":shceme.schInstrument}</span></div>\
            <div class="info_text">资质授权:&nbsp;&nbsp;<span>${shceme.schQualifications eq ""? "未知":shceme.schQualifications}</span></div>\
            <div class="info_text">周期:&nbsp;&nbsp;<span>${shceme.schPeriod eq ""? "未知":shceme.schPeriod.concat("个工作日")}</span></div>\
            <div class="info_text">提供样品制备服务:&nbsp;&nbsp;<span>${shceme.schOfferService eq 0?"否":"是"}</span></div>\
            <div class="project_price">￥'+ss+'</div>\
            <div class="choose" data-sche-id="${shceme.schId}">选择该方案</div>\
                    </div>\
                    </div>\
                    </div>';
        </c:forEach>
        html += '</div>\
                    </div>';
        console.log(222);
        $("#tuijianPlan").html(html);
        console.log(333);
        var count =${fn:length(schemes)};

        for (var i=0; i<count; i++){
            var idvalue = 'cell' + i;
            bindPlan(idvalue);
        }
        renderSwiper(count);
//            initArrow(count);
        initBottomBar(count);
    }
    function bindPlan(idvalue){
        $("#" + idvalue + " .choose").on("click", function(){
            window.location.href='${cms}/wx/order/wxCreateOrder.do?schId=' + $(this).data("scheId");
            console.info("idvalue"+idvalue);
            //alert($(this).data("scheId"));

        });
    }


</script>
</body>
</html>
