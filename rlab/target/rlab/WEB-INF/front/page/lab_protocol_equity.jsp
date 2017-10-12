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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20170905">

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
            color: #333333;
        }
        .big{
            font-size: 16px;
            margin-top: 32px;
        }
        .sm{
            font-size: 14px;
        }
        .blo{
            font-weight: bold;
            height: 100%;
            width: 63px;
        }
        .intro span{
            display: block;
            float: left;
        }
        .bloh{
            width: 805px;
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
                <div class="tab">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tab protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p class="select"><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit" style="margin-bottom: 43px">知识产权协议</div>
                <div class="intro">
                    <p class="sm">人人实验对网站内的所有信息内容（除特别注明信息来源或由他方输入的信息外）包括但不限于文字表述及其组合、图标、图饰、图表、色彩、版面设计、数据等均享有完整的著作权、专利权或商标权等相关权利，并受《中华人民共和国著作权法》《中华人民共和国专利法》等相关法律法规和中国加入的所有知识产权方面的国际条约、国际公约等的保护。本条中的“他方”包含平台用户和服务商。</p>
                    <p class="big clearfix"><span class="blo">第一条</span><span class="bloh">人人实验一直秉承尊重知识产权的理念，站内所使用的文字作品、美术作品、摄影作品、软件作品等均是通过合法途径取得授权或者原创。</span></p>
                    <p class="big clearfix"><span class="blo">第二条</span><span class="bloh">凡在人人实验平台上传信息即视为作者已免费授权人人实验，人人实验对该信息享有一定的权利，包括但不限于发表权、信息网络传播权、复制权、发行权。</span></p>
                    <p class="big clearfix"><span class="blo">第三条</span><span class="bloh">人人实验对用户自行上传的资料不承担任何法律责任，任何第三方均可对人人实验平台的内容进行监督，若发现存在侵犯任何第三人著作权等合法权益的内容，请及时告知人人实验，一经查实将在第一时间予以删除，并做相应的处理。</span></p>
                    <p class="big clearfix"><span class="blo">第四条</span><span class="bloh">未经人人实验书面许可，对于人人实验平台上的内容，任何单位或个人不得擅自复制、链接、非法使用或转载，不得以任何方式建立镜像站点。否则，人人实验将采取法律手段追究侵权者的责任。</span></p>
                    <p class="big" style="font-weight: bold">维权具体措施和步骤如下：</p>
                    <p class="big" style="margin-bottom: 16px">权利请求</p>
                    <p class="sm" style="color: #666666">任何个人或单位如果同时符合以下两个条件：</br>
                        1、 是某一作品/信息的权利所有人；</br>
                        2、 人人实验平台上的信息侵犯了该作品/信息的权利</br>
                        请上述个人或单位务必联系人人实验工作人员，按照人人实验工作人员的提示提供证明材料。
                    </p>
                    <p class="big" style="margin-bottom: 23px;margin-top: 23px">为了有效处理上述个人或单位的权利请求，请使用以下格式（包括各条款的序号）：</p>
                    <p class="sm" style="color: #666666;margin-bottom: 57px">
                        1. 请提供具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、营业执照复印件（对单位）、通信地址、电话号码、传真和电子邮件。</br>
                        2. 请完整、准确地指明涉嫌侵权作品的名称和登载该作品的网页的地址。</br>
                        3. 请提供构成侵权的初步证明材料，谨此提示如以下材料可能会构成初步证明：</br>
                        1）对涉嫌侵权内容拥有著作权和/或依法可以行使信息网络传播权的权属证明；</br>
                        2）对涉嫌侵权事实的举证。</br>
                        4. 请您在该权利通知落款处亲笔签名，如果您是依法成立的机构或组织，请您加盖公章。
                    </p>
                    <p class="sm" style="color: #666666;margin-bottom: 57px">
                        提出反请求的个人或单位务必联系人人实验工作人员，按照人人实验工作人员的提示提供证明材料。</br>
                        为了有效处理上述个人或单位的反请求，请使用以下格式（包括各条款的序号）：</br>
                        1. 请提供具体的联络信息，包括姓名、身份证或护照复印件（对自然人）、单位登记证明复印件（对单位）、通信地址、电话号码、传真和电子邮件。</br>
                        2. 请完整、准确地指明要求恢复作品的名称和网页的地址。</br>
                        3. 请提供不构成侵权的初步证明材料，谨此提示如下材料可能会构成初步证明：</br>
                        a. 对被指控侵权作品拥有著作权和/或依法可以行使信息网络传播权的权属证明，</br>
                        b. 对被指控侵权作品依法登载的举证。</br>
                        4. 请您在该反通知落款处亲笔签名，如果您是依法成立的机构或组织，请您加盖公章。
                    </p>
                    <p class="big" style="margin-bottom: 30px">
                        人人实验根据前述请求断开相关链接的或者删除相关内容的，被断开链接的网页的所有权人/管理人和相关内容的发布者可以向人人实验发出相关内容不侵犯他方权利的反请求。反请求发出后，人人实验对收到的反请求内容进行核实，确认属实的可以恢复相关内容，但不对该恢复行为及恢复后的相关内容承担法律责任。
                    </p>
                    <p class="big" style="margin-bottom: 30px">
                        请注意：根据《信息网络传播权保护条例》的规定，权利人应当对其权利通知的真实性负责；服务对象（提交反请求的人或者单位）应当对其反请求负责。如果您的“权利请求”或者“反请求”的陈述失实，您将承担对由此造成的全部法律责任（包括但不限于赔偿各种费用及律师费）。
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20170905"></script>
</body>
</html>