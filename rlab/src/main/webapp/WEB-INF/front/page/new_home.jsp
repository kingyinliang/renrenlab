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
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/base.css?v_=20180319"/>
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
        .goright img,.goleft img{
            width: 100%;
            height: 100%;
        }
        .data{
            width: 100%;
            height: 143px;
            margin-top: 73px;
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
        .orgliMain{
            margin-top: 23px;
            margin-bottom: 53px;
        }
        .orgliMain li{
            background: white;
            cursor: pointer;
            float: left;
            width: 298px;
            height: 288px;
            border: 1px solid #d2d2d2;
        }
        .orgliMain img{
            width: 100%;
        }
        .orgliMain p{
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
        .facolotatorBg img{
            height: 443px;
            position: absolute;
            left: 50%;
            margin-left: -960px;
        }
        .facolotatorMain{
            width: 1000px;
            height: 378px;
            z-index: 999;
            position: relative;
            overflow: hidden;
        }
        .facolotatorText{
            width: 265px;
            height: 378px;
            color: white;
            text-align: center;
            float: left;
        }
        .facolotatorText img{
            width: 100%;
            height: 100%;
        }
        .facolotatorLi{
            float: left;
            width: 735px;
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
            width: 245px;
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
        .insLibox a{
            color: #b9cfff;
            display: block;
            position: absolute;
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
        .demandImg img{
            width: 100%;
            height: 100%;
        }
        .demandTit em{
            font-size: 14px;
            color: #777777;
            margin-left: 10px;
        }
        .hidearrows img{
            width: 100%;
            height: 100%;
        }


        /*newhome*/

        #banner{
            width: 1000px;
            margin: auto;
            margin-top: 20px;
        }
        .bannerimg{
            width: 717px;
            height: 323px;
            float: left;
            overflow: hidden;
            position: relative;
        }
        .message{
            width: 274px;
            float: right;
        }
        .bannerimg img{
            width: 100%;
            height: 100%;
        }
        .bannerimg ul{
            position: absolute;
            width: 600%;
        }
        .bannerimg li{
            width: 717px;
            float: left;
        }
        .messageTop{
            padding: 16px 22px;
            height: 222px;
            background: white;
        }
        .messageTab{
            width: 73px;
            font-size: 14px;
            color: #3e4759;
            cursor: pointer;
            display: inline-block;
            text-align: center;
            padding-bottom: 10px
        }
        .seledMesstab{
            border-bottom: 1px solid #588eff;
            color: #485362;
        }
        .messageTop div{
            margin-top: 5px;
        }
        .messageTop div p{
            width: 100%;
        }
        .messageTop div p a{
            color: #3e4759;
            font-size: 13px;
            line-height: 27px;
        }
        .ent{
            width: 274px;
            height: 92px;
            margin-top: 8px;
        }
        .homelist{
            width: 1000px;
            margin: auto;
            margin-top: 30px;
        }
        .homelist .listTit i{
            width: 6px;
            height: 18px;
            margin-right: 10px;
            background: #588eff;
            display: inline-block;
        }
        .listTit span{
            font-size: 14px;
            color: #9da3aa;
        }
        .listTit b{
            font-size: 20px;
            color: #485362;
            margin-right: 19px;
        }
        .listTit{
            line-height: 25px;
            margin-bottom: 24px;
        }
        .listMain{
            height: 246px;
            box-shadow: 0px 2px 9px 0px
            rgba(0, 0, 0, 0.07);
        }
        .listMain div{
            cursor: pointer;
        }
        .list1{
            width: 264px;
            height: 245px;
            float: left;
            cursor: pointer;
            background-color: #588eff;
        }
        .list2{
            width: 184px;
            height: 245px;
            float: left;
            padding-top: 10px;
            background-color: #ffffff;
            box-shadow: 3px 0px 9px 0px
            rgba(0, 0, 0, 0.12);
        }
        .list2 p{
            font-size: 14px;
            line-height: 40px;
            text-align: center;
        }
        .insimg img{
            width: 100%;
            height: 100%;
        }
        .insimg{
            overflow: hidden;
            width: 100%;
            height: 155px;
        }
        .insimg img:hover{
            transform: scale(1.1);
        }
        .tests{
            height: 544px;
        }
        .testsimg{
            width: 265px;
            height: 544px;
            float: left;
            margin-right: 11px;
        }
        .testsLi li{
            background: #f2f2f2;
            width: 234px;
            height: 264px;
            float: left;
            position: relative;
        }
        .testsLi li p{
            width: 100%;
            padding: 0 15px;
            position: absolute;
            bottom: 40px;
            text-align: center;
            font-size: 18px;
            color: white;
        }
        .feature li{
            text-align: center;
            width: 298px;
            height: 323px;
            background-color: #ffffff;
            float: left;
        }
        .feature li span{
            display: block;
            font-size: 20px;
            color: #474953;
        }
        .feature li p{
            margin: auto;
            margin-top: 33px;
            width: 205px;
            font-size: 14px;
            color: #818181;
            line-height: 20px;
        }
        #foot{
            width: 100%;
            background: #588eff;
            height: 420px;
            margin-top: -71px;
        }
        .blogroll{
            width: 1120px;
            margin: auto;
            margin-top: 95px;
        }
        .blogroll p{
            font-size: 14px;
        }
        .blogroll i{
            font-size: 20px;
            margin-right: 10px;
        }
        .blogroll a{
            margin: 0 39px;
            display: inline-block;
            color: white;
            font-size: 14px;
        }
        .as {
            height: 158px;
        }
        .foot{
            margin-top: 79px;
            height: 186px;
        }

        #rightBars{
            width: 72px;
            height: 451px;
            background: none;
            border: none;
            position: fixed;
            bottom:150px;
            right: 50px;
            z-index: 9999;
        }
        #rightBars img{
            width: 60%;
            left: 20%;
            position: absolute;
            z-index: -1;
        }
        #rightBars .rightBar{
            margin-top: 40px;
        }
        #rightBars .rightBar a{
            cursor: pointer;
            padding: 20px;
            text-align: center;
            display: block;
            width: 100%;
            height: 66px;
            font-size: 13px;
            color: #969696;
            background: white;
        }
        #rightBars .gotops label{
            font-size: 18px;
            display: block;
            text-align: center;
        }
        #rightBars .gotops{
            color: #969696;
            padding: 20px;
            cursor: pointer;
            width: 100%;
            height: 66px;
            background: white;
            font-size: 12px;
        }
        #rightBars .rightBar .sledBar{
            background: #588eff;
            color: white;
        }
        .feature img{
            display: block;
            margin: auto;
            margin-top: 47px;
            margin-bottom: 25px;
        }
        .testsLi img{
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
<div id="main">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="1"/>
    </jsp:include>
    <%--right--%>
    <div id="rightBars">
        <img src="${rlab}/front/imgs/3.0/rightlogo.png" alt="">
        <div class="rightBar">
            <a class="sledBar" onclick="goelevator(1)">仪器预约</a>
            <a onclick="goelevator(2)">临床试验</a>
            <a onclick="goelevator(3)">分析测试</a>
            <a onclick="goelevator(4)">人人实验</a>
            <a onclick="goelevator(5)">平台特色</a>
        </div>
        <div class="gotops" onclick="goelevator(6)">
            <label class="lab-top"></label>
            <span style="text-align: center;display: block">顶部</span>
        </div>
    </div>
    <%--banner--%>
    <div id="banner" class="clearfix">
        <div class="bannerimg">
            <ul>
                <li>
                    <a href="javascript:void (0);">
                        <img src="${rlab}/front/imgs/3.0/banner1.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="javascript:void (0);">
                        <img src="${rlab}/front/imgs/3.0/banner2.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="javascript:void (0);">
                        <img src="${rlab}/front/imgs/3.0/banner3.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="javascript:void (0);">
                        <img src="${rlab}/front/imgs/3.0/banner4.png" alt="">
                    </a>
                </li>
                <li>
                    <a href="javascript:void (0);">
                        <img src="${rlab}/front/imgs/3.0/banner1.png" alt="">
                    </a>
                </li>
            </ul>
            
        </div>
        <div class="message">
            <div class="messageTop">
                <p style="border-bottom: 1px solid #e0e1e3;" class="bannerright">
                    <a class="messageTab seledMesstab">热门资讯</a>
                    <a class="messageTab">人人实验</a>
                    <a class="messageTab">最新需求</a>
                </p>
                <div class="hotsMessage">
                    <c:forEach items="${hots}" var="info">
                        <c:if test="${info.tInfoClassifyHot == 1}">
                            <p><a href="${rlab}/news/get_article_detail?id=${info.tInfoId}" target="_blank" title="${info.tInfoTitle}">${fn:length(info.tInfoTitle) > 16 ? info.tInfoTitle.substring(0,16).concat("...") : info.tInfoTitle}</a></p>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="renrenlab" style="display: none">
                    <c:forEach items="${hots}" var="info">
                        <c:if test="${info.tInfoClassifyHot == 2}">
                            <p><a href="${rlab}/news/get_article_detail?id=${info.tInfoId}" target="_blank" title="${info.tInfoTitle}">${fn:length(info.tInfoTitle) > 16 ? info.tInfoTitle.substring(0,16).concat("...") : info.tInfoTitle}</a></p>
                        </c:if>
                    </c:forEach>
                </div>
                <div class="demand" style="display: none"></div>
            </div>
            <div class="ent">
                <a href="${rlab}/front/pv/statistics?day=30">
                    <img src="${rlab}/front/imgs/3.0/zhishu.png" alt="">
                </a>
            </div>
        </div>
    </div>
    <%--仪器预约--%>
    <div class="homelist">
        <p class="listTit"><i></i><b>仪器预约</b><span>海量资源 触手可得</span></p>
        <div class="listMain clearfix">
            <div class="list1" onclick="gotrueins()">
                <img src="${rlab}/front/imgs/3.0/ins.png" alt="" style="width: 264px;height: 245px; ">
            </div>
            <div class="list2" onclick="goins(this)" data-map-id="766527">
                <p style="color: #485362">700MHz核磁共振波谱仪</p>
                <p style="color: #b3b8bd;font-size: 12px">委托测试</p>
                <div class="insimg">
                    <img src="${rlab}/front/imgs/2.3/ins1.png" alt="">
                </div>
            </div>
            <div class="list2" onclick="goins(this)" data-map-id="805158">
                <p style="color: #485362">GC-MS气质联用仪</p>
                <p style="color: #b3b8bd;font-size: 12px">委托测试</p>
                <div class="insimg">
                    <img src="${rlab}/front/imgs/3.0/hx.png" alt="" >
                </div>
            </div>
            <div class="list2" onclick="goins(this)" data-map-id="713095">
                <p style="color: #485362">JEM-2100透射电镜</p>
                <p style="color: #b3b8bd;font-size: 12px">委托测试</p>
                <div class="insimg">
                    <img src="${rlab}/front/imgs/3.0/qx.png" alt="">
                </div>
            </div>
            <div class="list2" onclick="goins(this)" data-map-id="808878">
                <p style="color: #485362">流式细胞仪（96孔加样器）</p>
                <p style="color: #b3b8bd;font-size: 12px">委托测试</p>
                <div class="insimg">
                    <img src="${rlab}/front/imgs/2.3/ins2.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <%--临床前CRO--%>
    <div class="homelist">
        <p class="listTit"><i></i><b>临床前CRO</b><span>专业团队 高效服务 </span></p>
        <div class="facolotatorMain clearfix">
            <div class="facolotatorText" onclick="gocro()">
                <img src="${rlab}/front/imgs/3.0/cro.png" alt="" style="width: 265px;height: 378px;cursor: pointer">
            </div>
            <div class="facolotatorLi">
                <ul>
                    <li onclick="goserver(this)" data-map-id="4247" class="facolotatorLis">
                        <p class="liTxt1">药物的筛选</p>
                        <p class="liTxt2">人人实验（北京）科技有限公司</p>
                        <p class="liTxt3">面议<span style="font-size: 12px"></span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu1.png" alt="">
                    </li>
                    <li onclick="goserver(this)" data-map-id="4203" class="facolotatorLis">
                        <p class="liTxt1">药理研究服务</p>
                        <p class="liTxt2">人人实验（北京）科技有限公司</p>
                        <p class="liTxt3">面议<span style="font-size: 12px"></span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu2.png" alt="">
                    </li>
                    <li onclick="goserver(this)" data-map-id="4193" class="facolotatorLis">
                        <p class="liTxt1">药效服务</p>
                        <p class="liTxt2">人人实验（北京）科技有限公司</p>
                        <p class="liTxt3">面议<span style="font-size: 12px"><span></p>
                        <p class="arrows"><img src="${rlab}/front/imgs/2.3/arrows.png" alt=""></p>
                    </li>
                    <li>
                        <img src="${rlab}/front/imgs/2.3/fuwu3.png" alt="">
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%--分析测试--%>
    <div class="homelist">
        <p class="listTit"><i></i><b>分析测试</b><span>流程简捷 准确权威 </span></p>
        <div class="tests clearfix" onclick="gofenxi()">
            <div class="testsimg">
                <img src="${rlab}/front/imgs/3.0/fenxi.png" alt="" style="width: 265px;height: 544px;">
            </div>
            <div class="testsLi">
                <ul>
                    <li style="margin-bottom: 16px">
                        <a href="${token3}/service/detail/3953">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%20%E9%A3%9F%E5%93%81%E4%B8%AD%E8%8F%8C%E8%90%BD%E6%80%BB%E6%95%B0%E6%B5%8B%E5%AE%9A.png" alt="">
                            <p>食品中菌落总数测定</p>
                        </a>
                    </li>
                    <li style="margin: 0 11px 16px 11px">
                        <a href="${token3}/service/detail/3523">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%E9%A5%AE%E7%94%A8%E6%B0%B4.png" alt="">
                            <p>水和废水、饮用水中金属元素</p>
                        </a>
                    </li>
                    <li style="margin-bottom: 16px">
                        <a href="${token3}/service/detail/283">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%E7%A9%BA%E6%B0%94.png" alt="">
                            <p>室内空气检测</p>
                        </a>
                    </li>
                    <li>
                        <a href="${token3}/service/detail/3177">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%E5%AE%B6%E7%94%A8%E7%94%B5%E6%B0%94CE%E8%AE%A4%E8%AF%81.png" alt="">
                            <p>家用电器、电动工具和类似器具CE认证</p>
                        </a>
                    </li>
                    <li style="margin:0 11px">
                        <a href="${token3}/service/detail/2241">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%E7%94%B5%E6%B0%94%E7%85%A7%E6%98%8E.png" alt="">
                            <p>电气照明和类似设备静电放电抗扰度的测定</p>
                        </a>
                    </li>
                    <li>
                        <a href="${token3}/service/detail/3890">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/banner/%E6%B0%B4%E6%9E%9C.png" alt="">
                            <p>水果中咪鲜胺残留量测定</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <%--人人实验室--%>
    <div class="homelist">
        <p class="listTit"><i></i><b>人人实验室</b><span>聚焦领域 精准直达 </span></p>
        <div class="orgliMain clearfix">
            <ul class="clearfix">
                <li onclick="gorenrenlab(this)" data-map-id="理化测试中心">
                    <img src="${rlab}/front/imgs/3.0/lihuaceshi.png" alt="">
                    <p class="orgLit1">理化测试中心</p>
                    <p class="orgLit2">全体实验室</p>
                </li>
                <li class="centreLi" onclick="gorenrenlab(this)" data-map-id="动物实验中心">
                    <img src="${rlab}/front/imgs/3.0/donwushiyan.png" alt="">
                    <p class="orgLit1">动物实验中心</p>
                    <p class="orgLit2">无机分析组</p>
                </li>
                <li onclick="gorenrenlab(this)" data-map-id="分子生物学中心">
                    <img src="${rlab}/front/imgs/3.0/fenzishengwuxue.png" alt="">
                    <p class="orgLit1">分子生物学中心</p>
                    <p class="orgLit2">全体实验室</p>
                </li>
            </ul>
        </div>
    </div>
    <%--平台特色--%>
    <div class="homelist">
        <p class="listTit"><i></i><b>平台特色</b><span>聚焦领域 精准直达  </span></p>
        <div class="feature clearfix">
            <ul>
                <li>
                    <img src="${rlab}/front/imgs/3.0/newhomejing.png" alt="" width="67" height="56px">
                    <span>精</span>
                    <p>重点实验室高精尖仪器 各领域资深专家</p>
                </li>
                <li style="margin: 0 53px">
                    <img src="${rlab}/front/imgs/3.0/newhomezhun.png" alt="" width="65px" height="65px">
                    <span>准</span>
                    <p>智能搜索匹配 基于大数据需求预测</p>
                </li>
                <li>
                    <img src="${rlab}/front/imgs/3.0/newhomekuai.png" alt="" width="38px" height="48px">
                    <span>快</span>
                    <p>7*24小时服务 实验结果最快1日可取</p>
                </li>
            </ul>
        </div>
    </div>
    <%--data--%>
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
    <%--foot--%>
    <div id="foot">
        <div class="blogroll">
            <p>
                <i>友情链接</i>
                <a href="http://www.blarc.com.cn/" target="_blank">北京动物实验研究中心</a>
                <a href="http://www.pharmcube.com/" target="_blank">医药魔方</a>
                <a href="https://www.pharmacodia.com/cn" target="_blank">药渡网</a>
                <a href="http://www.labbang.com/" target="_blank">实验帮</a>
                <a href="http://www.ibiocenter.com/" target="_blank">绿通北平台</a>
                <a href="https://www.yaozh.com/" target="_blank">药智网</a>
                <a href="http://www.zhiguagua.com/" target="_blank">知呱呱</a>
            </p>
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
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">


    $("#userMain").hover(function () {
        $(this).find("label").attr("class","lab-top");
        $(this).find(".usersele").show();
    },function () {
        $(this).find("label").attr("class","lab-down");
        $(this).find(".usersele").hide();
    })
    $(".code").hover(function () {
        $(".codeimg").show();
    },function () {
        $(".codeimg").hide();
    })

    demand();

    function demand() {
        $.ajax({
            url: BASE_URL + '/user/req/m_list',
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if (data.code === 0) {
                    for (var i = 0; i < data.payload.length; i++) {
                        if(data.payload[i].uReqDescription.length>16){
                            data.payload[i].uReqDescription=data.payload[i].uReqDescription.substring(0,16)+"...";
                        }
                        if(data.payload[i].uName.length>10){
                            data.payload[i].uName=data.payload[i].uName.substring(0,10)+"...";
                        }
//                        if(data.payload[i].uReqState==3){
//                            var timespan='已解决';
//                        }else {
//                            var timespan=data.payload[i].remainTime + '天后过期';
//                        }
                        var html='<p><a href="${rlab}/page/req/detail?uReqId='+ data.payload[i].uReqId +'">'+data.payload[i].uReqDescription+'</a></p>';
                        $(".demand").append(html);
                    }
                }
            },
            error: function () {
            }

        })
    }
    $(".messageTop .bannerright a").hover(function () {
        $(".messageTop .bannerright a").removeClass("seledMesstab");
        $(this).addClass("seledMesstab");
        if($(this).text()=='热门资讯'){
            $(".hotsMessage").show();
            $(".renrenlab").hide();
            $(".demand").hide();
        }else if($(this).text()=='人人实验'){
            $(".hotsMessage").hide();
            $(".renrenlab").show();
            $(".demand").hide();
        }else if($(this).text()=='最新需求'){
            $(".hotsMessage").hide();
            $(".renrenlab").hide();
            $(".demand").show();
        }
    })
    var banleft=0;
    var timer;
    play();
    function play() {
        timer =setInterval(function () {
            banleft+=717;
            banner(banleft);
        },3000)
    }

    function stop() {
        clearInterval(timer);
    }

    $(".bannerimg").on('mouseenter',function () {
        stop();
    });
    $(".bannerimg").on('mouseleave',function () {
        play()
    });

    function banner(num) {
        if (num==3585){
            num=717;
            $(".bannerimg ul").css("left","0");
            $(".bannerimg ul").stop().animate({left:'-'+num+'px'});
            banleft=717;
        }else {
            $(".bannerimg ul").stop().animate({left:'-'+num+'px'});
        }
    }

    function gocro() {
        window.location.href = BASE_URL + '/service/keyan?classify=77&name=CRO研发服务';
    }
    function gofenxi() {
        window.location.href = BASE_URL + '/service/zhiliang?classify=100&name=分析测试';
    }
    function gotrueins() {
        instag=true;
        toGoodsList();
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

    //返回顶部
    $(".gotops").on("click",function () {
        $('body,html').animate({scrollTop:0},1000);
    })
    var a = $('#headTab'),
        b =a.offset();
    $(window).on('scroll',function(){
        var c = $(document).scrollTop();
        $(".rightBar").find("a").attr("class","");
        if (c>=2300) {
            $(".rightBar a").eq(4).attr("class","sledBar");
            return;
        }else if (c<2300&&c>=1800) {
            $(".rightBar a").eq(3).attr("class","sledBar");
            return;
        }else if (c<1800&&c>=1200) {
            $(".rightBar a").eq(2).attr("class","sledBar");
            return;
        }else if(c<1200&&c>=700){
            $(".rightBar a").eq(1).attr("class","sledBar");
            return;
        }if(c<700){
            $(".rightBar a").eq(0).attr("class","sledBar");
            return;
        }
    })
    function goelevator(nums) {
        if(nums==1){
            $('body,html').animate({scrollTop:400},1000);
        } else if (nums==2) {
            $('body,html').animate({scrollTop:700},1000);
        } else if (nums==3) {
            $('body,html').animate({scrollTop:1200},1000);
        } else if (nums==4) {
            $('body,html').animate({scrollTop:1800},1000);
        } else if (nums==5) {
            $('body,html').animate({scrollTop:2300},1000);
        } else if (nums==6) {
            $('body,html').animate({scrollTop:0},1000);
        }
    }
</script>
</html>
