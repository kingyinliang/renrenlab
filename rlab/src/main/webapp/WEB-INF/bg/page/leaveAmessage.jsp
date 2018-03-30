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
            margin-bottom: 25px;
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
                <jsp:param name="levelNum" value="1"/>
                <jsp:param name="firstMenu" value="12"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>留言管理</cite></a>
                    <a><cite>留言信息列表</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="orgInp" placeholder="留言编号/仪器名称/服务名称/联系人" value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature" id="auditStates" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="classify" lay-verify="" lay-filter="classify">
                            <option value="99">请选择留言状态</option>
                            <option value="0" ${state==0? 'selected':''}>待处理</option>
                            <option value="1" ${state==1? 'selected':''}>处理完成</option>
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
                    搜索
                </button>
            </div>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="5%">
                        <col width="10%">
                        <col width="15%">
                        <col width="10%">
                        <col width="10%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="10%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>留言时间</th>
                        <th>仪器/服务名称</th>
                        <th>相关链接</th>
                        <th>联系人</th>
                        <th>联系电话</th>
                        <th>留言备注</th>
                        <th>操作</th>
                        <th>状态</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${infomations}" var="info">
                        <tr>
                            <td>${info.messageId}</td>
                            <td><fmt:formatDate value="${info.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                            <td>${info.productName}</td>
                            <td>
                                <c:if test="${info.productType == 0}">
                                    <a href="${rlab}/instrument/search/${info.productId}">${rlab}/instrument/search/${info.productId}</a>
                                </c:if>
                            </td>
                            <td>${info.contactName}</td>
                            <td>${info.contactPhone}</td>
                            <td>${info.contactContent}</td>
                            <td>
                                <c:if test="${info.contactState == 0}">
                                    <a onclick="over(this)" data-user-id="${info.messageId}">处理完成</a>
                                </c:if>
                                <c:if test="${info.contactState == 1}">
                                    ${info.operator}
                                </c:if>
                            </td>
                            <td>${info.contactState==0?'待处理':'处理完成'}</td>
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
    <div id="delete" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p style="margin-bottom: 55px">若点击确定，该留言将会显示“处理完成”。</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="deleteCommit(this)" id="deleteCommit">确认</button>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>

    var pageSize=${pageSize};
    var state=${empty state?99:state};
    var startDate='${beginTime}';
    var endDate='${endTime}';
    var keyword=$("#orgInp").val();

    function over($this) {
        $this = $($this);
        var id = $this.data("userId");
        $("#delete").show();
        $("#delete #deleteCommit").data("userId", id);
    }
    function deleteCommit($this) {
        $this = $($this);
        var id = $this.data("userId");

        $.ajax({
            url: '${rlab}/bg/leaveMessage/updataState',
            type: 'post',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({"messageId": id,"contactState":1})
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function closethis() {
        $(".shade").hide();
    }

    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(classify)', function (data) {
            state = data.value;
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/leaveMessage/list?pageSize=' + pageSize + '&keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate ;
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
                    window.location.href = '${rlab}/bg/leaveMessage/list?pageNo=' + obj.curr + '&pageSize=' + pageSize + '&keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate ;
                }
            }
        });
    });

    $('#daterange-btn').daterangepicker({
            startDate: '${beginTime}',
            endDate: '${endTime}',
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
        keyword=$("#orgInp").val();
        keyword=keyencode(keyword);
        var url = '${rlab}/bg/leaveMessage/list?pageSize=' + pageSize + '&keyword=' + keyword + '&state=' + state + '&beginTime=' + startDate + '&endTime=' + endDate ;
        window.location.href = url;
    }
</script>
</html>

