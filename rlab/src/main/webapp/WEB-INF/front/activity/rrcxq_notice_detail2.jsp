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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">

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
            <p class="author">2017年10月</p>
            <div style="margin-top: 30px; width: 100%; height: 1px; background-color: #f6f6f6"></div>
            <div class="detail_content">
                <p class="title">第一章 总则</p>
                <p class="text">第一条 为进一步加强昌平在大众创业万众创新工作中的服务作用，突出昌平作为全国小微企业创新创业城市示范的示范效应，全面盘活昌平区域内丰富的科技资源，有效降低小微企业在创新研发活动中的成本，促进小微企业与高等学校、科研院所、大型企业之间的创新要素流动和产学研用合作，决定实施人人创新券（以下简称创新券）项目，为充分发挥创新券的作用，特制定本管理办法。</p>
                <p class="text">第二条 创新券使用和管理遵守国家有关法律法规和财务规章制度，遵循诚实申请、公正受理、择优支持、科学管理、公开透明、专款专用、据实列支的原则。</p>
            </div>

            <div class="detail_content">
                <p class="title">第二章 机构与职责</p>
                <p class="text">第三条 创新券由“昌平区小微企业创业创新基地城市示范专项资金”提供支持，昌平园管委会负责管理、评估和审计，委托昌平科技园发展有限公司下属人人实验具体实施。人人实验设立创新券工作小组（以下简称工作小组），负责创新券的申请、审核与发放等工作。</p>
                <p class="text">第四条 工作小组负责制定创新券相关工作流程并实施，使用人人实验平台（以下简称平台）支撑创新券的发放、使用、评价、反馈、统计。工作小组的具体职责主要包括：创新券的申请、审核与发放流程制定、创新券的宣传与活动推广、创新券审核与沟通、创新券资金发放、创新券使用效果评估、档案管理与风险管理。</p>
            </div>

            <div class="detail_content">
                <p class="title">第三章 人人创新券的补贴对象和范围</p>
                <p class="text">第五条 创新券补贴对象为小微企业，小微企业认定条件：在职正式员工100人以下，近两年营业收入均在1000万以内，注册资金不高于3000万元，管理规范，无不良诚信记录。</p>
                <p class="text">第六条 创新券补贴的项目范围包括：仪器设备共享、测试检测服务、研发设计服务、委托开发服务、合作研发服务、技术解决方案、创新支撑服务等应用于科研创新领域的项目，优先补贴具有一定社会效应的项目。按照法律法规或者强制性标准要求必须开展的强制检测和法定检测等其他项目，不纳入创新券的补贴范围。</p>
                <p class="text">第七条 创新券补贴项目的服务方需通过平台认证审核，小微企业和服务方无任何隶属、共建、产权纽带等关联关系。</p>
            </div>

            <div class="detail_content">
                <p class="title">第四章 人人创新券的形式</p>
                <p class="text">第八条 创新券通过工作小组向符合条件的小微企业发放补贴资金。</p>
                <p class="text">第九条 小微企业需要在平台完成实名认证并申请创新券。创新券补贴的基本规则如下：</p>
                <p class="text">•&nbsp;&nbsp;第一类，在昌平区注册的小微企业使用昌平区资源（指服务方企业注册地为昌平区），享受项目费用50%的创新券补贴，企业每年享受补贴总资金限额为20万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;第二类，在昌平区注册的小微企业使用非昌平区资源，享受项目费用40%的创新券补贴，企业每年享受补贴总资金限额为20万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;第三类，非昌平区注册的小微企业使用昌平区资源，享受项目费用30%的创新券补贴，企业每年享受补贴总金额上限10万元；</p>
                <p class="text" style="margin-top: 0px">•&nbsp;&nbsp;第四类，其他小微企业，享受项目费用20%的创新券补贴，企业每年享受补贴总金额上限5万元，本类项目补贴总额度不超过年度创新券补贴资金总额的10%。</p>
                <p class="text">为重点支持北京未来科学城作为北京科技创新中心主平台建设，对第一类和第三类情况中使用北京未来科学城内央企资源的项目补贴金额比例在原来基础上相应提高10%。</p>
                <p class="text">为重点支持昌平区产业布局，对生物医药、能源环保、智能制造、电子通信等领域，以及区政府重点支持的其他领域或项目，符合本管理办法要求的将进行优先支持。</p>
                <p class="text">上述补贴额度可根据年度执行情况进行适当调整。</p>
            </div>

            <div class="detail_content">
                <p class="title">第五章 人人创新券发放</p>
                <p class="text">第十条 申请创新券的小微企业需通过平台在线提供以下信息：填写人人创新券企业基本信息表、人人创新券项目申请表；填写组织机构代码，上传企业营业执照扫描件、法人身份证复印件、近两年财务报告；上传项目交易签订合同、协议、委托单等相关纸质文件、发票、银行回执单、记账凭证和成果证明材料；其他有利于申领人人创新券的证明材料。</p>
                <p class="text">第十一条 小微企业提交申请及相关证明材料后，工作小组将进行内部审核和外部审核，对符合条件拟进行补贴的项目和企业进行公示，公示完成后工作小组将补贴资金发放至申请企业的对公账户。</p>
            </div>

            <div class="detail_content">
                <p class="title">第六章 评价与监督</p>
                <p class="text">第十二条 工作小组对通过平台完成的项目，提供完整后台记录或线下记录，定期进行汇总、统计和评估，并报送相关主管部门。</p>
                <p class="text">第十三条 申请创新券的小微企业应严格执行财务规章制度和会计核算办法，真实合法地申请使用创新券，并自觉接受财政、审计、监察部门以及工作小组的监督检查；同时，工作小组针对创新券补贴的项目，每半年进行一次抽样复核，复核总量不低于补贴总量的5%。</p>
                <p class="text">第十四条 工作小组设计的流程和支撑系统需有效管控虚假交易、重复领取等违规行为，并确保全过程信息真实有效、可溯源，接受第三方独立审计。</p>
                <p class="text">第十五条 对经查证存在虚报材料、虚构交易、关联交易等行为的申请企业，工作小组有权要求企业立即退还补贴资金，并将其纳入平台失信名单，定期向社会公示，并将依法追究法律责任。</p>
            </div>

            <div class="detail_content">
                <p class="title">第七章 附则</p>
                <p class="text">第十六条 工作小组对创新券发放过程中获得的企业及个人信息、交易信息、认证资料、科研活动内容等相关信息严格保密，保证其合法权益，工作小组保留对人人创新券项目的最终解释权。</p>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
</body>
</html>
</html>