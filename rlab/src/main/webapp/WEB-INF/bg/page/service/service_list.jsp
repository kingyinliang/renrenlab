<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../../config/taglibs.jsp" %>
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style type="text/css">
        .faci_sc {
            float: left;
            margin-top: 14px;
        }

        .slct_type {
            width: 170px;
            height: 50px;
            float: left;
            margin-top: 14px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .lab_date {
            margin-top: 14px;
            float: left;
            margin-right: 20px;
        }

        .panel_btn {
            float: left;
            margin-top: 14px;
        }

        .panel_btn button {
            margin-right: 10px;
        }

        .panel_section {
            margin-bottom: 17px;
        }

        .panel_section .audit {
            margin-top: 50px;
        }

        .panel_section .audit button {
            margin-right: 18px;
        }

        .pages {
            margin-top: 30px;
        }

        .td_ins_number {
            position: relative;
            padding-left: 20px;
        }

        .td_ins_number input {
            float: left;
            position: absolute;
            left: 0;
        }

        .td_ins_number span {
            float: left;
            line-height: 20px;
        }
        .shade .tit{
            padding: 26px 0 0 0;
            overflow: hidden;
        }
        .shade .tit span{
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 15px;
        }
        .shade .tit p{
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }
        .shade .tit button{
            width: 50%;
            box-sizing: content-box;
            margin: 0;
            float: left;
            height: 60px;
            margin-bottom: 0;
            margin-top: 0;
            border-radius: 0;
            border-top: 1px solid #7b8da0;
            background: #78b3e7;
        }
        tr td a{
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="4"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">服务管理</a>
                  <a href="">服务列表</a>
                </span>
            </div>

            <%-- 检索模块 --%>
            <div class="panel_section">
                <div class="clearfix">
                    <%-- START搜索框组件 --%>
                    <div class="lab_search_type1 faci_sc">
                        <%--<i class="lab-search"></i>--%>
                        <label for="shareInsKeyword" class="lab-search"></label>
                        <input id="shareInsKeyword" type="text" class="scInpt" placeholder="服务编号/服务名称"
                               value="<c:out value="${keyword}" escapeXml="true"/>" escapeXml="true"/>
                    </div>
                    <%-- END搜索框组件 --%>
                    <div class="slct_type">
                        <%--STAR搜索下拉--%>
                        <form class="layui-form lab_sc_slect" action="javascript:void(0)">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="shareInsStatus" lay-filter="shareInsStatus" name="modules" lay-verify="required" >
                                        <option value="99" ${state == 99 ? "selected": ""}>全部</option>
                                        <option value="1"  ${state == 1 ? "selected": ""}>待审核</option>
                                        <option value="0"  ${state == 0 ? "selected": ""}>审核通过</option>
                                        <option value="3"  ${state == 3 ? "selected": ""}>审核拒绝</option>
                                        <option value="4"  ${state == 4 ? "selected": ""}>已上架</option>
                                        <option value="2"  ${state == 2 ? "selected": ""}>已下架</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <%--END搜索下拉--%>
                    </div>
                    <%--START 公用时间组件 --%>
                    <div class="lab_date clearfix">
                        <button type="button" class="" id="daterange-btn">
                        <span>
                          近一周
                        </span>
                            <%--<i class="fa fa-caret-down"></i>--%>
                            <i class="layui-icon date_icon">&#xe637;</i>
                        </button>
                    </div>
                    <%--END 公用时间组件--%>
                    <div class="panel_btn clearfix">
                        <%--按钮组件--%>
                        <button class="lab_btn_base lab_btn_type1" type="button" onclick="doSearchSharew()">
                            <i class="lab-search"></i>检索服务
                        </button>
                        <button class="lab_btn_base lab_btn_type2" type="button" onclick="showAll()">
                            <i class="iconfont icon-caidan1"></i>显示所有
                        </button>
                    </div>
                </div>
                <%--审核权限--%>
                <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                    <div class="audit">
                        <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_blue" type="button" onclick="acceptShareInfo()">
                            审核通过
                        </button>
                        <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_red" type="button" onclick="rejectShareInfo()">
                            审核拒绝
                        </button>
                    </div>
                <%--</c:if>--%>
            </div>

            <%--③列表区--%>
            <div class="lab_list_type1">
                <table class="layui-table">
                    <colgroup>
                        <col width="6%">
                        <col width="20%">
                        <col width="9%">
                        <col width="9%">
                        <col width="9%">
                        <col width="18%">
                        <col width="9%">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>服务编号</th>
                        <th>服务名称</th>
                        <th>服务来源</th>
                        <th>参考价格</th>
                        <th>发布机构</th>
                        <%--<th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">--%>
                        <th style="cursor: pointer" onclick="listSort(this)" class="sorts">
                            更新时间<i class="lab-down"></i>
                            <%--更新时间<i class="${order==null? 'lab-down' : 'lab-top' }"></i>--%>
                        </th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="item" items="${result}">
                        <tr>
                            <td>
                                <div class="td_ins_number clearfix">
                                        <%--审核权限--%>
                                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                                        <input name="insNumber" type="checkbox" data-service-id="${item.serviceInfo.serviceId}"
                                               value="" ${item.serviceInfo.serviceState == 1? '': 'disabled'}/>
                                    <%--</c:if>--%>
                                    <span>${item.serviceInfo.serviceId}</span>
                                </div>
                            </td>
                            <td width="">${item.serviceInfo.serviceName}</td>
                            <td width="">${item.userBaseInfo.uNickname}</td>
                            <td width="">
                                <c:if test="${item.serviceInfo.servicePrice.flag == 1}">
                                    ￥${item.serviceInfo.servicePrice.accPrice} / ${item.serviceInfo.servicePrice.unit}
                                </c:if>
                                <c:if test="${item.serviceInfo.servicePrice.flag == 2}">
                                    <c:choose>
                                        <c:when test='${item.serviceInfo.servicePrice.scopeHighPrice.equals("0")}'>
                                            ￥${item.serviceInfo.servicePrice.scopeLowPrice}/${item.serviceInfo.servicePrice.unit}起
                                        </c:when>
                                        <c:otherwise>
                                            ￥${item.serviceInfo.servicePrice.scopeLowPrice} - ￥${item.serviceInfo.servicePrice.scopeHighPrice} / ${item.serviceInfo.servicePrice.unit}
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:if test="${item.serviceInfo.servicePrice.flag == 3}">
                                    面议
                                </c:if>
                            </td>
                            <td width="">
                                ${item.orgName}
                            </td>
                            <td width="">
                                ${item.serviceInfo.modifyTimeStr}
                            </td>
                            <td width="">
                                ${item.serviceInfo.stateStr}
                            </td>
                            <td width="">
                                <c:if test="${item.serviceInfo.serviceState == 0}">
                                    <a href="${rlab}/bg/service/detail?serviceId=${item.serviceInfo.serviceId}">查看详情</a>
                                    <a href="${rlab}/bg/service/modify?serviceId=${item.serviceInfo.serviceId}">修改</a>
                                    <a onclick="changeState(this)" data-service-id="${item.serviceInfo.serviceId}" data-service-state="${item.serviceInfo.serviceState}">开启</a>
                                </c:if>
                                <c:if test="${item.serviceInfo.serviceState == 1}">
                                    <a href="${rlab}/bg/service/detail?serviceId=${item.serviceInfo.serviceId}">查看详情</a>
                                    <a href="${rlab}/bg/service/modify?serviceId=${item.serviceInfo.serviceId}">修改</a>
                                </c:if>
                                <c:if test="${item.serviceInfo.serviceState == 2}">
                                    <a href="${rlab}/bg/service/detail?serviceId=${item.serviceInfo.serviceId}">查看详情</a>
                                    <a href="${rlab}/bg/service/modify?serviceId=${item.serviceInfo.serviceId}">修改</a>
                                    <a onclick="changeState(this)" data-service-id="${item.serviceInfo.serviceId}" data-service-state="${item.serviceInfo.serviceState}">开启</a>
                                </c:if>
                                <c:if test="${item.serviceInfo.serviceState == 3}">
                                    <a href="${rlab}/bg/service/detail?serviceId=${item.serviceInfo.serviceId}">查看详情</a>
                                    <a href="${rlab}/bg/service/modify?serviceId=${item.serviceInfo.serviceId}">修改</a>
                                </c:if>
                                <c:if test="${item.serviceInfo.serviceState == 4}">
                                    <a href="${rlab}/bg/service/detail?serviceId=${item.serviceInfo.serviceId}">查看详情</a>
                                    <a href="${rlab}/bg/service/modify?serviceId=${item.serviceInfo.serviceId}">修改</a>
                                    <a onclick="changeState(this)" data-service-id="${item.serviceInfo.serviceId}" data-service-state="${item.serviceInfo.serviceState}">关闭</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <%--④分页区--%>
            <div class="pages clearfix">
                <div class="textinfo">
                    <p>
                        <%--显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize > total? total : pageNo * pageSize}条/共${total}条</p>--%>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right"></div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select id="pageSize" name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" >10条/页</option>
                            <option value="25" >25条/页</option>
                            <option value="50" >50条/页</option>
                            <option value="100" >100条/页</option>
                        </select>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="close">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认下架此仪器</p>
            <p style="font-size: 16px;color: #909090">下架仪器后，该仪器用户不可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="drop()">确认</button>
        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="open">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认重新开启此仪器</p>
            <p style="font-size: 16px;color: #909090">开启仪器后，该仪器用户可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="agree()">确认</button>
        </div>
    </div>
</div>
</body>
<%--开发环境--%>
<script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
<script src="${rlab}/common/assets/layui/layui.js" charset="utf-8"></script>
<script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
<script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
<script src="${rlab}/bg/js/main.js"></script>
<script type="text/javascript">
    var state = '${state}';
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var pageSize = '${pageSize}';
    var keyword = '<c:out value="${keyword}" escapeXml="true"/>';
    var order = '${order}';
    initDateForm();
    initLayui();

    /**
     * 初始化所有日期
     */
    function initLayui() {
        layui.use(['laypage','form', 'layedit'], function () {
            var form = layui.form(),
                laypage = layui.laypage;

            // pageSize change事件监听
            form.on('select(shareInsStatus)', function(data){
                state = data.value;
            });

            form.on('select(pageSize)', function(data){
                pageSize = data.value;
            });


            laypage({
                cont: 'pagesControl'
                , pages: ${pages}
//                , pages: 10
                , skip: true
                , skin: '#2fcba8'
                , curr: ${pageNo}
//                , curr: 1
                , prev: '<em><</em>'
                , next: '<em>></em>'
                , jump: function (obj, first) {
                    if (!first) {
                        window.location.href = '${rlab}/bg/service/list?keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;

                    }
                }
            });
        });
    }

    /**
     * 初始化日期表单
     */
    function initDateForm() {

        $('#daterange-btn').daterangepicker({
                startDate: '${requestScope.get("beginTime")}',
                endDate: '${requestScope.get("endTime")}',
                minDate:'2016-01-01',
                maxDate:new Date()
            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年MM月DD日'));
                startDate = start.format('YYYY-MM-DD');
                endDate = end.format('YYYY-MM-DD');
            }
        );
        $('#daterange-btn span').html('${requestScope.get("beginTime")}' + ' - ' + '${requestScope.get("endTime")}');
    }




    function doSearchSharew() {
        keyword=$("#shareInsKeyword").val();
        keyword=keyencode(keyword);
        var url = '${rlab}/bg/service/list?keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate + '&pageSize=' + pageSize;
        window.location.href = url;
    }

    function showAll() {
        window.location.href = '${rlab}/bg/service/list';
    }

    function acceptShareInfo() {
        var ids = [];
        for (var i = 0; i < $("input[name=insNumber]:checked").length; i++) {
            ids.push($("input[name=insNumber]:checked").eq(i).data("serviceId"))
        }

        var data = {
            'serviceIds': ids,
            'state': 0
        }

        $.ajax({
            url: '${rlab}/bg/service/audit',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data:JSON.stringify(data)
        })
            .done(function (data) {
                console.log(data);
                if (data.code == 0){
                    window.location.reload();
                }else {
                    alert("失败");
                }
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function rejectShareInfo() {
        var ids = [];
        for (var i = 0; i < $("input[name=insNumber]:checked").length; i++) {
            ids.push($("input[name=insNumber]:checked").eq(i).data("serviceId"))
        }

        var data = {
            'serviceIds': ids,
            'state': 3
        }

        $.ajax({
            url: '${rlab}/bg/service/audit',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data:JSON.stringify(data)
        })
            .done(function (data) {
                console.log(data);
                if (data.code == 0){
                    window.location.reload();
                }else {
                    alert("失败");
                }
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function changeState($this) {
        $this = $($this);
        var id = $this.data("serviceId");
        var state = $this.data("serviceState");
        console.log(id);
        console.log(state);

        if (state == 0||state==2){
            state = 4;
        }else {
            state = 2;
        }

        var data = {
            serviceId: id,
            serviceState: state
        };

        $.ajax({
            url: '${rlab}/bg/service/changeState',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data:JSON.stringify(data)
        })
            .done(function (data) {
                console.log(data);
                if (data.code == 0){
                    window.location.reload();
                }else {
                    alert("失败");
                }
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function listSort() {
        if (order == ''){
            var url = '${rlab}/bg/service/list?keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate + '&pageSize=' + pageSize + '&order=' + 'ASC';
            window.location.href = url;
        }else {
            var url = '${rlab}/bg/service/list?keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate + '&pageSize=' + pageSize;
            window.location.href = url;
        }
    }
</script>
</html>
