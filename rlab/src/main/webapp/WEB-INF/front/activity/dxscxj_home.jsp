<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>


    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

    <style>
        body, html {
            background: #eff6ff;
            color: #666;
            font-size: 20px;
        }

        /*banner样式开始*/
        .img_content {
            width: 100%;
            padding-bottom: 31.25%;
            background: #f6f7ff;
            position: relative;
        }

        .banner img {
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
        }

        /*奖金券*/
        .blackboard {

        }

        .blackboard {
            width: 730px;
            margin: 0 auto;
            position: relative;
            height: 622px;
            overflow: hidden;
            margin-top: 57px;
        }

        .blackboard > img {
            position: absolute;
            width: 100%;
            left: 0;
            top: 0;
            z-index: 1;
        }

        .blackboard h2 {
            display: block;
            line-height: 60px;
            font-size: 34px;
            color: #003391;
            position: relative;
            z-index: 2;
            text-align: center;
            margin-right: 10px;
        }

        .server_content {
            height: 32px;
            line-height: 32px;
            margin-top: 153px;
            position: relative;
            text-align: center;
            z-index: 2;
            font-size: 20px;
            color: #333;
            font-weight: 700;

        }

        .board_tp_1 {
            width: 280px;
            position: absolute;
            left: 50%;
            top: 274px;
            margin-left: -136px;
            z-index: 2;
            font-size: 16px;
            color: #0352c8;
        }

        .board_tp_1 > div {
            width: 100px;
            height: 100px;
            text-align: center;
        }

        .board_tp_1 > div p {
            line-height: 40px;
        }

        .board_tp_1 > .lft {
            float: left;
        }

        .board_tp_1 > .rt {
            float: right;
        }

        .blackboard p.txt {
            font-size: 22px;
            color: #0352c8;
            z-index: 2;
            text-align: center;
            position: relative;
        }

        .blackboard .p {
            position: relative;
            z-index: 2;
            text-align: center;
            font-size: 20px;
            font-weight: 700;
            color: #333;
        }

        .cxj_content h2 {
            text-align: center;
            font-size: 30px;
            color: #2b2b2b;
            position: relative;
            height: 36px;
            line-height: 36px;
        }

        .cxj_content h2 span {
            position: relative;
            z-index: 3;
        }

        .cxj_content h2 i {
            background: #fdd539;
            display: block;
            width: 120px;
            height: 22px;
            position: absolute;
            left: 50%;
            margin-left: -60px;
            z-index: 2;
            top: 16px;
        }

        .items {
            padding: 20px 15px;
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            border-radius: 8px;
            width: 1200px;
            margin: 0 auto;
            background: #fff;
        }

        div.tip {
            font-size: 15px;
            color: #999;
            line-height: 40px;
            min-height: 40px;
        }

        /*使用规则部分*/
        .norm {
            background: #fff;
            margin-top: 70px;
        }

        .norm_box {
            overflow: hidden;
        }

        .norm_box > p {
            padding-left: 30px;
            position: relative;
            line-height: 40px;
            margin-bottom: 34px;
        }

        .norm_box > p > i {
            position: absolute;
            left: 0;
        }

        .norm_box > p > span {
        }
        s.mark {
            font-size: 28px;
            color: #0352c8;
            border-bottom: 2px solid #fdd539;
        }

        /*参与奖*/
        h5{
            font-size: 26px;
            color: #333;
            line-height: 68px;
            position: relative;
        }
        h5 > img{
            position: absolute;
            top:0;
            left: 100px;
        }

        .ty_p {
            position: relative;
            padding-left: 110px;
            min-height: 60px;
            line-height: 42px;
            font-size: 22px;
        }
        .ty_p > i{
            position: absolute;
            left: 0;
            top: 0;
            font-size: 22px;
            color: #666;
        }
        .ty_p > span{
            line-height: 45px;
            display: block;
        }
        .ty_p > span > img {
            vertical-align: bottom;
        }
        /*金银铜奖*/

    </style>
</head>
<body>

<div class="wrapper">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="cxj_content">
        <%--banner开始--%>
        <div class="banner">
            <div class="img_content">
                <img src="${rlab}/front/imgs/cxj/dxscxj/banner.jpg" alt="人人实验创新券海报">
            </div>
        </div>
        <%--人人实验奖金券--%>
        <div class="blackboard">
            <img src="${rlab}/front/imgs/cxj/dxscxj/blackboard.png" alt="">
            <h2 style="line-height: 60px; height: 60px">人人实验奖金券</h2>
            <div class="server_content" style="">
                服务内容
            </div>
            <div class=board_tp_1>
                <div class="lft">
                    <img style="width: 64px;" src="${rlab}/front/imgs/cxj/dxscxj/ins.png" alt="">
                    <p>仪器设备使用</p>
                </div>
                <div class="rt">
                    <img style="width: 62px;" src="${rlab}/front/imgs/cxj/dxscxj/facility.png" alt="">
                    <p>检验检测</p>
                </div>
            </div>
            <p class="p" style="margin-top: 140px;">使用时间</p>
            <p class="txt" style="margin-top: 15px;">5月1日-10月31日</p>
            <p class="p" style="margin-top: 35px;">服务对象</p>
            <p class="txt" style="margin-top:17px; ">第二届金银铜获奖团队、第三届全体参赛人员</p>
        </div>
        <%--第二届--%>
        <h2 style="margin-top:62px;"><span>第二届</span><i></i></h2>
        <div class="second_term items"
             style="width: 1200px;height: 156px;background: #fff;margin: 0 auto;margin-top: 50px;">
            <div style="line-height: 80px;">
                第二届金银铜获奖项目参加第三届大赛的团队，联系人人实验客服提供获奖证明领取<s class="mark">2000元</s>大赛奖金卡券。
            </div>
            <div class="tip">
                使用方法：在人人实验平台交易金额超过2000元，联系人人实验客服核对信息后，立减。
            </div>
        </div>
        <%--第三届--%>
        <h2 style="margin-top: 60px;"><span>第三届</span><i></i></h2>
        <div class="thirdy_term items" style="margin-top: 40px;">
            <h5><span>参与奖<img src="${rlab}/front/imgs/cxj/dxscxj/d.png" ></span></h5>
            <p class="ty_p">
                <i>服务对象：</i>
                <span style="color: #333;">第三届全体参赛人员；</span>
            </p>
            <p class="ty_p">
                <i>服务奖金：</i>
                <span>
                   <s class="mark">1000元/人</s> <i style="font-size: 17px;color: #666;">（含600元、300元、100元大赛奖金卡券各一张）</i>
                </span>
            </p>
            <p class="ty_p">
                <i>满减使用：</i>
                <span>
                    <img style="width: 184px;margin-right: 34px;" src="${rlab}/front/imgs/cxj/dxscxj/1.png" alt="">
                    <img style="width: 184px;margin-right: 34px;" src="${rlab}/front/imgs/cxj/dxscxj/2.png" alt="">
                    <img style="width: 184px;margin-right: 34px;" src="${rlab}/front/imgs/cxj/dxscxj/3.png" alt="">
                </span>
            </p>
            <div class="tip" style="margin-top:20px;">
                使用方法：交易成功后，符合满减金额（交易金额满1500元减600元、交易金额满1000元减300元、交易金额满500元减100元），联系人人实验相关客服核对信息后，立减。
            </div>
        </div>

        <%--金银铜奖--%>
        <div class="gold_medal items" style="margin-top: 30px;">
            <h5><span>金银铜奖<img src="${rlab}/front/imgs/cxj/dxscxj/d.png" ></span></h5>
            <p class="ty_p">
                <i>服务对象：</i>
                <span style="color: #2b2b2b;">第三届金银铜获奖团队；</span>
            </p>
            <p class="ty_p">
                <i>服务奖金：</i>
                <span style="color: #2b2b2b;line-height: 40px;position: relative;top: -9px"><img style="width: 40px;" src="${rlab}/front/imgs/cxj/dxscxj/medal_1.png" alt="">金奖（<s class="mark">10000元/团队</s>）；<img style="width: 30px;" src="${rlab}/front/imgs/cxj/dxscxj/medal_2.png" alt="">银奖（<s class="mark">5000元/团队</s>）；<img style="width: 28px;" src="${rlab}/front/imgs/cxj/dxscxj/medal_3.png" alt="">铜奖（<s class="mark">2000元/团队</s>）；</span>
            </p>
            <p class="ty_p">
                <i>领取方法：</i>
                <span style="color: #2b2b2b">大赛评选结果揭晓后，各团队可向人人实验平台或各省市组委会提交项目材料（项目中用于购买创新服务的合同及发票、项目成果、项目汇报材料等），根据自身获奖情况兑换相应奖金。</span>

                <span style="color: #2b2b2b;font-size: 22px">
                    详情请咨询平台客服：方式一，拨打客服热线4001029559；方式二，关注人人实验服务号（renrenlab），在后台直接留言；方式三，发送邮件至service@renrenlab.com。
                </span>
            </p>
        </div>
        <%--使用规则--%>
        <div class="norm">
            <div class="norm_box" style="width: 1200px;margin: 0 auto;">
                <h4 style="font-size: 28px;color: #333;line-height: 100px;">使用规则</h4>
                <p>
                    <i>1.</i>
                    <span>
                        仅限中国“互联网+”大学生创新创业大赛第二届金银铜奖项目及第三届参赛人员使用；
                    </span>
                </p>
                <p>
                    <i>2.</i>
                    <span>
                        服务需为切实存在的参赛使用需求，忌违规使用大赛奖金卡券；
                    </span>
                </p>
                <p>
                    <i>3.</i>
                    <span>
                        在人人实验平台内通用，无品类、地域限制，订单中所产生的交易需达到满减额才能使用，同一订单符合满减金额可叠加使用；
                    </span>
                </p>
                <p>
                    <i>4.</i>
                    <span>
                       大赛奖金卡券不能直接兑换现金；
                    </span>
                </p>
                <p>
                    <i>5.</i>
                    <span>
                       每张大赛奖金卡券仅能够使用一次，不找零，不退换；
                    </span>
                </p>
                <p>
                    <i>6.</i>
                    <span>
                       使用大赛奖金卡券抵扣部分的金额不开具发票；
                    </span>
                </p>
                <p>
                    <i>7.</i>
                    <span>
                        大赛奖金卡券应在系统显示的有效期内使用，逾期作废；
                    </span>
                </p>
                <p>
                    <i>8.</i>
                    <span>
                        使用大赛奖金卡券的订单，已支付未提供服务的订单如果发生订单取消在成功后，系统会立即把奖金卡券退回账户，有效期不变，如订单遇到由多个服务商提供，奖金金额分摊到每一个交易商品上；
                    </span>
                </p>
                <p>
                    <i>9.</i>
                    <span>
                        了解更多关于大赛奖金卡券的使用规则，请咨询人人实验官方客服（400-102-9559）。
                    </span>
                </p>

            </div>


        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <!--绑定手机号弹窗源码-->
</div>

<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script>
    function isLogin() {
        var lyerModal;
        var HTML = '<div class="md_ctnt" >\
                        <h6>请您登录后下载文件</h6>\
                        <p><span id="timer">3s</span>后自动跳转至登录页</p>\
                     </div>'
        var layerOption = {
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: false,
            skin: 'yourclass',
            content: HTML
        }
        lyerModal = layer.open(layerOption);
        var index = 3;
        setInterval(function () {
            if (index == 0) {
                logins();
            } else {
                $("#timer").text(--index + 's');
            }
        }, 1000)
    }
</script>
</body>
</html>