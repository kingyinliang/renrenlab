<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv=“X-UA-Compatible” content=“chrome=1″/>
    <meta name="renderer" content="webkit">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%--<%@ include file="../../config/shujike.jsp" %>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/base.css?v_=20180330"/>
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/home.css?v_=20170905"/>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/assets/jquery-1.12.4/jquery.fullPage.css"/>
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.fullPage.min.js" type="text/javascript" charset="utf-8"></script>

    <%--<script src="${rlab}/front/js/common/main.js"></script>--%>
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <style>
        .user{
            background: url("${rlab}/front/imgs/opaque.png");
        }
    </style>
</head>
<body>
<div id="dowebok">
    <div class="section" id="page1">
        <div class="headNav">
            <div class="navHead">
                <div class="logoHome">
                    <img src="${rlab}/front/imgs/icon/logo-header.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <i class="lab-arrow-down"></i>
                            <ul class="user_down">
                                <li>
                                    <a  onclick="toCenter();return false;" href="javascript:void (0);">个人中心</a>
                                </li>
                                <%--<li>--%>
                                    <%--<a  onclick="toCenter();return false;" href="javascript:void (0);">服务商认证</a>--%>
                                <%--</li>--%>
                                <li id="logout">
                                    <a  onclick="logouts();return false;" href="javascript:void (0);">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead">
                            <a onclick="logins();" href="javascript:void(0);">登录</a> |
                            <a onclick="registers();" href="javascript:void(0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat" style="display: none;">
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div style="float: right;width: 120px;text-align: center;" >
                    <%--<c:choose>--%>
                        <%--<c:when test="${sessionScope.uid != null}">--%>
                            <a href="${rlab}/page/req/listpage" style="color: #fff;font-size: 16px;">发布需求</a>
                        <%--</c:when>--%>
                        <%--<c:otherwise>--%>
                            <%--<a href="${rlab}/page/req/pubpage" onclick="" style="color: #fff;font-size: 16px;">发布需求</a>--%>
                        <%--</c:otherwise>--%>
                    <%--</c:choose>--%>

                </div>
                <div style="float: right;width: 120px;text-align: center;">
                    <a href="javascript:void(0);" onclick="toSearch();return false;" style="color: #fff;font-size: 16px;">仪器共享</a>
                </div>
                <div style="float: right;width: 120px;text-align: center;" >
                    <a href="${rlab}/page/dxscxj/home" target="_blank" style="color: #fff;font-size: 16px;">大学生创新券</a>
                </div>
                <div style="float: right;width: 120px;text-align: center;">
                    <a href="${rlab}/page/activity?source=0" target="_blank" style="color: #fff;font-size: 16px;">人人创新券</a>
                </div>
            </div>
        </div>
        <div id="banner">
            <ul id="homeBannerUl">
                <li class="focus">
                    <div class="banner-modal"></div>
                    <img src="${rlab}/front/imgs/new-home-banner-01.jpg" alt="实验室案例图1">
                </li>
                <li>
                    <div class="banner-modal"></div>
                    <img src="${rlab}/front/imgs/new-home-banner-02.jpg" alt="实验室案例图2">
                </li>
                <li>
                    <img src="${rlab}/front/imgs/new-home-banner-03.jpg" alt="实验室案例图3">
                </li>
            </ul>
        </div>
        <div class="page1Text" style="top: 47%;">
            <h1>让仪器共享起来</h1>
            <%--<h3>Share the instruments</h3>--%>
        </div>
        <div id="search">
            <input type="text" name="" id="searching" value="" placeholder="共享仪器/服务机构"/>
            <span class="lab-search" id="goSearch"></span>
        </div>
    </div>
    <div class="section" id="page2">
        <div class="headNav">
            <div class="navHead">
                <div class="logoHome">
                    <img src="${rlab}/front/imgs/icon/logo-header.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <i class="lab-arrow-down"></i>
                            <ul class="user_down">
                                <li>
                                    <a href="javascript:void (0);" onclick="toCenter();return">个人中心</a>
                                </li>
                                <li>
                                    <a href="javascript:void (0);" onclick="logouts();">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead">
                            <a onclick="logins();" href="javascript:void (0);">登录</a> |
                            <a onclick="registers();" href="javascript:void (0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat" >
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div class="gopage1">
                    <a href="#page01"><p>搜索仪器</p></a>
                </div>
            </div>
        </div>
        <div class="bannerpage2">
            <ul class="banner_cxq">
                <li>
                    <a href="${rlab}/page/dxscxj/home" target="_blank">
                        <img src="${rlab}/front/imgs/undergraduatebg.jpg?v_=20170905" alt="">
                        <span class="undergraduateimg"><img src="${rlab}/front/imgs/undergraduateimg.png?v_=20170905" alt=""></span>
                    </a>
                </li>
                <li>
                    <a href="${rlab}/page/activity?source=0" target="_blank">
                        <img src="${rlab}/front/imgs/cxqbg.jpg?v_=20170905" alt="">
                        <span class="cxqimg"><img src="${rlab}/front/imgs/cxqimg.png?v_=20170905" alt=""></span>
                    </a>
                </li>
                <li>
                    <a href="${rlab}/page/dxscxj/home" target="_blank">
                        <img src="${rlab}/front/imgs/undergraduatebg.jpg?v_=20170905" alt="">
                        <span class="undergraduateimg"><img src="${rlab}/front/imgs/undergraduateimg.png?v_=20170905" alt=""></span>
                    </a>
                </li>
            </ul>
        </div>
    </div>


    <div class="section" id="page3">
        <div class="headNav" >
            <div class="navHead">
                <div class="logoHome" onclick="toHome()" style="cursor: pointer;">
                    <img src="${rlab}/front/imgs/icon/logo-head-bule.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span style="color: #4E4E4E"><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <i class="lab-arrow-down" style="color: #4E4E4E"></i>
                            <ul class="user_down">
                                <li>
                                    <a href="javascript:void (0);" onclick="toCenter();">个人中心</a>
                                </li>
                                <li>
                                    <a href="javascript:void (0);" onclick="logouts();">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead btnHeadBlack">
                            <a onclick="logins();" href="javascript:void (0)">登录</a> |
                            <a onclick="registers();" href="javascript:void (0)">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat" style="color: #4E4E4E;">
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div class="gopage1">
                    <a href="#page01" style="color: #4E4E4E;"><p>搜索仪器</p></a>
                </div>
            </div>
        </div>
        <div class="freestyle">
            <img src="${rlab}/front/imgs/page3org.jpg"/>
        </div>
        <%--<img src="${rlab}/front/imgs/home2.png" class="bgpic"/>--%>
        <div id="page2Text" class="texts">
            <h1 style="font-size: 66px">打破边界</h1>
            <h1 style="font-size: 28px;margin-top: 30px;color: #b0b0b0;">科研可以更自由</h1>
            <%--<h3>Break the boundary</h3>--%>
            <p><img src="${rlab}/front/imgs/4800.png" style="width: 76px;height: 23px;margin-bottom: 10px;margin-right: 10px;">余家顶级实验室，在这里向您敞开大门，与最聪<br />明的人一起用最先进的仪器，更轻松地探索未知领域</p>
        </div>
        <div class="freeText">
            <img src="${rlab}/front/imgs/freestyle.png"/>
        </div>
    </div>
    <div class="section" id="page4">
        <div class="headNav">
            <div class="navHead">
                <div class="logoHome" onclick="toHome()" style="cursor: pointer;">
                    <img src="${rlab}/front/imgs/icon/logo-header.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <i class="lab-arrow-down"></i>
                            <ul class="user_down">
                                <li>
                                    <a href="javascript:void (0);" onclick="toCenter();return">个人中心</a>
                                </li>
                                <li>
                                    <a href="javascript:void (0);" onclick="logouts();">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead">
                            <a onclick="logins();" href="javascript:void (0);">登录</a> |
                            <a onclick="registers();" href="javascript:void (0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat">
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div class="gopage1">
                    <a href="#page01"><p>搜索仪器</p></a>
                </div>
            </div>
        </div>
        <img src="${rlab}/front/imgs/page3bg.png" style="width: 100%;height: 100%;"/>
        <div class="pageimg">
            <img src="${rlab}/front/imgs/page3.png" style="width: 100%;height: 100%;"/>
        </div>
        <div id="page3Text" class="texts">
            <h1 style="font-size: 66px">应有尽有</h1>
            <h1 style="font-size: 28px;margin-top: 26px;color: #b0b0b0;">实验从此无烦恼</h1>
            <%--<h3>Have everything that one expects to find</h3>--%>
            <p style="color: #e5e5e5"><img src="${rlab}/front/imgs/500-000.png" style="width: 128px;height: 23px;margin-bottom: 10px;margin-right: 10px;">余台共享仪器资源覆盖<br />生物医药、化学化工、物理机械、电子电器、智能硬件等多个<br />行业领域，"巧妇难为无米之炊"已然是过去</p>
        </div>
    </div>
    <div class="section" id="page5">
        <div class="headNav" >
            <div class="navHead">
                <div class="logoHome" onclick="toHome()" style="cursor: pointer;">
                    <img src="${rlab}/front/imgs/icon/logo-head-bule.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span style="color: #4E4E4E"><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <i class="lab-arrow-down" style="color: #4E4E4E"></i>
                            <ul class="user_down">
                                <li>
                                    <a href="javascript:void (0);" onclick="toCenter();">个人中心</a>
                                </li>
                                <li>
                                    <a href="javascript:void (0);" onclick="logouts();;">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead btnHeadBlack">
                            <a onclick="logins();" href="javascript:void (0);">登录</a> |
                            <a onclick="registers();" href="javascript:void (0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat" style="color: #4E4E4E;">
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div class="gopage1">
                    <a href="#page01" style="color: #4E4E4E;"><p>搜索仪器</p></a>
                </div>
            </div>
        </div>
        <%--<div class="freestyle">
            <img src="${rlab}/front/imgs/home04.jpg"/>
        </div>--%>
        <img src="${rlab}/front/imgs/page4bg.png" style="width: 100%;height: 100%;"/>
        <div class="page4img">
            <img src="${rlab}/front/imgs/page5.png" style="width: 100%;height: 100%;"/>
        </div>
        <div id="page4Text" class="texts">
            <h1 style="font-size: 66px">精 准 快</h1>
            <h1 style="font-size: 28px;margin-top: 26px;color: #b0b0b0;">让新技术更好地服务科研</h1>
            <%--<h3>Internet + New technology</h3>--%>
            <p>为每台仪器叠加GPS信息，更快地找到最近的实验设备<br />深度挖掘海量科研数据，给您更好的实验参考建议</p>
        </div>
        <%--<div class="freeText">
            <img src="${rlab}/front/imgs/internet.png"/>
        </div>--%>
    </div>
    <%--<div class="section" id="page5">
        <div class="headNav" >
            <div class="navHead">
                <div class="logoHome">
                    <img src="${rlab}/front/imgs/icon/logo-head-bule.png"/>
                </div>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div class="user">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span style="color: #4E4E4E">${sessionScope.nickname.length() > 4 ? sessionScope.nickname.substring(0,4).concat("..."):sessionScope.nickname}</span>
                            <i class="lab-arrow-down" style="color: #4E4E4E"></i>
                            <ul class="user_down">
                                <li>
                                    <a href="javascript:void (0);" onclick="toCenter();">个人中心</a>
                                </li>
                                <li>
                                    <a href="javascript:void (0);" onclick="logouts();">退出登录</a>
                                </li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="btnHead btnHeadBlack">
                            <a onclick="logins();" href="javascript:void (0);">登录</a> |
                            <a onclick="registers();" href="javascript:void (0);">注册</a>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="wechat" style="color: #4E4E4E;">
                    <p>关注服务号</p>
                    <div class="weixin">
                        <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
                    </div>
                </div>
                <div class="gopage1">
                    <a href="#page01" style="color: #4E4E4E;"><p>搜索仪器</p></a>
                </div>
            </div>
        </div>
        <div id="page5Text" class="texts">
            <div class="page5s">
                <h1 style="margin-top: 25px;font-size: 66px">顶尖机构</h1>
                <h1 style="font-size: 28px;margin-top: 23px;color: #b0b0b0;">紧密合作互利共赢</h1>
                &lt;%&ndash;<h3>Cooperation</h3>&ndash;%&gt;
            </div>
            <div class="orgImg">
                <img src="${rlab}/front/imgs/org.png" style="width: 100%;height: 100%;"/>
            </div>
        </div>
    </div>--%>

    <div class="section" id="page6">
        <div class="footOrg">
            <div id="footOrg">
                <a href="http://www.blarc.com.cn/" title="北京实验动物研究中心" style="margin: 0;width: 158px" target="_blank"><img src="${rlab}/front/imgs/blarc.png"/></a>
                <a href="http://www.pharmcube.com/" title="医药魔方" target="_blank" style="width: 185px"><img src="${rlab}/front/imgs/pharmcube.png"/></a>
                <a href="https://www.pharmacodia.com/cn" title="药渡网" target="_blank" style="width: 147px"><img src="${rlab}/front/imgs/pharmacodia.png"/></a>
                <a href="http://www.labbang.com/" title="实验帮" target="_blank" style="width: 167px"><img src="${rlab}/front/imgs/labbang.png"/></a>
                <a href="http://www.ibiocenter.com/" title="绿通平台" target="_blank" style="width: 92px"><img src="${rlab}/front/imgs/ibiocenter.png"/></a>
                <a href="https://www.tsget.com/" title="天使助" target="_blank" style="width: 164px"><img src="${rlab}/front/imgs/tianshizhu.png"/></a>
            </div>
        </div>
        <img src="${rlab}/front/imgs/footBg.jpg" style="width: 100%;height: 100%;"/>
        <div class="foots">
            <div id="foots">
                <div class="footText">
                    <div class="footItem">
                        <h4>关于人人实验</h4>
                        <p><a target="_blank" href="${rlab}/page/aboutus">关于我们</a></p>
                        <p><a target="_blank" href="${rlab}/page/ournews">媒体报道</a></p>
                        <p><a target="_blank" href="${rlab}/page/aboutus">加入我们</a></p>
                        <p><a target="_blank" href="${rlab}/page/callus">联系我们</a></p>
                    </div>
                    <div class="footItem" style="margin-right: 210px">
                        <h4>服务条款</h4>
                        <p><a target="_blank" href="${rlab}/page/server">服务协议</a></p>
                        <p><a target="_blank" href="${rlab}/page/equity">知识产权协议</a></p>
                    </div>
                    <div class="ft_wechat">
                        <div class="lft">
                            <div class="lft_img">
                                <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="人人实验二维码" title="请用手机扫描二维码">
                            </div>
                            <p class="lft_txt">[关 注 微 信 公 众 号]</p>
                        </div>
                        <div class="rt">
                            <i></i>
                            <p>客服热线：400-102-9559</p>
                            <p>联系邮箱：market@renrenlab.com</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-btm">
            <div>
                <span>Copyright&nbsp;&nbsp;&nbsp;2015-2017 人人实验（北京）科技有限公司 All Rights Reserved 京ICP备15058824</span>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    $(function() {

        $('#dowebok').fullpage({
            sectionsColor: ['#f5f7fa', '#fff', '#fff', '#f5f7fa', '#f5f7fa', '#f5f7fa'],
            'navigation': true,
            resize: true,
            anchors: ['page01', 'page02', 'page03', 'page04', 'page05', 'page06'],
            menu: '#menu'
        });
        $("#page1").css("padding-bottom","0")
        $(".wechat").hover(function () {
            $(".weixin").show()
        }, function () {
            $(".weixin").hide()
        })
        $(".user").hover(function () {
            $(".user_down").show();
            $(".user i").attr("class", "lab-arrow-up")
        }, function () {
            $(".user_down").hide();
            $(".user i").attr("class", "lab-arrow-down")
        })
        function controlHomeBanner() {
            if( 'MozTransform' in document.documentElement.style || 'WebkitTransform' in document.documentElement.style || 'OTransform' in document.documentElement.style || 'msTransform' in document.documentElement.style){
                $('#homeBannerUl li.focus img').stop().animate({'width': '122%', 'height': '112%'}, 6000, function () {
                    if ($(this).parent().next().length > 0) {
                        $(this).parent().removeClass('focus').next().addClass('focus');
                        $(this).css({'width': '110%', 'height': '100%'});
                    } else {
                        $(this).css({'width': '110%', 'height': '100%'});
                        $('#homeBannerUl li').last().removeClass('focus').parent().find('li').first().addClass('focus')
                    }
                    controlHomeBanner();
                });
            }else{
                $('#homeBannerUl li img').css({'top': '0', 'left': '0'});
                setInterval(function () {
                    var $_img = $('#homeBannerUl li.focus img');
                    if ($_img.parent().next().length > 0) {
                        $_img.parent().removeClass('focus').next().addClass('focus');
                    } else {
                        $('#homeBannerUl li').last().removeClass('focus').parent().find('li').first().addClass('focus')
                    }
                    controlHomeBanner();
                },6000)
            }
        };
        controlHomeBanner();

        $("#searching").on("keyup", function (e) {
            var searchText = $("#serach").val();
            if (e.keyCode !== 13 || searchText == "") {
                return false;
            }
            gotoSearch(e);
        })


        $("#goSearch").on("click", function (e) {
            gotoSearch(e);
        })
        //page2轮播
        var leftwith=0;
        page2Carousel();
        function page2Carousel() {

            setInterval(function () {
                leftwith=leftwith+100;
                $(".banner_cxq").animate({"left":"-"+leftwith+"%"},1000,function () {
                    if (leftwith==200){
                        leftwith=0;
                        $(".banner_cxq").css("left","0");
                    }
                })
            },4000)
        }
        function gotoSearch(e) {

            var PAGE_NO = 1;
            KEY_WORD = $("#searching").val();

            var address = getCurremtAdress();

            if (address === -1) {
                toGoodsList();
            }else{

                if(address === "北京") {

                    CUR_PROVINCE = "北京市";

                } else if(address === "上海"){

                    CUR_PROVINCE = "上海";

                } else if(address === "重庆"){

                    CUR_PROVINCE = "重庆";

                }else if(address === "天津"){

                    CUR_PROVINCE = "天津";

                }else {

                    if(address !== "全国") {
                        CUR_CITY = address;
                    }

                }
            }
            toGoodsList();
        }
    })
</script>
</html>