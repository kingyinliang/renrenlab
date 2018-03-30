<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>【人人实验-科创头条】${classify==1?careerInfo.careerTitle:classify==2?recruitInfo.recruitTitle:resumeInfo.resumeTitle}</title>
    <meta name="Keywords" content="人人实验,仪器共享,科创头条"/>
    <meta name="Description" content="${classify==1?'职场资讯提供就业信息、求职攻略、毕业生资讯、职场动态、话题互动等。':classify==2?'更多优质岗位等你来戳，招聘岗位发至邮箱zhaopin@renrenlab.com，主题“岗位+公司名称”。':'更多优质人才等你来撩，自荐个人简历请邮箱至zhaopin@renrenlab.com，主题“简历自荐+姓名”。'}"/>

    <%--分享--%>
    <meta property="og:type" content="article">
    <meta name="og:category " content="人人实验" />
    <meta property="og:title" content="【人人实验-科创头条】${classify==1?careerInfo.careerTitle:classify==2?recruitInfo.recruitTitle:resumeInfo.resumeTitle}" />
    <meta property="og:description" content="${classify==1?'职场资讯提供就业信息、求职攻略、毕业生资讯、职场动态、话题互动等。':classify==2?'更多优质岗位等你来戳，招聘岗位发至邮箱zhaopin@renrenlab.com，主题“岗位+公司名称”。':'更多优质人才等你来撩，自荐个人简历请邮箱至zhaopin@renrenlab.com，主题“简历自荐+姓名”。'}"/>
    <meta property="og:image" content="${classify==1?'http://www.renrenlab.com/rlab/mobile/imgs/zczx.png':classify==2?'http://www.renrenlab.com/rlab/mobile/imgs/zp.png':'http://www.renrenlab.com/rlab/mobile/imgs/rc.png'}">
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
        #maessagemain .time{
            border-bottom: 0.01rem solid #dddddd;
            margin-bottom: 0.3rem;
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
            border: solid 0.02rem;
            border-radius: 0.3rem;
            margin-right: 0.74rem;
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
            width: 100%;
            height: auto;
            margin: 0.32rem 0;
        }
        .tInfoContent{
            font-size: 0.4rem;
            color: #352c2c;
            width: 100%;
            line-height: 0.633rem;
        }
        .tInfoContent span,.tInfoContent p,.tInfoContent div{
            line-height: 0.633rem;
            font-size: 0.4rem;
        }
        strong{
            font-weight: bold;
        }
        table{
            line-height: 0.633rem;
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
        .job p{
            font-size: 0.4rem;
            margin: 0.4rem 0;
            line-height: 0.55rem;
        }
        .copyright p{
            line-height: 0.5rem;
            font-size: 0.4rem;
            color: #333333;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_four.jsp" %>
    </header>
    <div id="maessagemain">
        <c:if test="${classify==1}">
            <h3>${careerInfo.careerTitle}</h3>
            <div class="time">
                <span>
                    <i class="lab-history"></i>
                    <c:choose>
                        <c:when test="${careerInfo.hours >= 24 }">
                            ${careerInfo.createTime.toLocalDate()}  ${careerInfo.createTime.toLocalTime().withNano(0)}
                        </c:when>
                        <c:when test="${careerInfo.hours == 0}">
                            刚刚
                        </c:when>
                        <c:otherwise>
                            ${careerInfo.hours}小时前
                        </c:otherwise>
                    </c:choose>
                </span>
                <span><i class="lab-yanjing"></i>阅读（${careerInfo.careerReadCount}）</span>
            </div>
            <div class="tInfoContent">${careerInfo.careerContent}</div>
        </c:if>
        <c:if test="${classify==2}">
            <h3>${recruitInfo.recruitTitle}</h3>
            <div class="time">
                <span>
                    <i class="lab-history"></i>
                    <c:choose>
                        <c:when test="${recruitInfo.hours >= 24 }">
                            ${recruitInfo.createTime.toLocalDate()}  ${recruitInfo.createTime.toLocalTime().withNano(0)}
                        </c:when>
                        <c:otherwise>
                            ${recruitInfo.hours}小时前
                        </c:otherwise>
                    </c:choose>
                </span>
                <span><i class="lab-yanjing"></i>阅读（${recruitInfo.recruitReadCount}）</span>
            </div>
            <div class="job">
                <p>职位描述：<br>${recruitInfo.recruitDescription}</p>
                <p>岗位要求：${recruitInfo.recruitRequirement}</p>
                <p>年龄要求：${recruitInfo.recruitAgeRequirement}</p>
                <p>学历：${recruitInfo.recruitEducational}</p>
                <p>职位有效期：${recruitInfo.recruitValidityDate}</p>
                <p>电子邮箱：${recruitInfo.recruitEmail}</p>
                <p>联系电话：${recruitInfo.recruitContactPhone}</p>
                <p>联系人：${recruitInfo.recruitContactName}</p>
                <p>公司地址：${recruitInfo.recruitPlace}</p>
                <p>公司福利：${recruitInfo.recruitWelfare}</p>
                <p>公司简介：${recruitInfo.recruitCompanyDes}</p>
            </div>
        </c:if>
        <c:if test="${classify==3}">
            <h3>${resumeInfo.resumeTitle}</h3>
            <div class="time">
                <span>
                    <i class="lab-history"></i>
                    <c:choose>
                        <c:when test="${resumeInfo.hours >= 24 }">
                            ${resumeInfo.createTime.toLocalDate()}  ${resumeInfo.createTime.toLocalTime().withNano(0)}
                        </c:when>
                        <c:otherwise>
                            ${resumeInfo.hours}小时前
                        </c:otherwise>
                    </c:choose>
                </span>
                <span><i class="lab-yanjing"></i>阅读（${resumeInfo.resumeReadCount}）</span>
            </div>
            <div class="job">
                <p>姓名：${resumeInfo.resumeName}</p>
                <p>教育背景：<br>${resumeInfo.resumeBg}</p>
                <p>性别：${resumeInfo.resumeSex}</p>
                <p>出生年月：${resumeInfo.resumeBirth}</p>
                <p>掌握技能：${resumeInfo.resumeSkills}</p>
                <p>工作经历：${resumeInfo.resumeWorkExperience}</p>
                <p>学术经历：${resumeInfo.resumeExperience}</p>
                <p>实践经历：${resumeInfo.resumeProjectExperience}</p>
                <p>自我评价：${resumeInfo.resumeSelfEvaluation}</p>
            </div>
        </c:if>
        <div class="copyright">
            <p>
                <b>版权声明</b><br><br>
                本网站所有注明“来源：人人实验”的文字、图片和音视频资料，版权均属于人人实验所有，非经授权，任何媒体、网站或个人不得转载，授权转载时须注明“来源：人人实验”。本网所有转载文章系出于传递更多信息之目的，且明确注明来源和作者，不希望被转载的媒体或个人可与我们联系，我们将立即进行删除处理。
            </p>
        </div>
    </div>

    <div class="recommend">
        <h3>热门标签</h3>
        <div class="tags" style="border: none">
            <c:forEach items="${tags}" var="info" varStatus="state">
                <a style="color: ${state.index==0||state.index==3||state.index==6||state.index==9 ? '#668feb':state.index==1||state.index==4||state.index==7||state.index==10?'#ebb566':state.index==2||state.index==5||state.index==8?'#eb9566':'#668feb'}">${info.tTagName}</a>
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
            title: '【人人实验-科创头条】${classify==1?careerInfo.careerTitle:classify==2?recruitInfo.recruitTitle:resumeInfo.resumeTitle}',
            link: link,
            imgUrl:"${classify==1?'http://www.renrenlab.com/rlab/mobile/imgs/zczx.png':classify==2?'http://www.renrenlab.com/rlab/mobile/imgs/zp.png':'http://www.renrenlab.com/rlab/mobile/imgs/rc.png'}",// 自定义图标
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
            title: '【人人实验-科创头条】${classify==1?careerInfo.careerTitle:classify==2?recruitInfo.recruitTitle:resumeInfo.resumeTitle}', // 分享标题
            desc:"${classify==1?'职场资讯提供就业信息、求职攻略、毕业生资讯、职场动态、话题互动等。':classify==2?'更多优质岗位等你来戳，招聘岗位发至邮箱zhaopin@renrenlab.com，主题“岗位+公司名称”。':'更多优质人才等你来撩，自荐个人简历请邮箱至zhaopin@renrenlab.com，主题“简历自荐+姓名”。'}", // 分享描述
            link: link, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: "${classify==1?'http://www.renrenlab.com/rlab/mobile/imgs/zczx.png':classify==2?'http://www.renrenlab.com/rlab/mobile/imgs/zp.png':'http://www.renrenlab.com/rlab/mobile/imgs/rc.png'}", // 自定义图标
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