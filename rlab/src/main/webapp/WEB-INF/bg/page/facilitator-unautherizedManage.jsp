<%--
  Created by IntelliJ IDEA.
  User: ChenXuan
  Date: 2017/9/18 0018
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="${rlab}/common/assets/layui/layui.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
    <script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .time {
            margin-top: 20px;
        }

        .lab_date > button {
            width: 295px;
        }
        .btn:hover{color: white!important;}
        .searchs{
            width: 250px;
            margin-right: 10px;
        }
        .listNature{
            margin-left: 0;
            margin-right: 10px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="6"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>服务商管理</cite></a>
                    <a><cite>未认证服务商列表</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="orgInp" placeholder="请输入机构名称/法人名称" value="<c:out value="${orgName}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="searchs" style="margin-top: 10px;">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="userInp" placeholder="请输入所属业务人员名称" value="<c:out value="${bizName}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature" id="auditStates" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="auditStates">
                            <option value="">请选择审核状态</option>
                            <option value="99">全部</option>
                            <option value="1" ${state == 1 ? "selected": ""}>待审核</option>
                            <option value="3" ${state == 3 ? "selected": ""}>已拒绝</option>
                        </select>
                    </form>
                </div>
                <div class="listNature" id="source" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="source">
                            <option value="">请选择申请来源</option>
                            <option value="99">全部</option>
                            <option value="1" ${source == 1 ? "selected": ""}>推广活动</option>
                            <option value="0" ${source == 0 ? "selected": ""}>线下拓展</option>
                            <option value="2" ${source == 2 ? "selected": ""}>线上平台</option>
                        </select>
                    </form>
                </div>
                <div class="listNature" id="transitTime" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="transitTime">
                            <option value="">请选择发起时间</option>
                            <option value="99">全部</option>
                            <option value="0" ${time == 0 ? "selected": ""}>一天之内</option>
                            <option value="2" ${time == 2 ? "selected": ""}>三天之内</option>
                            <option value="6" ${time == 6 ? "selected": ""}>一周之内</option>
                        </select>
                    </form>
                </div>

                <button class="layui-btn btn" style="float: left;margin-right: 23px;background: #49aaff;margin-top: 10px" onclick="gosearch()">
                    <div class="lab-search"></div>
                    检索服务商
                </button>
            </div>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>申请编号</th>
                        <th>审核状态</th>
                        <th>机构名称</th>
                        <th>所属业务人员</th>
                        <th>发起时间</th>
                        <th>申请来源</th>
                        <th>联系方式</th>
                        <th>机构法人</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${providerList}" var="info">
                        <tr>
                            <td>${info.orgOid}</td>
                            <td>${info.orgIdentification==1?"待审核":"审核拒绝"}</td>
                            <td>${info.orgName}</td>
                            <td>${info.orgBizName==''? "无名":(info.orgBizUid==0?"人人实验":info.orgBizName)}</td>
                            <td><fmt:formatDate value="${info.applicationTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${info.orgSource == 0?"线下拓展":info.orgSource == 1?"推广活动":"线上平台"}</td>
                            <td>${info.contact}</td>
                            <td>${info.orgPersonName}</td>
                            <td>
                                <a class="check" style="color: #6693c8;" href="${rlab}/bg/provider/detail/uncertificated/${info.orgOid}">查看详情</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <%--<tr>--%>
                        <%--<td>dasdas</td>--%>
                        <%--<td>asdasd</td>--%>
                        <%--<td>asdasd</td>--%>
                        <%--<td>asd</td>--%>
                        <%--<td>asd</td>--%>
                        <%--<td>asd</td>--%>
                        <%--<td>asdasd</td>--%>
                        <%--<td>asdasd</td>--%>
                        <%--<td>--%>
                            <%--<a class="check" style="color: #6693c8;" href="${rlab}/bg/provider/detail/uncertificated/{oid}">查看详情</a>--%>
                        <%--</td>--%>
                    <%--</tr>--%>
                    </tbody>
                </table>
            </div>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize > total? total : pageNo * pageSize}条/共${total}条</p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right">
                </div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${pageSize == 10 ? "selected" : ""}>10条/页</option>
                            <option value="25" ${pageSize == 25 ? "selected" : ""}>25条/页</option>
                            <option value="50" ${pageSize == 50 ? "selected" : ""}>50条/页</option>
                            <option value="100" ${pageSize == 100 ? "selected" : ""}>100条/页</option>
                        </select>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var auditStates=${empty state?99:state };
    var pageSize=${pageSize};
    var source=${empty source?99:source};
    var transitTime=${empty time?99:time};
    var orgName=$("#orgInp").val();
    var bizName=$("#userInp").val();

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(auditStates)', function (data) {
            auditStates = data.value;
        });

        form.on('select(source)', function (data) {
            source = data.value;
        });

        form.on('select(transitTime)', function (data) {
            transitTime = data.value;
        });
        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/provider/auth/search?flag=2&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates ;
        });

    });

    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;
        laypage({
            cont: 'pagesControl'
            ,pages: ${pages}
            ,skip: true
            ,skin: '#2fcba8'
            ,curr: ${pageNo}
            ,prev: '<em><</em>'
            ,next: '<em>></em>'
            ,jump: function(obj, first){
                if(!first){
                    window.location.href = '${rlab}/bg/provider/auth/search?flag=2&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates ;
                }
            }
        });
    });
    function gosearch() {
        orgName=$("#orgInp").val();
        bizName=$("#userInp").val();
        orgName=keyencode(orgName);
        bizName=keyencode(bizName);
        var url = '${rlab}/bg/provider/auth/search?flag=2&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates ;
        window.location.href = url;
    }
</script>
</html>

