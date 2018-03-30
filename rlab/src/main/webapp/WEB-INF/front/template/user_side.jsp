<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../config/taglibs.jsp" %>

<div class="user_side clearfix">
    <div class="avatar clearfix">
        <c:choose>
            <c:when test="${sessionScope.avatar != null}">
                <img src="${sessionScope.avatar}" alt="用户头像">
            </c:when>
            <c:otherwise>
                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
            </c:otherwise>
        </c:choose>
        <p title="${sessionScope.simpleNickName}">
            <c:out value="${sessionScope.simpleNickName}" escapeXml="true"/>
        </p>
    </div>
    <div class="side_bar">
        <ul id="userSide" class="u_sd_ul">
            <li class="${param.levelNum == 1 && param.firstMenu == 1?'actived':''}">
                <a href="${rlab}/user/center">个人中心</a>
            </li>
            <li class="${param.levelNum == 1 && param.firstMenu == 2?'actived':''}">
                <a href="${rlab}/user/req/tinylist?pageNo=1&pageSize=10&state=99">我的微需求</a>
            </li>
            <li onclick="userSideClick(event,this)" class="${param.levelNum == 2 && param.firstMenu == 3?'actived':''}">
                <a href="javascript:void(0);">我的创新券</a>
                <dl style="display: none" class="${param.levelNum == 2 && param.firstMenu == 3?'side_dn':''}">
                    <dd class="${param.levelNum == 2 && param.firstMenu == 3 && param.secondMenu == 1?'actived':''}">
                        <a class="second_menu" href="${rlab}/coupon/page?source=${source}">
                            <i class="lab-dot-1"></i>
                            人人创新券
                        </a>
                    </dd>
                    <dd class="${param.levelNum == 2 && param.firstMenu == 3  && param.secondMenu == 2?'actived':''}">
                        <a class="second_menu" href="${rlab}/coupon/toCollege">
                            <i class="lab-dot-1"></i>
                            大学生创新券
                        </a>
                    </dd>
                    <dd class="${param.levelNum == 2 && param.firstMenu == 3  && param.secondMenu == 3?'actived':''}">
                        <a class="second_menu" href="${rlab}/page/hdxtcxj">
                            <i class="lab-dot-1"></i>
                            海淀协同创新券
                        </a>
                    </dd>
                    <dd class="${param.levelNum == 2 && param.firstMenu == 3  && param.secondMenu == 4?'actived':''}">
                        <a class="second_menu" href="${rlab}/page/sdkjcxj">
                            <i class="lab-dot-1"></i>
                            首都科技创新券
                        </a>
                    </dd>
                </dl>
            </li>

            <li class="${param.levelNum == 1 && param.firstMenu == 4?'actived':''}">
                <a href="${rlab}/provider/search?pageNo=1&pageSize=49">服务商认证</a>
            </li>
            <%--<li class="${param.levelNum == 1 && param.firstMenu == 5?'actived':''}">--%>
            <%--<a href="${rlab}/provider/search?pageNo=1&pageSize=49">仪器管理</a>--%>
            <%--</li>--%>
            <li class="${param.levelNum == 1 && param.firstMenu == 6?'actived':''}">
                <a href="${rlab}/user/service_list">服务管理</a>
            </li>
        </ul>
    </div>
</div>