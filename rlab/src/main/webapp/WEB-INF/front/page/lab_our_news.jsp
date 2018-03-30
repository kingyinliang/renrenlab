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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20180129">

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
    <style type="text/css">
        .page{
            width: 130px;
            float: right;
            text-align: center;
        }
        .page a{
            display: inline-block;
            line-height: 32px;
            font-size: 16px;
            color: #9b9b9b;
            width: 32px;
            cursor: pointer;
        }
        .page .selectpage{
            color: #0a8ddf;
        }
    </style>
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
                <div class="tabs">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p class="select"><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tabs protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit">媒体报道</div>
                <div class="page1">
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/hqw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://finance.huanqiu.com/cjrd/2018-02/11583658.html">【环球网】人人创新券助力小微企业轻装上阵</a></p>
                            <p class="newsTime"> 2018-2-05</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/cnrb.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://tech.chinadaily.com.cn/2018-02/02/content_35634514.htm">【中国日报】人人创新券助力小微企业轻装上阵</a></p>
                            <p class="newsTime"> 2018-02-02</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/kcw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://news.ikanchai.com/2018/0201/195215.shtml">【砍柴网】人人实验荣膺“2017中国分享经济年度领军企业”</a></p>
                            <p class="newsTime"> 2018-02-01</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/zhw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://tech.china.com/article/20180131/20180131104044.html">【中华网】人人实验荣膺“2017中国分享经济年度领军企业”</a></p>
                            <p class="newsTime"> 2018-01-31</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/cnr.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://www.cnr.cn/chanjing/gundong/20180115/t20180115_524099401.shtml">【中央人民广播电台】共享科研：设备在左人才在右，左膨右胀之后能遇见蓝海吗？</a></p>
                            <p class="newsTime"> 2018-01-05</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/dmw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit" style="line-height: 27px"><a href="http://vcbeat.net/NzU0ODhlYWVmMDUxNzc1NDJiZTUzYWYzZWU0NTM4ZWU=">【动脉网】人人实验，让科研仪器“共享”起来，为小微企业提供2400万科技创新“红包”</a></p>
                            <p class="newsTime"> 2017-12-28</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/bqw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://life.ynet.com/2017/11/03/626608t978.html?forward=1">【北青网】人人创新券”你还不知道？有人已经666的用起来了</a></p>
                            <p class="newsTime"> 2017-11-03</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/fhw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://tech.ifeng.com/a/20171102/44741435_0.shtml">【凤凰科技】人人创新券”你还不知道？有人已经666的用起来了</a></p>
                            <p class="newsTime"> 2017-11-02</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/hqw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://finance.huanqiu.com/cjrd/2017-11/11351474.html">【环球网】人人创新券”你还不知道？有人已经666的用起来了</a></p>
                            <p class="newsTime"> 2017-11-02</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/qlw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://tech.qianlong.com/2017/0803/1911535.shtml">【千龙网】昌平区“人人创新券”助力小微企业 最高扶持额度20万元</a></p>
                            <p class="newsTime"> 2017-08-03</p>
                        </div>
                    </div>
                </div>
                <div class="page2" style="display: none">
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/stw.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://www.sootoo.com/content/672327.shtml">【速途网】人人创新券项目启动 人人实验扶持小微企业专项活动踏上新征程</a></p>
                            <p class="newsTime"> 2017-08-02</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/xhs.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://xinhua-rss.zhongguowangshi.com/160/-5166990033302484302/2134566.html">【新华社】北京昌平投入千万打造人人创新券助力小微企业发展</a></p>
                            <p class="newsTime"> 2017-08-03</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/cnqn.png" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://news.youth.cn/gn/201708/t20170803_10432215.htm">【中国青年网】千万元人人创新券 助力小微企业踏上新征程</a></p>
                            <p class="newsTime"> 2017-08-03</p>
                        </div>
                    </div>
                    <div class="newsLi clearfix">
                        <img src="${rlab}/front/imgs/news/rmw.jpg" alt="">
                        <div class="righttext">
                            <p class="newsTit"><a href="http://unn.people.com.cn/n1/2017/0803/c14717-29447292.html">【人民网】人人创新券项目启动 扶持小微企业专项活动踏上新征程</a></p>
                            <p class="newsTime"> 2017-08-03</p>
                        </div>
                    </div>
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
                </div>
                <div class="page3" style="display: none">
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
                <div class="page">
                    <a class="selectpage">1</a>
                    <a>2</a>
                    <a>3</a>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
 <script type="text/javascript">
     $(".page a").on("click",function () {
         $('body,html').animate({scrollTop:0},20);
         $(".page a").attr("class","");
         $(this).attr("class","selectpage");
         if ($(this).text()=="1"){
             $(".page1").show();
             $(".page2").hide();
             $(".page3").hide();
         }else if($(this).text()=="2"){
             $(".page2").show();
             $(".page1").hide();
             $(".page3").hide();
         }else {
             $(".page3").show();
             $(".page1").hide();
             $(".page2").hide();
         }
     })
 </script>
</body>
</html>