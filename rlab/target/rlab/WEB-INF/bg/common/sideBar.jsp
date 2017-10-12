<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../config/taglibs.jsp" %>

<ul class="layui-nav layui-nav-tree" lay-filter="test" id="side">
    <%--首页--%>
    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 1?'layui-this':''}">
        <a href="${rlab}/bg/home/toHome"><label class="iconfont icon-icon-test"></label><span>首页</span></a>
    </li>
    <%--用户管理--%>
    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 2?'layui-this':''}">
        <a href="${rlab}/bg/user/list?pageNo=1&pageSize=10"><label
                class="iconfont icon-yonghu"></label><span>用户管理</span></a>
    </li>
    <%--仪器管理--%>
    <li class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 3?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="iconfont icon-yiqi"></label><span>仪器管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${  param.firstMenu == 3 && param.secondMenu == 1?'layui-this':''}">
                <a href="${rlab}/bg/baseins/list"><label class="lab-dot-1"></label><span>基本信息管理</span></a>
            </dd>
            <dd class="${ param.firstMenu == 3 && param.secondMenu == 2?'layui-this':''}">
                <a href="${rlab}/bg/share/list"><label class="lab-dot-1"></label><span>共享信息管理</span></a>
            </dd>
            <dd class="${ param.firstMenu == 3 && param.secondMenu == 3?'layui-this':''}">
                <a href="${rlab}/bg/instrument/upload/uploadInstruments"><label
                        class="lab-dot-1"></label><span>共享仪器批量上传</span></a>
            </dd>
        </dl>
    </li>
    <%--机构管理--%>
    <li class="layui-nav-item  ${param.levelNum == 2 && param.firstMenu == 4?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="iconfont icon-jigou"></label><span>机构管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${ param.firstMenu == 4 && param.secondMenu == 1?'layui-this':''}">
                <a href="${rlab}/bg/org/search?pageNo=1&pageSize=10"><label class="lab-dot-1"></label><span>机构管理</span></a>
            </dd>
            <dd class="${ param.firstMenu == 4 && param.secondMenu == 2?'layui-this':''}">
                <a href="${rlab}/bg/org/search/detail?operator=add"><label
                        class="lab-dot-1"></label><span>添加机构</span></a>
            </dd>
        </dl>
    </li>

    <%--服务商管理--%>
    <li style="" class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 5?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="iconfont icon-shangdian"></label><span>服务商管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${ param.firstMenu == 5 && param.secondMenu == 1?'layui-this':''}">
                <a href="${rlab}/bg/provider/auth/search?flag=2"><label class="lab-dot-1"></label><span>未认证服务商列表</span></a>
            </dd>
            <dd class="${ param.firstMenu == 5 && param.secondMenu == 2?'layui-this':''}">
                <a href="${rlab}/bg/provider/auth/search?flag=1"><label class="lab-dot-1"></label><span>认证服务商列表</span></a>
            </dd>
            <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                <dd class="${ param.firstMenu == 5 && param.secondMenu == 3?'layui-this':''}">
                    <a href="${rlab}/bg/provider/page/add"><label class="lab-dot-1"></label><span>认证申请新增</span></a>
                </dd>
            </c:if>
        </dl>
    </li>

    <%--需求管理--%>
    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 6?'layui-this':''}">
        <a href="${rlab}/bg/req/list"><label class="lab-scheme"></label><span>需求管理</span></a>
    </li>

    <%--创新券管理--%>
    <li class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 7?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="lab-coupon"></label><span>创新卷管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${ param.secondMenu == 1 && param.firstMenu == 7?'layui-this':''}">
                <a href="${rlab}/bg/coupon/search?flag=1"><label class="lab-dot-1"></label><span>认证审核</span></a>
            </dd>
            <dd class="${ param.secondMenu == 2 && param.firstMenu == 7?'layui-this':''}">
                <a href="${rlab}/bg/coupon/search?flag=2"><label class="lab-dot-1"></label><span>项目审核</span></a>
            </dd>
        </dl>
    </li>

    <%--权限管理--%>
    <c:if test="${sessionScope.u_rid == 10008 || sessionScope.u_rid == 10007}">
        <li class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 8?'layui-nav-itemed':''}">
            <a href="javascript:void (0);"><label class="lab-coupon"></label><span>角色权限管理</span></a>
            <dl class="layui-nav-child">
                <dd class="${ param.secondMenu == 1 && param.firstMenu == 8?'layui-this':''}">
                    <a href="${rlab}/bg/user/role_manage"><label class="lab-dot-1"></label><span>管理员列表</span></a>
                </dd>
                <dd class="${ param.secondMenu == 2 && param.firstMenu == 8?'layui-this':''}">
                    <a href="${rlab}/bg/user/role_add"><label class="lab-dot-1"></label><span>管理员新增</span></a>
                </dd>
               <%--超级管理员/高级管理员--%>
                <dd class="${ param.secondMenu == 3 && param.firstMenu == 8?'layui-this':''}">
                    <a href="${rlab}/bg/user/rooter_manage"><label
                            class="lab-dot-1"></label><span>管理员权限管理</span></a>
                </dd>
            </dl>
        </li>
    </c:if>


</ul>
