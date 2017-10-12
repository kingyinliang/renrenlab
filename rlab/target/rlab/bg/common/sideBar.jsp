<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--test--%>
<%--<div style="color: #fff">--%>
    <%--${param.levelNum}--%>
    <%--${param.firstMenu}--%>
    <%--${param.secondMenu}--%>
<%--</div>--%>

<ul class="layui-nav layui-nav-tree" lay-filter="test" id="side">
    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 1?'layui-this':''}">
        <a href="../page/home.jsp"><label class="lab-home"></label><span>首页</span></a>
    </li>

    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 2?'layui-this':''}">
        <a href="../page/userManage.jsp"><label class="lab-user"></label><span>用户管理</span></a>
    </li>

    <li class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 3?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="lab-godTime"></label><span>仪器管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${  param.firstMenu == 3 && param.secondMenu == 1?'layui-this':''}">
                <a href="../page/insBaseInfoToManage.jsp"><label class="lab-dot-1"></label><span>基本信息管理</span></a>
            </dd>
            <dd class="${ param.firstMenu == 3 && param.secondMenu == 2?'layui-this':''}">
                <a href="../page/insShareInfoManage.jsp"><label class="lab-dot-1"></label><span>共享信息管理</span></a>
            </dd>
        </dl>
    </li>

    <li class="layui-nav-item  ${param.levelNum == 2 && param.firstMenu == 4?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="lab-company"></label><span>机构管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${ param.firstMenu == 4 && param.secondMenu == 1?'layui-this':''}">
                <a href="../page/orgManage.jsp"><label class="lab-dot-1"></label><span>机构管理</span></a>
            </dd>
            <dd class="${ param.firstMenu == 4 && param.secondMenu == 2?'layui-this':''}">
                <a href="../page/orgInfoToAdd.jsp"><label class="lab-dot-1"></label><span>添加机构</span></a>
            </dd>
        </dl>
    </li>

    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 5?'layui-this':''}">
        <a href="../page/facilitatorManage.jsp"><label class="lab-qr-code-1"></label><span>服务商管理</span></a>
    </li>

    <li class="layui-nav-item ${param.levelNum == 1 && param.firstMenu == 6?'layui-this':''}">
        <a href="${rlab}/bg/page/demand_manage.jsp"><label class="lab-scheme"></label><span>需求管理</span></a>
    </li>

    <li class="layui-nav-item ${param.levelNum == 2 && param.firstMenu == 7?'layui-nav-itemed':''}">
        <a href="javascript:void (0);"><label class="lab-coupon"></label><span>创新卷管理</span></a>
        <dl class="layui-nav-child">
            <dd class="${ param.secondMenu == 1?'layui-this':''}">
                <a href="${rlab}/bg/page/rrcxj_enterpise_manage.jsp"><label class="lab-dot-1"></label><span>认证审核</span></a>
            </dd>
            <dd class="${ param.secondMenu == 2?'layui-this':''}">
                <a href="${rlab}/bg/page/rrcxj_project_manage.jsp"><label class="lab-dot-1"></label><span>项目审核</span></a>
            </dd>
        </dl>
    </li>

</ul>
