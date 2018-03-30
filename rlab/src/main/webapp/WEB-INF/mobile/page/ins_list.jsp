<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <style>

        a, a:link, a:visited, a:hover, a:active {
            text-decoration: none
        }
        p{margin-bottom: 0}

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

        /*=END 城市下拉 [kingyinliang，2017-06-27]*/

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






        #listmain{
            margin-top: 2.275rem;
        }
        #listmain ul{
            padding: 0 0.347rem;
        }
        #listmain li{
            padding: 0.347rem 0 0.267rem 0;
            border: none;
            border-bottom: 0.01rem solid #dddddd;
        }
        #listmain li img{
            float: left;
            width: 3.52rem;
            height: 2.107rem;
            border-radius: 0.133rem;
        }
        .itemlitxt{
            float: left;
            margin-left: 0.587rem;
            width: 5.1rem;
            max-width: 5.1rem;
        }
        .itemlitxt div{
            line-height: 0.9rem;
        }
        .itemlitxt div p{
            font-size: 0.32rem;
            letter-spacing: 0.013rem;
            color: #6c6c6c;
            float: right;
            line-height: 0.64rem;
        }
        .itemlitxt p span i{
            font-size: 0.64rem;
        }
        .itemlitxt p span{
            color: #e6566b;
        }
        .itemtit{
            font-size: 0.347rem;
            letter-spacing: 0.011rem;
            color: #322d2d;
            height: 1.2rem;
            line-height: 0.5rem;
        }
        .mui-pull-loading,.mui-pull-caption{
            font-size: 0.32rem!important;
        }
        .instab div{
            width: 4.9rem;
            float: left;
            cursor: pointer;

        }
        .instab{
            position: fixed;
            width: 100%;
            top:1.175rem;
            z-index: 9999;
            height: 1.1rem;
            text-align: center;
            box-shadow: 0rem 0.053rem 0.107rem 0rem
            rgba(228, 228, 228, 0.5);
            background: white;
        }
        .instab p{
            font-size: 0.293rem;
            color: #555f69;
            height: 0.4rem;
            margin-top: 0.37rem;
            line-height: 0.4rem;
        }

        .typebox{
            position: fixed;
            top:2.275rem;
            width: 100%;
            height: 11.173rem;
            background-color: #ffffff;
            z-index: 9999;
            border-top: 0.01rem solid #dddddd;
            border-bottom: 0.01rem solid #dddddd;
            display: none;
        }
        .stairType{
            border-right: 0.01rem solid #dddddd;
        }
        .stairType,.secondtype{
            width: 4.9rem;
            height: 11.173rem;
            float: left;
            position: relative;
            overflow: scroll;
        }
        .stairType{
            overflow: auto;
        }
        .lab-top{
            font-size: 0.32rem;
            background: white;
            position: absolute;
            top:-0.22rem;
            left: 50%;
            margin-left: -0.16rem;
            z-index: 9999;
        }
        .stairType p:hover,.typebox .seledType,.secondtype p:hover{
            color: #6aa0ff;
            border-bottom: 0.01rem solid #6aa0ff;
        }
        .stairType p,.secondtype p{
            line-height: 0.747rem;
            font-size: 0.32rem;
            color: #322d2d;
            margin-left: 0.347rem;
            display: inline-block;
        }
        .nomore{
            display: none;
        }
        .mui-pull-bottom-tips,.nomore{
            text-align: center;
            color: #777;
            height: 1rem;
            line-height: 1rem;
            font-size:0.32rem!important;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;">
    <header>
        <%@ include file="../template/header_two.jsp" %>
        <p class="headtitle">仪器预约</p>
    </header>
    <div class="instab">
        <div class="type" onclick="typeboxshow()">
            <p style="border-right: 0.02rem solid #cccccc">
                <span>所有类型</span>
                <i class="lab-down"></i>
            </p>
        </div>
        <div class="city" onclick="selectAddress()">
            <p>
                <span>全国</span>
                <i class="lab-down"></i>
            </p>
        </div>
    </div>
    <div class="typebox clearfix">
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

    <div id="listmain" class="mui-content mui-scroll-wrapper">
        <div class="mui-scroll">
            <ul class="mui-table-view mui-table-view-chevron" data-page-no="2" data-type-str="" data-city-str="">

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

    var cout=false;
    /**
     * 返回历史上一页
     */


    function goBack() {
        history.go(-1);
    }

    var mask = mui.createMask(function () {
        $(".typebox").hide()
    });//callback为用户点击蒙版时自动执行的回调；
    function typeboxshow() {
        if($(".typebox").css("display")=="none"){
            $(".typebox").show()
            mask.show();
        }else {
            $(".typebox").hide()
            mask.close();
        }
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

        var str=$(".type span").text();
        if (str=="全部类型"||str=="所有类型"){
            str="";
        }
        if (curAddress=="全国"){
            curAddress="";
        }
        $("#listmain ul").html("").data("typeStr",str).data('pageNo',2).data("cityStr",curAddress);
        $("#listmain ul").append(getlist(str,1,curAddress));
        mui('#listmain').pullRefresh().scrollTo(0,0,10);
    }


    /*一级类型*/
    $(".stairType p").on("click",function () {
        $(".stairType p").attr("class","");
        $(this).attr("class","seledType");
        var num=$(this).data("categoryId");
        gettypelist(num);
    })

    /*二级类型*/
    function second($this) {
        $(".secondtype p").attr("class","");
        $($this).attr("class","seledType");
        var str=$($this).text();
        var city=$(".city span").text();
        if (city=="全国"){
            city="";
        }
        $(".type span").text(str);
        $(".typebox").hide();
        mask.close();
        if (str=="全部仪器"){
            str="";
        }
        $("#listmain ul").html("").data("typeStr",str).data('pageNo',2);
        $("#listmain ul").append(getlist(str,1,city));
        mui('#listmain').pullRefresh().scrollTo(0,0,10);
    }
    /*获取二级类型*/
    function gettypelist(num) {
        var html='';
        $.ajax({
            url: BASE_URL + '/front/search/categories?code=' + num,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                for (var i=0;i<data.payload.length;i++){
                    html+='<div><p data-category-id="'+data.payload[i].id+'" onclick="second(this)">'+data.payload[i].categoryName+'</p></div>'
                }
                $(".secondtype").html(html);

            },
            error: function () {

            }
        })
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
            url: BASE_URL + '/front/search/more_ins?tag=仪器预约&pageNo=' + num + '&category2=' + str + '&city=' +city,
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
                    if (item.price.flag==3){
                        price='<p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>';
                    }else if(item.price.flag==1){
                        (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.accPrice+'</i></span></p>' : price='<p><span>¥<i>'+item.price.accPrice+'</i></span>/'+item.price.unit+'</p>';
                    }else if(item.price.flag==2){
                        if(item.price.scopeHighPrice=="0"){
                            (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>/'+item.price.unit+'起</p>';
                        }else{
                            (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>/'+item.price.unit+'起</p>';
                        }
                    }
                    var citys='';
                    if(item.insPic==''||item.insPic==null){
                        item.insPic='${rlab}/common/common_img/default/ins_300X300.jpg';
                    }else{
                        item.insPic=item.insPic+'264_158';
                    }
                    (item.orgAddrDistrict!=null) ? citys=item.orgAddrDistrict:citys=" ";
                    li = $("<li class='clearfix' onclick='goinsdetail(this)'></li>");
                    li.data("insId",item.mapId);
                    li.html( '<img src="'+item.insPic+'" alt="">\
                                <div class="itemlitxt">\
                                <p class="itemtit">'+item.insName.substring(0,21)+'</p>\
                                <div><span style="margin-right: 0.347rem">'+item.orgAddrCity+'</span><span>'+citys+'</span>'+price+'</div>\
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
    // if (mui.os.plus) {
    //     mui.plusReady(function() {
    //         setTimeout(function() {
    //             mui('#listmain').pullRefresh().pullupLoading();
    //         }, 10);
    //
    //     });
    // } else {
    //     mui.ready(function() {
    //         mui('#listmain').pullRefresh().pullupLoading();
    //     });
    // }
    mui("#listmain").on("tap","li",function(){
        window.location.href = BASE_URL + '/instrument/search/' + $(this).data("insId");
    });
</script>
</html>