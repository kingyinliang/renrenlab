<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>【人人实验-科创头条】${info.tInfoTitle}</title>
    <meta name="Keywords" content="<c:forEach var="tag" items="${info.tInfoTags}">${tag},</c:forEach>人人实验,仪器共享"/>
    <meta name="Description" content="${info.tInfoSubTitle}"/>
    <%--分享--%>
    <meta property="og:type" content="article">
    <meta name="og:category " content="人人实验" />
    <meta property="og:title" content="${info.tInfoTitle}" />
    <meta property="og:description" content="${info.tInfoSubTitle}"/>
    <meta property="og:image" content="${info.tInfoImage}">
    <meta itemprop="image" content="${info.tInfoImage}" />

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <style>
        #maessagemain,.interest,.recommend {
            padding: 0.48rem 0.347rem;
        }
        #maessagemain h3{
            font-size: 0.427rem;
            letter-spacing: 0.014rem;
            color: #322d2d;
        }
        #maessagemain .time span{
            margin-right: 0.6rem;
            font-size: 0.293rem;
            line-height: 1rem;
            color: #7f7f7f;
        }
        #maessagemain .time i{
            font-size: 0.32rem;
            color: #897e7e;
            margin-right: 0.187rem;
        }
        .tags{
            border-top: 0.02rem solid #e0e1e2;
            padding: 0.45rem 0;
        }
        .tags a{
            display: inline-block;
            padding: 0 0.24rem;
            line-height: 0.453rem;
            font-size: 0.32rem;
            color: #678feb;
            border: solid 0.03rem;
            border-radius: 0.3rem;
            margin-right: 0.44rem;
            margin-top: 0.2rem;
        }
        .messageimg{
            width: 100%;
            margin: 0.32rem 0;
        }
        .messageimg img{
            width: 100%;
            height: 4.827rem;
            background-color: #76aae9;
            display: block;
        }
        .tInfoContent img{
            width: 100%!important;
            height: auto;
            margin: 0.32rem 0;
        }
        .tInfoContent td,.tInfoContent th{
            padding: 0.02rem 0.08rem;
            border: 0.01rem solid #DDD;
            margin: 0;
        }
        .tInfoContent{
            font-size: 0.4rem!important;
            color: #352c2c;
            width: 100%;
            line-height: 0.633rem;
        }
        .tInfoContent span,.tInfoContent p,.tInfoContent div,.tInfoContent a{
            line-height: 0.633rem;
            font-size: 0.4rem!important;
        }
        strong{
            font-weight: bold;
        }
        table{
            line-height: 0.633rem;
            width: 100%;
            border-collapse: collapse;
            display: table;
        }
        .interest h3,.recommend h3 {
            font-size: 0.373rem;
            letter-spacing: 0.05rem;
            color: #453a3a;
            margin-bottom: 0.5rem;
        }
        .interest li{
            padding: 0.56rem 0 0.48rem 0;
            border: none;
            border-bottom: 0.01rem solid #dddddd;
        }
        .interest li img{
            width: 3.52rem !important;
            height: 2.107rem;
            border-radius: 0.133rem;
            float: left;
            margin-right: 0.58rem;
            background: #000000;
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
        .qrCode{
            font-size: 0.293rem;
            letter-spacing: 0.01rem;
            color: #322d2d;
            line-height: 0.32rem;
            padding: 0 0.9rem;
            margin-bottom: 1.0rem;
        }
        .qrCode img{
            margin: auto;
            display: block;
            width: auto;
            height: 2.72rem;
        }
        .records{
            width: 100%;
            height: 2.507rem;
            text-align: center;
            background-color: #e6e6e6;
            color: #939393;
            font-size: 0.267rem;
            line-height: 0.5rem;
            padding-top: 0.5rem;
        }
        .copyright p{
            line-height: 0.5rem;
            font-size: 0.4rem;
            color: #333333;
        }
        .recommend a{
            margin-bottom: 0.2rem;
        }
    </style>
</head>

<body style="background: white">
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden;'>
    <img src='${info.tInfoImage}'>
</div >
<div id="main" class="main" style="background: white;margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_four.jsp" %>
    </header>
    <div id="maessagemain">
        <h3>${info.tInfoTitle}</h3>
        <div class="time">
            <span>
                <i class="lab-history"></i>
                <c:choose>
                    <c:when test="${info.hours >= 24 }">
                        ${info.createTime.toLocalDate()}  ${info.createTime.toLocalTime().withNano(0)}
                    </c:when>
                    <c:when test="${info.hours == 0}">
                        刚刚
                    </c:when>
                    <c:otherwise>
                        ${info.hours}小时前
                    </c:otherwise>
                </c:choose>
            </span>
            <span><i class="lab-yanjing"></i>阅读（${info.tReadCount}）</span>
        </div>
        <div class="tags">
            <c:forEach items="${info.tInfoTags}" var="tag" varStatus="state">
                <a style="color: ${state.index==0||state.index==3||state.index==6||state.index==9 ? '#668feb':state.index==1||state.index==4||state.index==7||state.index==10?'#ebb566':state.index==2||state.index==5||state.index==8?'#eb9566':'#668feb'};border-color: ${state.index==0||state.index==3||state.index==6||state.index==9 ? '#668feb':state.index==1||state.index==4||state.index==7||state.index==10?'#ebb566':state.index==2||state.index==5||state.index==8?'#eb9566':'#668feb'}">${tag}</a>
            </c:forEach>
        </div>
        <div class="messageimg">
            <%--<img src="${info.tInfoImage}" alt="">--%>
        </div>
        <div class="tInfoContent">${info.tInfoContent}</div>
        <div class="copyright" style="margin-top: 0.5rem">
            <p style="margin-bottom: 0.5rem;display:${empty info.tInfoFrom?'none':'block'}">来源：${info.tInfoFrom}</p>
            <p style="line-height: 0.633rem">
                <b>版权声明</b><br><br>
                ${info.tInfoFrom=='人人实验'?'本网站所有注明“来源：人人实验”的文字、图片和音视频资料，版权均属于人人实验所有，非经授权，任何媒体、网站或个人不得转载，授权转载时须注明“来源：人人实验”。':'本网所有转载文章系出于传递更多信息之目的，且明确注明来源和作者，不希望被转载的媒体或个人可与我们联系，我们将立即进行删除处理。'}
            </p>
        </div>
    </div>
    <div class="interest">
        <h3>相关推荐</h3>
        <ul>
            <c:forEach items="${list}" var="item">
                <li class="clearfix" onclick="gomessagede(this)" data-me-id="${item.tInfoId}">
                    <img src="${item.tInfoImage}" alt="">
                    <div class="itemlitxt">
                        <p class="itemlitit"><c:out value="${ item.tInfoTitle.length() > 21 ? item.tInfoTitle.substring(0,21).concat('...') :item.tInfoTitle }" escapeXml="true"/></p>
                        <span class="history">
                            <i class="lab-history"></i>
                            <c:choose>
                                <c:when test="${item.hours >= 24 }">
                                    ${item.createTime.toLocalDate()}  ${item.createTime.toLocalTime().withNano(0)}
                                </c:when>
                                <c:when test="${item.hours == 0}">
                                    刚刚
                                </c:when>
                                <c:otherwise>
                                    ${item.hours}小时前
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>
    <div class="recommend">
        <h3>热门标签</h3>
        <div class="tags" style="border: none">
            <c:forEach items="${tags}" var="info" varStatus="state">
                <a href="${rlab}/news/get_tag_articles_page?tagName=${info.tTagName}"
                   style="color: ${state.index==0||state.index==3||state.index==6||state.index==9 ? '#668feb':state.index==1||state.index==4||state.index==7||state.index==10?'#ebb566':state.index==2||state.index==5||state.index==8?'#eb9566':'#668feb'};border-color: ${state.index==0||state.index==3||state.index==6||state.index==9 ? '#668feb':state.index==1||state.index==4||state.index==7||state.index==10?'#ebb566':state.index==2||state.index==5||state.index==8?'#eb9566':'#668feb'}">${info.tTagName}</a>
            </c:forEach>
        </div>
    </div>
    <div class="qrCode">
        <img src="${rlab}/mobile/imgs/m2.4/qrcode.png" alt="">
        <p>
            温馨提示：长按二维码关注人人实验公众微信号，或保存二维码至手机使用微信扫一扫关注人人实验公众微信号，客服小花为您答疑解惑。使用电脑登录主站www.renrenlab.com了解更多优质服务和仪器。
        </p>
    </div>
    <div class="records">
        <p>Copyright 2015-2017 人人实验（北京）科技有限公司</p>
        <p>All Rights Reserved 京ICP备15058824</p>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
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
    function gomessagede($this) {
        window.location.href = '${rlab}/news/get_article_detail?id=' + $($this).data("meId");
    }
    $(".tInfoContent table").each(function () {
        var div = document.createElement("div");
        var _this = $(this);
        if (_this.length > 0) {
            _this.replaceWith("<div style=\"width:100%;overflow:auto;\">" + _this[0].outerHTML + "</div>");
        }
    });
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
            title: '【人人实验-科创头条】${info.tInfoTitle}',
            link: link,
            imgUrl: '${info.tInfoImage}',// 自定义图标
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
            title: '【人人实验-科创头条】${info.tInfoTitle}', // 分享标题
            desc: '${info.tInfoSubTitle}', // 分享描述
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: '${info.tInfoImage}', // 自定义图标
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
</html>