<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/11/22
  Time: 17:08
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
        html,body{
            width: 100%;
            height: auto;
        }
        .rrcxq_main{
            margin-top: 1.173rem;
            overflow: hidden;
        }
        p{
            font-size: 0.32rem;
            margin-bottom: 0;
            line-height: 1;
        }
        p label{
            font-size: 0.5rem;
            color: #7490fc;
            float: left;
        }
        p span{
            color: #2b2b2b;
            font-size: 0.32rem;
            line-height: 0.5rem;
            float: left;
        }
        .tits{
            text-align: center;
            font-size: 0.37rem;
            line-height: 1;
            margin: 0.7rem 0;
            color: #2b2b2b;
        }
        .rrtit{
            margin-bottom: 0.4rem;
            margin-left: 0.22rem;
        }
        .titmain{
            margin: 0 0.48rem 0.72rem 0.72rem;
            letter-spacing: 0.02rem;
            line-height: 0.48rem;
            color: #373737;
        }
        .table{
            padding: 0 0.77rem 0.77rem 0.77rem;
            font-size: 0.2rem;
            text-align: center;
        }
        td{
            border: none;
        }
        tr{
            background: white;
            line-height: 1.2rem;
        }
        table{
            width: 100%;
        }
        table tbody tr{

            width: 100%;
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
    <div class="rrcxq_main">
        <p class="tits">人人创新券</p>
        <p class="clearfix rrtit"><label class="lab-dian_fang"></label><span>人人创新券简介</span></p>
        <p class="titmain">
            人人创新券由中关村昌平园管委会提供“昌平区小微企业<br>
            创新创业基地城市示范专项资金”支持，并负责管理、评<br>
            估和审计，委托人人实验平台具体实施。
        </p>
        <p class="clearfix rrtit"><label class="lab-dian_fang"></label><span>扶持对象</span></p>
        <p class="titmain">
            同时满足以下几项条件的小微企业和创新创业团队 ：<br>
            <br>
            1.注册资金不高于3000万元;<br>
            <br>
            2.在职正式员工不多于100人;<br>
            <br>
            3.近两年营业收入均在1000万元以下;<br>
            <br>
            4.无不良诚信记录。
        </p>
        <p class="clearfix rrtit"><label class="lab-dian_fang"></label><span>扶持额度</span></p>
        <div class="table">
            <table border="0">
                <colgroup>
                    <col width="25%">
                    <col width="25%">
                    <col width="25%">
                    <col width="25%">
                </colgroup>
                <tbody>
                    <tr style="background: #7490fc;color: white;line-height: 0.65rem;">
                        <td>申请企业注册地</td>
                        <td>服务方注册地</td>
                        <td>扶持比例</td>
                        <td>额度上限</td>
                    </tr>
                    <tr>
                        <td>昌平区内</td>
                        <td>昌平区内</td>
                        <td>50%</td>
                        <td>20万元</td>
                    </tr>
                    <tr>
                        <td>昌平区内</td>
                        <td>昌平区外</td>
                        <td>40%</td>
                        <td>20万元</td>
                    </tr>
                    <tr>
                        <td>昌平区外</td>
                        <td>昌平区内</td>
                        <td>30%</td>
                        <td>10万元</td>
                    </tr>
                    <tr>
                        <td>昌平区外</td>
                        <td>昌平区外</td>
                        <td>20%</td>
                        <td>5万元</td>
                    </tr>
                </tbody>

            </table>
        </div>
        <p class="clearfix rrtit"><label class="lab-dian_fang"></label><span>使用范围</span></p>
        <p class="titmain">
            仪器设备共享、测试检测服务、研发设计服务、委托开<br>
            发服务、合作研发服务、技术解决方案、创新支撑服务<br>
            等科技创新创业活动。
        </p>
        <p class="clearfix rrtit"><label class="lab-dian_fang"></label><span>申请使用流程</span></p>
        <p class="titmain">
            发起资格认证申请：<br>
            提交资格认证材料<br>
            平台审核<br>
            审核通过后获得创新券使用资格<br>
            <br>
            发起创新券项目申请：<br>
            提交项目申请表<br>
            平台审核<br>
            审核通过后该项目可使用创新券。<br>
            <br>
            创新券兑现：<br>
            用户、平台与项目服务方三者签订服务合同用户将项目<br>
            费用汇给人人实验平台，平台再与服务方结算项目完成<br>
            后，用户将项目合同、发票、记账凭证、银行回单、成<br>
            果证明材料等提交至平台备案平台公示完成后将创新券<br>
            扶持金额汇入用户账户。<br>
            <br>
            注：如需申请人人创新券，<br>
            请使用电脑登录www.renrenlab.com进行申请<br>
            或关注人人实验服务号，客服验小花为您解答
        </p>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
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
