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
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="10"/>
                <jsp:param name="secondMenu" value="${source==1?'3':source==2?'4':'1'}"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>科创头条管理</cite></a>
                    <a><cite>${source==1?'政策源列表':source==2?'动态源列表':'科创头条列表'}</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 10px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="orgInp" placeholder="请输入科创头条名称" value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="searchs" style="margin-top: 10px;">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" id="userInp" placeholder="请输入创建者" value="<c:out value="${uname}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature" id="auditStates" style="margin-right: 10px;margin-top: 10px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="classify" lay-verify="" lay-filter="classify">
                            <option value="99">请选择科创头条分类</option>
                            <option value="1" ${classify==1? 'selected':''}>政策指南</option>
                            <option value="2" ${classify==2? 'selected':''}>科研前沿</option>
                            <option value="3" ${classify==3? 'selected':''}>最新活动</option>
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
                        <col width="30%">
                        <col width="20%">
                        <col width="10%">
                        <col width="20%">
                        <col width="10%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>科创头条标题</th>
                        <th>标签</th>
                        <th>发布人</th>
                        <th>发布时间</th>
                        <th>操作</th>
                        <th>链接</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${infomations}" var="info">
                        <tr>
                            <td>${info.tInfoTitle}</td>
                            <td><c:forEach items="${info.tInfoTags}" var="item" varStatus="state">${item}<c:if test="${!state.last}">, </c:if></c:forEach></td>
                            <td>${info.tUname==null? "无名":info.tUname}</td>
                            <td>${info.createTime.toLocalDate()} ${info.createTime.toLocalTime().withNano(0)}</td>
                            <td>
                                <a  href="${rlab}/bg/infomation/detail?id=${info.tInfoId}" target="_blank">编辑</a>
                                <a class="remove" onclick="deleteshade(this)" data-user-id="${info.tInfoId}">删除</a>
                                <c:if test="${info.tInfoState == 2}">
                                    <a class="remove" onclick="passshade(this)" data-user-id="${info.tInfoId}" data-state-code="0">通过</a>
                                </c:if>
                                <c:if test="${info.tInfoState == 0}">
                                    <a class="remove" onclick="passshade(this)" data-user-id="${info.tInfoId}" data-state-code="2">下架</a>
                                </c:if>
                            </td>
                            <td>
                                <a href="${rlab}/news/get_article_detail?id=${info.tInfoId}">${rlab}/news/get_article_detail?id=${info.tInfoId}</a>
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
    <div id="delete" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认删除此科创头条</p>
            <p style="font-size: 16px;color: #909090">删除后科创头条不会显示在主站</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="deleteCommit(this)" id="deleteCommit">确认</button>
        </div>
    </div>
    <div id="pass" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认通过此科创头条</p>
            <p style="font-size: 16px;color: #909090">通过后文章会显示在主站</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="passCommit(this)" id="passCommit">确认</button>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>

    var pageSize=${pageSize};
    var classify=${empty classify?99:classify};
    var startDate='${beginTime}';
    var endDate='${endTime}';
    var keyword=$("#orgInp").val();
    var uname=$("#userInp").val();

    function deleteshade($this) {
        $this = $($this);
        var id = $this.data("userId");
        $("#delete").show();
        $("#delete #deleteCommit").data("userId", id);
    }
    function passshade($this) {
        $this = $($this);
        var id = $this.data("userId");
        var code = $this.data("stateCode");
        $("#pass").show();
        $("#pass #passCommit").data("userId", id);
        $("#pass #passCommit").data("stateCode", code);
    }
    function deleteCommit($this) {
        $this = $($this);
        var id = $this.data("userId");

        $.ajax({
            url: '${rlab}/bg/infomation/delete',
            type: 'post',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({"tInfoId": id})
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

    function passCommit($this) {
        $this = $($this);
        var id = $this.data("userId");
        var code = $this.data("stateCode");

        $.ajax({
            url: '${rlab}/bg/infomation/pass',
            type: 'post',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify({"tInfoId": id, "tInfoState": code})
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
            classify = data.value;
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/infomation/list?pageSize=' + pageSize + '&keyword=' + keyword + '&uname=' + uname + '&classify=' + classify + '&beginTime=' + startDate + '&endTime=' + endDate +'&source='+${source};
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
                    window.location.href = '${rlab}/bg/infomation/list?pageNo=' + obj.curr + '&pageSize=' + pageSize + '&keyword=' + keyword + '&uname=' + uname + '&classify=' + classify + '&beginTime=' + startDate + '&endTime=' + endDate +'&source='+${source};
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
        uname=$("#userInp").val();
        keyword=keyencode(keyword);
        uname=keyencode(uname);
        var url = '${rlab}/bg/infomation/list?pageSize=' + pageSize + '&keyword=' + keyword + '&uname=' + uname + '&classify=' + classify + '&beginTime=' + startDate + '&endTime=' + endDate +'&source='+${source};
        window.location.href = url;
    }
</script>
</html>

