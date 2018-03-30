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
        .intro{
            color: #404252;
        }
        .big{
            font-size: 16px;
            margin-bottom: 20px;
            line-height: 30px;
        }
        .sm{
            font-size: 16px;
            line-height: 30px;
        }
        .blo{
            font-weight: bold;
            height: 100%;
            width: 64px;
        }
        .intro span{
            float: left;
        }
        .bloh{
            width: 804px;
        }
        .page{
            width: 200px;
            float: right;
            height: 20px;
            margin-bottom: 50px;
            margin-right: 30px;
        }
        .page a{
            display: block;
            width: 20px;
            height: 20px;
            text-align: center;
            margin: 0 5px;
            color: #999999;
            line-height: 20px;
            float: right;
            cursor: pointer;
        }
        .page .sele{
            color: #333333;
        }
        .smm{
            text-indent: 32px;
            font-size: 14px;
        }
        .titff{
            font-size: 14px;
            text-indent: 32px;
            display: block;
            float: none!important;
            line-height: 30px;
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
                    <p><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tabs protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p class="select"><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content" style="margin-bottom: 30px">
                <div class="bigtit" style="margin-bottom: 43px">人人实验平台服务使用协议</div>
                <div class="intro">
                    <div class="page1">
                        <p class="sm" style="margin-bottom: 26px;font-size: 16px; color: #404252">人实验（北京）科技有限公司（以下简称“人人实验”）依据《人人实验平台服务使用协议》（以下简称“本协议”）的规定提供服务，本协议具有合同效力。用户注册时，请您认真阅读本协议，审阅并接受或不接受本协议（未成年人应在法定监护人陪同下审阅）。</p>
                        <p class="sm" style="margin-bottom: 38px;font-size: 16px;">若您已经注册为人人实验平台用户，即表示您已充分阅读、理解并同意自己与人人实验订立本协议，且您自愿受本协议的条款约束。人人实验有权随时变更本协议并在人人实验官网上予以公告。经修订的条款一经在人人实验官网公布后，立即自动生效。如您不同意相关变更，必须停止使用人人实验。本协议内容包括协议正文及所有人人实验已经发布的各类协议。所有协议为本协议不可分割的一部分，与本协议正文具有同等法律效力。一旦您继续使用人人实验平台，则表示您已接受并自愿遵守经修订后的条款。</p>

                        <p class="big clearfix" style="font-size: 14px;color: #70717D"><span style="font-weight: normal">人人实验：</span><span>指人人实验（北京）科技有限责任公司，以下简称“人人实验”；</span></p>
                        <p class="big clearfix" style="font-size: 14px;color: #70717D"><span class="blo" style="font-weight: normal">服务商：</span><span class="bloh">指与人人实验平台达成合作的机构和个人；或者经授权获得服务商单位营业执照或组织机构代码，并经该服务商管理员审核，拥有管理和操作该服务商已上线资源的机构和个人；</span></p>
                        <p class="big clearfix" style="margin-bottom: 43px;font-size: 14px;color: #70717D"><span style="font-weight: normal">用户：</span><span>指具有完全民事行为能力的、使用人人实验平台各项服务的自然人或者法人；</span></p>
                        <p class="big clearfix"><span class="blo">第一条</span><span class="bloh">为推动传统工作方式的转变和非实物科技服务网络交易的繁荣，保障人人实验用户合法权益，维护人人实验正常经营秩序，根据国家相关法律法规及《人人实验服务规则》，制定本协议。</span></p>
                        <p class="big clearfix"><span class="blo">第二条</span><span class="bloh">人人实验平台服务协议，是对人人实验平台用户增加基本义务或限制基本权利的条款。用户在人人实验平台交易，应当遵循平等、自愿、诚实信用原则。</span></p>
                        <p class="big clearfix"><span class="blo">第三条</span><span class="bloh">违规行为的认定与处理，应基于人人实验认定的事实并严格依规执行。人人实验平台用户在适用本协议上一律平等。</span></p>
                        <p class="big clearfix"><span class="blo">第四条</span><span class="bloh">用户应当遵守国家法律、法规、行政规章的规定。对任何涉嫌违反法律、法规、行政规章的行为，本协议已有规定的，适用本协议；本协议尚无规定的，人人实验有权酌情处理。但人人实验对用户的处理不免除其应当承担的法律责任。</span></p>
                        <p class="big clearfix"><span class="blo">第五条</span><span class="bloh">用户在人人实验平台上的全部行为仅代表其个人或法人，不代表人人实验，基于该行为的全部责任应当由用户自行承担。</span></p>
                        <p class="big clearfix"><span class="blo">第六条</span><span class="bloh">在人人实验平台上完成的交易，除法律规定不能转让或用户另有约定外，交易中涉及的相关的知识产权全部转让于用户所有。</span></p>
                        <p class="big clearfix"><span class="blo">第七条</span><span class="bloh">用户在人人实验注册成为平台用户时起，应当接受并同意本协议，否则不能使用人人实验平台的各项服务。人人实验有权随时修改本协议并在网站上予以公告。自公告之日起，若用户不同意相关修改的，应当立即停止使用人人实验平台的相关服务或产品；若继续使用的，则视为接受修改后的协议。</span></p>
                        <p class="big clearfix"><span class="blo">第八条</span><span class="bloh">人人实验有权对用户行为及适用的协议进行单方认定，并据此处理。</span></p>
                        <p class="big clearfix"><span class="blo">第九条</span><span class="bloh">用户资格</span></p>
                        <div class="sm" style="margin-bottom: 20px;margin-left: 64px">
                            <p style="font-size: 16px">1、只有符合下列条件之一的自然人或法人才能申请成为人人实验平台用户，可以使用人人实验平台的服务：</p>
                            <p class="smm">A、年满十八岁，并具有民事权利能力和民事行为能力的自然人。</p>
                            <p class="smm">B、无民事行为能力人或限制民事行为能力人应经过其监护人的同意。</p>
                            <p style="font-size: 14px;margin-left: 32px">C、根据中国法律、 法规、行政规章成立并合法存在的机关、企事业单位、社团组织和其他组织。无法人资格的单位或组织不许注册为人人实验平台用户的，其与人人实验之间的协议自始无效，人人实验一经发现，有权立即终止该用户的人人实验平台使用权限，并追究其使用人人实验所造成的一切法律责任。</p>
                            <p>2、用户需要提供明确的联系地址和联系电话，并提供真实姓名或名称，并且进行实名认证，即上传有效的身份证正反面照片，以及本人与身份证的合影。服务商需要提供组织机构代码并且上传该组织的营业执照。</p>
                            <p>3、人人实验平台用户须承诺遵守法律法规、社会主义制度、国家利益、公民合法权益、公共秩序、社会道德风尚和保证信息真实性。</p>
                        </div>
                        <p class="big clearfix"><span class="blo">第十条</span><span class="bloh">用户的权利和义务</span></p>
                        <p class="sm" style="margin-left: 64px">
                            1、用户有权根据本协议及人人实验发布的相关规则，利用人人实验平台发布需求信息、查询科技资源信息、发布招标信息，在人人实验社区及相关产品发布信息，参加人人实验的有关活动及享受人人实验提供的其他有关资讯及信息服务。服务商有权根据本协议及人人实验发布的相关规则，利用人人实验平台发布服务，发布科技资源信息，以及其他符合人人实验相关制度的信息，参加人人实验的相关活动及享受人人实验提供的其他有关资讯及信息内容。</br>
                            2、用户和服务商须自行负责管理自己的账号和密码，且须对在该账号下发生的所有活动（包括但不限于发布需求信息、网上点击同意各类协议、规则、参与需求招标等）承担责任。用户和服务商有权根据需要更改账户登录和提现密码。因用户和服务商的过错导致的任何损失由用户或者服务商自行承担，该过错包括但不限于：不按照交易提示操作，未及时进行交易操作，遗忘或泄露密码，密码被他人破解，用户或者服务商使用的计算机被他人侵入。</br>
                            3、用户和服务商应当向人人实验提供真实准确的注册信息，包括但不限于真实姓名、身份证号、联系电话、地址、邮政编码等，保证人人实验可以通过上述联系方式与其取得联系。同时，用户或服务商也应当在相关资料发生实际变更时，及时更新有关注册信息；</br>
                            4、 用户和服务商在人人实验平台注册的账号名称，不得有下列情形：</br>
                            <span class="titff">（一）违反宪法或法律法规规定的；</span>
                            <span class="titff">（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</span>
                            <span class="titff">（三）损害国家荣誉和利益的，损害公共利益的；</span>
                            <span class="titff">（四）煽动民族仇恨、民族歧视，破坏民族团结的；</span>
                            <span class="titff">（五）破坏国家宗教政策，宣扬邪教和封建迷信的；</span>
                            <span class="titff">（六）散布谣言，扰乱社会秩序，破坏社会稳定的；</span>
                            <span class="titff">（七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</span>
                            <span class="titff">（八）侮辱或者诽谤他人，侵害他人合法权益的；</span>
                            <span class="titff">（九）含有法律、行政法规禁止的其他内容的。</span>
                            5、用户和服务商不得以虚假信息骗取账号名称注册，或其账号头像、简介等注册信息存在违法和不良信息；</br>
                            6、用户和服务商不得冒用、关联机构或社会名人注册账号名称；</br>
                            7、用户和服务商不得以任何形式擅自转让或授权他人使用自己在人人实验平台的用户帐号（实名认证通过后，不能进行变更）；</br>
                            8、用户和服务商有义务确保在人人实验平台上发布的信息真实、准确，无误导性；</br>
                            9、用户和服务商在人人实验平台上发布信息以及在社区内及相关产品信息，不得违反国家法律、法规、行政规章的规定、不得侵犯他人知识产权或其他合法权益的信息、不得违背社会公共利益或公共道德、不得违反人人实验的相关规定；</br>
                            10、用户和服务商在人人实验平台交易中应当遵守诚实信用原则，不得以干预或操纵发布需求等不正当竞争方式扰乱网上交易秩序，不得从事与网上交易无关的不当行为；</br>
                            11、用户不得违反《银行卡业务管理办法》使用银行卡，或利用信用卡套取现金（以下简称套现）；</br>
                            12、用户和服务商承诺自己在使用人人实验平台时的所有行为遵守法律、法规、行政规章和人人实验的相关规定以及各种社会公共利益或公共道德。如有违反导致任何法律后果的发生，用户或者服务商将以自己的名义独立承担相应的法律责任；</br>
                            13、用户与服务商在人人实验平台上交易过程中产生纠纷，可以请求人人实验从中予以协调处理。用户或者服务商如发现其他人有违法或违反本协议的行为，可以向人人实验举报；</br>
                            14、除人人实验另有规定外，用户应当自行承担因交易产生的相关费用，并依法纳税；
                        </p>
                    </div>
                    <div class="page2" style="display: none">
                        <p class="sm"style="margin-bottom: 30px;margin-left: 64px">
                            15、未经人人实验书面允许，用户不得将人人实验的任何资料以及在平台上所展示的任何信息作商业性利用（包括但不限于以复制、修改、翻译等形式制作衍生作品、分发或公开展示）；</br>
                            16、用户和服务商不得使用以下方式登录网站或破坏网站所提供的服务：</br>
                            <span class="titff">A、以任何机器人软件、蜘蛛软件、爬虫软件、刷屏软件或其它自动方式访问或登录人人实验平台；</span>
                            <span class="titff">B、通过任何方式对本公司内部结构造成或可能造成不合理或不合比例的重大负荷的行为；</span>
                            <span class="titff">C、通过任何方式干扰或试图干扰网站的正常工作或网站上进行的任何活动。</span>
                            17、用户有权在同意人人实验相关规则的前提下享受消费者保障服务；</br>
                            18、用户同意接收来自人人实验的信息，包括但不限于活动信息、交易信息、促销信息等。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十一条 </span><span>人人实验的权利和义务</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            1、人人实验为用户提供一个信息服务平台，是服务商发布服务和用户发布需求的科技资源服务平台。</br>
                            2、人人实验有义务在现有技术水平的基础上努力确保整个网上交流平台的正常运行，尽力避免服务中断或将中断时间限制在最短时间内，保证用户网上交易活动的顺利进行。</br>
                            3、人人实验有义务对用户在注册使用人人实验平台过程中所遇到的与交易或注册有关的问题及反映的情况及时做出回复。</br>
                            4、人人实验有权对用户的注册资料进行审查，对存在任何问题或怀疑的注册资料，人人实验有权发出通知询问用户并要求用户做出解释、改正，在审查期间，人人实验有权利暂时停用用户账号。</br>
                            5、用户因在人人实验平台上交易与其他用户产生纠纷的，用户将纠纷告知人人实验，或人人实验知悉纠纷情况的，经审核后，人人实验有权通过电子邮件及电话联系向纠纷双方了解纠纷情况，并将所了解的情况通过电子邮件互相通知对方。双方通过司法机关依照法定程序要求人人实验提供相关资料，人人实验将积极配合并提供有关资料。</br>
                            6、因网上信息平台的特殊性，人人实验不承担对所有用户的交易行为以及与交易有关的其他事项进行事先审查的义务。但如发生以下情形，人人实验有权在无需征得用户的同意的情况下，限制用户的活动、向用户核实有关资料、发出警告通知、暂时中止、无限期终止及拒绝向该用户提供服务：</br>
                            <span class="titff">A、用户以非自然人名义进行认证之后认证主体自行注销或者经有权机关吊销或撤销的。</span>
                            <span class="titff">B、用户违反本协议或因被提及而纳入本协议的相关规则。</span>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">C、存在用户或其他第三方通知人人实验，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据，而人人实验无法联系到该用户核证或验证该用户向人人实验提供的任何资料。</span>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">D、存在用户或其他第三方通知人人实验，认为某个用户或具体交易事项存在违法或不当行为，并提供相关证据。人人实验以普通非专业人员的知识水平标准对相关内容进行判别，可以明显认为这些内容或行为可能对他方或人人实验造成损失或承担法律责任。</span>
                            7、根据国家法律、法规、行政规章规定、本协议的内容和人人实验所掌握的事实依据，可以认定该用户存在违法或违反本协议行为以及在人人实验平台上的其他不当行为，人人实验有权无需征得用户的同意在人人实验平台及所在网站上以网络发布形式公布该用户的违法行为，并有权随时作出删除相关个人信息、终止服务提供等处理。</br>
                            8、人人实验依据本协议及相关规则，可以冻结、使用、先行赔付、退款、处置用户缴存并冻结在人人实验平台账户内的资金。因违规而被封号的用户账户中的资金在按照规定进行处置后尚有余额的，该用户可申请提现。</br>
                            9、人人实验有权在不通知用户的前提下，删除或采取其他限制性措施处理下列信息：包括但不限于以规避费用为目的、以炒作信用为目的、存在欺诈等恶意或虚假内容、与网上交易无关或不是以交易为目的、存在恶意竞价或其他试图扰乱正常交易秩序因素、违反公共利益或可能严重损害人人实验和其他用户合法利益的信息。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十二条</span><span>人人实验的责任范围</span></p>
                        <div class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            当用户接受该协议时，用户应当明确了解并同意：</br>
                            1、人人实验不能随时预见到任何技术上的问题或其他困难。该等困难可能会导致数据损失或其他服务中断。人人实验是在现有技术基础上提供的服务。人人实验不保证以下事项∶</br>
                            <span class="titff">A、人人实验平台将符合所有用户的要求。</span>
                            <span class="titff">B、人人实验平台不受干扰、能够及时提供、安全可靠或免于出错。</span>
                            <span class="titff">C、本服务使用权的取得结果是正确或可靠的。</span>
                            2、是否经由人人实验平台下载或取得任何资料，由用户自行考虑、衡量并且自负风险，因下载任何资料而导致用户电脑系统的任何损坏或资料流失，用户应负完全责任。希望用户在使用人人实验平台时，小心谨慎并运用常识。</br>
                            3、用户经由人人实验平台取得的建议和资讯，无论其形式或表现，绝不构成本协议未明示规定的任何保证。
                            <p>4、基于以下原因而造成的利润、商誉、使用、资料损失或其它无形损失，人人实验不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿（即使人人实验已被告知前款赔偿的可能性）：</p>
                            <div style="margin-left: 32px;font-size: 14px">
                                A、人人实验平台的使用或无法使用。</br>
                                B、用户的传输或资料遭到未获授权的存取或变更。</br>
                                C、人人实验平台中任何第三方之声明或行为。</br>
                                D、人人实验平台在服务交易中为用户提供交易机会，推荐交易方。</br>
                                E、人人实验平台的其它相关事宜。
                            </div>
                            5、人人实验只是为用户提供一个服务交易的平台，对于用户所发布的需求的合法性、真实性及其品质，以及用户履行交易的能力等，人人实验一律不负任何担保责任。</br>
                            6、人人实验平台提供与其它互联网上的网站或资源的链接，用户可能会因此连结至其它运营商经营的网站，但不表示人人实验与这些运营商有任何关系。其它运营商经营的网站均由各经营者自行负责，不属于人人实验控制及负责范围之内。对于存在或来源于此类网站或资源的任何内容、广告、物品或其它资料，人人实验亦不予保证或负责。因使用或依赖任何此类网站或资源发布的或经由此类网站或资源获得的任何内容、物品或服务所产生的任何损害或损失，人人实验不负任何直接或间接的责任。
                        </div>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十三条</span><span>知识产权</span></p>
                        <div class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            1、人人实验平台及平台所使用的任何相关软件、程序、内容，包括但不限于作品、图片、档案、资料、网站构架、网站版面的安排、网页设计、经由人人实验或广告商向用户呈现的广告或资讯，均由人人实验或其它权利人依法享有相应的知识产权，包括但不限于著作权、商标权、专利权或其它专属权利等，受到相关法律的保护。未经人人实验或权利人明示授权，用户保证不修改、出售、散布人人实验平台及平台所使用的上述任何资料和资源，或根据上述资料和资源制作成任何种类产品。　</br>　
                            2、人人实验授予用户不可转移其非专属的使用权，使用户可以通过单机计算机使用人人实验的目标代码（以下简称"软件"），但用户不得自行且不得允许任何第三方复制、修改、创作衍生作品、进行还原工程、反向组译，或以其它方式破译或试图破译源代码，或出售、转让"软件"或对"软件"进行再授权，或以其它方式移转" 软件"之任何权利。用户同意不以任何方式修改"软件"，或使用修改后的"软件"。</br>
                            3、用户不得经由非人人实验所提供的界面使用人人实验平台。
                        </div>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十四条</span><span>隐私权</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            1、信息使用：</br>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">A、人人实验不会向任何人出售或出借用户的个人或法人信息，除非事先得到用户得许可。</span>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">B、人人实验亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播用户的个人或法人信息。任何用户如从事上述活动，一经发现，人人实验有权立即终止与该用户的服务协议，查封其账号。</span>
                            2、信息披露：用户的个人或法人信息将在下述情况下部分或全部被披露：
                        </p>
                    </div>
                    <div class="page3" style="display: none">
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            <span class="titff">A、经用户同意，向第三方披露。</span>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">B、用户在使用人人实验平台过程中涉及到知识产权类纠纷，有他方主张权利的，人人实验在审核主张方提交的资料后认为披露用户信息有助于纠纷解决的。</span>
                            <span class="titff">C、根据法律的有关规定，或者行政、司法机关的要求，向第三方或者行政、司法机关披露。</span>
                            <span class="titff">D、若用户出现违反中国有关法律或者网站规定的情况，需要向第三方披露。</span>
                            <span class="titff">E、为提供您所要求的产品和服务，而必须和第三方分享用户的个人或法人信息。</span>
                            <span class="titff">F、其它根据法律或者网站规定，人人实验认为合适的披露。</span>
                            3、信息安全：</br>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">A、在使用人人实验服务平台进行网上交易时，请用户妥善保护自己的个人或法人信息，仅在必要的情形下向他人提供。</span>
                            <span class="titff" style="margin-left: 32px;text-indent: 0;">B、如果用户发现自己的个人或法人信息泄密，尤其是用户账户或“支付账户管理”账户及密码发生泄露，请用户立即联络人人实验平台客服，以便我们采取相应措施。</span>
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十五条</span><span>不可抗力</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            因不可抗力或者其他意外事件，使得本协议的履行不可能、不必要或者无意义的，双方均不承担责任。本合同所称之不可抗力意指不能预见、不能避免并不能克服的客观情况，包括但不限于战争、台风、水灾、火灾、雷击或地震、罢工、暴动、法定疾病、黑客攻击、网络病毒、电信部门技术管制、政府行为或任何其它自然或人为造成的灾难等客观情况。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十六条</span><span>保密</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            用户保证在使用人人实验平台过程中所获悉的属于人人实验及他方的且无法自公开渠道获得的文件及资料（包括但不限于商业秘密、公司计划、运营活动、财务信息、技术信息、经营信息及其他商业秘密）予以保密。未经该资料和文件的原提供方同意，用户不得向第三方泄露该商业秘密的全部或者部分内容。但法律、法规、行政规章另有规定或者双方另有约定的除外。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十七条</span><span>交易纠纷解决方式</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            1、本协议及其规则的有效性、履行和与本协议及其规则效力有关的所有事宜，将受中华人民共和国法律管辖，任何争议仅适用中华人民共和国法律。</br>
                            2、人人实验有权受理并调处用户与其他用户因交易服务产生的纠纷，同时有权单方面独立判断其他用户对该用户的举报及索偿是否成立，若判断索偿成立，则人人实验有权要求用户进行相应偿付。人人实验没有使用自用资金进行偿付的义务，但若进行了该等支付，用户应及时赔偿人人实验的全部损失，否则人人实验有权通过其他方式抵减相应资金或权益，如仍无法弥补损失，则人人实验保留继续追偿的权利。因人人实验非司法机关，用户完全理解并承认，人人实验对证据的鉴别能力及对纠纷的处理能力有限，受理交易纠纷完全是基于用户之委托，不保证处理结果符合用户的期望，人人实验有权决定是否参与争议的调处。</br>
                            3、凡因履行本协议及其规则发生的纠纷以及在人人实验平台上交易产生的所有纠纷，各方可协商解决，若协商不成的，各方一致同意提交北京仲裁委员会按其仲裁规则进行仲裁。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十八条</span><span>完整协议</span></p>
                        <p class="sm" style="margin-bottom: 30px;margin-left: 64px">
                            本协议由本协议条款与《人人实验平台服务规则》、《人人实验平台知识产权保护协议》等人人实验公示的各项规则组成，相关名词可互相引用参照，如有不同理解，以本协议条款为准。</br>
                            您对本协议理解和认同，您即对本协议所有组成部分的内容理解并认同，一旦您使用本服务，您和本公司即受本协议所有组成部分的约束。
                        </p>
                        <p class="big clearfix"><span class="blo" style="width: 75px">第十九条</span><span>人人实验对本服务协议包括基于本服务协议制定的各项规则拥有最终解释权。</span></p>
                    </div>
                </div>
            </div>
            <div class="page">
                <a onclick="gopage(this)">3</a>
                <a onclick="gopage(this)">2</a>
                <a class="sele" onclick="gopage(this)">1</a>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript" charset="utf-8">

    function gopage($this) {
        $this=$($this);
        var pages=".page"+$this.html();
        $(".intro .page1,.page2,.page3").hide(500);
        $(pages).show(1000);
        $(".page a").attr("class","");
        $this.attr("class","sele");
        $("html,body").animate({scrollTop:0},800);
    }
</script>
</body>
</html>