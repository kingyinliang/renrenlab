
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

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202 ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>

    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <%--layer--%>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

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
        .substance{
            padding: 0.53rem 0.44rem;
            background: #fff;
            border-radius:0.2rem;
            margin-top: 0.26rem;
            position: relative;
        }

        .substance textarea{
            width: 100%;
            min-height: 7rem;
            border: 0;
        }
        .both_btn{
            height: 1.17rem;
            background-color: rgba(79, 141, 240, 1);
            width: 100%;
            position: fixed;
            bottom: 0;
            font-size: 0.37rem;
            line-height: 1.17rem;
            letter-spacing: 0.008rem;
            color: #ffffff;
            text-align: center;
        }
        .tit i{
            color: #4f8df0;
            margin-left: 0.2rem;
        }
        .tit{
            margin-left: 0.44rem;
            color: #4e4e4e;
            font-size: 0.37rem;
        }
        #textNum{
            color: #7a7a7a;
            text-align: right;
            position: absolute;
            right: 0.44rem;
            bottom: 0.53rem;
            background: white;
            z-index: 999;
        }
        #text{
            font-size: 0.37rem;
            line-height: 0.53rem;
        }
        #text::-webkit-input-placeholder { /* WebKit browsers */
            color:    #cbcbcb;
        }
        #text:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
            color:    #cbcbcb;
        }
        #text::-moz-placeholder { /* Mozilla Firefox 19+ */
            color:    #cbcbcb;
        }
        #text:-ms-input-placeholder { /* Internet Explorer 10+ */
            color:    #cbcbcb;
        }
        .refuse{
            font-size: 0.3rem;
            line-height: 0.447rem;
            color: #ef6f6f;
            padding: 0.44rem;
        }


        /*弹窗*/
        .layui-m-layer1 .layui-m-layerchild {
            border-radius: 0.267rem;
        }
        #pop{
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
    </style>
</head>
<body>
<div id="main" class="sp_main">


    <div class="headers" style="background: white">
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

    <div class="content">
        <div style="padding: 0.32rem">
            <p class="tit">需求描述<i class="lab-tip"></i></p>
            <div class="substance">
                <p id="textNum"><span id="textNums">0</span>/140字</p>
                <textarea id="text" maxlength="140" placeholder="为了保证您获得质量更佳的服务，请具体描述该实验项目的可公开信息，包括但不限于研究目的/背景介绍、实验样品（名称、数量、状态、处理方式等）、实验方法（标准、技术规范等）、实验仪器设备（名称、品牌、型号等）以及服务方资质要求等。">${detail.uReqDescription}</textarea>
            </div>
            <c:if test="${detail.uReqState==1}">
                <div class="refuse">
                    <p>拒绝原因：<span>${detail.uReqReason}。</span></p>
                </div>
            </c:if>
        </div>
        <div class="both_btn">
            ${Integer.valueOf(detail.remainTime) <= 0? '重新发布': '修改需求'}
        </div>
    </div>
    <div id="pop">
        <div class="popup">
            <p class="p1">你是否确认${Integer.valueOf(detail.remainTime) <= 0? '重新发布该需求': '修改需求'}？</p>
            <p class="p2"></p>
            <div style="position: absolute;bottom: 0;left: 0">
                <span class="popbtn dismiss">取消</span>
                <span class="popbtn commit">确定</span>
            </div>

        </div>
    </div>
</div>

</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }


    var text = $("#text").val();
    $("#textNums").text(text.length);


    $("#text").on("input",function () {
        if ($("#text").val().length>140){
            $("#textNums").css("color","red");
            $("#textNums").html($("#text").val().length);
        }else {
            $("#textNums").css("color","#7a7a7a");
            $("#textNums").html($("#text").val().length);
        }
    })


    $(".both_btn").on("click", function () {

        var text = $("#text").val();
        if (text.length == 0){
            mui.toast("需求描述不能为空");
            return;
        }
        var html = $("#pop").html();
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
        $(".commit").off("click").on("click", function () {

            var text = $("#text").val();
            var data;
            if (${Integer.valueOf(detail.remainTime) <= 0}) {
                data = {
                    'uReqId': ${detail.uReqId},
                    'uReqDescription': text,
                    'modifyTimes': '${detail.modifyTimes}',
                    'isReDepoly': '1'
                };
            } else {
                data = {
                    'uReqId': ${detail.uReqId},
                    'uReqDescription': text,
                    'modifyTimes': '${detail.modifyTimes}'
                };
            }


            $.ajax({
                url: '${rlab}/user/req/modify',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:function (data) {
                    if(data.code === 0){
                        mui.toast("需求修改成功,即将跳转");
                        setTimeout(function () {
                            window.location.href = '${rlab}/user/req/tinylist?pageNo=1&pageSize=10&state=0';
                        },1000)
                    }
                },
                error:function () {
                    mui.toast('修改失败，请重新操作！');
                    layer.close(laryer);
                },
            })

        });
    })
</script>
</html>


