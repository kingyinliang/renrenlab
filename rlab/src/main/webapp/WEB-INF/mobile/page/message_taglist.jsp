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

    <link rel="stylesheet" href="${rlab}/mobile/css/search_result.css">
    <style>
        .tag span{
            color: #5c92ff;
            margin-right: 0.3rem;
        }
        .tag{
            line-height: 1rem;
            font-size: 0.373rem;
            letter-spacing: 0.05rem;
            color: #453a3a;
            position: fixed;
            top:1.175rem;
            padding: 0 0.347rem;
        }

    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;">
    <header>
        <%@ include file="../template/header_four.jsp" %>
    </header>
    <div class="tag"><span>${tagName}</span>相关的文章</div>
    <div id="listmain" class="mui-content mui-scroll-wrapper" style="margin-top:2.175rem;">
        <div class="mui-scroll">
            <ul class="mui-table-view mui-table-view-chevron message" data-page-no="1">

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


    /*获取列表*/
    function getlist(ul) {
        if(ul){
            num=$(ul).data('pageNo')*1;
            $(ul).data('pageNo',num+1);
        }
        var fragment = document.createDocumentFragment();
        var html='';
        var li;
        $.ajax({
            url: BASE_URL + '/news/get_tag_articles_info?tagName=${tagName}&pageNo=' + num,
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
                    var hor="";
                    var item=data.payload.list[i];
                    if(item.hours>= 24){
                        hor=transfer(item.modifyTime);
                    }else if(item.hours == 24) {
                        hor='刚刚';
                    }else {
                        hor=item.hours+'小时前'
                    }
                    if(item.tInfoImage==null){
                        item.tInfoImage="";
                    }
                    var title="";
                    if(item.tInfoTitle.length>21){
                        title=item.tInfoTitle.substring(0,21)+"...";
                    }else{
                        title=item.tInfoTitle;
                    }
                    li = $("<li class='clearfix' onclick='goinsdetail(this)'></li>");
                    li.data("insId",item.tInfoId);
                    li.html( '<img src="'+item.tInfoImage+'" alt="">\
                                <div class="itemlitxt">\
                                    <p class="itemtit">'+title+'</p>\
                                    <div>\
                                        <span style="margin-right: 0.347rem" class="lab-history"></span><span>'+hor+'</span>\
                                    </div>\
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
                        ul.appendChild(getlist(ul));
                        mui('#listmain').pullRefresh().endPullupToRefresh();
                    }, 1000);
                }
            }
        }
    });
    if (mui.os.plus) {
        mui.plusReady(function() {
            setTimeout(function() {
                mui('#listmain').pullRefresh().pullupLoading();
            }, 10);

        });
    } else {
        mui.ready(function() {
            mui('#listmain').pullRefresh().pullupLoading();
        });
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