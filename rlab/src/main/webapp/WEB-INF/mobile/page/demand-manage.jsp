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

    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202 ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <%--layer--%>


    <style type="text/css">
        /*头部样式在base.css*/

        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            background: #f5f6fa;
        }

        a {
            text-decoration: none !important;
        }

        a:hover {
            text-decoration: none !important;
        }

        a:link {
            text-decoration: none !important;
        }

        p {
            margin-bottom: 0;
        }

        .mui-toast-container {
            bottom: 50%;
        }

        textarea {
            margin: 0;
            padding: 0;
        }

        .content {
            margin-top: 1.173rem;
            padding-bottom: 1rem;
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
            top: 0;
            right: 0;
        }

        .user-img {
            width: 0.8267rem;
            height: 1.173rem;
            line-height: 1.173rem;
            text-align: center;
            position: absolute;
            top: 0;
            right: 0.3rem;
        }

        .user-img img {
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
            top: 0;
            left: 0;
        }

        #tab {
            padding-top: 0.64rem;
            background: #F5F6FA;
        }

        #tabHeard {
            height: 0.4rem;
            line-height: 0.4rem;
            margin-bottom: 0.267rem;
        }

        #tabHeard a {
            padding: 0;
            line-height: 0.5rem;
            font-size: 0.373rem;
            color: #B5B5B5;
        }

        #sliderProgressBar {
            background-color: #4F8DF0;
            height: 0.05rem;
            width: 25%;
        }

        #tabHeard .active {
            background: 0 0;
            color: #4f8df0;
        }

        .boder {
            border-left: 0.03rem solid #e5e5e5 !important;
        }

        #tabBox {
            margin-top: 0.3067rem;
            padding-bottom: 0.3rem;
        }

        .tabLi {
            padding-left: 0.32rem;
            padding-right: 0.32rem;
            border: none !important;
        }
        .tabLi ul {
            background: #F5F6FA;
        }

        .tabLi li {
            font-size: 0.32rem;
            padding: 0.67rem 0.47rem;
            margin-top: 0.18rem;
            background: white;
            border-radius: 0.2rem;
        }
        .item{
            display: inline-block;
            width: 24%;
            text-align: center;
        }
        .timeState{
            line-height: 0.587rem;
            font-size: 0.3rem;
            color: #7a7a7a;
            position: relative;
        }



        .state {
            width: 1.53rem;
            height: 0.587rem;
            display: block;
            position: absolute;
            top: 0;
            right: -0.47rem;
            text-align: center;
        }

        .state0 {
            background: url("${rlab}/mobile/imgs/m2.1/daishenhe.png") no-repeat;
            background-size: 100%;
            color: #fcaa0d;
        }

        .state1 {
            background: url("${rlab}/mobile/imgs/m2.1/yijujue.png") no-repeat;
            background-size: 100%;
            color: #ef6f6f;
        }

        .state2 {
            background: url("${rlab}/mobile/imgs/m2.1/yiguoqi.png") no-repeat;
            background-size: 100%;
            color: #7a7a7a;
        }

        .state3 {
            background: url("${rlab}/mobile/imgs/m2.1/yijiejue.png") no-repeat;
            background-size: 100%;
            color: #35d694;
        }

        .state4 {
            background: url("${rlab}/mobile/imgs/m2.1/weijiejue.png") no-repeat;
            background-size: 100%;
            color: #4f8df0;
        }

        .showtext {
            padding-top: 0.3rem;
            text-align: center;
            border-bottom: 0.02rem solid #f0f0f0;
            line-height: 1.02rem;
            font-size: 0.3rem;
            margin-top: -0.5rem;
            background-size: 100%;
            position: relative;
            z-index: 99;
        }
        .showtext span{
            position: relative;
            z-index: 99;
        }
        .showtext img{
            position: absolute;top: 0;left: 0;width: 100%;height: 100%;z-index: 98
        }
        .refuse{
            line-height: 0.447rem;
            font-size: 0.3rem;
            color: #ef6f6f;
            margin-top: 0.53rem;
            margin-bottom: 0.4rem!important;
        }
        .but{
            width: 2.65rem;
            height: 0.867rem;
            font-size: 0.32rem;
            line-height: 0.867rem;
            border-radius: 0.213rem;
            background: #4f8df0;
            text-align: center;
            color: white;
            display: inline-block;
        }
        .endtime{
            text-align: right;
            color: #4f8df0;
            font-size: 0.3rem;
        }

        .endtimeNum{
            font-size: 0.3rem;
            color: #7a7a7a;
        }
        .endtimeNum i{
            margin-right: 0.2rem;
        }
        .endtimeNum i,.endtimeNum span{
            float: left;
            line-height: 0.5rem;
        }
        .demandtext {
            font-size: 0.37rem;
            line-height: 0.55rem;
            color: #4E4E4E;
            margin-bottom: 0.2rem;
            /*overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
            width: 100%;*/
        }
        .box{
            margin-top: 0.26rem;
            max-height: 1.65rem;
            overflow: hidden;
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

        /*弹窗*/
        .layui-m-layer1 .layui-m-layerchild {
            border-radius: 0.267rem;
        }
        .pop{
            display: none;
        }
        .popup{
            overflow: hidden;
            position: relative;
            width: 8rem;
            height: 4.53rem;
            border-radius: 0.267rem;
            background: white;
        }
        .popup .p1{
            margin-top: 1.22rem;
            font-size: 0.45rem;
            color: #333;
            text-align: center;
        }
        .popup .p2{
            margin-top: 0.267rem;
            font-size: 0.34rem;
            color: #7c7c7c;
            text-align: center;
        }
        .popup .popbtn{
            float: left;
            font-size: 0.45rem;
            color: #4f8df0;
            line-height: 1.333rem;
            display: inline-block;
            text-align: center;
            width: 3.99rem;
            border-top: 0.02rem solid #bfbfbf;
        }
        .popup .commit{
            border-left: 0.02rem solid #bfbfbf;
        }
        .boxs{
            width: 0.3rem;
            height: 1.341rem;
            position: absolute;
            z-index: -100;
        }
        .beyond{
            position: relative;
            max-height:1.341rem;
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
        .default{
            padding-top: 3rem;
            text-align: center;
            margin-top: 1.173rem;
            padding-bottom: 1rem;
            overflow: hidden;
        }
        .default p{
            margin-top: 0.7rem;
            text-align: center;
            color: #666;
            font-size: 0.4267rem;
        }
        .default img{
            margin: auto;
            width: 2.92rem;
        }
    </style>
</head>
<body>
<div id="main" class="sp_main">


    <div class="headers" style="background: white">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()"><img src="${rlab}/mobile/imgs/home_logo.png"/></a></p>
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
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg"
                                     alt="用户头像">
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

    <div class="content" style="display:${map.get("count") == 0?'none':'block'}">
        <div id="tab">
            <div  id="tabHeard">
                <a class="item ${state == 99?"active":""}"  onclick="gotab(this)" data-state-id="99">全部</a>
                <a class="item boder ${state == 4?"active":""}"  onclick="gotab(this)" data-state-id="4">未解决</a>
                <a class="item boder ${state == 0?"active":""}"  onclick="gotab(this)" data-state-id="0">待审核</a>
                <a class="item boder ${state == 2?"active":""}"  onclick="gotab(this)" data-state-id="2">已过期</a>
            </div>
            <div id="sliderProgressBar" style="margin-left:${state == 4?"25%":state == 0?"50%":state == 2?"75%":""}"></div>
            <div id="tabBox">
                <div class="tabLi">
                    <ul>
                    <c:forEach items="${infos}" var="info">
                        <li>
                            <p class="timeState">
                                发布时间：${info.beginTime}
                                <span class="state ${info.uReqState == 0?"state0":info.uReqState == 1?"state1":info.uReqState == 2?"state2":info.uReqState == 3?"state3":info.uReqState == 4?"state4":""}">
                                        ${info.uReqState == 0?"待审核":info.uReqState == 1?"已拒绝":info.uReqState == 2?"已过期":info.uReqState == 3?"已解决":info.uReqState == 4?"未解决":""}
                                </span>
                            </p>

                            <div class="box">
                                <p class="demandtext">
                                        ${info.uReqDescription}
                                </p>
                            </div>

                            <p class="showtext"><img src="${rlab}/mobile/imgs/m2.1/managebg.png" alt=""><span><s>点击展开</s><i class="lab-down"></i></span></p>

                            <c:if test="${info.uReqState == 1}">
                                <c:if test="${info.uReqReason != null && info.uReqReason != ''}">
                                    <p class="refuse">拒绝原因：${info.uReqReason}</p>
                                </c:if>
                            </c:if>

                            <div style="margin-bottom: 0.5rem;margin-top: 0.5rem;text-align: right">

                                <c:if test="${info.uReqState == 0||info.uReqState == 1||info.uReqState == 4}">
                                    <p class="but" onclick="modify(this)" data-req-id="${info.uReqId}">修改</p>
                                </c:if>

                                <c:if test="${info.uReqState == 2}">
                                    <p class="but" onclick="modify(this)" data-req-id="${info.uReqId}">重新发布</p>
                                </c:if>

                                <c:if test="${info.uReqState == 4}">
                                    <c:if test="${info.uHasDelay == 0}">
                                        <c:if test="${info.remainTime != null && info.remainTime <= 3}">
                                            <p class="but" style="margin: 0 0.1rem" data-req-id="${info.uReqId}" onclick="addTime(this)">延长有效期</p>
                                        </c:if>
                                    </c:if>
                                    <p class="but solve" data-req-id="${info.uReqId}" onclick="finish(this)">已解决</p>
                                </c:if>
                            </div>

                            <c:if test="${info.uReqState == 4}">
                                <p class="endtime">${info.remainTime}天后过期</p>
                            </c:if>

                            <c:if test="${info.uReqState > 1}">
                                <p class="endtimeNum clearfix"><i class="lab-checked-3"></i><span>${info.uChkCount}人</span><span style="float: right">截止日期：${info.endTime}</span></p>
                            </c:if>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <%-- START分页--%>
        <div class="paging" style="display: ${total > 10? "block" : "none"};">
            <div id="page_container" class="page_list"></div>
        </div>
        <%-- END分页--%>
    </div>
    <div class="default" style="display:${map.get("count") == 0?'block':'none'}">
        <img src="${rlab}/mobile/imgs/demand_default.png" alt="">
        <p>哎呦，您还没有发布过需求<br>快去发布一个吧</p>
    </div>
    <div class="pop solves">
        <div class="popup">
            <p class="p1">你是否确认该需求已解决？</p>
            <p class="p2"></p>
            <div style="position: absolute;bottom: 0;left: 0">
                <span class="popbtn dismiss">取消</span>
                <span class="popbtn commit commits">确定</span>
            </div>
        </div>
    </div>
    <div class="pop defer">
        <div class="popup">
            <p class="p1">你是否确认延长该需求有效期？</p>
            <p class="p2">仅可延长一次需求的有效期</p>
            <div style="position: absolute;bottom: 0;left: 0">
                <span class="popbtn postpone">取消</span>
                <span class="popbtn commit confirm">确定</span>
            </div>
        </div>
    </div>
    <div class="boxs"></div>
</div>
</body>
<script type="text/javascript" src="${rlab}/common/assets/zepto_lab_animate/lab.animate.js"></script>
<script src="${rlab}/mobile/assets/fenye/pagination.js"></script>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }


    var PAGE_NO = '${pageNo}';// 起始页参数
    var PAGE_SIZE = 10; // 每页条数参数
    var STATE = '${state == null || ''.equals(state)? 99:state}'; // 状态筛选参数
    showselect();//显示下拉展开按钮
    refusalCause()//拒绝原因三行隐藏
    //返回
    var entrance=GetQueryString("entrance");
    function gotab($this) {
        $this = $($this);
        var state=$this.data("stateId");
        window.location.href = '${rlab}/user/req/tinylist?pageNo=1&pageSize=10&state=' + state + '&entrance=' + entrance;
    }
    //获取URL值函数
    function GetQueryString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return unescape(r[2]); return null;
    }
    //下拉展开
    function showselect() {
        for (var i=0;i<$(".demandtext").length;i++){
            if ($(".demandtext").eq(i).height()<$(".demandtext").eq(i).parent().height()) {
                $(".demandtext").eq(i).parent().parent().find(".showtext").hide();
            }
        }
    }
    //拒绝原因三行隐藏
    function  refusalCause() {
        for (var i=0;i<$(".refuse").length;i++){
            if ($(".refuse").eq(i).height()>$(".boxs").height()) {
                $(".refuse").eq(i).addClass("beyond");
            }
        }
    }
    function modify($this) {
        $this = $($this);
        var id = $this.data('reqId');
        window.location.href = '${rlab}/user/req/modifypage?uReqId=' + id;
    }

    /**
     * 跳转仪器需求管理列表页
     */
    function toDemandList() {
        window.location.href = BASE_URL + '/user/req/tinylist?pageNo=' + PAGE_NO + '&pageSize=' + PAGE_SIZE + '&state=' + STATE + '&entrance=' + entrance;
    }

    // 初始化页面分页
    showPages(${total}, (${pageNo} -1) * 10, ${pageSize}, function (from, max) {
        PAGE_NO = from / 10 + 1;
        toDemandList();
    }, "page_container");


    function finish($this) {
        $this = $($this);
        var id = $this.data('reqId');
        var html = $(".solves").html();
        var laryer = layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 0,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['400px', '150px'], //宽高
            content: html  //弹窗内容
        });

        $(".dismiss").off("click").on("click", function () {
            layer.close(laryer);
        });
        $(".commits").off("click").on("click", function () {
            var data = {
                uReqIds: [id],
                uReqState: 3
            }
            $.ajax({
                url: '${rlab}/user/req/auditing',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:function (data) {
                    window.location.reload(true);
                },
                error:function () {
                    mui.toast("失败");
                },
            })
        });
    }

    function addTime($this) {
        $this = $($this);
        var id = $this.data('reqId');
        //        console.log(id);
        var html = $(".defer").html();
        var laryer = layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 0,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['400px', '170px'], //宽高
            content: html  //弹窗内容
        });

        $(".postpone").off("click").on("click", function () {
            layer.close(laryer);
        });
        $(".confirm").off("click").on("click", function () {
            console.log('commit' + id);
            $.ajax({
                url: '${rlab}/bg/req/delay?uReqId=' + id,
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                success:function (data) {
                    window.location.reload(true);
                },
                error:function () {
                    mui.toast("失败");
                },
            })

        });
    }
    $(".showtext").on("click", function () {
        var hei=$(this).parent().find(".demandtext").css("height");
        hei=hei.replace(new RegExp("px"), "");
        if ($(this).data("boxHei")){
            var boxhei=$(this).data("boxHei");
        }else {
            var boxhei=$(this).parent().find(".box").css("height");
            $(this).data("boxHei",boxhei);
        }
        var $this=$(this);
        if($(this).parent().find(".box").css("height")==boxhei){
            hei=hei*1+$(".boxs").width();
            $(this).parent().find(".box").labAnimate({"maxHeight": hei}, 1000,"easing2");
            setTimeout(function () {
                $this.find("s").html("点击收起");
                $this.find("i").attr("class","lab-top");
            },1000)
        }else {
            boxhei=boxhei.replace(new RegExp("px"), "");
            $(this).parent().find(".box").labAnimate({"maxHeight": boxhei}, 1000,"easing2");
            setTimeout(function () {
                $this.find("span s").html("点击展开");
                $this.find("span i").attr("class","lab-down");
            },1000)
        }
    })
</script>
</html>


