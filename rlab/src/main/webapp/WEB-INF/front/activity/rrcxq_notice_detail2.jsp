<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css">

    <%--<link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <style>
        html, body, .sp_main {
            background-color: #f6f7ff;
        }

        .banners img {
            width: 100%;
        }

        /*导航部分*/
        .navigator {
            margin: 0 auto;
            margin-top: 30px;
            width: 1200px;
            background-color: #3d8cf8;
            height: 50px;
            line-height: 50px;
        }

        .navigator .ad {
            float: left;
            line-height: 48px;
            height: 50px;
            margin-left: 15px;

        }

        .navigator .ad img {
            vertical-align: middle;
        }

        .navigator .txt {
            float: left;
            margin-left: 15px
        }

        .navigator .txt a {

        }

        .navigator .txt a:hover {
            text-decoration: underline;
        }

        /*列表部分*/
        .nt_list {
            width: 1200px;
            margin: 0 auto;
            background: #fff;
            border: solid 1px rgba(239, 239, 239, 1);
            margin-top: 9px;
            padding: 20px 35px;
            height: 646px;
            position: relative;
        }

        .nt_list > ul.list {
            list-style: none;
        }

        .nt_list > ul.list li {
            height: 50px;
            line-height: 50px;
            padding-left: 26px;
            position: relative;
        }

        .nt_list > ul.list i {
            color: #3d8cf8;
            display: block;
            line-height: 50px;
            position: absolute;
            left: 0;
        }

        .nt_list > ul.list a {
            font-size: 18px;
            color: #414141;
        }

        .nt_list > ul.list a:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .nt_list > ul.list s {
            font-size: 18px;
            color: #9f9f9f;
            position: absolute;
            right: 6px;
        }

        /*内容区域*/
        .detail_main {
            margin: 0 auto;
            margin-top: 10px;
            width: 1200px;
            background-color: white;
            text-align: center;
            overflow: hidden;
            padding-bottom: 85px;
        }

        .detail_main .title {
            font-size: 30px;
            color: #414141;
            margin-top: 40px
        }

        .detail_main .author {
            margin-top: 20px;
            font-size: 15px;
            color: #9f9f9f;
        }

        .detail_content{
            color: #414141;
            margin: 0 75px 0 75px;
        }

        .detail_content .title{
            font-size: 26px;
        }

        .detail_content .text{
            text-align: left;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<div id="main" class="wrapper">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>

    <div class="cxj_content" style="padding-bottom: 30px">
        <%--banner--%>
        <div class="banners">
            <img src="${rlab}/front/imgs/cxj/activityBanner.png">
        </div>

        <%--导航--%>
        <div class="navigator">
            <div class="ad" style="">
                <img src="${rlab}/front/imgs/cxj/add@1x.png" alt="">
            </div>
            <div class="txt">
                <a style="color: white" href="${rlab}/page/activity?source=0">人人创新券</a>
                <i class="lab-youjian_1" style="color: #9ec5fb; font-size: 14px;"></i>
                <a style="color: white" href="${rlab}/page/activity/notice">人人创新券公告信息</a>
                <i class="lab-youjian_1" style="color: #9ec5fb; font-size: 15px;"></i>
                <a style="color: white" href="#">公告正文</a>
            </div>
        </div>
        <%--内容区域--%>
        <div class="detail_main">
            <p class="title">人人创新券项目管理办法</p>
            <p class="author">2017-09-25</p>
            <div style="margin-top: 30px; width: 100%; height: 1px; background-color: #f6f6f6"></div>
            <div class="detail_content">
                <p class="title">第一章 总则</p>
                <p class="text">第一条 为进一步加强昌平在大众创业万众创新工作中的服务作用，突出昌平作为全国小微企业创新创业城市示范的示范效应，全面盘活昌平区域内的丰富科技资源，有效降低企业在创新研发活动中的成本，促进小微企业与高等学校、科研院所、大型企业之间的创新要素流动和产学研用合作，决定实施人人创新券项目，为充分发挥人人创新券的作用，特制定本管理办法。</p>
                <p class="text">第二条 人人创新券主要用于鼓励昌平区小微企业、创业团队等在研发活动、科技创新活动中优先使用区域内资源，人人创新券由创新券工作小组负责宣传发放与审核执行，主要为小微企业和创业团队进行补贴。</p>
                <p class="text">第三条 人人创新券使用和管理遵守国家有关法律法规和财务规章制度，遵循诚实申请、公正受理、择优支持、科学管理、公开透明、专款专用、据实列支的原则。</p>
            </div>

            <div class="detail_content">
                <p class="title">第二章 机构与职责</p>
                <p class="text">第四条 人人创新券由昌平园管委会提供“昌平区小微企业创业创新基地城市示范专项资金”支持，并负责管理、评估和审计，委托昌平科技园发展有限公司下属人人实验具体实施。人人实验设立创新券工作小组，负责创新券的申请、审核、发放等工作。</p>
                <p class="text">第五条 创新券工作小组制定人人创新券相关制度和流程，报备管委会经通过后进行推广和落地，并使用在线系统支撑人人创新券的发放、使用、评价、反馈、统计。具体职责包括但：完成针对平台人人创新券发放相关环节的流程设计、负责提交申请的小微企业创业团队的沟通审核、组织人人创新券面向各类用户线上线下的宣传培训，对人人创新券的资金使用进行支付管理，对人人创新券的使用效果与效用进行及时采集与评估。</p>
            </div>

            <div class="detail_content">
                <p class="title">第三章 人人创新券的形式</p>
                <p class="text">第六条 人人创新券采用一般创新券的补贴方式，向符合获得人人创新券条件的企业提供后补贴的获取形式。通过平台交易成功给予优惠补贴。人人创新券面向企业补贴资金由园区管委会提供，并设定年度补贴资金总限额。</p>
                <p class="text">第七条 小微企业、创业团队在通过平台实名认证后，符合获得人人创新券条件的企业、团队在平台线上可申请人人创新券，通过平台交易支付可直接抵扣金额后者以后补贴形式发放，获得人人创新券基础条件与使用规则如下：</p>
                <p class="text">•&nbsp;&nbsp;注册在昌平区的小微企业、创业团队使用昌平区资源，享受购买费用50%的人人创新券补贴，每家昌平企业或团队每年享受补贴总金额上限20万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;注册在昌平区的小微企业、创业团队使用非昌平区资源，享受购买费用40%的人人创新券补贴，每家昌平企业或团队每年享受补贴总金额上限20万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;非昌平区注册的小微企业、创业团队使用昌平区资源，享受购买费用30%的人人创新券补贴，每家非昌平企业或团队每年享受补贴总金额上限10万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;其他小微企业、创业团队，享受购买费用20%的人人创新券补贴，每家企业或团队每年享受补贴总金额上限10万元；该项目每年投资占比不超过年度总金额的20%。</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;上述补贴额度如因市场反馈、政策要求等需进行调整，应向上级相关部门提交备案，通过后按照新补贴额度进行补贴。</p>
            </div>

            <div class="detail_content">
                <p class="title">第四章 支持对象、范围与方式</p>
                <p class="text">第八条 人人创新券发放对象为小微企业、创业团队，给予人人创新券的研发创新服务包括仪器设备共享、测试检测服务、研发设计服务、委托开发服务、合作研发服务、技术解决方案、创新支撑服务科研活动。人人创新券只支持科技创新创业而开展的可带来一定社会效益的科研活动。按照法律法规或者强制性标准要求必须开展的强制检测和法定检测等其他商业活动，不纳入人人创新券补贴的支持范围。</p>
                <p class="text">第九条 使用人人创新券的企业或团队需通过平台完成认证审核，其科研服务方也需是通过平台认证审核的服务商。</p>
                <p class="text">小微企业需同时满足以下条件：</p>
                <p class="text">（一）在职正式员工100人以下，营业收入1000万以下（近两年营业收入均低于1000万），注册资金不高于3000万元，具有健全的财务机构，管理规范，无不良诚信记录。</p>
                <p class="text">（二）与开展合作的单位无任何隶属、共建、产权纽带等关联关系</p>
                <p class="text">创业团队需同时满足以下条件：</p>
                <p class="text">（一）不具备法人资格，还未注册企业</p>
                <p class="text">（二）创业项目需具有产品研发及转化所需的测试或研发工作</p>
            </div>

            <div class="detail_content">
                <p class="title">第五章 人人创新券发放</p>
                <p class="text">第十条 对于符合人人创新券发放要求的小微企业、创业团队可采取后补贴的形式获取补贴。小微企业及创业团队需提交相应材料，经过身份认证审核、创新券申请审核及创新券兑换审核后，创新券工作小组将补贴款项汇到企业对公账户或在直接交易中减免。在平台人人创新券支撑体系最终建设完成之前，可结合实行线下记录的方式进行，其余规则与平台线上人人创新券规则完全一致。</p>
                <p class="text">第十一条 小微企业、创业团队获得人人创新券需在平台进行机构认证并申请，需出示给平台以下证明材料：</p>
                <p class="text">（一）需在人人实验平台注册认证并填写组织机构代码，上传企业营业执照扫描件、法人身份证复印件、近两年财务报告；</p>
                <p class="text">（二）服务交易签订合同、协议、委托单等相关纸质文件、发票、银行流水、成果证明；</p>
                <p class="text">（三）人人创新券企业基本信息表、人人创新券项目申请表；</p>
                <p class="text">（四）其他有利于申领人人创新券的证明材料。</p>
            </div>

            <div class="detail_content">
                <p class="title">第六章 评价与监督</p>
                <p class="text">第十二条 人人实验平台针对所有企业、团队领取使用人人创新券完成的交易，对交易内容、金额、时间、人员、过程等内容需提供后台完整记录或者线下记录，并确保数据安全，实时报送中关村科技园区昌平园管委会，并在人人实验官网实时公示，同时，定期进行汇总、统计和评估并报中关村科技园区昌平园管委会，并按季度在中关村科技园区昌平园管委会网站和昌平区政府网站公布进展情况和统计信息。</p>
                <p class="text">第十三条 申领、使用人人创新券的企业、团队，应严格执行财务规章制度和会计核算办法，真实合法地使用人人创新券，并自觉接受科技、财政、审计、监察部门以及人人实验平台的监督检查；同时，人人实验平台针对所有企业、团队领取使用人人创新券的交易，每半年施行一次抽样复查，以该检查周期内交易数量的5%作为复查对象，复查内容包括但不限于申报主体、交易内容等。</p>
                <p class="text">第十四条 平台设计的规则、线下线上支撑系统、资格认定和交易确认都严格管控，避免虚假订单、同一订单多次领取创新券等违规行为产生，在人人创新券领取过程中，保证全程信息真实、有效，并接受第三方审计。</p>
                <p class="text">第十五条 人人实验平台经查发现企业信息、材料与提交不一致或者不符合补贴范围的有权要求企业当年退还补贴资金，同时，纳入人人实验平台黑名单，不在给予人人创新券支持，并报送中关村科技园区昌平园管委会备案，中关村科技园区昌平园管委会可向社会公示，并依法追究法律责任。</p>
            </div>

            <div class="detail_content">
                <p class="title">第七章 附则</p>
                <p class="text">第十六条 平台对人人创新券发放过程中获得的企业及个人信息、交易信息、认证资料、科研活动内容等相关信息严格保密，保证其合法权益。</p>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
</body>
</html>
</html>