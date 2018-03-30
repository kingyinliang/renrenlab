<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">

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
<div id="main" class="wrapper" style="overflow: hidden;padding-bottom: 1.3rem">
    <header>
        <%@ include file="../template/header_three.jsp" %>
    </header>

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
        <p style="margin-top: 0.3rem">验小花温馨提示：</p>
        <p style="margin-top: 0.6rem;">如您需要修改个人资料（用户名、密码等）<br />请您使用电脑访问人人实验网站www.renrenlab.com</p>
    </div>
    <div class="quit" onclick="logouts()" style="position: fixed;bottom: 1.3rem;">
        <p>退 出 登 录</p>
    </div>
    <footer>
        <jsp:include page="../template/footer.jsp" flush="true">
            <jsp:param name="active" value="4"/>
        </jsp:include>
    </footer>
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

    // setCallbackUrl();// 设置登录时回跳路径

    function logouts() {
//        setCallbackUrl();
        window.location.href = BASE_URL + "/user/logout?curURI=" + encodeURI(URL_CUR_CITY);
    }

    function gomanage() {
        window.location.href = BASE_URL + "/user/req/tinylist?pageNo=1&pageSize=10&state=99&entrance=1";
    }

</script>
</html>