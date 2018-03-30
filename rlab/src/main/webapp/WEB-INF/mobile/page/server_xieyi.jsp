<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/11/28
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

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

        *{margin: 0;padding: 0;}html,body{width: 100%;height: 100%;background: #f5f6fa;}

        a{
            text-decoration: none!important;
        }

        a:hover{text-decoration: none !important;}a:link{text-decoration: none !important;}

        .content{
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
            top:0;
            right: 0;
        }
        .user-img{
            width: 0.8267rem;
            height: 1.173rem;
            line-height:1.173rem;
            text-align: center;
            position: absolute;
            top:0;
            right: 0.3rem;
        }
        .user-img img{
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
            top:0;
            left: 0;
        }
        .sdkj{
            margin: 1.173rem 0.69rem 0 0.77rem;
            overflow: hidden;
        }

        .sdkj p{
            font-size: 0.32rem;
            color: #373737;
            line-height: 0.48rem;
            letter-spacing: 0.02rem;
        }
        .sdkj .sdkj_tit{
            text-align: center;
            margin-bottom: 0.84rem;
            color: #2b2b2b;
            margin-top: 0.3rem;
        }
    </style>
</head>

<body>
<div id="main" class="sp_main">


    <div class="headers" style="background: white">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()" ><img src="${rlab}/mobile/imgs/home_logo.png" /></a></p>
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
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
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
    <div class="sdkj">
        <p class="sdkj_tit">人人实验平台服务使用协议</p>
        <p>人人实验（北京）科技有限公司（以下简称“人人实验”）依据《人人实验平台服务使用协议》（以下简称“本协议”）的规定提供服务，本协议具有合同效力。用户注册时，请您认真阅读本协议，审阅并接受或不接受本协议（未成年人应在法定监护人陪同下审阅）。<br>
            <br>
            若您已经注册为人人实验平台用户，即表示您已充分阅读、理解并同意自己与人人实验订立本协议，且您自愿受本协议的条款约束。人人实验有权随时变更本协议并在人人实验官网上予以公告。经修订的条款一经在人人实验官网公布后，立即自动生效。如您不同意相关变更，必须停止使用人人实验。本协议内容包括协议正文及所有人人实验已经发布的各类协议。所有协议为本协议不可分割的一部分，与本协议正文具有同等法律效力。一旦您继续使用人人实验平台，则表示您已接受并自愿遵守经修订后的条款。<br>
            <br>
            名词解释：<br>
            <br>
            人人实验：指人人实验（北京）科技有限责任公司，以下简称“人人实验”；<br>
            <br>
            服务商：指与人人实验平台达成合作的机构和个人；或者经授权获得服务商单位营业执照或组织机构代码，并经该服务商管理员审核，拥有管理和操作该服务商已上线资源的机构和个人；<br>
            <br>
            用户：指具有完全民事行为能力的、使用人人实验平台各项服务的自然人或者法人；<br>
            <br>
            第一条为推动传统工作方式的转变和非实物科技服务网络交易的繁荣，保障人人实验用户合法权益，维护人人实验正常经营秩序，根据国家相关法律法规及《人人实验服务规则》，制定本协议。<br>
            <br>
            第二条人人实验平台服务协议，是对人人实验平台用户增加基本义务或限制基本权利的条款。用户在人人实验平台交易，应当遵循平等、自愿、诚实信用原则。<br>
            <br>
            第三条违规行为的认定与处理，应基于人人实验认定的事实并严格依规执行。人人实验平台用户在适用本协议上一律平等。<br>
            <br>
            第四条用户应当遵守国家法律、法规、行政规章的规定。对任何涉嫌违反法律、法规、行政规章的行为，本协议已有规定的，适用本协议；本协议尚无规定的，人人实验有权酌情处理。但人人实验对用户的处理不免除其应当承担的法律责任。<br>
            <br>
            第五条用户在人人实验平台上的全部行为仅代表其个人或法人，不代表人人实验，基于该行为的全部责任应当由用户自行承担。<br>
            <br>
            第六条在人人实验平台上完成的交易，除法律规定不能转让或用户另有约定外，交易中涉及的相关的知识产权全部转让于用户所有。<br>
            <br>
            第七条用户在人人实验注册成为平台用户时起，应当接受并同意本协议，否则不能使用人人实验平台的各项服务。人人实验有权随时修改本协议并在网站上予以公告。自公告之日起，若用户不同意相关修改的，应当立即停止使用人人实验平台的相关服务或产品；若继续使用的，则视为接受修改后的协议。<br>
            <br>
            第八条人人实验有权对用户行为及适用的协议进行单方认定，并据此处理。<br>
            <br>
            第九条用户资格<br>
            <br>
            1、只有符合下列条件之一的自然人或法人才能申请成为人人实验平台用户，可以使用人人实验平台的服务：<br>
            A、年满十八岁，并具有民事权利能力和民事行为能力的自然人。<br>
            B、无民事行为能力人或限制民事行为能力人应经过其监护人的同意。<br>
            C、根据中国法律、 法规、行政规章成立并合法存在的机关、企事业单位、社团组织和其他组织。无法人资格的单位或组织不许注册为人人实验平台用户的，其与人人实验之间的协议自始无效，人人实验一经发现，有权立即终止该用户的人人实验平台使用权限，并追究其使用人人实验所造成的一切法律责任。<br>
            2、用户需要提供明确的联系地址和联系电话，并提供真实姓名或名称，并且进行实名认证，即上传有效的身份证正反面照片，以及本人与身份证的合影。服务商需要提供组织机构代码并且上传该组织的营业执照。<br>
            3、人人实验平台用户须承诺遵守法律法规、社会主义制度、国家利益、公民合法权益、公共秩序、社会道德风尚和保证信息真实性。<br>
            <br>
            第十条用户的权利和义务<br>
            <br>
            1、用户有权根据本协议及人人实验发布的相关规则，利用人人实验平台发布需求信息、查询科技资源信息、发布招标信息，在人人实验社区及相关产品发布信息，参加人人实验的有关活动及享受人人实验提供的其他有关资讯及信息服务。服务商有权根据本协议及人人实验发布的相关规则，利用人人实验平台发布服务，发布科技资源信息，以及其他符合人人实验相关制度的信息，参加人人实验的相关活动及享受人人实验提供的其他有关资讯及信息内容。<br>
            2、用户和服务商须自行负责管理自己的账号和密码，且须对在该账号下发生的所有活动（包括但不限于发布需求信息、网上点击同意各类协议、规则、参与需求招标等）承担责任。用户和服务商有权根据需要更改账户登录和提现密码。因用户和服务商的过错导致的任何损失由用户或者服务商自行承担，该过错包括但不限于：不按照交易提示操作，未及时进行交易操作，遗忘或泄露密码，密码被他人破解，用户或者服务商使用的计算机被他人侵入。<br>
            3、用户和服务商应当向人人实验提供真实准确的注册信息，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等，保证人人实验可以通过上述联系方式与其取得联系。同时，用户或服务商也应当在相关资料发生实际变更时，及时更新有关注册信息；<br>
            4、 用户和服务商在人人实验平台注册的账号名称，不得有下列情形：<br>
            （一）违反宪法或法律法规规定的；<br>
            （二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br>
            （三）损害国家荣誉和利益的，损害公共利益的；<br>
            （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br>
            （五）破坏国家宗教政策，宣扬邪教和封建迷信的；<br>
            （六）散布谣言，扰乱社会秩序，破坏社会稳定的；<br>
            （七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br>
            （八）侮辱或者诽谤他人，侵害他人合法权益的；<br>
            （九）含有法律、行政法规禁止的其他内容的。<br>
            5、用户和服务商不得以虚假信息骗取账号名称注册，或其账号头像、简介等注册信息存在违法和不良信息；<br>
            6、用户和服务商不得冒用、关联机构或社会名人注册账号名称；<br>
            7、用户和服务商不得以任何形式擅自转让或授权他人使用自己在人人实验平台的用户帐号（实名认证通过后，不能进行变更）；<br>
            8、用户和服务商有义务确保在人人实验平台上发布的信息真实、准确，无误导性；<br>
            9、用户和服务商在人人实验平台上发布信息以及在社区内及相关产品信息，不得违反国家法律、法规、行政规章的规定、不得侵犯他人知识产权或其他合法权益的信息、不得违背社会公共利益或公共道德、不得违反人人实验的相关规定；<br>
            10、用户和服务商在人人实验平台交易中应当遵守诚实信用原则，不得以干预或操纵发布需求等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为；<br>
            11、用户不得违反《银行卡业务管理办法》使用银行卡，或利用信用卡套取现金（以下简称套现）；<br>
            12、用户和服务商承诺自己在使用人人实验平台时的所有行为遵守法律、法规、行政规章和人人实验的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，用户或者服务商将以自己的名义独立承担相应的法律责任；<br>
            13、用户与服务商在人人实验平台上交易过程中产生纠纷，可以请求人人实验从中予以协调处理。用户或者服务商如发现其他人有违法或违反本协议的行为，可以向人人实验举报；<br>
            14、除人人实验另有规定外，用户应当自行承担因交易产生的相关费用，并依法纳税；<br>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    /**
     * 返回历史上一页
     */
    function goBack() {
        history.go(-1);
    }



</script>
</html>
