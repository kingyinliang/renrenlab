<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description"
          content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
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

        .mui-bar ~ .mui-content .mui-fullscreen {
            top: 44px;
            height: auto;
        }

        .mui-pull-top-tips {
            position: absolute;
            top: -20px;
            left: 50%;
            margin-left: -25px;
            width: 40px;
            height: 40px;
            border-radius: 100%;
            z-index: 1;
        }

        .mui-bar ~ .mui-pull-top-tips {
            top: 24px;
        }

        .mui-pull-top-wrapper {
            width: 42px;
            height: 42px;
            display: block;
            text-align: center;
            background-color: #efeff4;
            border: 1px solid #ddd;
            border-radius: 25px;
            background-clip: padding-box;
            box-shadow: 0 4px 10px #bbb;
            overflow: hidden;
        }

        .mui-pull-top-tips.mui-transitioning {
            -webkit-transition-duration: 200ms;
            transition-duration: 200ms;
        }

        .mui-pull-top-tips .mui-pull-loading {
            /*-webkit-backface-visibility: hidden;
            -webkit-transition-duration: 400ms;
            transition-duration: 400ms;*/

            margin: 0;
        }

        .mui-pull-top-wrapper .mui-icon,
        .mui-pull-top-wrapper .mui-spinner {
            margin-top: 7px;
        }

        .mui-pull-top-wrapper .mui-icon.mui-reverse {
            /*-webkit-transform: rotate(180deg) translateZ(0);*/
        }

        .mui-pull-bottom-tips {
            text-align: center;
            background-color: #efeff4;
            font-size: 15px;
            line-height: 40px;
            color: #777;
        }

        .mui-pull-top-canvas {
            overflow: hidden;
            background-color: #fafafa;
            border-radius: 40px;
            box-shadow: 0 4px 10px #bbb;
            width: 40px;
            height: 40px;
            margin: 0 auto;
        }

        .mui-pull-top-canvas canvas {
            width: 40px;
        }

        .mui-slider-indicator.mui-segmented-control {
            background-color: white;
        }

        .mui-content {
            padding-top: 1.175rem;
        }

        #slider {
            top: 1.175rem;
        }

        #segmentedControl {
            padding: 0 0.35rem;
        }

        #segmentedControl .mui-control-item {
            color: #555f69;
            font-size: 0.347rem;
            line-height: 0.8rem;
        }

        .mui-segmented-control.mui-segmented-control-inverted .mui-control-item.mui-active {
            border-bottom: 0.053rem solid #668feb !important;
        }

        .mui-fullscreen .mui-segmented-control ~ .mui-slider-group {
            top: 0.9rem;
        }

        .mui-slider .mui-segmented-control.mui-segmented-control-inverted ~ .mui-slider-group .mui-slider-item {
            border: none;
        }

        .mui-pull-loading {
            font-size: 0.32rem !important;
        }

        .mui-table-view {
            padding: 0 0.35rem;
        }

        .mui-table-view li {
            padding: 0.56rem 0 0.48rem 0;
            border: none;
            border-bottom: 0.01rem solid #dddddd;
        }

        .mui-table-view li img {
            width: 3.52rem !important;
            height: 2.107rem;
            border-radius: 0.133rem;
            float: left;
            margin-right: 0.58rem;
        }

        .itemlitit {
            height: 1.6rem;
            font-size: 0.373rem;
            line-height: 0.4rem;
            letter-spacing: 0.013rem;
            color: #322d2d;
            margin-bottom: 0.267rem;
        }

        .itemlitxt {
            width: 5.15rem;
            float: left;
        }

        .history i {
            margin-right: 0.2rem;
            font-size: 0.3rem;
        }

        .history {
            font-size: 0.267rem;
            letter-spacing: 0.008rem;
            color: #7f7f7f;
        }
        .mui-pull-bottom-tips{
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
        <p class="headtitle">科创头条</p>
    </header>
    <div class="mui-content">
        <div id="slider" class="mui-slider mui-fullscreen">
            <div id="segmentedControl"
                 class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted">
                <a class="mui-control-item mui-active" href="#item1mobile">最新文章</a>
                <a class="mui-control-item" href="#item2mobile">政策速报</a>
                <a class="mui-control-item" href="#item3mobile">行业动态</a>
                <a class="mui-control-item" href="#item4mobile">最新活动</a>
                <a class="mui-control-item" href="#item5mobile">职来职往</a>
            </div>
            <div class="mui-slider-group">
                <div id="item1mobile" class="mui-slider-item mui-control-content mui-active">
                    <div id="scroll1" class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <ul class="mui-table-view" data-page-no="1" data-type-str="最新文章"></ul>
                        </div>
                    </div>
                </div>
                <div id="item2mobile" class="mui-slider-item mui-control-content">
                    <div class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <ul class="mui-table-view" data-page-no="1" data-type-str="政策速报"></ul>
                        </div>
                    </div>
                </div>
                <div id="item3mobile" class="mui-slider-item mui-control-content">
                    <div class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <ul class="mui-table-view" data-page-no="1" data-type-str="行业动态"></ul>
                        </div>
                    </div>
                </div>
                <div id="item4mobile" class="mui-slider-item mui-control-content">
                    <div class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <ul class="mui-table-view" data-page-no="1" data-type-str="最新活动"></ul>
                        </div>
                    </div>
                </div>
                <div id="item5mobile" class="mui-slider-item mui-control-content">
                    <div class="mui-scroll-wrapper">
                        <div class="mui-scroll">
                            <ul class="mui-table-view" data-page-no="1" data-type-str="职来职往"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
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

    $("#item1mobile ul").append(getlist('最新文章',1));
    $("#item2mobile ul").append(getlist('政策速报',1));
    $("#item3mobile ul").append(getlist('行业动态',1));
    $("#item4mobile ul").append(getlist('最新活动',1));
   $("#item5mobile ul").append(getlist('职来职往',1));

    /*获取列表*/
    function getlist(str, num,el) {

        if(el){
            num=$(el).data('pageNo')*1+1;
            $(el).data('pageNo',num);
            str=$(el).data('typeStr');
        }
        var fragment = document.createDocumentFragment();
        var li;
        if(str=="职来职往"){
            $.ajax({
                url: BASE_URL + '/front/search/career?pageNo=' + num,
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.payload.list.length; i++) {
                        var hor="";
                        var item=data.payload.list[i];
                        if(item.hours>= 24){
                            hor=transfer(item.modifyTime);
                        }else if(item.hours == 24) {
                            hor='刚刚';
                        }else {
                            hor=item.hours+'小时前'
                        }
                        var title="";
                        if(item.careerTitle.length>21){
                            title=item.careerTitle.substring(0,21)+"...";
                        }else{
                            title=item.careerTitle;
                        }
                        li = $("<li class='clearfix' onclick='gojobdetail(this)'></li>");
                        li.data("messId",item.careerId);
                        li.data("classIfy",1);
                        li.html( '<img src="${rlab}/mobile/imgs/zczx.png" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemlitit">' +title+ ' </p>\
                                <span class="history"><i class="lab-history"></i>'+hor+'</span>\
                            </div>');
                        li=li.get(0);
                        fragment.appendChild(li);
                    }
                },
                error: function () {

                }
            })
            $.ajax({
                url: BASE_URL + '/front/search/recruit?pageNo=' + num,
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.payload.list.length; i++) {
                        var hor="";
                        var item=data.payload.list[i];
                        if(item.hours>= 24){
                            hor=transfer(item.modifyTime);
                        }else if(item.hours == 24) {
                            hor='刚刚';
                        }else {
                            hor=item.hours+'小时前'
                        }
                        var title="";
                        if(item.recruitTitle.length>21){
                            title=item.recruitTitle.substring(0,21)+"...";
                        }else{
                            title=item.recruitTitle;
                        }
                        li = $("<li class='clearfix' onclick='gojobdetail(this)'></li>");
                        li.data("messId",item.recruitId);
                        li.data("classIfy",2);
                        li.html( '<img src="${rlab}/mobile/imgs/zp.png" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemlitit">' + title + ' </p>\
                                <span class="history"><i class="lab-history"></i>'+hor+'</span>\
                            </div>');
                        li=li.get(0);
                        fragment.appendChild(li);
                    }
                },
                error: function () {

                }
            })
            $.ajax({
                url: BASE_URL + '/front/search/resume?pageNo=' + num,
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.payload.list.length; i++) {
                        var hor="";
                        var item=data.payload.list[i];
                        if(item.hours>= 24){
                            hor=transfer(item.modifyTime);
                        }else if(item.hours == 24) {
                            hor='刚刚';
                        }else {
                            hor=item.hours+'小时前'
                        }
                        var title="";
                        if(item.resumeTitle.length>21){
                            title=item.resumeTitle.substring(0,21)+"...";
                        }else{
                            title=item.resumeTitle;
                        }

                        li = $("<li class='clearfix' onclick='gojobdetail(this)'></li>");
                        li.data("messId",item.resumeId);
                        li.data("classIfy",3);
                        li.html( '<img src="${rlab}/mobile/imgs/rc.png" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemlitit">' + title + ' </p>\
                                <span class="history"><i class="lab-history"></i>'+hor+'</span>\
                            </div>');
                        li=li.get(0);
                        fragment.appendChild(li);
                    }
                },
                error: function () {

                }
            })
        }else {
            $.ajax({
                url: BASE_URL + '/front/search/sciences?classifyName=' + str + '&pageNo=' + num,
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.payload.list.length; i++) {
                        var hor="";
                        var item=data.payload.list[i];
                        if(item.hours>= 24){
                            hor=item.createTimeStr;
                        }else if(item.hours == 24) {
                            hor='刚刚';
                        }else {
                            hor=item.hours+'小时前'
                        }
                        var title="";
                        if(item.tInfoTitle.length>21){
                            title=item.tInfoTitle.substring(0,21)+"...";
                        }else{
                            title=item.tInfoTitle;
                        }
//                        if(item.tInfoTitle.length>21){
//                            item.tInfoTitle=item.tInfoTitle.substring(0,21)+'...'
//                        }
                        li = $("<li class='clearfix' onclick='gomessagedetail(this)'></li>");
                        li.data("messId",item.tInfoId);
                        li.html( '<img src="'+ item.tInfoImage +'" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemlitit">' + title+ ' </p>\
                                <span class="history"><i class="lab-history"></i>'+hor+'</span>\
                            </div>');
                        li=li.get(0);
                        fragment.appendChild(li);
                    }
                },
                error: function () {

                }
            })
        }


        return fragment;
    }

    mui.init();
    (function ($) {
        //阻尼系数
        var deceleration = mui.os.ios ? 0.003 : 0.0009;
        $('.mui-scroll-wrapper').scroll({
            scrollY: true, //是否竖向滚动
            scrollX: false, //是否横向滚动
            bounce: false,
            indicators: true, //是否显示滚动条
            deceleration: deceleration
        });
        $.ready(function () {
            //循环初始化所有下拉刷新，上拉加载。
            $.each(document.querySelectorAll('.mui-slider-group .mui-scroll'), function (index, pullRefreshEl) {
                $(pullRefreshEl).pullToRefresh({
                    up: {
                        callback: function () {
                            var self = this;
                            setTimeout(function () {
                                var ul = self.element.querySelector('.mui-table-view');
                                ul.appendChild(getlist("最新文章",2,ul));
                                self.endPullUpToRefresh();
                            }, 1000);
                        }
                    }
                });
            });
        });
    })(mui);
    function gomessagedetail($this) {
        window.location.href = BASE_URL + '/news/get_article_detail?id=' + $($this).data("messId");
    }
    function gojobdetail($this) {
        window.location.href = BASE_URL + '/news/get_work_detail?classify=' + $($this).data("classIfy") + '&id=' + $($this).data("messId");
    }
    function transfer(str) {
        var date = new Date(str);
        Y = date.getFullYear() + '-';
        M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        var redata=(Y+M+D+h+m+s);
        return redata;
    }

</script>
</html>