<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_=20170608">

    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/user_center.css?v_=20170608">
    <style>
        .userPhone{
            text-align: center;
            margin-top: 0.32rem;
        }
        .usersPhone{
            display: inline-block;
            margin: auto;
            text-align: center;
            font-size: 0.32rem;
            line-height: 0.43rem;
        }
        .usersPhone span{
            float: left;
            font-size: 0.32rem;
            line-height: 0.43rem;
        }
        .usersPhone i{
            float: left;
            font-size: 0.43rem;
        }
        .code img{
            width: 1.87rem;
        }
    </style>
</head>

<body>
<div id="main" class="wrapper" style="overflow: hidden;">

    <div class="headers">
        <i class="lab-back_1 lft_back" onclick="goBack()"></i>
        <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()" ><img src="${rlab}/mobile/imgs/home_logo.png" /></a></p>
        <a class="lab-search" id="searchs" href="javascript:void (0)" onclick="showSearchModal(this)" data-main-id="main" ></a>
    </div>

    <div class="main">
        <c:choose>
            <c:when test="${sessionScope.avatar != null}">
                <img src="${sessionScope.avatar}" alt="用户头像">
            </c:when>
            <c:otherwise>
                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
            </c:otherwise>
        </c:choose>
        <p class="names">${sessionScope.nickname}</p>
        <div class="userPhone"><p class="usersPhone clearfix"><i class="lab-phone"></i><span>${sessionScope.mobile != null ? sessionScope.mobile : "--"}</span></p></div>
        <div id="phone">
            <span class="lab-im"></span>
            <p onclick="gomanage()">我的微需求</p>
            <a id="bind" class="lab-youjian_1"></a>
        </div>
    </div>
    <div class="foot">
        <p class="code"><img src="${rlab}/mobile/imgs/m2.1/homecode.jpg" alt=""></p>
        <p style="text-align: center;font-size: 0.3rem;color: #333;margin-top: 0.2rem">关注“人人实验”服务号，体验VIP定制服务</p>
        <p style="margin-top: 0.3rem">验小花温馨提示：</p>
        <p style="margin-top: 0.6rem;">如您需要修改个人资料（用户名、密码等）<br />请您使用电脑访问人人实验网站www.renrenlab.com</p>
    </div>
    <div class="quit" onclick="logouts()">
        <p>退 出 登 录</p>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script type="text/javascript">
    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }

    setCallbackUrl();// 设置登录时回跳路径

    function logouts() {
        setCallbackUrl();
        window.location.href = BASE_URL + "/front/user/logout?curURI=" +  encodeURI(URL_CUR_CITY );
    }

    function gomanage() {
        window.location.href = BASE_URL+ "/front/user/req/tinylist?pageNo=1&pageSize=10&state=99&entrance=1";
    }
</script>
</html>