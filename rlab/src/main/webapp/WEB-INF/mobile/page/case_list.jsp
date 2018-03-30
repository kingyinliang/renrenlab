<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202 ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <%--layer--%>
    <script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">
    <style>
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

        #item4mobile {
            margin-top: 1.173rem;
            padding: 0.36rem 0.32rem;
        }

        #item4mobile li {
            font-size: 0.32rem;
            padding: 0.333rem;
            margin-top: 0.18rem;
            background: white;
            border-radius: 0.2rem;
        }

        #item4mobile p {
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

        #item4mobile img {
            width: 2.77rem;
            height: 2.77rem;
            float: left;
        }

        #item4mobile .tit h3 {
            font-size: 0.32rem;
            color: #4f8df0;
            margin: 0.32rem 0;
        }

        #item4mobile {
            border: none !important;
        }

        #item4mobile .tit h2 {
            font-size: 0.35rem;
            color: #4b4b4b;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        #item4mobile .tit {
            max-width: 5rem;
            margin-left: 0.82rem;
            float: left;
        }

        #item4mobile p {
            font-size: 0.32rem;
        }

        .tit_state {
            color: #18c248;
        }

        .tit_timer {
            color: #c0c0c0;
            margin-left: 0.32rem;
        }
    </style>
</head>
<body>
<div id="main">
    <div class="headers">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo" style="font-size: 0.36rem">应用案例</p>
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
    <div class="lists" id="item4mobile">
        <ul>

        </ul>
    </div>
</div>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }

    // 这个数据和case_list.jsp 里的 caseStore 一致，可以对应一下
    var caseStore = [
        {
            index: 0, // 索引
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/anmosai.png",
            caseTitle: "安默赛斯——合作研发服务",// 标题
            caseType: "创新券",// 创新券
            caseDesc: "北京安默赛斯生物科技有限公司委托人人实验平台服务方，通过用转基因老年痴呆小鼠长期给予供试药物，用水迷宫和高架十字迷宫考察药物治疗阿尔茨海默症的效果，并通过分子生物学检测来观察药物对动物病理学上的改善作用，为药物的后期研发提供依据。该项目获得人人实验平台18万元创新券补贴支持。"
        },
        {
            index: 1,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/huajiejiyin.png",
            caseTitle: "华颉基因——实验仪器租赁",
            caseType: "创新券",
            caseDesc: "北京华颉基因医疗技术有限公司的高通量基因测序项目，通过人人实验平台成功入驻中关村科技园昌平园，并采用以租代买的模式解决了主要仪器设备的购置。该项目应用第二代基因测序技术，仅通过2毫升血液，便可检测包括亚型、耐药性在内的基因指纹，为病人绘制疾病指纹，提供全面的、敏感的、早期、无创及动态的疾病监控，实现疾病的早期诊断，并在治疗及随访过程中实现对病情变化的动态监控。该项目获得人人实验平台20万元创新券补贴支持。"
        },
        {
            index: 2,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/zhongshifangda.png",
            caseTitle: "中试放大需求",
            caseType: "微需求",
            caseDesc: "北京海燕药业研发中心需要找固体制剂中试平台，来到人人实验平台寻求帮助。平台在一小时内与某医药研究开发中心毛老师取得联系并沟通细节，对接双方顺利完成了药品制作和包装。"
        },
        {
            index: 3,
            type:1, // 0 微需求 1 创新券
            casePic:BASE_URL + "/mobile/imgs/m2.3/case/huanuoshidai.png",
            caseTitle: "华诺时代——测试检测服务",
            caseType: "创新券",
            caseDesc: "北京华诺时代科技有限公司委托人人实验平台服务方，成功完成了多糖多酚组织样本提取的低浓度mRNA提取、建库、测序工作，环境样本16SV4区扩增子信息采集与分析工作等多个项目。人人实验平台对单个项目均给予50%创新券补贴支持。"
        },
        {
            index: 4,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/jiliangjiaozhun.png",
            caseTitle: "计量、校准需求",
            caseType: "微需求",
            caseDesc: "北京迈世通科技有限公司需要校准34台仪器设备，通过联系人人实验平台，平台获取需要校准的设备台账后，对接后端服务方，迅速响应给出了报价单，清晰罗列了包括现场校准设备、送检设备及每台设备报价等信息。企业确认后，一周内就完成了所有仪器设备的校准工作，高效解决了以往企业仪器设备校准的诸多不便之处。"
        },
        {
            index: 5,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/boyajiyin.png",
            caseTitle: "博雅辑因——技术解决方案",
            caseType: "创新券",
            caseDesc: "博雅辑因（北京）生物科技有限公司委托人人实验平台服务方，对其提供的菌株、质粒、PCR产物等样本，采用sanger测序法进行测序，并对测序过程中所需的引物进行合成。人人实验平台对该项目给予50%创新券补贴支持。"
        },
        {
            index: 6,
            type:1, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/xiboshengwu.png",
            caseTitle: "希波生物——测试检测服务",
            caseType: "创新券",
            caseDesc: "北京市希波生物医学技术有限责任公司委托人人实验平台服务方，对其提供的人类组织样本/血液样本/DNA样本进行提取和质量检测，对于质检合格的样本进行文库构建、全外显子捕获、高通量测序及基因突变生物信息学分析，实验结果用于后续项目研发。人人实验平台对该项目给予30%创新券补贴支持。"
        },
        {
            index: 7,
            type:0 , // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/yiqigongxiang.png",
            caseTitle: "仪器共享需求",
            caseType: "微需求",
            caseDesc: "北京邮电大学的王同学在做课题过程中需要用到高效液相色谱HPLC，本学校仪器不能满足需求，于是向人人实验仪器共享平台寻求帮助，希望能在学校附近找到某个单位或高校有这台仪器，在人人实验官网上很快就找到了隔壁学校北京师范大学就有HPLC，并顺利联系上了负责人王老师，保证了实验顺利进行。"
        },
        {
            index: 8,
            type:0, // 0 微需求 1 创新券
            casePic: BASE_URL + "/mobile/imgs/m2.3/case/weituoshiyan.png",
            caseTitle: "委托实验需求",
            caseType: "微需求",
            caseDesc: "中关村生命科学园内一家生物类企业，应业务需要委托技术服务方做40只大鼠CT及血管造影实验，找到人人实验平台帮助解决。人人实验根据服务项目要求，精准对接到中科院动物所生殖科老师，既优惠又高效。"
        },
        {
            index: 9,
            type:0, // 0 微需求 1 创新券
            casePic:BASE_URL + "/mobile/imgs/m2.3/case/jiejuefangan.png",
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
            $("#item4mobile > ul").append(caseItem);
        }
    }

    /**
     * 初始化案例列表
     */
    function createCaseItem(caseData) {

        return '<li class="clearfix">\
            <a href="${rlab}/m_home/case_detail?index='+ caseData.index + '&type=' + caseData.type + '">\
            <img class="liImg" src="' + caseData.casePic + '"/>\
            <div class="tit">\
            <h2>' + caseData.caseTitle + '</h2>\
            <h3>' + caseData.caseType + '</h3>\
            <p>' + caseData.caseDesc + '</p></div></a></li>';
    }

</script>

</html>
