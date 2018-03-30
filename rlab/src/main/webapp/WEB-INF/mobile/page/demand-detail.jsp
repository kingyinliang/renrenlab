<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>【微需求】${detail.uReqDescription}</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <meta name="description" content="人人实验是互联网+科技服务平台，200多家检测机构，提供近5万种设备和服务项目，涵盖生物医药、智能硬件、化学化工等多个领域，由专业人员1对1跟踪服务，保证检测质量与效率">
    <meta name="Keywords" content="实验外包，仪器租用，第三方检测，仪器租赁，仪器共享，实验服务，研发服务，检测服务，服务商加盟，互联网+，化学，化工，材料，学术，科学，科研，博士，硕士，理工，科技创新券，生物医药检测，生物器械检测，化学化工检测，金属材料检测，电子电气及机械检测， 电磁兼容（EMC）检测，软件信息检测， 环境监测，环境监测与职业卫生检测，食品及农产品检测，可靠性测试，气候环境实验，大型仪器，服务机构。">
    <meta property="og:type" content="article">
    <meta property="og:title" content="【微需求】${detail.uReqDescription}" />
    <%--缩略图--%>
    <meta property="og:image" content="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/wxfx.jpg">
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

        .content {
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

        .substance {
            padding: 0.62rem 0.47rem;
            background: #fff;
            border-radius: 0.2rem;
            margin-top: 0.26rem;
        }

        .information {
            font-size: 0.293rem;
            color: #7a7a7a;
        }

        .information_see {
            float: right;
        }

        .substance_text {
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.37rem;
            line-height: 0.54rem;
            letter-spacing: 0.008rem;
            color: #4e4e4e;
            margin: auto;
            margin-top: 0.38rem;
        }

        .end_Time {
            margin-top: 1.34rem;
            text-align: right;
        }

        .expire {
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.29rem;
            line-height: 0.44rem;
            letter-spacing: 0.005rem;
            color: #4f8df0;

        }

        .both_btn {
            height: 1.17rem;
            background-color: rgba(79, 141, 240, 1);
            width: 100%;
            position: fixed;
            bottom: 0;
        }

        .btnName, .contactWay {
            width: 100%;
            height: 100%;
            float: left;
            font-family: ﻿PingFangSC-Regular;
            font-size: 0.37rem;
            line-height: 1.17rem;
            letter-spacing: 0.008rem;
            color: #ffffff;
            text-align: center;
        }

        .btnName {
            background-color: rgba(30, 30, 31, 1);
        }

        .contactWay {
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

    </style>
</head>
<body>
<div id="main" class="sp_main">
    <div class="headers" style="background: white">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()"><img
                src="${rlab}/mobile/imgs/home_logo.png"/></a></p>
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

    <div class="content">
        <div style="padding: 0.32rem">
            <div class="substance">
                <div class="information">
                    <div style="margin-bottom: 0.3rem">发布人：${detail.uName}</div>
                    <div class="information_time">
                        <span>发布时间：${detail.beginTime}</span>
                        <div class="information_see">
                            <i class="lab-yanjing"></i>
                            <span>
                                    <s>${detail.uChkCount}</s>人
                                </span>

                        </div>
                    </div>
                </div>
                <div class="substance_text">
                    ${detail.uReqDescription}
                </div>
                <div class="end_Time">
                    <p class="expire" style="display: ${detail.uReqState == 3? 'none':'block'};margin-bottom: 0.2rem">
                        ${detail.remainTime}天后过期
                    </p>
                    <p class="endDate">
                        截止日期：<span>${detail.endTime}</span>
                    </p>
                </div>

            </div>
        </div>
        <div class="both_btn" style="display: ${detail.uReqState!=4?'none':'block'}">

            <c:choose>
                <%--登录--%>
                <c:when test="${sessionScope.uid != null}">
                    <div id="aaa" class="contactWay" data-u-phone="${detail.uMobile}">查看联系方式</div>
                </c:when>
                <%--未登录--%>
                <c:otherwise>
                    <div class="contactWay" onclick="showModalToLogin()">查看联系方式</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>


</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script typet="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }

    $("#aaa").on("click",function () {
        showcontactWay(this);
    })

    function showcontactWay($this) {
        $this = $($this);
        $this.css("background", "#bfbfbf");
        $this.css("color", "rgba(79, 141, 240, 1)");
        var str='<a href="tel:'+$this.data("uPhone")+'">'+$this.data("uPhone")+'</a>'
        $this.html(str);
        $.ajax({
            url: '${rlab}/page/req/addcount?uReqId=' +${detail.uReqId},
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if (data.code == 0) {
                    $this.off("click");
                    $(".information_see span s").html($(".information_see span s").html() * 1 + 1);
                    /*$this.live("click",showcontactWay);;*/
                }
            },
            error: function () {
            }
        })
    }
    function showModalToLogin() {
        var html =
            '<div class="login_modal">\
            <div class="tips">\
            <i class="lab-gantanhao"></i>\
            </div>\
            <p class="fast">需要登录</p>\
            <p class="last">才可查看联系方式</p>\
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
    $(function(){
        var url = location.href.split('#').toString();//url不能写死
        $.ajax({
            type : "get",
            url: "${rlab}/front/wechatParam",
            dataType : "json",
            async : false,
            data:{url:url},
            success : function(data) {
                wx.config({
                    debug: false,////生产环境需要关闭debug模式
                    appId: data.appid,//appId通过微信服务号后台查看
                    timestamp: data.timestamp,//生成签名的时间戳
                    nonceStr: data.nonceStr,//生成签名的随机字符串
                    signature: data.signature,//签名
                    jsApiList: [//需要调用的JS接口列表
                        'checkJsApi',//判断当前客户端版本是否支持指定JS接口
                        'onMenuShareTimeline',//分享给好友
                        'onMenuShareAppMessage'//分享到朋友圈
                    ]
                });
            },
            error: function(xhr, status, error) {
                //alert(status);
                //alert(xhr.responseText);
            }
        })
    });
    wx.ready(function () {
        var link = window.location.href;
        var protocol = window.location.protocol;
        var host = window.location.host;
        //分享朋友圈
        wx.onMenuShareTimeline({
            title: '【微需求】${info.tInfoTitle}',
            link: link,
            imgUrl: 'http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E9%9C%80%E6%B1%82.png',// 自定义图标
            trigger: function (res) {
                // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回.
                //alert('click shared');
            },
            success: function (res) {
                //alert('shared success');
                //some thing you should do
            },
            cancel: function (res) {
                //alert('shared cancle');
            },
            fail: function (res) {
                //alert(JSON.stringify(res));
            }
        });
        //分享给好友
        wx.onMenuShareAppMessage({
            title: '【微需求】${info.tInfoTitle}', // 分享标题
            desc: '', // 分享描述
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: 'http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E9%9C%80%E6%B1%82.png', // 自定义图标
            type: 'link', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        });
        wx.error(function (res) {
            alert(res.errMsg);
        });
    });
</script>
</script>
</html>

