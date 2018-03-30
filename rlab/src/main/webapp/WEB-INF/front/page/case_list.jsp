<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv=“X-UA-Compatible” content=“chrome=1″/>
    <meta name="renderer" content="webkit">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
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
        .main{
            width: 1040px;
            margin: auto;
            padding-top: 65px;
        }
        .item img{
            width: 100%;
        }
        /*.item{*/
            /*width: 303px;*/
            /*height: 303px;*/
            /*float: left;*/
            /*position: relative;*/
            /*margin: 23px 20px;*/
            /*overflow: hidden;*/
            /*cursor: pointer;*/
        /*}*/
        /*.shade{*/
            /*width: 303px;*/
            /*height: 303px;*/

            /*background: #000000;*/
            /*position: absolute;*/
            /*top:0;*/
            /*filter:alpha(opacity=10);*/
            /*-moz-opacity:0.1;*/
            /*-khtml-opacity: 0.1;*/
            /*opacity: 0.1;*/
        /*}*/
        /*.itemTxt{*/
            /*width: 303px;*/
            /*height: 303px;*/
            /*position: absolute;*/
            /*top:198px;*/
        /*}*/
        /*.itemTit span{*/
            /*line-height: 50px;*/
            /*display: inline-block;*/
            /*border-bottom: 1px solid #ffffff;*/
            /*border-top: 1px solid #ffffff;*/
        /*}*/
        /*.itemTit{*/
            /*line-height: 50px;*/
            /*color: #ffffff;*/
            /*font-size: 14px;*/
            /*text-align: center;*/
            /*margin-top: 23px;*/
            /*margin-bottom: 25px;*/
        /*}*/
        /*.itemT{*/
            /*font-size: 12px;*/
            /*color: #FFFFFF;*/
            /*padding: 0 16px;*/
            /*line-height: 18px;*/
            /*letter-spacing: 1px;*/
            /*opacity:0;*/
        /*}*/


        .case_tit b{
            float: left;
            font-weight: 600;
        }
        .case_tit span{
            font-size: 14px;
            color: #514e58;
            float: right;
        }
        .case_tit .subhead{
            margin-top: 13px;
            font-size: 18px;
            color: #96929d;
            margin-bottom: 60px;
        }
        .case_tit{
            color: #514e58;
            font-size: 20px;
        }
        .item{
            margin-bottom: 80px;
        }
        .item img{
            width: 442px;
            height: 233px;
            float: left;
        }
        .txt{
            float: left;
            margin-left: 75px;
            padding-top: 40px;
        }
        .caseTitle{
            font-size: 15px;
            color: #2d3238;
        }
        .descbox{
            margin-top: 15px;
            width: 520px;
            overflow: hidden;
            height: 48px;
        }
        .caseDesc{
            font-size: 12px;
            color: #777272;
            line-height: 24px;
            letter-spacing: 1px;
        }
        .labdown label{
            cursor: pointer;
            font-size: 20px;
            color: #979797;
        }
        .labdown{
            display: block;
            margin-top: 35px;
            width: 20px;
            cursor: pointer;
            border-top: solid 1px #979797;
            border-bottom: solid 1px #979797;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="8"/>
    </jsp:include>
    <!--内容部分-->
    <div class="main clearfix">
        <div class="case_tit clearfix">
            <p class="clearfix">
                <b>应用案例</b>
                <span style="margin-left: 15px">小微企业领补贴</span>
                <span>专业团队解难题</span>
            </p>
            <p class="subhead">Practical case</p>
        </div>

    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">

    // 这个数据和case_list.jsp 里的 caseStore 一致，可以对应一下
    var caseStore = [
        {
            index: 0, // 索引
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/anmosai.png",
            caseTitle: "安默赛斯——合作研发服务",// 标题
            caseType: "创新券",// 创新券
            caseDesc: "北京安默赛斯生物科技有限公司委托人人实验平台服务方，通过用转基因老年痴呆小鼠长期给予供试药物，用水迷宫和高架十字迷宫考察药物治疗阿尔茨海默症的效果，并通过分子生物学检测来观察药物对动物病理学上的改善作用，为药物的后期研发提供依据。该项目获得人人实验平台18万元创新券补贴支持。"
        },
        {
            index: 1,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/huajiejiyin.png",
            caseTitle: "华颉基因——实验仪器租赁",
            caseType: "创新券",
            caseDesc: "北京华颉基因医疗技术有限公司的高通量基因测序项目，通过人人实验平台成功入驻中关村科技园昌平园，并采用以租代买的模式解决了主要仪器设备的购置。该项目应用第二代基因测序技术，仅通过2毫升血液，便可检测包括亚型、耐药性在内的基因指纹，为病人绘制疾病指纹，提供全面的、敏感的、早期、无创及动态的疾病监控，实现疾病的早期诊断，并在治疗及随访过程中实现对病情变化的动态监控。该项目获得人人实验平台20万元创新券补贴支持。"
        },
        {
            index: 2,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/zhongshifangda.png",
            caseTitle: "中试放大需求",
            caseType: "微需求",
            caseDesc: "北京海燕药业研发中心需要找固体制剂中试平台，来到人人实验平台寻求帮助。平台在一小时内与某医药研究开发中心毛老师取得联系并沟通细节，对接双方顺利完成了药品制作和包装。"
        },
        {
            index: 3,
            type:1, // 0 微需求 1 创新券
            casePic:BASE_URL + "/front/imgs/2.4/huanuoshidai.png",
            caseTitle: "华诺时代——测试检测服务",
            caseType: "创新券",
            caseDesc: "北京华诺时代科技有限公司委托人人实验平台服务方，成功完成了多糖多酚组织样本提取的低浓度mRNA提取、建库、测序工作，环境样本16SV4区扩增子信息采集与分析工作等多个项目。人人实验平台对单个项目均给予50%创新券补贴支持。"
        },
        {
            index: 4,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/jiliangjiaozhun.png",
            caseTitle: "计量、校准需求",
            caseType: "微需求",
            caseDesc: "北京迈世通科技有限公司需要校准34台仪器设备，通过联系人人实验平台，平台获取需要校准的设备台账后，对接后端服务方，迅速响应给出了报价单，清晰罗列了包括现场校准设备、送检设备及每台设备报价等信息。企业确认后，一周内就完成了所有仪器设备的校准工作，高效解决了以往企业仪器设备校准的诸多不便之处。"
        },
        {
            index: 5,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/boyajiyin.png",
            caseTitle: "博雅辑因——技术解决方案",
            caseType: "创新券",
            caseDesc: "博雅辑因（北京）生物科技有限公司委托人人实验平台服务方，对其提供的菌株、质粒、PCR产物等样本，采用sanger测序法进行测序，并对测序过程中所需的引物进行合成。人人实验平台对该项目给予50%创新券补贴支持。"
        },
        {
            index: 6,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/xiboshengwu.png",
            caseTitle: "希波生物——测试检测服务",
            caseType: "创新券",
            caseDesc: "北京市希波生物医学技术有限责任公司委托人人实验平台服务方，对其提供的人类组织样本/血液样本/DNA样本进行提取和质量检测，对于质检合格的样本进行文库构建、全外显子捕获、高通量测序及基因突变生物信息学分析，实验结果用于后续项目研发。人人实验平台对该项目给予30%创新券补贴支持。"
        },
        {
            index: 7,
            type:0 , // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/yiqigongxiang.png",
            caseTitle: "仪器共享需求",
            caseType: "微需求",
            caseDesc: "北京邮电大学的王同学在做课题过程中需要用到高效液相色谱HPLC，本学校仪器不能满足需求，于是向人人实验仪器共享平台寻求帮助，希望能在学校附近找到某个单位或高校有这台仪器，在人人实验官网上很快就找到了隔壁学校北京师范大学就有HPLC，并顺利联系上了负责人王老师，保证了实验顺利进行。"
        },
        {
            index: 8,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/front/imgs/2.4/weituoshiyan.png",
            caseTitle: "委托实验需求",
            caseType: "微需求",
            caseDesc: "中关村生命科学园内一家生物类企业，应业务需要委托技术服务方做40只大鼠CT及血管造影实验，找到人人实验平台帮助解决。人人实验根据服务项目要求，精准对接到中科院动物所生殖科老师，既优惠又高效。"
        },
        {
            index: 9,
            type:0, // 0 微需求 1 创新券
            casePic:BASE_URL + "/front/imgs/2.4/jiejuefangan.png",
            caseTitle: "解决方案需求",
            caseType: "微需求",
            caseDesc: "北京民康百草科技有限公司在药物研发过程中需要测定中间体杂质，该实验项目需用到液相质谱联用仪来摸索测试条件，向人人实验平台求助。平台运营人员根据服务方能力，把业务推送给某药物安全有效性研究公司，该公司有AB公司5500型液相质谱联用仪，同时配有操作经验丰富的检测人员。平台及时解决了企业研发过程中的难处。"
        }
    ];


    initCaseList();
    function initCaseList() {
        var caseItem;
        for (var i = 0; i < caseStore.length; i++) {
            caseItem = createCaseItem(caseStore[i]);
            $(".main").append(caseItem);
        }
    }
    /**
     * 初始化案例列表
     */
    function createCaseItem(caseData) {

        return'<div class="item clearfix">\
                         <img src="' + caseData.casePic + '" alt="">\
                         <div class="txt">\
                             <p class="caseTitle">' + caseData.caseTitle + '</p>\
                             <div class="descbox">\
                                 <p class="caseDesc">' + caseData.caseDesc + '</p>\
                             </div>\
                             <div class="labdown"><label class="lab-down"></label></div>\
                         </div>\
                     </div>';

    }
    $(".labdown").on("click",function () {
        var pheight=$(this).parent().find(".descbox p").height();
        console.log(pheight);
        if($(this).parent().find(".descbox").height()>=pheight){
            $(this).parent().find(".descbox").stop().animate({height:"48px"},500,"swing");
            $(this).find("label").attr("class","lab-down");
            $(this).stop().animate({width:20,marginTop:35},500,"swing");
            var t=$(this);
            setTimeout(function () {
                t.css("borderTop","solid 1px #979797");
            },900)
        }else {
            $(this).parent().find(".descbox").stop().animate({height:pheight},500,"swing");
            $(this).find("label").attr("class","lab-top");
            $(this).css("borderTop","none");
            $(this).stop().animate({width:520,marginTop:10},500,"swing");
        }
    })

//    for (var i=0;i<$(".descbox p").length;i++){
//        console.log($(".descbox p").eq(i).height()+"  "+$(".descbox p").eq(i).parent(".descbox").height());
//        if($(".descbox p").eq(i).height()<=$(".descbox p").eq(i).parent(".descbox").height()){
//            $(".descbox p").eq(i).parent().find(".labdown").hide();
//        }
//    }
   /* $(".item").hover(function () {
        $(this).find(".shade").stop().animate({opacity:'0.5'});
        $(this).find(".itemTit span").css('borderTop','none');
        $(this).find(".itemTxt").stop().animate({top:0},500);
        $(this).find(".itemT").stop().animate({opacity:1},500);
    },function () {
        $(this).find(".shade").stop().animate({opacity:'0.1'});
        $(this).find(".itemTit span").css('borderTop','1px solid #ffffff');
        $(this).find(".itemTxt").stop().animate({top:198},500);
        $(this).find(".itemT").stop().animate({opacity:0},500);
    })*/
</script>
</html>
