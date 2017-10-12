<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--公用头部(第一种头部)--%>
<div class="header_three">
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