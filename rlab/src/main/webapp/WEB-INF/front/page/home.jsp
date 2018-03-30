<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv=“X-UA-Compatible” content=“chrome=1″/>
    <meta name="renderer" content="webkit">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息,仪器共享"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
<%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%--<%@ include file="../../config/shujike.jsp" %>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/base.css?v_=20180330"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png?v_=20171108" type="image/x-icon">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css?v_=20171108">
    <!--<![endif]-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>

    <script src="${rlab}/front/js/view/jquery.waypoints.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/front/js/view/jquery.countup.min.js" type="text/javascript" charset="utf-8"></script>

    <%--<script src="${rlab}/front/js/common/main.js"></script>--%>
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <style type="text/css">
        
        .banner{
            width: 100%;
            min-width: 1120px;
            height: 563px;
            overflow: hidden;
            position: relative;
        }
        .banner ul{
            width: 1000%;
            height: 563px;
        }
        .banner li{
            position: relative;
            height: 100%;
            width: 10%;
            float: left;
        }
        .cxqbg{
            width: 100%;
            height: 100%;
        }
        .cxq{
            display: block;
            width: 1120px;
            height: 100%;
            margin: auto;
            position: relative;
            top:-563px;
        }
        .goright,.goleft{
            position: absolute;
            top:50%;
            margin-top: -20px;
            width: 40px;
            height: 40px;
        }
        .goright{
            right: 0;
        }
        .goright img,.goleft img{
            width: 100%;
            height: 100%;
        }
        .data{
            width: 100%;
            height: 143px;
            margin-top: -71px;
        }
        .dataMain{
            overflow: hidden;
            margin: auto;
            width: 1000px;
            height: 142px;
            background-color: white;
            box-shadow: 0px 5px 9px 0px
            rgba(214, 214, 214, 0.5);
            position: relative;
            top:0;
            z-index: 999;
        }
        .dataTab{
            margin-top: 44px;
            height: 50px;
            line-height: 50px;
            text-align: center;
        }
        .tabData{
            width: 332px;
            height: 50px;
            display: inline-block;
            color: #828282;
            font-size: 58px;
            position: relative;
            float: left;
        }
        .jia{
            font-size: 14px;
            margin-top: -7px;
            position: absolute;
            line-height: 14px;
        }
        .servenum{
            border-left: 1px solid #e6e6e6;
            border-right: 1px solid #e6e6e6;
        }
        .dataTxts{
            margin-top: 4px;
        }
        .dataTxt{
            width: 332px;
            height: 25px;
            float: left;
            line-height: 25px;
            text-align: center;
            color: #828282;
            font-size: 12px;
        }
        .org,.ins{
            margin-top: 148px;
            width: 100%;
            border-top: 2px solid #f4f4f4;
        }
        .orgTit,.insTit{
            width: 196px;
            height: 33px;
            line-height: 33px;
            font-size: 24px;
            background: white;
            color: #555555;
            font-weight: 600;
            margin: auto;
            text-align: center;
            margin-top: -16px;
        }
        .titInt{
            width: 302px;
            font-size: 16px;
            line-height: 32px;
            color: #555555;
            margin: auto;
            text-align: center;
            margin-top: 20px;
            letter-spacing: 0.79px;
        }
        .blueBar{
            width: 22px;
            height: 4px;
            margin: auto;
            margin-top: 20px;
            background: #588eff;
        }
        .orgLi{
            width: 1000px;
            margin: auto;
            margin-top: 70px;
        }
        .orgHref{
            display: inline-block;
            width: 99px;
            height: 34px;
            border: solid 1px #dfdfdf;
            color: #3d8cf8;
            font-size: 11px;
            text-align: center;
            line-height: 34px;
        }
        .orgliMain{
            margin-top: 23px;
            margin-bottom: 53px;
        }
        .orgLi li{
            cursor: pointer;
            float: left;
            width: 298px;
            height: 288px;
            border: 1px solid #d2d2d2;
        }
        .orgLi img{
            width: 100%;
        }
        .orgLi p{
            color: #4f4f4f;
            text-align: center;
        }
        .orgLit1{
            margin-top: 28px;
            font-size: 18px;
        }
        .orgLit2{
            margin-top: 15px;
            font-size: 12px;
        }
        .centreLi{
            margin: 0 53px;
        }

        .facolotator{
            width: 100%;
            margin-top: 144px;
        }
        .facolotatorBg{
            width: 100%;
            min-width: 1120px;
            height: 443px;
            background: #5d93ec;
            overflow: hidden;
            position: relative;
        }
        .facolotatorBg img{
            height: 443px;
            position: absolute;
            left: 50%;
            margin-left: -960px;
        }
        .facolotatorMain{
            width: 1000px;
            height: 378px;
            margin: auto;
            margin-top:-189px;
            background: #413acb;
            z-index: 999;
            position: relative;
            overflow: hidden;
        }
        .facolotatorText{
            margin: 12px;
            width: 286px;
            height: 354px;
            border: 1px solid #7a75da;
            color: white;
            text-align: center;
            float: left;
        }
        .facolotatorLi{
            float: left;
            width: 690px;
            background: white;
        }
        .facolotatorLi li p img{
            width: 40px;
            height: 15px;
        }
        .facolotatorLi li img{
            width: 100%;
            height: 100%;
        }
        .facolotatorLi li{
            width: 230px;
            height: 189px;
            background-color: white;;
            float: left;
            cursor: pointer;
            color: #4f4f4f;
            text-align: center;
            line-height: 25px;
        }
        .liTxt1{
            font-size: 18px;
            margin-top: 55px;
        }
        .liTxt2{
            color: #777777;
            font-size: 12px;
            margin-top: 8px;
        }
        .liTxt3{
            font-size: 20px;
            margin-top: 13px;
        }
        .arrows{
            display: none;
            margin-top: 8px;
        }
        .insLi{
            width: 1000px;
            margin: auto;
            margin-top: 88px;
            margin-bottom: 56px;
        }
        .insLi li{
            cursor: pointer;
            float: left;
            width: 313px;
            height: 263px;
            box-shadow: 0px 7px 8px 0px rgba(190, 190, 190, 0.5);
            border-radius: 5px 5px 5px 5px;
            overflow: hidden;
            position: relative;
        }
        .insLi li img{
            width: 100%;
            height: 100%;
        }
        .insLibox{
            width: 313px;
            height: 132px;
            padding: 16px 17px 8px 14px;
            color: #b9cfff;
            font-size: 16px;
            background-color: #588eff;
            opacity: 0.9;
            position: absolute;
            bottom: -132px;
            line-height: 20px;
        }
        .insLibox a{
            color: #b9cfff;
            display: block;
            position: absolute;
        }
        .insArrows{
            display: block;
            float: right;
            width: 40px;
            height: 23px;
            padding-left: 19px;
            border-left: 1px solid white;
            overflow: hidden;
        }
        .insLi .insArrows img{
            width: 17px;
            height: 13px;
            margin-top: 6px;
        }
        .price a{
            color: #b9cfff;
            display: block;
            position: absolute;
            left: -240px;
        }
        .price{
            margin-top: 23px;
            position: relative;
            overflow: hidden;
        }

        .demand{
            width: 1000px;
            margin: auto;
            margin-top: 159px;
            height: 426px;
            margin-bottom: 150px;
        }
        .demandImg img{
            width: 100%;
            height: 100%;
        }
        .demandText{
            width: 490px;
            float: left;
        }
        .demandImg{
            width: 510px;
            height: 100%;
            float: right;
        }
        .demandTit em{
            font-size: 14px;
            color: #777777;
            margin-left: 10px;
        }
        .demandTit{
            font-size: 28px;
            color: #4f4f4f;
        }
        .demandTexts{
            margin-top: 85px;
            font-size: 16px;
            color: #676767;
            line-height: 33px;
        }
        .godemand{
            cursor: pointer;
            display: block;
            width: 166px;
            height: 41px;
            line-height: 41px;
            text-align: center;
            background-color:#588eff;
            color: white;
            margin-top: 32px;
            position: relative;
        }
        .hidearrows img{
            width: 100%;
            height: 100%;
        }
        .hidearrows{
            width: 17px;
            height: 13px;
            position: absolute;
            top: 15px;
            left: 90px;
            z-index: 98;
            line-height: 13px;
        }
        .godemandText{
            display: block;
            background: #588eff;
            width: 48px;
            position: absolute;
            left: 59px;
            z-index: 99;
        }

    </style>
</head>
<body>
<div id="main">
    <div id="head">
        <div id="heads" class="clearfix">
            <a href="${rlab}/page/home"><img src="${rlab}/front/imgs/2.3/logo.png"/></a>
            <div class="search">
                <div class="searchTab">
                    <a href="javascript:void (0);" class="pitchTab" data-search-type="1">仪器</a>
                    <a href="javascript:void (0);" data-search-type="2">服务</a>
                    <a href="javascript:void (0);" data-search-type="3">机构</a>
                </div>
                <div class="searchInp">
                    <label class="lab-search searchBut"></label>
                    <div>
                        <input type="text" id="search" value="" placeholder="请输入仪器名称"/>
                    </div>
                    <input type="button" id="gosearch" value="搜索" />
                </div>
            </div>
            <a id="godemand" href="${rlab}/page/req/listpage">发布需求</a>
        </div>
        <div id="headTab">
            <div class="headTab clearfix">
                <div class="tab selectedTab" onclick="gohome()">
                    <div class="tabStrip"></div>
                    <span>首页</span>
                </div>
                <div class="tab" onclick="goorghome()">
                    <div class="tabStrip"></div>
                    <span>服务机构</span>
                </div>
                <div class="tab" onclick="goserverhome()">
                    <div class="tabStrip"></div>
                    <span>服务大厅</span>
                </div>
                <div class="tab" onclick="goinshome()">
                    <div class="tabStrip"></div>
                    <span>仪器共享</span>
                </div>
                <div class="tab" onclick="goreqhome()">
                    <div class="tabStrip"></div>
                    <span>微需求</span>
                </div>
                <div class="tabSelect">
                    <div>
                        <span>创新券</span>
                        <label class="lab-down"></label>
                        <ul class="reel">
                            <li><a href="${rlab}/page/activity?source=0">人人创新券</a></li>
                            <li style="border-top: 1px solid #ebebeb;border-bottom: 1px solid #ebebeb"><a href="${rlab}/page/dxscxj/home">大学生创新券</a></li>
                            <li style="border-bottom: 1px solid #ebebeb"><a href="${rlab}/page/hdxtcxj">海淀协同创新券</a></li>
                            <li><a href="${rlab}/page/sdkjcxj">首都科技创新券</a></li>
                        </ul>
                    </div>
                </div>
                <div class="tab" onclick="gomessagehome()">
                    <div class="tabStrip"></div>
                    <span>科创头条</span>
                </div>
                <div class="tab" onclick="gocasehome()">
                    <div class="tabStrip"></div>
                    <span>应用案例</span>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="userMain">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <label class="lab-down"></label>
                            <ul class="usersele">
                                <li><a onclick="toCenter();return false;" href="javascript:void (0);">个人中心</a></li>
                                <li style="border-top: 1px solid #ebebeb;"><a onclick="logouts();return false;" href="javascript:void (0);">退出</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="login">
                            <label class="lab-user"></label>
                            <a onclick="logins();" href="javascript:void(0);" style="margin-left: 28px"><span style="border-right: 1px solid white;">登录</span></a>
                            <a onclick="registers();" href="javascript:void(0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div id="rightBar">
        <p class="rightTab goerweima"><label class="lab-erweima"></label></p>
        <p class="rightTab gocall" style="border-top: 1px solid #cbcbcb;border-bottom: 1px solid #cbcbcb"><label class="lab-phone-2"></label></p>
        <p class="rightTab gotop"><label class="lab-top"></label></p>
        <div class="call">
            <p class="callHead">联系电话<label class="lab-close-1"></label></p>
            <p class="phones"><label class="lab-phone-2"></label><span  style="color: #333333">400-102-9559</span></p>
        </div>
        <div class="erweima">
            <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="">
        </div>
    </div>
    <div class="banner">
        <ul style="position: absolute;height: auto">
            <li>
                <a href="javascript:void (0);">
                    <img src="${rlab}/front/imgs/2.3/rrcxq.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/cxqbg.png" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/cxqimg.png" alt="" class="cxq">--%>
                </a>
            </li>
            <li>
                <a href="javascript:void (0);">
                    <img src="${rlab}/front/imgs/2.3/sdkj.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/sdkjbg.jpg" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/sdkj.png" alt="" class="cxq">--%>
                </a>
            </li>
            <li>
                <a href="javascript:void (0);">
                    <img src="${rlab}/front/imgs/2.3/hdxt.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/hdxtbg.png" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/hdxtimg.png" alt="" class="cxq">--%>
                </a>
            </li>
            <li>
                <a href="javascript:void (0);">
                    <img src="${rlab}/front/imgs/2.3/zhishu.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/pingtaibg.png" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/pingtai.png" alt="" class="cxq">--%>
                </a>
            </li>
	    <li>
                <a href="${rlab}/front/pv/statistics?day=30">
                    <img src="${rlab}/front/imgs/2.3/zhishus.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/pingtaibg.png" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/pingtai.png" alt="" class="cxq">--%>
                </a>
            </li>
            <li>
                <a href="javascript:void (0);">
                    <img src="${rlab}/front/imgs/2.3/rrcxq.png" alt="" class="cxqbg">
                    <%--<img src="${rlab}/front/imgs/2.3/cxqbg.png" alt="" class="cxqbg">--%>
                    <%--<img src="${rlab}/front/imgs/2.3/cxqimg.png" alt="" class="cxq">--%>
                </a>
            </li>
        </ul>
        <a href="javascript:void (0);" class="goleft"><img src="${rlab}/front/imgs/2.3/left.png" alt=""></a>
        <a href="javascript:void (0);" class="goright"><img src="${rlab}/front/imgs/2.3/right.png" alt=""></a>
    </div>
    <script type="text/javascript">
        $(".banner").css("height",$(".banner").width()*0.293);
    </script>
    <div class="data">
        <div class="dataMain">
            <div class="dataTab">
                <div class="citynum tabData"><span style="font-weight: 100;" class="counter" data-counter-time="2000" data-counter-delay="50">262</span><em class="jia"></em></div>
                <div class="servenum tabData"><span style="font-weight: 100;" class="counter" data-counter-time="2000" data-counter-delay="50">506502</span><em class="jia"></em></div>
                <div class="orgnum tabData"><span style="font-weight: 100;" class="counter" data-counter-time="2000" data-counter-delay="50">1278</span><em class="jia"></em></div>
            </div>
            <div class="dataTxts">
                <div class="dataTxt">全国覆盖城市</div>
                <div class="dataTxt">平台仪器数量</div>
                <div class="dataTxt">累计服务企业</div>
            </div>
        </div>
    </div>
    <div class="org">
        <div class="orgTit">服务机构</div>
        <p class="titInt">4800余家服务机构 在这里向您敞开大门打破边界 让科研更开放</p>
        <div class="blueBar"></div>
        <div class="orgLi">
            <a class="orgHref btnhover" href="${rlab}/provider/search?pageNo=1&pageSize=49">成为服务商</a>
            <div class="orgliMain clearfix">
                <ul>
                    <li onclick="goorg(this)" data-map-id="76748">
                        <img src="${rlab}/front/imgs/2.3/beida.png" alt="">
                        <p class="orgLit1">北大世佳研究中心</p>
                        <p class="orgLit2">全体实验室</p>
                    </li>
                    <li class="centreLi" onclick="goorg(this)" data-map-id="25007">
                        <img src="${rlab}/front/imgs/2.3/qinghua.png" alt="">
                        <p class="orgLit1">北京蛋白质组研究中心</p>
                        <p class="orgLit2">无机分析组</p>
                    </li>
                    <li onclick="goorg(this)" data-map-id="76751">
                        <img src="${rlab}/front/imgs/2.3/zhonguancun.png" alt="">
                        <p class="orgLit1">中国医药研究开发中心有限公司</p>
                        <p class="orgLit2">全体实验室</p>
                    </li>
                </ul>
            </div>
            <a class="btnhover orgHref" href="javascript:void(0);" style="font-size: 14px;width: 131px;height: 44px;line-height: 44px;margin: auto;display: block" onclick="goorghome()">MORE</a>
        </div>
    </div>
    <div class="facolotator">
        <div class="facolotatorBg">
            <img src="${rlab}/front/imgs/2.3/bg.png" alt="">
        </div>
        <div class="facolotatorMain clearfix">
            <div class="facolotatorText">
                <p style="margin-top: 56px;font-size:20px; ">服务大厅</p>
                <p style="font-size:10px;color: #8b87df ">Service</p>
                <p style="font-size: 14px;margin-top: 50px;line-height: 28px">极致服务<br>让检测更可靠<br>13万余项服务<br>为您的成功助力</p>
                <a href="javascript:void(0);" onclick="goserverhome()" style="width: 118px;height: 34px;margin: auto;display: block;color: white;;margin-top: 25px" class="orgHref gofacolotator">MORE</a>
            </div>
            <div class="facolotatorLi">
                <ul>
                    <li onclick="goserver(this)" data-map-id="3737" class="facolotatorLis">
                        <p class="liTxt1">人类疾病模型构建</p>
                        <p class="liTxt2">北京实验动物研究中心</p>
                        <p class="liTxt3">面议<span style="font-size: 12px"></span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu1.png" alt="">
                    </li>
                    <li onclick="goserver(this)" data-map-id="3818" class="facolotatorLis">
                        <p class="liTxt1">蛋白质组检测</p>
                        <p class="liTxt2">北京蛋白质组研究中心</p>
                        <p class="liTxt3">面议<span style="font-size: 12px"></span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu2.png" alt="">
                    </li>
                    <li onclick="goserver(this)" data-map-id="545" class="facolotatorLis">
                        <p class="liTxt1">元素分析（ICPMS）</p>
                        <p class="liTxt2">北京北达燕园微构分析测试中心有限公司</p>
                        <p class="liTxt3">300<span style="font-size: 12px">/样</span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu3.png" alt="">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="ins">
        <div class="insTit">仪器共享</div>
        <p class="titInt">海量资源 让实验更轻松<br>50余万台共享仪器节约您的时间和成本</p>
        <div class="blueBar"></div>
        <div class="insLi">
            <ul class="clearfix">
                <li onclick="goins(this)" data-map-id="820085">
                    <img src="${rlab}/front/imgs/2.3/ins2.png" alt="">
                    <div class="insLibox">
                        <p style="font-size: 18px;color: white">荧光定量PCR仪</p>
                        <p style="margin-top: 9px">北京生物医药科技孵化有限公司</p>
                        <p class="price">
                            <a href="">参考价格：<em style="font-size: 24px;color: white">80</em>/小时</a>
                            <span class="insArrows"><img src="${rlab}/front/imgs/2.3/smallarrows.png" alt=""></span>
                        </p>
                    </div>
                </li>
                <li style="margin: 0 30px" onclick="goins(this)" data-map-id="714877">
                    <img src="${rlab}/front/imgs/2.3/ins3.png" alt="">
                    <div class="insLibox">
                        <p style="font-size: 18px;color: white">电化学工作站</p>
                        <p style="margin-top: 9px">汇龙森国际企业孵化（北京）有限公司</p>
                        <p class="price">
                            <a href="">参考价格：<em style="font-size: 24px;color: white">面议</em></a>
                            <span class="insArrows"><img src="${rlab}/front/imgs/2.3/smallarrows.png" alt=""></span>
                        </p>
                    </div>
                </li>
                <li onclick="goins(this)" data-map-id="720909">
                    <img src="${rlab}/front/imgs/2.3/ins1.png" alt="">
                    <div class="insLibox">
                        <p style="font-size: 18px;color: white">等离子质谱仪</p>
                        <p style="margin-top: 9px">海南省地质测试研究中心</p>
                        <p class="price">
                            <a href="">参考价格：<em style="font-size: 24px;color: white">面议</em></a>
                            <span class="insArrows"><img src="${rlab}/front/imgs/2.3/smallarrows.png" alt=""></span>
                        </p>
                    </div>
                </li>
            </ul>
        </div>
        <a class="btnhover orgHref" href="javascript:void(0);" onclick="goinshome()" style="font-size: 14px;width: 131px;height: 44px;line-height: 44px;margin: auto;display: block">MORE</a>
    </div>
    <div class="demand clearfix">
        <div class="demandText">
            <p class="demandTit">微需求<em>Demand</em></p>
            <p class="demandTexts">
                快速响应<br>
                让科技更好地服务科研 1000余位行业专家<br>
                更快了解您的需求 每台仪器叠加GPS信息<br>
                更快找到实验设备 深度挖掘海量科研数据<br>
                更快获得参考建议。
            </p>
            <a href="${rlab}/page/req/listpage" class="godemand clearfix"><span class="godemandText">去发布</span><span class="hidearrows"><img src="${rlab}/front/imgs/2.3/smallarrows.png" alt=""></span></a>
        </div>
        <div class="demandImg">
            <img src="${rlab}/front/imgs/2.3/demand.png" alt="">
        </div>
    </div>
    <div id="foot">
        <div class="orglogo">
            <div class="logoimg clearfix">
                <a href="http://www.blarc.com.cn/" title="北京实验动物研究中心" style="margin: 0;width: 150px" target="_blank"><img src="${rlab}/front/imgs/blarc.png"/></a>
                <a href="http://www.pharmcube.com/" title="医药魔方" target="_blank" style="width: 170px;margin: 0 0 0 25px"><img src="${rlab}/front/imgs/pharmcube.png"/></a>
                <a href="https://www.pharmacodia.com/cn" title="药渡网" target="_blank" style="width: 140px;margin: 6px 0 6px 20px"><img src="${rlab}/front/imgs/pharmacodia.png"/></a>
                <a href="http://www.labbang.com/" title="实验帮" target="_blank" style="width: 140px;margin-left: 10px;margin-top: 7px;"><img src="${rlab}/front/imgs/labbang.png"/></a>
                <a href="http://www.ibiocenter.com/" title="绿通平台" target="_blank" style="width: 102px;margin: 0 10px"><img src="${rlab}/front/imgs/ibiocenter.png"/></a>
                <a href="http://www.yaozh.com/" title="药智网" target="_blank" style="width: 160px;margin: 20px 10px 20px 0"><img src="${rlab}/front/imgs/yaozh.png"/></a>
                <a href="http://www.zhiguagua.com" title="知呱呱" target="_blank" style="width: 170px;margin: 15px 0px;"><img src="${rlab}/front/imgs/zhiguagua.png"/></a>
            </div>
        </div>
        <div class="foot">
            <div class="as clearfix">
                <p class="footTit">
                    <span style="font-size: 25px">关于</span>
                    <span style="font-size: 12px;color: #abc6ff">About</span>
                </p>
                <ul>
                    <li><a href="${rlab}/page/aboutus">关于我们</a></li>
                    <li><a href="${rlab}/page/ournews">媒体报道</a></li>
                    <li><a href="${rlab}/page/aboutus">加入我们</a></li>
                </ul>
                <ul>
                    <li><a href="${rlab}/page/equity">知识产权协议</a></li>
                    <li><a href="${rlab}/page/server">服务协议</a></li>
                </ul>
            </div>
            <div class="as clearfix" style="margin-left: 80px">
                <p class="footTit">
                    <span style="font-size: 25px">联系</span>
                    <span style="font-size: 12px;color: #abc6ff">Contact</span>
                </p>
                <ul style="margin-left: 54px">
                    <li style="width: 300px;text-align: left">客服热线：400-102-9559</li>
                    <li style="width: 300px;text-align: left">联系邮箱：market@renrenlab.com</li>
                </ul>
            </div>
            <div class="as" style="width: 130px;margin-left: 40px">
                <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="">
                <p style="text-align: center;font-size: 14px">扫码关注微信公众号</p>
            </div>
        </div>
        <div class="bottom">Copyright   2015-2017 人人实验（北京）科技有限公司 All Rights Reserved 京ICP备15058824</div>
    </div>
</div>
</body>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    var banleft=0;
    var timer;
    play();
    $(".banner").css("height",$(".banner").width()*0.293);
    $(window).resize(function () {          //当浏览器大小变化时
        console.log($(".banner").css("width"));
        $(".banner").css("height",$(".banner").width()*0.293);
    });
    function play() {
        timer =setInterval(function () {
            banleft+=100;
            banner(banleft);
        },3000)
    }

    function stop() {
        clearInterval(timer);
    }

    $(".banner").on('mouseenter',function () {
        stop();
    });
    $(".banner").on('mouseleave',function () {
        play()
    });

    function banner(num) {
        if (num==600){
            num=100;
            $(".banner ul").css("left","0");
            $(".banner ul").stop().animate({left:'-'+num+'%'});
            banleft=100;
        }else {
            $(".banner ul").stop().animate({left:'-'+num+'%'});
        }
    }

    $(".goleft").on("click",function () {
        if(banleft==0){
            $(".banner ul").css("left","-500%");//最后一张
            banleft=400;//倒数第二张
        }else {
            banleft-=100;
        }
        banner(banleft);
    })
    $(".goright").on("click",function () {
        banleft+=100;
        banner(banleft);
    })
    //数字累加
    $('.counter').countUp();

    //轮播箭头
    $(".goleft").hover(function () {
        $(this).find("img").attr("src","${rlab}/front/imgs/2.3/left_hover.png")
    },function () {
        $(this).find("img").attr("src","${rlab}/front/imgs/2.3/left.png")
    })
    $(".goright").hover(function () {
        $(this).find("img").attr("src","${rlab}/front/imgs/2.3/right_hover.png")
    },function () {
        $(this).find("img").attr("src","${rlab}/front/imgs/2.3/right.png")
    })
    //悬浮
    $(".orgliMain li").hover(function () {
        $(this).css("box-shadow","0px 5px 9px 0px rgba(214, 214, 214, 0.5)");
        $(this).css("border-color","white");
    },function () {
        $(this).css("box-shadow","");
        $(this).css("border-color","#d2d2d2");
    })
    //按钮
    $(".btnhover").hover(function () {
        $(this).css("background","#3d8cf8");
        $(this).css("color","white");
    },function () {
        $(this).css("background","white");
        $(this).css("color","#3d8cf8");
    })
    //淡入淡出
    $(".facolotatorLis").hover(function () {
        $(this).find(".liTxt1").stop();
        $(this).css("background","#588eff");
        $(this).css("color","white");
        $(this).find(".liTxt2").css("color","white");
        $(this).find(".liTxt1").animate({marginTop:'38px'},200);
        $(this).find(".arrows").fadeIn(200);
    },function () {
        $(this).find(".liTxt1").stop();
        $(this).css("background","white");
        $(this).css("color","#4f4f4f");
        $(this).find(".liTxt2").css("color","#777777");
        $(this).find(".liTxt1").animate({marginTop:'55px'},200);
        $(this).find(".arrows").fadeOut(200);
    })
    //去服务大厅
    $(".gofacolotator").hover(function () {
        $(this).css("background","white");
        $(this).css("color","#413acb");
    },function () {
        $(this).css("background","#413acb");
        $(this).css("color","white");
    })
    //仪器动画
    $(".insLi li").hover(function () {
        $(this).find(".insLibox").stop();
        $(this).find(".price a").stop();
        $(this).find(".insLibox").animate({bottom:"0px"},300);
        $(this).find(".price a").animate({left:"0px"},400);

    },function () {
        $(this).find(".insLibox").stop();
        $(this).find(".price a").stop();
        $(this).find(".insLibox").animate({bottom:"-132px"},300);
        $(this).find(".price a").animate({left:"-240px"},400);
    })
    //去发布动画
    $(".godemand").hover(function () {
        $(this).find(".godemandText").stop();
        $(this).find(".hidearrows").stop();
        $(this).find(".godemandText").animate({left:"50px"},200);
        $(this).find(".hidearrows").animate({left:"99px"},200);
    },function () {
        $(this).find(".godemandText").stop();
        $(this).find(".hidearrows").stop();
        $(this).find(".godemandText").animate({left:"59px"},200);
        $(this).find(".hidearrows").animate({left:"90px"},200);
    })
</script>
</html>
