<%--
  Created by IntelliJ IDEA.
  User: ChenXuan
  Date: 2017/9/18 0018
  Time: 15:41
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
        .index{
            float: left;
            width: 300px;
            height: 50px;
            line-height: 50px;
            margin-top: 10px;
            margin-right: 10px;
        }
        .indexInp{
            padding: 0 10px;
            width: 100px;
            background: white;
        }
        .but button{
            float: left;margin-right: 23px;background: #49aaff;margin-top: 10px
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
                <jsp:param name="firstMenu" value="5"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>服务商管理</cite></a>
                    <a><cite>认证服务商列表</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="orgInp" placeholder="请输入机构名称" value="<c:out value="${orgName}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="searchs" style="margin-top: 10px;margin-left: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="userInp" placeholder="请输入所属业务人员名称" value="<c:out value="${bizName}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="index">
                    <span>共享排名：</span>
                    <input type="text" class="indexInp" placeholder="最小数值" id="rankLow" value="<c:out value="${rankLow}" escapeXml="true"/>">
                    <span>—</span>
                    <input type="text" class="indexInp" placeholder="最大数值" id="rankHigh" value="<c:out value="${rankHigh}" escapeXml="true"/>">
                </div>
                <div class="listNature" id="serviceStates" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="serviceStates">
                            <option value="">请选择业务状态</option>
                            <option value="99">全部</option>
                            <option value="1" ${state == 1 ? "selected": ""}>私有</option>
                            <option value="0" ${state == 0 ? "selected": ""}>公有</option>
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
                        <col width="2%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                        <col width="8%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th>服务商编号</th>
                        <th>业务状态</th>
                        <th>机构名称</th>
                        <th>所属业务人员</th>
                        <th>通过时间</th>
                        <th>申请来源</th>
                        <th>联系方式</th>
                        <th>共享指数排名</th>
                        <th>操作</th>
                        <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                            <th>管理员权限</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${providerList}" var="info">
                        <tr>
                            <td><input name="reqNumber" class="checks" type="checkbox" data-req-id="${info.orgOid}" ></td>
                            <td>${info.orgOid}</td>
                            <td>${info.orgBizUid==0?"公有":"私有"}</td>
                            <td>${info.orgName}</td>
                            <td>${empty info.orgBizName ?"人人实验":info.orgBizName}</td>
                            <td><fmt:formatDate value="${info.auditTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${info.orgSource == 0?"线下拓展":info.orgSource == 1?"推广活动":"线上平台"}</td>
                            <td>${info.contact}</td>
                            <td>${info.orgRank}</td>
                            <td>
                                <a class="check" style="color: #6693c8;" href="${rlab}/bg/provider/detail/certificated/${info.orgOid}">查看详情</a>
                            </td>
                            <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                                <td>
                                    <a class="check" style="color: red;" onclick="gotan(this)" data-org-id="${info.orgOid}">撤销认证</a>
                                </td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                <div class="but">
                    <button class="layui-btn btn" onclick="selectAll()">
                        全部选中
                    </button>
                    <button class="layui-btn btn" onclick="gotan(this)">
                        撤销认证
                    </button>
                </div>
            </c:if>
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
    var rankLow='${rankLow}';
    var rankHigh='${rankHigh}';

    function selectAll() {
        for (var i = 0; i < $("input[name=reqNumber]").length; i++) {
            $("input[name=reqNumber]").eq(i).prop("checked", true);
        }
    }
    function gotan($this) {
        $this=$($this);
        var orgId=$this.data("orgId");
        var html='<div class="tan" style="padding: 20px">\
            <span class="lab-close-1" style="font-size: 22px;position: absolute;right: 10px;top: 10px;cursor: pointer" id="closetan"></span>\
            <p style="text-align: center;font-size: 16px;color: #333;line-height: 50px">撤销认证</p>\
            <textarea placeholder="请输入撤销原因" style="width: 485px;height: 200px" id="reason"></textarea>\
            <div style="text-align: center;margin-top: 10px">\
            <button class="layui-btn" style="background-color:#7b8da0" id="closeTan">取消</button>\
            <button class="layui-btn" id="revocation">确定</button>\
            </div>\
            </div>';
        //页面层-自定义
        var layer_1 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'modal_class',
            content: html
        });

        $(".modal_class").css({
            width: 525
        })

        $("#closetan").off("click").on("click", function () {
            layer.close(layer_1);
        })

        $("#closeTan").off("click").on("click", function () {
            layer.close(layer_1);
        })

        $("#revocation").off("click").on("click", function () {
            revocation(orgId);
        })
    }
    function revocation($this) {
        var oids=[];
        var reason=$("#reason").val();
        if ($("#reason").val().length==0){
            layer.msg("请输入撤销的原因");
            return;
        }
        if($this){
            oids.push($this);
        }else if( $("input[name=reqNumber]:checked").length==0) {
            layer.msg("请选中要撤销的服务商");
            return;
        }else {
            for (var i = 0; i < $("input[name=reqNumber]:checked").length; i++) {
                oids.push($("input[name=reqNumber]:checked").eq(i).data("reqId"));
            }
        }
        $.ajax({
            url: '${rlab}/bg/provider/auth/backout',
            type: 'post',
            data:{
                oids:oids,
                reason:reason
            },
            traditional: true

        })
        .done(function (data) {
            window.location.reload(true);
        })
        .fail(function (data) {
            alert("失败");
        });
    }
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(serviceStates)', function (data) {
            serviceStates = data.value;
        });

        form.on('select(source)', function (data) {
            source = data.value;
        });

        form.on('select(transitTime)', function (data) {
            transitTime = data.value;
        });
        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/provider/auth/search?flag=1&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates + '&rankLow=' + rankLow + '&rankHigh=' + rankHigh;
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
                    window.location.href = '${rlab}/bg/provider/auth/search?flag=1&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates + '&rankLow=' + rankLow + '&rankHigh=' + rankHigh;
                }
            }
        });
    });
    function gosearch() {
        orgName=$("#orgInp").val();
        bizName=$("#userInp").val();
        orgName=keyencode(orgName);
        bizName=keyencode(bizName);
        rankLow=$("#rankLow").val();
        rankHigh=$("#rankHigh").val();
        var url = '${rlab}/bg/provider/auth/search?flag=1&pageSize=' + pageSize + '&orgName=' + orgName + '&bizName=' + bizName + '&source=' + source + '&time=' + transitTime + '&state=' + auditStates + '&rankLow=' + rankLow + '&rankHigh=' + rankHigh;
        window.location.href = url;
    }

</script>
</html>

