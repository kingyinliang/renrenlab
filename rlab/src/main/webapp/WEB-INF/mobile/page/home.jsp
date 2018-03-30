<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>--%>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/js/swiper-3.4.2.min.css"/>
    <script src="${rlab}/mobile/js/swiper-3.4.2.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/home.css?v_=20171127">
    <style>
        p{
            margin: 0;
        }
        .item2mobile-item{
            overflow: hidden;
        }
        .item2mobile-item a{
            width: 1.573rem;
            height: 0.52rem;
            margin: auto;
            margin-top: 0.29rem;
            display: inline-block;
            line-height: 0.5rem;
            border: 0.03rem solid #c5d6f3!important;
            border-radius: 0.26rem;
            font-size: 0.27rem;
        }
        .search{
            font-size: 0.32rem;
            color: #bfbfbf;
            line-height: 0.96rem;
        }
        .lab-yanjing{
            margin-right: 0.1rem;
        }
        #item4mobile p,#item5mobile p{
            width: 100%;
            margin: 0;
            overflow: initial;
            font-size: 0.37rem;
            color: #4e4e4e;
            line-height: 0.4rem;
            margin-bottom: 0.3rem
        }
        #item4mobile img{
            width: 2.77rem;
            height: 2.77rem;
            float: left;
        }
        #item4mobile .tit h3{
            font-size: 0.32rem;
            color: #adadad;
            margin-top: 0.4rem;
            margin-bottom: 1.3rem;
        }
        #item4mobile{
            border: none!important;
        }
        #item4mobile .tit h2{
            font-size: 0.4rem;
            color: #3f3f3f
        }
        #item4mobile .tit{
            max-width: 5rem;
            margin-left: 0.53rem;
        }
        #item4mobile p{
            font-size: 0.32rem;
        }
        .tit_state{
            color: #18c248;
        }
        .tit_timer{
            color: #c0c0c0;
            margin-left: 0.32rem;
        }

        #item5mobile .tit p{
            width: 100%;
            margin: 0;
            overflow: hidden;
            font-size: 0.32rem;
            color: #c0c0c0;
            line-height: 0.44rem;
            max-height: 0.90rem;
            overflow: hidden;
            display: -webkit-box;
            -webkit-box-orient: vertical;
            -webkit-line-clamp: 2;
            overflow: hidden;
        }

        #item5mobile h2{
            font-size: 0.35rem;
            color: #4b4b4b;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        #item5mobile .tit{
            width: 4.49rem;
            margin-left: 0.7rem;
        }
        #item5mobile img{
            width: 2.64rem!important;
            height: 2.71rem!important;
            float: left;
        }
        .tabLi h3 {
            font-size: 0.32rem;
            color: #4f8df0;
            margin: 0.32rem 0;
        }



        .home-tab{
            height: 2.907rem;
            padding-top: 0.56rem;
        }
        .home-tab a{
            display: inline-block;
            width: 19%;
            text-align: center;
        }
        .hometab-icon{
            margin-bottom: 0.35rem;
        }
        .hometab-icon img{
            width: 1.067rem;
            height: 1.067rem;
        }
        .home-tab a span{
            line-height: 0.6rem;
            font-size: 0.293rem;
            display: block;
            color: #5d5d5d;
        }
        .demand{
            margin: auto;
            width: 9.147rem;
            height: 1.173rem;
            background-color: #ffffff;
            box-shadow: 0rem 0.053rem 0.16rem 0rem
            rgba(205, 205, 205, 0.5);
            border-radius: 0.053rem;
            overflow: hidden;
            margin-bottom: 0.5rem;
            padding: 0.187rem;
        }
        .demandbg img{
            width: 100%;
            height: 100%;
        }
        .demandbg{
            float: left;
            width: 1.786rem;
            height: 0.64rem;
            margin-top: 0.06rem;
        }
        .demandtxt li{
            height: 0.747rem;
            margin-bottom: 0.24rem;
        }
        .demandtxt p{
            margin: 0;
            font-size: 0.367rem;
            line-height: 0.747rem;
            letter-spacing: 0.009rem;
            color: #7d7d7d;
        }

        .demandtxt{
            width: 6.58rem;
            height: 0.987rem;
            float: left;
            margin-left: 0.4rem;
            position: relative;
        }
        .demandtxt ul{
            position: absolute;

        }

        .itemtit a{
            line-height: 0.667rem;
            float: right;
            color: #9a9696;
            font-size: 0.293rem;
        }
        .home-item .itemtit,.home-item .itemtxt{
            padding: 0 0.45rem;
            margin-bottom: 0.1rem;
        }
        .itemtit span{
            line-height: 0.667rem;
            font-size: 0.48rem;
            letter-spacing: 0.016rem;
            color: #322d2d;
        }
        .itemtxt{
            line-height: 0.427rem;
            font-size: 0.293rem;
            letter-spacing: 0.01rem;
            color: #9a9696;
        }
        .itemimg{
            height: 3.067rem;
            position: relative;
            overflow: hidden;
            margin-bottom: 0.88rem;
            margin-top: 0.48rem;
        }
        .itemimg .swiper-slide p{
            padding-left: 0.347rem;
            line-height: 0.5rem;
            font-size: 0.293rem;
            color: #ffffff;
            position: absolute;
            bottom: 0.3rem;
            left: 0;
        }
        .itemimg .swiper-slide img{
            overflow: hidden;
            width: 5.067rem;
            height: 3.067rem;
            background-color: white;
            border-radius: 0.15rem;
        }
        .home-item .swiper-slide{
            margin-left: 0.45rem;
            overflow: hidden;
            width: 5.067rem;
            height: 3.067rem;
            background-color: #fff;
            border-radius: 0.133rem;
        }
        .itemli ul li img{
            width: 3.52rem;
            height: 2.107rem;
            float: left;
            border-radius: 0.133rem;
            margin-right: 0.58rem;
            background: #000000;
        }
        .itemli ul{
            padding: 0 0.45rem;
        }
        .itemli ul li{
            padding: 0.56rem 0 0.48rem 0;
            border-bottom: 0.053rem solid #dddddd;
        }
        .itemlitit{
            font-size: 0.37rem;
            line-height: 0.4rem;
            letter-spacing: 0.011rem;
            color: #322d2d;
            margin-bottom: 0.9rem;
        }
        .itemlitxt{
            width: 4.8rem;
            float: left;
        }
        .history i{
            margin-right: 0.2rem;
        }
        .history{
            font-size: 0.24rem;
            letter-spacing: 0.008rem;
            color: #7f7f7f;
        }
        .records p{
            font-size: 0.267rem;
            line-height: 0.42rem;
            color: white;
            margin: 0;
        }
        .records{
            width: 100%;
            height: 2.56rem;
            text-align: center;
            background-color: #6aa0ff;
            padding: 0.25rem 0 1.173rem 0;
            margin-top: 0.3rem;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white">
    <header>
        <%@ include file="../template/header_three.jsp" %>
    </header>
    <div id="slider" class="mui-slider">
        <div class="mui-slider-group mui-slider-loop">
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner05.png">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner01.png" alt="">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner02.png" alt="">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner03.png" alt="">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner04.png" alt="">
                </a>
            </div>
            <div class="mui-slider-item">
                <a href="${rlab}/front/pv/statistics?day=30">
                    <img src="${rlab}/mobile/imgs/banner/banner05.png" alt="">
                </a>
            </div>
            <div class="mui-slider-item mui-slider-item-duplicate">
                <a href="javascript:void (0);">
                    <img src="${rlab}/mobile/imgs/banner/banner01.png">
                </a>
            </div>
        </div>
        <div class="mui-slider-indicator">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
        </div>
    </div>
    <div class="home-tab">
        <a href="${rlab}/front/search/p4?searchKey=&all=3">
            <span class="hometab-icon"><img src="${rlab}/mobile/imgs/m2.4/ins.png" alt=""></span>
            <span>仪器共享</span>
        </a>
        <a href="${rlab}/front/search/p3?searchKey=&all=3">
            <span class="hometab-icon"><img src="${rlab}/mobile/imgs/m2.4/detection.png" alt=""></span>
            <span>检验检测</span>
        </a>
        <a href="${rlab}/front/search/p2?searchKey=&all=3">
            <span class="hometab-icon"><img src="${rlab}/mobile/imgs/m2.4/scientific.png" alt=""></span>
            <span>科研众包</span>
        </a>
        <a href="${rlab}/front/search/sciences_page">
            <span class="hometab-icon"><img src="${rlab}/mobile/imgs/m2.4/message.png" alt=""></span>
            <span>科创头条</span>
        </a>
        <a href="${rlab}/m_home/case_page">
            <span class="hometab-icon"><img src="${rlab}/mobile/imgs/m2.4/case.png" alt=""></span>
            <span>应用案例</span>
        </a>
    </div>
    <div class="demand">
        <div class="demandbg">
            <a href="${rlab}/page/req/listpage">
                <img src="${rlab}/mobile/imgs/m2.4/demandbg.png" alt="">
            </a>
        </div>
        <div class="demandtxt">
            <div class="swiper-wrapper">
            </div>
        </div>
    </div>
    <%--仪器预约--%>
     <div class="home-item">
         <p class="itemtit"><span>仪器预约</span><a href="${rlab}/front/search/more_ins_page">更多></a></p>
         <p class="itemtxt">海量资源 触手可得</p>
         <div class="itemimg itemimg1">
             <div class="swiper-wrapper">
             </div>
         </div>
     </div>
    <%--临床前CRO服务--%>
    <div class="home-item">
        <p class="itemtit"><span>临床前CRO服务</span><a href="${rlab}/service/classify_list?classify=77&name=CRO研发服务">更多></a>
        </p>
        <p class="itemtxt">专业团队 高效服务</p>
        <div class="itemimg itemimg2">
            <div class="swiper-wrapper">
            </div>
        </div>
    </div>
    <%--分析测试--%>
    <div class="home-item">
        <p class="itemtit"><span>分析测试</span><a href="${rlab}/service/classify_list?classify=100&name=分析测试">更多></a></p>
        <p class="itemtxt">流程简捷 准确权威</p>
        <div class="itemimg itemimg3">
            <div class="swiper-wrapper">
            </div>
        </div>
    </div>
    <%--人人实验室--%>
    <div class="home-item">
        <p class="itemtit"><span>人人实验室</span><%--<a href="${rlab}/front/search/cro_page?tag=人人实验室">更多></a>--%></p>
        <p class="itemtxt">聚焦领域 精准直达</p>
        <div class="itemimg itemimg4">
            <div class="swiper-wrapper">
                <div class="swiper-slide"><a href="${rlab}/front/search/renrenlab_page?name=理化测试中心"><img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E7%90%86%E5%8C%96%E6%B5%8B%E8%AF%95%E4%B8%AD%E5%BF%83.png" alt=""><p>理化测试中心</p></a></div>
                <div class="swiper-slide"><a href="${rlab}/front/search/renrenlab_page?name=动物实验中心"><img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%8A%A8%E7%89%A9%E5%AE%9E%E9%AA%8C%E4%B8%AD%E5%BF%83.png" alt=""><p>动物实验中心</p></a></div>
                <div class="swiper-slide"><a href="${rlab}/front/search/renrenlab_page?name=分子生物学中心"><img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%88%86%E5%AD%90%E7%94%9F%E7%89%A9%E4%B8%AD%E5%BF%83.png" alt=""><p>分子生物学中心</p></a></div>
            </div>
        </div>
    </div>
    <%--科创头条--%>
    <div class="home-item">
        <p class="itemtit"><span>科创头条</span><a href="${rlab}/front/search/sciences_page">更多></a></p>
        <p class="itemtxt">前沿资讯 把握科技脉搏 </p>
        <div class="itemli message">
            <ul>
            </ul>
        </div>
    </div>
    <%--备案--%>
    <div class="records">
        <p>Copyright 2015-2017 人人实验（北京）科技有限公司</p>
        <p>All Rights Reserved 京ICP备15058824</p>
    </div>
    <footer>
        <jsp:include page="../template/footer.jsp" flush="true">
            <jsp:param name="active" value="1"/>
        </jsp:include>
    </footer>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径
    demand();

    $(".itemimg1 .swiper-wrapper").append(getIns(766527));
    $(".itemimg1 .swiper-wrapper").append(getIns(805158));
    $(".itemimg1 .swiper-wrapper").append(getIns(713095));
    $(".itemimg1 .swiper-wrapper").append(getIns(808878));
    $(".itemimg1 .swiper-wrapper").append(getIns(750204));

    $(".itemimg2 .swiper-wrapper").append(getService(4247));
    $(".itemimg2 .swiper-wrapper").append(getService(4203));
    $(".itemimg2 .swiper-wrapper").append(getService(4193));
    $(".itemimg2 .swiper-wrapper").append(getService(4223));
    $(".itemimg2 .swiper-wrapper").append(getService(4227));
    $(".itemimg2 .swiper-wrapper").append(getService(4195));

    $(".itemimg3 .swiper-wrapper").append(getService(3953));
    $(".itemimg3 .swiper-wrapper").append(getService(3523));
    $(".itemimg3 .swiper-wrapper").append(getService(283));
    $(".itemimg3 .swiper-wrapper").append(getService(3177));
    $(".itemimg3 .swiper-wrapper").append(getService(2241));


    getMessage();

    var swiper = new Swiper('.demandtxt', {
        direction: 'vertical',
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        autoplayDisableOnInteraction : false,
        autoplay:2000
    });
    var swiper = new Swiper('.itemimg1', {
        slidesPerView: 'auto',
    });
    var swiper = new Swiper('.itemimg2', {
        slidesPerView: 'auto',
    });
    var swiper = new Swiper('.itemimg3', {
        slidesPerView: 'auto',
    });
    var swiper = new Swiper('.itemimg4', {
        slidesPerView: 'auto',
    });

    /**
     * 返回历史上一页
     */

    function goBack() {
        history.go(-1);
    }



    //    获取仪器
    function getIns(id) {
        var html='';
        $.ajax({
            url: BASE_URL + '/instrument/msearch/' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if(data.payload.insPic==''||data.payload.insPic==null){
                    data.payload.insPic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    data.payload.insPic=data.payload.insPic+'264_158';
                }
                html = '<div class="swiper-slide"><a href="${rlab}/instrument/search/' + id + '"><img src="' + data.payload.insPic + '" alt=""><p>' + data.payload.insName + '</p></a></div>'
            }
        })
        return html;
    }
    //    获取服务
    function getService(id) {
        var html='';
        $.ajax({
            url: BASE_URL + '/service/mdetail/' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if(data.payload.servicePic==''||data.payload.servicePic==null){
                    data.payload.servicePic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    data.payload.servicePic=data.payload.servicePic+'264_158';
                }
                html = '<div class="swiper-slide"><a href="${rlab}/service/detail/' + id + '"><img src="' + data.payload.servicePic + '" alt=""><p>' + data.payload.serviceName.substring(0, 15) + '</p></a></div>'
            },
            error: function () {

            }
        })
        return html;
    }
    //    获取科创头条
    function getMessage() {
        $.ajax({
            url: BASE_URL + '/front/search/sciences?classifyName=最新文章&pageNo=1&pageSize=3',
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                for (var i = 0; i < data.payload.list.length; i++) {
                    var hor="";
                    var item=data.payload.list[i];
                    if(item.hours>= 24){
                        hor=item.createTimeStr;
                    }else if(item.hours == 24) {
                        hor='刚刚';
                    }else {
                        hor=item.hours+'小时前'
                    }
                    if(item.tInfoTitle.length>21){
                        item.tInfoTitle=item.tInfoTitle.substring(0,21)+'...'
                    }
                    $(".message ul").append('<li class="clearfix" onclick="gomessagedetail(this)" data-mess-id="'+item.tInfoId+'">\
                            <img src="'+ item.tInfoImage +'" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemlitit">' + item.tInfoTitle + ' </p>\
                                <span class="history"><i class="lab-history"></i>'+hor+'</span>\
                            </div>\
                            </li>');
                }
            }
        })
    }
    function gomessagedetail($this) {
        window.location.href = BASE_URL + '/news/get_article_detail?id=' + $($this).data("messId");
    }


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
                        if(data.payload[i].uReqState==3){
                            var timespan='已解决';
                        }else {
                            var timespan=data.payload[i].remainTime + '天后过期';
                        }
                        var html='<div class="swiper-slide"><a href="${rlab}/page/req/detail?uReqId='+ data.payload[i].uReqId +'"><p>'+data.payload[i].uReqDescription+'</p></a></div>'
                        $(".demandtxt .swiper-wrapper").append(html);
                    }
                }
            },
            error: function () {
            }

        })
    }

    function toDemandDetail($this) {
        $this=$($this);
        window.location.href=BASE_URL+'/page/req/detail?uReqId='+$this.data("goodsId");
    }
    function toOrgDetail($this) {
        $this=$($this);
        window.location.href = BASE_URL + '/org/' + $this.data("goodsId");
    }
    mui.init({
        swipeBack: false //启用右滑关闭功能
    });

    mui('.mui-scroll-wrapper').scroll();
    $('.mui-scroll-wrapper').scroll({
        indicators: true //是否显示滚动条
    });

    var slider = mui("#slider");
    var mask = mui.createMask(function(){
        $("#codes").hide();
    });
    slider.slider({
        interval: 2500
    });

    var caseStore = [
        {
            index: 1,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/huajiejiyin.png",
            caseTitle: "华颉基因——实验仪器租赁",
            caseType: "创新券",
            caseDesc: "北京华颉基因医疗技术有限公司的高通量基因测序项目，通过人人实验平台成功入驻中关村科技园昌平园，并采用以租代买的模式解决了主要仪器设备的购置。该项目应用第二代基因测序技术，仅通过2毫升血液，便可检测包括亚型、耐药性在内的基因指纹，为病人绘制疾病指纹，提供全面的、敏感的、早期、无创及动态的疾病监控，实现疾病的早期诊断，并在治疗及随访过程中实现对病情变化的动态监控。该项目获得人人实验平台20万元创新券补贴支持。"
        },
        {
            index: 3,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/boyajiyin.png",
            caseTitle: "博雅辑因——技术解决方案",
            caseType: "创新券",
            caseDesc: "博雅辑因（北京）生物科技有限公司委托人人实验平台服务方，对其提供的菌株、质粒、PCR产物等样本，采用sanger测序法进行测序，并对测序过程中所需的引物进行合成。人人实验平台对该项目给予50%创新券补贴支持。"
        },
        {
            index: 8,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/weituoshiyan.png",
            caseTitle: "委托实验需求",
            caseType: "微需求",
            caseDesc: "中关村生命科学园内一家生物类企业，应业务需要委托技术服务方做40只大鼠CT及血管造影实验，找到人人实验平台帮助解决。人人实验根据服务项目要求，精准对接到中科院动物所生殖科老师，既优惠又高效。"
        }
    ];


    /**
     * 初始化案例列表
     */
    /*function createCaseItem(caseData) {

        return '<li class="clearfix">\
            <a href="${rlab}/m_home/case_detail?index='+ caseData.index + '&type=' + caseData.type + '">\
            <img class="liImg" src="' + caseData.casePic + '"/>\
            <div class="tit">\
            <h2>' + caseData.caseTitle + '</h2>\
            <h3>' + caseData.caseType + '</h3>\
            <p>' + caseData.caseDesc + '</p></div></a></li>';
    }*/
</script>
</html>