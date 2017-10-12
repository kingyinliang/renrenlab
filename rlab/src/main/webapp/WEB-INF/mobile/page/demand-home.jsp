<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/9/6 0006
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <%--layer--%>
    <style type="text/css">
        /*头部样式在base.css*/

        *{margin: 0;padding: 0;}html,body{width: 100%;height: 100%;background: #f5f6fa;}

        a{
            text-decoration: none!important;
        }

        a:hover{text-decoration: none !important;}a:link{text-decoration: none !important;}

        .content{
            margin-top: 1.173rem;
        }
        .headers {
            height: 1.173rem;
            width: 100%;
            background: #F5F6FA;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9999999;
        }

        .users {
            float: right;
            color: #4E4E4E;
            font-size: 0.56rem;
            line-height: 1.173rem;
            margin-right: 0.3067rem;
            position: absolute;
            top:0;
            right: 0;
        }
        .user-img{
            width: 0.8267rem;
            height: 1.173rem;
            line-height:1.173rem;
            text-align: center;
            position: absolute;
            top:0;
            right: 0.3rem;
        }
        .user-img img{
            overflow: hidden;
            border-radius: 50%;
            width: 0.8267rem;
            height: 0.8267rem;
        }
        .homelogo {
            height: 0.56rem;
            display: block;
            margin: 0.3067rem;
            text-align: center;
        }

        .homelogo img {
            height: 100%;
        }
        .headers .lft_back {
            width: 1rem;
            line-height: 1.173rem;
            text-align: center;
            font-size: 0.45rem;
            float: left;
            position: absolute;
            top:0;
            left: 0;
        }
        .banner img{
            width: 100%;
            height: 4.55rem;
        }
        .but{
            height: 1.53rem;
        }
        .but a{
            text-align: center;
            float: left;
            display: inline-block;
            width: 50%;
            height: 100%;
            line-height: 1.53rem;
            color: #4f8df0;
            border: none;
            font-size: 0.45rem;
            background: white;
        }
        .list{
            padding: 0 0.32rem;
        }
        .list li{
            padding: 0.36rem 0.45rem;
            background: white;
            border-radius: 0.13rem;
            margin: 0.2rem 0;
        }
        .list li p{
            font-size: 0.32rem;
            line-height: 0.4rem;
            margin-bottom: 0.2rem;
        }
        .litext {
            position:relative;
            line-height:0.4rem;
            font-size: 0.37rem;
        }
        .beyond{
            max-height:1.2rem;
            overflow:hidden;
        }
        .beyond::after {
            content:"...";
            font-weight:bold;
            position:absolute;
            bottom:0;
            right:0;
            padding:0 20px 1px 45px;
            background:url(http://www.css88.com/wp-content/uploads/2014/09/ellipsis_bg.png) repeat-y;
        }

        /*分页*/
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

        .solve{
            color: white;
            background: #4f8df0;
        }
        .box{
            position: absolute;
            z-index: -100;
            height: 1.2rem;
        }

        /*START登录弹窗*/
        .login_modal {
            background-color: #fff;
            /*position: fixed;*/
            top: 100px;
            width: 6.9rem;
            text-align: center;
            -webkit-border-radius: 0.26rem;
            -moz-border-radius: 0.26rem;
            border-radius: 0.26rem;
            overflow: hidden;
        }

        .login_modal .tips {
            height: 1.58rem;
            margin-top: 1.33rem;
            font-size: 1.2rem;
            color: #4f8df0;
        }

        .login_modal p {
            font-size: 0.45rem;
            color: #333;
            line-height: 0.60rem;
        }

        .login_modal p.fast {
            margin-top: 0.45rem;
        }

        .login_modal p.last {
            padding-bottom: 0.84rem;
        }

        [data-dpr="1"] .login_modal p.last {
            border-bottom: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal p.last {
            border-bottom: 2px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal p.last {
            border-bottom: 4px solid #bfbfbf;
        }

        .login_modal .btn {
            height: 1.33rem;
            overflow: hidden;
        }

        .login_modal .btn button {
            height: 1.33rem;
            width: 50%;
            float: left;
            background-color: #fff;
            outline: 0 none;
            border: 0 none;
            font-size: 0.45rem;
            text-align: center;
            color: #4f8df0;
            box-sizing: border-box;
        }

        [data-dpr="1"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="2"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        [data-dpr="3"] .login_modal .btn button.rt {
            border-left: 1px solid #bfbfbf;
        }

        .layui-m-layercont {
            padding: 0 !important;
        }

        /*END 登录弹窗*/
        .lab-yanjing{
            margin-right: 0.1rem;
        }
    </style>
</head>
<body>
<div id="main" class="sp_main">


    <div class="headers">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()" ><img src="${rlab}/mobile/imgs/home_logo.png" /></a></p>
        <c:choose>
            <%--登录--%>
            <c:when test="${sessionScope.uid != null}">
                <p class="user-img" onclick="toCenter()">
                    <i>
                        <c:choose>
                            <c:when test="${sessionScope.avatar != null}">
                                <img src="${sessionScope.avatar}" alt="用户头像">
                            </c:when>
                            <c:otherwise>
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                            </c:otherwise>
                        </c:choose>
                    </i>
                </p>
            </c:when>
            <%--未登录--%>
            <c:otherwise>
                <a class="users lab-user" id="gouser" href="javascript:void (0)" onclick="toCenter()"></a>
            </c:otherwise>
        </c:choose>
    </div>
    
    <div class="content" style="padding-bottom: 1rem">
        <div class="banner"><img src="${rlab}/mobile/imgs/m2.1/demandhome.png" alt=""></div>
        <div class="but clearfix">
            <a onclick="gopubpage()"><i class="lab-fabu" style="font-size: 0.54rem;"></i>发布需求</a>
            <c:choose>
                <%--登录--%>
                <c:when test="${sessionScope.uid != null}">
                    <a onclick="goreqtinylist()"><i class="lab-user"></i>我的需求</a>
                </c:when>
                <%--未登录--%>
                <c:otherwise>
                    <a onclick="showModalToLogin()"><i class="lab-user"></i>我的需求</a>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="list">
            <ul>

            </ul>
        </div>
        <%-- START分页--%>
        <div class="paging" style="display: none;">
            <div id="page_container" class="page_list"></div>
        </div>
        <%-- END分页--%>
    </div>
<div class="box"></div>
</div>
</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script src="${rlab}/mobile/assets/fenye/pagination.js"></script>
<script type="text/javascript">

    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }

    setCallbackUrl();// 设置登录时回跳路径
    var PAGE_NO;//当前页码
    var total;//总页数
    var pageNumber=1;//当前页码
    //如果有页码获取出来
    if(GetQueryString("pageNo")){
        pageNumber=GetQueryString("pageNo")*1;
    }

    initialPage();//初始化页面

    //去发布需求页面
    function gopubpage() {
        window.location.href = BASE_URL + "/page/req/pubpage";
    }
    //去我的需求页面
    function goreqtinylist() {
        window.location.href = BASE_URL + "/front/user/req/tinylist?pageNo=1&pageSize=10&state=99&entrance=0";
    }
    //获取URL值函数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    //登录弹窗
    function showModalToLogin() {
        var html =
            '<div class="login_modal">\
            <div class="tips">\
            <i class="lab-gantanhao"></i>\
            </div>\
            <p class="fast">需要登录</p>\
            <p class="last">才可进入需求管理</p>\
            <div class="btn">\
            <button id="cancelModal" type="button">取消</button>\
            <button id="toLogin" type="button" class="rt">登录</button>\
            </div>\
            </div>';

        var layer_1 = layer.open({
            style: 'padding:0;width:auto;',
            shadeClose: false,
            content: html
        })

        $("#cancelModal").off("click").on("click", function () {
            layer.close(layer_1);
        });

        $("#toLogin").off("click").on("click", function () {
            toLogin();
        });
    }
    //初始化页面函数
    function initialPage() {
        $.ajax({
            url: BASE_URL + '/page/req/listinfo?pageSize=10&pageNo=' + pageNumber,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if (data.code === 0) {
                    total=data.payload.total;
                    PAGE_NO=data.payload.pageNum;
                    var datas = data.payload.list;
                    loadMeinv(datas);
                }
            },
            error: function () {
            }
        })
    }
    //循环生成节点
    function loadMeinv(itemList) {

        for (var i = 0; i < itemList.length; i++) {//每次加载时模拟随机加载图片
            var item = createItem(itemList[i]);
            $(".list ul").append(item);
            if($(".litext").eq($(".litext").length-1).height()>$(".box").height()){
                $(".litext").eq($(".litext").length-1).addClass("beyond");
            }
            item = null;
        }

    }
    //具体节点生成
    function createItem(data) {
        var html =
            '<li data-u-id="'+data.uReqId+'">\
            <p><span >'+ data.uName +'</span></p>\
            <p class="litext">'+ data.uReqDescription +'</p>\
            <p style="color: #7a7a7a"><i class="lab-yanjing"></i><s>' + data.uChkCount + '</s>人<span style="float: right;color: #4f8df0;">' + data.remainTime + '天后过期</span></p>\
            </li>';
        return $(html);
    }


    // 初始化页面分页
    showPages(total, (PAGE_NO -1) * 10, 10, function (from, max) {
        PAGE_NO = from / 10 + 1;
        toDemandList();
    }, "page_container");
    //分页跳转
    function toDemandList() {
        window.location.href = BASE_URL + '/page/req/listpage?pageNo=' + PAGE_NO;
    }
    //总条数超过10显示分页
    if (total>10){
        $(".paging").show();
    }
    //跳转详情页
    $(".list li").on("click",function () {
        var id=$(this).data("uId");
        window.location.href="${rlab}/page/req/detail?uReqId="+id;
    })
</script>
</html>
