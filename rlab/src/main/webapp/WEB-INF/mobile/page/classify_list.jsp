<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>

    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_640X424.jpg")
        }

    </script>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/search_result.css">

    <style>
        .instab .city{
            width: 100%;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;">
    <header>
        <%@ include file="../template/header_two.jsp" %>
        <p class="headtitle" style="width: 6.5rem; margin-left: -3.25rem;">${name}</p>
    </header>
    <div class="instab" style="top: 1.175rem;">
        <div class="city" onclick="selectAddress()">
            <p>
                <span>全国</span>
                <i class="lab-down"></i>
            </p>
        </div>
    </div>
    <div class="typebox clearfix" style="top: 2.245rem;">
        <div class="stairType">
            <i class="lab-top"></i>
            <div><p class="seledType" onclick="second(this)">全部仪器</p></div>
            <div><p data-category-id="03">实验室常用设备</p></div>
            <div><p data-category-id="11">光学仪器及设备</p></div>
            <div><p data-category-id="07">工业在线及过程控制仪器</p></div>
            <div><p data-category-id="08">行业专用仪器</p></div>
            <div><p data-category-id="06">测量/计量仪器</p></div>
            <div><p data-category-id="02">物性测试仪器及设备</p></div>
            <div><p data-category-id="15">实验室服务</p></div>
            <div><p data-category-id="09">相关仪表</p></div>
            <div><p data-category-id="05">环境监测仪器</p></div>
            <div><p data-category-id="01">化学分析仪器</p></div>
            <div><p data-category-id="04">生命科学仪器及设备</p></div>
        </div>
        <div class="secondtype">
        </div>
    </div>

    <div id="listmain" class="mui-content mui-scroll-wrapper" style="margin-top: 2.245rem;">
        <div class="mui-scroll">
            <ul class="mui-table-view mui-table-view-chevron"  data-page-no="2" data-type-str="" data-city-str="">

            </ul>
            <div class="nomore">
                <p>没有更多数据了</p>
            </div>
        </div>
    </div>
</div>
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
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script src="${rlab}/mobile/js/mui.pullToRefresh.js"></script>
<script src="${rlab}/mobile/js/mui.pullToRefresh.material.js"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */

    function goBack() {
        history.go(-1);
    }

    initDropdown();// 初始化城市下拉
    $("#listmain ul").append(getlist("",1,$(".city span").text()));//初始化列表
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
        $(".city span").text(curAd);
        $("#listmain ul").data("cityStr",curAd);
        $("#curAddress").text(curAd);
    }
    /*城市下拉*/
    function selectAddress() {

        $("#main").hide(2000);
        $("#dropdown").show(2000);
        $("#dropdown").data("flag", 1);
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
    /**
     * 从地址页跳转搜索页
     */
    function choseAddress($this) {

        // 控制样式
        var curAddress = $($this).text();

        $("#dropdown").hide(500);
        $("#dropdown").data("flag", 0);
        $(".city span").text(curAddress);
        $("#curAddress").text(curAddress);
        $("#main").show(1000);
        // $("#superSearch").show();
        $("#div_moveToTop").hide();

        if (curAddress=="全国"){
            curAddress="";
        }
        $("#listmain ul").html("").data('pageNo',2).data("cityStr",curAddress);
        $("#listmain ul").append(getlist("",1,curAddress));
        mui('#listmain').pullRefresh().scrollTo(0,0,10);
    }


    /*获取列表*/
    function getlist(str,num,city,ul) {
        if(ul){
            num=$(ul).data('pageNo')*1;
            $(ul).data('pageNo',num+1);
            str=$(ul).data('typeStr');
            city=$(ul).data('cityStr');
        }
        if(city=='全国'){
            city='';
        }
        var fragment = document.createDocumentFragment();
        var html='';
        var li;
        $.ajax({
            url: BASE_URL + '/service/service_list?classify=${classify}&pageNum=' + num + '&city=' + city,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                console.log(data);
                if(data.payload.list.length==0){
                    $(".nomore").show();
                    $(ul).data('pageNo',num);
                }else {
                    $(".nomore").hide();
                }
                for (var i = 0; i < data.payload.list.length; i++) {
                    var item=data.payload.list[i];
                    var price=''
                    if (item.servicePrice.flag==3){
                        price='<p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>';
                    }else if(item.servicePrice.flag==1){
                        (item.servicePrice.unit == '无') ? price='<p><span>¥<i>'+item.servicePrice.accPrice+'</i></span></p>' : price='<p><span>¥<i>'+item.servicePrice.accPrice+'</i></span>/'+item.servicePrice.unit+'</p>';
                    }else if(item.servicePrice.flag==2){
                        if(item.servicePrice.scopeHighPrice=="0"){
                            (item.servicePrice.unit == '无') ? price='<p><span>¥<i>'+item.servicePrice.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.servicePrice.scopeLowPrice+'</i></span>/'+item.servicePrice.unit+'起</p>';
                        }else{
                            (item.servicePrice.unit == '无') ? price='<p><span>¥<i>'+item.servicePrice.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.servicePrice.scopeLowPrice+'</i></span>/'+item.servicePrice.unit+'起</p>';
                        }
                    }
                    var citys='';
                    if(item.servicePic==null){
                        item.servicePic="";
                    }
                    (item.serviceDistrict!=null) ? citys=item.serviceDistrict:citys=" ";
                    if(item.serviceName.length>25){
                        item.serviceName=item.serviceName.substring(0,25)+"..."
                    }
                    li = $("<li class='clearfix' onclick='goinsdetail(this)'></li>");
                    li.data("insId",item.serviceId);
                    li.html( '<img src="'+item.servicePic+'" alt="" onerror="imgOnError(this)">\
                                <div class="itemlitxt">\
                                <p class="itemtit">'+item.serviceName+'</p>\
                                <div><span style="margin-right: 0.347rem">'+item.serviceCity+'</span><span>'+citys+'</span>'+price+'</div>\
                            </div>');
                    li=li.get(0);
                    fragment.appendChild(li);
                }
            },
            error: function () {

            }
        })
        return fragment;
    }
    mui.init({
        pullRefresh: {
            container: '#listmain',
            up: {
                contentrefresh: '正在加载...',
                callback: function() {
                    setTimeout(function () {
                        var ul = document.body.querySelector('.mui-table-view');
                        ul.appendChild(getlist("",2,"",ul));
                        mui('#listmain').pullRefresh().endPullupToRefresh();
                    }, 1000);
                }
            }
        }
    });
    mui("#listmain").on("tap","li",function(){
        window.location.href = BASE_URL + '/service/detail/' + $(this).data("insId");
    });
</script>
</html>