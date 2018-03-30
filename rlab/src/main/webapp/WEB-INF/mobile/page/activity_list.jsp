<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/11/24
  Time: 11:13
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
    <style>
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
        #item4mobile{
            margin-top: 1.173rem;
            padding: 0.36rem 0.32rem;
        }
        #item4mobile li {
            font-size: 0.32rem;
            padding: 0.333rem;
            margin-top: 0.18rem;
            background: white;
            border-radius: 0.2rem;
        }
        #item4mobile p{
            width: 100%;
            margin: 0;
            overflow: initial;
            font-size: 0.37rem;
            color: #4e4e4e;
            line-height: 0.4rem;
        }
        #item4mobile img{
            width: 2.77rem;
            height: 2.77rem;
            float: left;
        }
        #item4mobile .tit h3{
            font-size: 0.32rem;
            color: #adadad;
            margin-top: 0.4rem;
            margin-bottom: 0.8rem;
        }
        #item4mobile{
            border: none!important;
        }
        #item4mobile .tit h2{
            font-size: 0.4rem;
            color: #3f3f3f
        }
        #item4mobile .tit{
            max-width: 5rem;
            margin-left: 0.82rem;
            float: left;
        }
        #item4mobile p{
            font-size: 0.32rem;
        }
        .tit_state{
            color: #18c248;
        }
        .tit_timer{
            color: #c0c0c0;
            margin-left: 0.32rem;
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
    <div class="lists" id="item4mobile">
        <ul>
            <li class="clearfix">
                <a href="${rlab}/page/activity/rrcxq">
                    <img class="liImg"  src="${rlab}/mobile/imgs/m2.3/activity/rrcxj.png"/>
                    <div class="tit">
                        <h2>人人创新券</h2>
                        <h3>共享科技资源，服务创新创业</h3>
                        <p><span class="tit_state">进行中</span><span class="tit_timer">2017.07.01-2017.12.31</span></p>
                    </div>
                </a>
            </li>
            <li class="clearfix">
                <a href="${rlab}/page/activity/sdkj">
                    <img class="liImg" src="${rlab}/mobile/imgs/m2.3/activity/sdkj.png" />
                    <div class="tit">
                        <h2>首都科技创新券</h2>
                        <h3 style="margin-bottom: 0.4rem;line-height: 0.5rem;">
                            创新创业&nbsp;政府助力 <br>
                            创业互帮&nbsp;合作共赢
                        </h3>
                        <p><span class="tit_state">进行中</span><span class="tit_timer">2017.07.01-2017.12.31</span></p>
                    </div>
                </a>
            </li>
            <li class="clearfix">
                <a href="${rlab}/page/activity/hdxt">
                    <img class="liImg" src="${rlab}/mobile/imgs/m2.3/activity/hdxt.png"/>
                    <div class="tit">
                        <h2>海淀协同创新券</h2>
                        <h3  style="margin-bottom: 0.4rem;line-height: 0.5rem;">
                            降低企业投入成本 <br>
                            激发创新创业活力
                        </h3>
                        <p><span class="tit_state">进行中</span><span class="tit_timer">2017.07.01-2017.12.31</span></p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }
</script>

</html>
