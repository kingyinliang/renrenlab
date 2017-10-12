<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="head">
    <div class="icon">
        <p><img src="${rlab}/bg/img/logos.jpg" style="width: 100%;height: 100%"></p>
    </div>
    <div class="logout" onclick="logouts()">
        <a >退出</a>
    </div>
    <div class="u_info">${nickname.length() > 6 ? nickname.substring(0,6).concat("..."):nickname}</div>
    <div class="u_info_img"><p>
        <c:choose>
            <c:when test="${avatar != null && !''.equals(avatar)}">
                <img src="${avatar}" alt="用户头像">
            </c:when>
            <c:otherwise>
            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
            </c:otherwise>
        </c:choose>
    </p>
    </div>
</div>

