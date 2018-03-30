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
        .hdxt{
            margin: 1.173rem 0.69rem 0 0.77rem;
            overflow: hidden;
        }

        .hdxt p{
            font-size: 0.32rem;
            color: #373737;
            line-height: 0.48rem;
            letter-spacing: 0.02rem;
        }
        .hdxt .hdxt_tit{
            text-align: center;
            margin-bottom: 0.84rem;
            color: #2b2b2b;
            margin-top: 0.3rem;
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
    <div class="hdxt">
        <p class="hdxt_tit">海淀协同创新券</p>
        <p>为贯彻落实海淀区委区政府《关于加快核心区自主创新<br>
            和产业发展的若干意见》（京海发〔2014〕10号），<br>
            进一步盘活海淀优势科技资源，降低企业创新投入成本，<br>
            激发创新活力，促进中小微企业与高校院所、社会服务<br>
            机构之间的产学研合作，完善中关村协同创新服务平台<br>
            的聚合调动功能，海淀区提出实施海淀协同创新券。<br>
            <br>
            人人实验平台作为中关村协同创新平台的创新驿站，主<br>
            要负责协助企业申请协同创新券以及技术服务对接工作。<br>
            <br>
            <br>
            注：如需申请海淀协同创新券，<br>
            请使用电脑登录www.renrenlab.com进行申请<br>
            或关注人人实验服务号，客服验小花为您解答。</p>
    </div>
    <%--<div id="org">
        <h1>合作机构</h1>
        <div id="orglist" class="mui-slider">
            <div class="mui-slider-group mui-slider-loop">
                <div class="mui-slider-item mui-slider-item-duplicate">
                    <a><img src="${rlab}/mobile/imgs/21.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/22.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/23.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/24.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/25.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/1.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/2.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/3.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/4.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/5.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/6.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/7.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/8.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/9.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/10.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/11.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/12.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/13.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/14.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/15.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/16.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/17.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/18.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/19.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/20.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/21.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/22.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/23.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/24.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/25.jpg"/></a>
                </div>
                <div class="mui-slider-item mui-slider-item-duplicate">
                    <a><img src="${rlab}/mobile/imgs/1.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/2.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/3.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/4.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/5.jpg"/></a>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <img src="${rlab}/mobile/imgs/home_logo.png"/>
        <p>关注“人人实验”服务号，体验VIP专业定制服务</p>
        <p>长按识别二维码，或保存图片后用微信扫一扫打开</p>
        <p><img src="${rlab}/mobile/imgs/two.jpg"></p>
    </div>--%>

</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
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

    var mask = mui.createMask(function(){
        $("#codes").hide();
    });
    function showCodes() {
        mask.show();
        $("#codes").show();
    }
    function closeCode() {
        mask.close();
        $("#codes").hide();
    }
    setCallbackUrl();// 设置登录时回跳路径
    mui.init({
        swipeBack: false //启用右滑关闭功能
    });


</script>
</html>
