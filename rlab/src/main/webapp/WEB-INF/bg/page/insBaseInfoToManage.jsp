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
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>仪器管理</cite></a>
                    <a><cite>基本信息管理</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" placeholder="仪器名称/仪器编号/仪器型号" value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature" id="instype" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="instype">
                            <option value="">请选择仪器分类</option>
                            <option value="0">全部</option>
                            <option value="1">已认证</option>
                            <option value="2">未认证</option>
                        </select>
                    </form>
                </div>
                <%--START 公用时间组件 --%>
                <div class="lab_date clearfix" style="float: left;margin-top: 10px;margin-right: 15px">
                    <button type="button" class="" id="daterange-btn">
                            <span>
                              请选择日期
                            </span>
                        <%--<i class="fa fa-caret-down"></i>--%>
                        <i class="layui-icon date_icon">&#xe637;</i>
                    </button>

                </div>
                <%--END 公用时间组件--%>
                <button class="layui-btn btn" style="float: left;margin-right: 23px;background: #49aaff;margin-top: 10px" onclick="gosearch()">
                    <div class="lab-search"></div>
                    检索仪器
                </button>
                <button class="layui-btn btn" style="float: left;background: #16b8be;margin-top: 10px" onclick="gosearchAll()">
                    <div class="iconfont icon-caidan1"></div>
                    显示所有
                </button>

            </div>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="10%">
                        <col width="25%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>仪器编号</th>
                        <th>仪器名称</th>
                        <th>仪器品牌</th>
                        <th>仪器型号</th>
                        <th>仪器类别</th>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">更新时间<i class="${order==null? 'lab-down' : 'lab-top' }"></i></th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${infoList}" var="info">
                        <tr>
                            <td>${info.insIid}</td>
                            <td>${info.insName}</td>
                            <td>${info.insBrand}</td>
                            <td>${info.insMode}</td>
                            <td>${info.insturmentCategories[0].categoryName}>${info.insturmentCategories[1].categoryName}</td>
                            <td>${info.time}</td>
                            <td>
                                <%--查询权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                    <a class="check" style="color: #6693c8;" href="${rlab}/bg/baseins/detail?insIid=${info.insIid}">查看详情</a>
                                </c:if>
                                <%--修改权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                                    <a class="forbidden" href="${rlab}/bg/baseins/tomodify?insIid=${info.insIid}">修改</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
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
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var pageSize = ${pageSize};
    var instypeValue = '${insCategory}';
    var keyword = $(".seachInp").val();
    var order='${order==null? "":"&order=1"}';
    keyword=keyencode(keyword);
    $.ajax({
        url: "${rlab}/bg/baseins/category?level=1",
        type: 'get',
        async: false
    }).done(function (data) {
        var html = '<option value="">请选择仪器分类</option><option value="">全部</option>';
        for (var i = 0; i < data.payload.length; i++) {
            if (data.payload[i].insCategory.toString() == instypeValue) {
                html += '<option value="' + data.payload[i].insCategory + '" selected>' + data.payload[i].categoryName + '</option>';
            } else {
                html += '<option value="' + data.payload[i].insCategory + '">' + data.payload[i].categoryName + '</option>';
            }

        }
        $("#instype select").html(html);
    }).fail(function () {
        layer.msg("系统繁忙 , 请稍后再试");
    });

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(instype)', function (data) {
            instypeValue = data.value;
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/baseins/list?keyword='+keyword+'&pageNo=1&pageSize=' + pageSize + '&insCategory=' + instypeValue+order;
        });

    });
    layui.use(['laypage', 'layer'], function () {
        var laypage = layui.laypage
            , layer = layui.layer;
        laypage({
            cont: 'pagesControl'
            , pages: ${pages}
            , skip: true
            , skin: '#2fcba8'
            , curr: ${pageNo}
            , prev: '<em><</em>'
            , next: '<em>></em>'
            , first: 1
            , last: ${pages}
            , jump: function (obj, first) {
                if (!first) {
                    window.location.href = '${rlab}/bg/baseins/list?keyword='+keyword+'&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&insCategory=' + instypeValue+order;
                }
            }
        });
    });

    $('#daterange-btn').daterangepicker({
            startDate: '${requestScope.get("beginTime")}',
            endDate: '${requestScope.get("endTime")}',
            minDate:'2016-01-01',
            maxDate:new Date()
        },
        function (start, end) {
            $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年M月D日'));
            startDate = start.format('YYYY-MM-DD');
            endDate = end.format('YYYY-MM-DD');
        }
    );
    $('#daterange-btn span').html(startDate + ' - ' + endDate);

    function gosearch() {
        var keyword = $.trim($(".seachInp").val());
//        var orgnat=$(".orgnat input").val();
//        console.log(search+state+source)
        /*var url = '';
         window.location.href= url;*/

        keyword = encodeURI(keyword);

        keyword = keyword.replace(/\\$/g, "%24");
        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/@/g, "%40");
        keyword = keyword.replace(/=/g, "%3d");
        keyword = keyword.replace(/:/g, "%3a");
        keyword = keyword.replace(/\//g, "%2f");
        keyword = keyword.replace(/;/g, "%3b");
        keyword = keyword.replace(/\?/g, "%3f");
        keyword = keyword.replace(/'/g, "%27");
//        console.log(keyword);


        console.log(url);
        var url = '${rlab}/bg/baseins/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + '&insCategory=' + instypeValue+order;
        window.location.href = url;
    }

    function gosearchAll() {
        var url = '${rlab}/bg/baseins/list';
        window.location.href = url;
    }

    function listSort($this) {
        $this = $($this);
        if (!$this.data("sort")){
            order="&order=1";
        }else {
            order="";
        }
        window.location.href ='${rlab}/bg/baseins/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + '&insCategory=' + instypeValue+order;
    }
</script>
</html>
