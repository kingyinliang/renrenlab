<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20170905">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style type="text/css">
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
        }
    </style>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>


    <div id="content">
        <div class="main clearfix">
            <div class="lef">
                <div class="tab">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p class="select"><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tab protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit">媒体报道</div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/zgyqw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://www.yiqi.com/news/detail_2989.html">【中国仪器网】仪器共享网站兴起：“人人实验”共享对接科研设备</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/wh.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://whb.cn/zhuzhan/kandian/20170501/90650.html">【文汇报】“网聚”数十万台设备 共享对接“人人实验”</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/yg.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://news.cnr.cn/native/gd/20170222/t20170222_523615970.shtml">【央广网】打造科研领域的“淘宝” 人人实验成为科技创新“助推器”</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/zxw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://www.chinanews.com/cj/2017/02-17/8152172.shtml">【中新网】网络媒体走转改：人人实验，打造科技资源共享平台</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/rmw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://media.people.com.cn/n1/2017/0214/c14677-29080109.html">【人民网】人人实验平台 用共享经济模式科技创新</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/sohuw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://news.sohu.com/20170214/n480654138.shtml">【搜狐新闻】人人实验平台 用共享经济模式科技创新</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/zhw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://tech.china.com/data/11022462/20160823/23361050.html">【中华网】人人实验亮相京医药展 助推科技共享经济发展</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/gjzx.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://gb.cri.cn/43871/2016/07/06/8451s5221941.htm">【国际在线】北京创业创新唤醒回龙观</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>
                <div class="newsLi clearfix">
                    <img src="${rlab}/front/imgs/news/sohuw.jpg" alt="">
                    <div class="righttext">
                        <p class="newsTit"><a href="http://www.sohu.com/a/74767364_372297">【搜狐网】金融峰会黑马扬蹄！人人实验联合智能公会助力双创</a></p>
                        <p class="newsTime"> 2017-05-11</p>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20170905"></script>
</body>
</html>