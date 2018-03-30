<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--公用头部(三级头部)--%>
<div class="header_four">
    <div class="ipt">
        <div class="ipt_content">
            <div class="lft_back" onclick="goBack()">
                <i class="lab-back_1"></i>
            </div>

            <p class="homelogo"><a href="javascript:void (0)" onclick="toHome()" ><img src="${rlab}/mobile/imgs/home_logo.png" /></a></p>

            <div class="searchs" onclick="showSearchModal(this)" data-main-id="main">
                <i class="lab-search"></i>
            </div>

            <div class="rt_user" onclick="toCenter()">
                <c:choose>
                    <c:when test="${sessionScope.uid == null}">
                        <i class="lab-user"></i>
                    </c:when>
                    <c:otherwise>
                        <div class="avatar">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg"
                                         alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>