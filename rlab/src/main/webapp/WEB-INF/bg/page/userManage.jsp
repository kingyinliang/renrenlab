<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/7/14 0014
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp"%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.js"></script>--%>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>
    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
    <script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <style>
        .form{
            overflow: hidden;
            height: 100%;
        }
        .table a{
            color: #4c5e70;
            padding-left: 3px;
            padding-right: 3px;
            display: block;
            float: left;
            cursor: pointer;
        }


        .remove:hover{
            color: #ff441f;
        }
        .forbidden:hover{
            color: #f49b28;
        }
        .check:hover{
            color: #49aaff!important;
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
                <jsp:param name="levelNum" value="1" />
                <jsp:param name="firstMenu" value="2" />
            </jsp:include>
        </div>
        <div class="main">
            <%-- 编写代码的地方，内容区域 --%>
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>用户管理</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="searchs" style="margin-top: 20px">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" placeholder="手机号/用户昵称" value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature state" style="margin-top: 20px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="renzhengtype">
                            <%--<option value="">请选择认证状态</option>--%>
                            <option value="99" ${type == 99 ? "selected": ""}>全部</option>
                            <option value="1" ${type == 1 ? "selected": ""}>已认证</option>
                            <option value="0" ${type == 0 ? "selected": ""}>未认证</option>
                        </select>
                    </form>
                </div>
                <div class="listNature source" style="margin-top: 20px;margin-right: 23px">
                    <form class="layui-form" style="height: 50px;width: 170px;">
                        <select name="city" lay-verify="" lay-filter="sourcetype">
                            <%--<option value="">请选择用户来源</option>--%>
                            <option value="99" ${source == 99 ? "selected": ""}>全部</option>
                            <option value="0" ${source == 0 ? "selected": ""}>微信</option>
                            <option value="1" ${source == 1 ? "selected": ""}>web</option>
                            <option value="2" ${source == 2 ? "selected": ""}>m站</option>
                        </select>
                    </form>
                </div>
                <div style="float: left;margin: 20px 23px 0 0">
                    <p style="line-height: 50px;float: left;margin-right: 20px;color: 7b8da0">请选择时间</p>
                    <%--START 公用时间组件 --%>
                    <div class="lab_date clearfix" style="float: left">
                        <button type="button" class="" id="daterange-btn">
                    <span>
                      近一周
                    </span>
                            <%--<i class="fa fa-caret-down"></i>--%>
                            <i class="layui-icon date_icon">&#xe637;</i>
                        </button>

                    </div>
                    <%--END 公用时间组件--%>
                </div>
                <button class="layui-btn btn" style="margin:20px 23px 0 0;background: #49aaff;float: left;" onclick="gosearch()"><div class="lab-search"></div>检索用户</button>
                <button class="layui-btn btn" style="background: #16b8be;float: left;margin-top: 20px" onclick="showAll()"><div class="iconfont icon-caidan1"></div>显示所有</button>
            </div>
            <%--<div class="time clearfix">
                <p style="line-height: 50px;float: left;margin-right: 20px;color: 7b8da0">请选择时间</p>
                &lt;%&ndash;START 公用时间组件 &ndash;%&gt;
                <div class="lab_date clearfix" style="float: left">
                    <button type="button" class="" id="daterange-btn">
                    <span>
                      近一周
                    </span>
                        &lt;%&ndash;<i class="fa fa-caret-down"></i>&ndash;%&gt;
                        <i class="layui-icon date_icon">&#xe637;</i>
                    </button>

                </div>
                &lt;%&ndash;END 公用时间组件&ndash;%&gt;
                <button class="layui-btn btn" style="background: #16b8be" onclick="showAll()"><div class="iconfont icon-caidan1"></div>显示所有</button>
                <button class="layui-btn btn" style="margin-right: 23px;background: #49aaff" onclick="gosearch()"><div class="lab-search"></div>检索用户</button>
            </div>--%>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="6%">
                        <col width="20%">
                        <col width="9%">
                        <col width="9%">
                        <col width="9%">
                        <col width="18%">
                        <col width="9%">
                        <col >
                    </colgroup>
                    <thead>
                    <tr>
                        <th>手机号</th>
                        <th>用户昵称</th>
                        <th>认证状态</th>
                        <th>真实姓名</th>
                        <th>用户来源</th>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">注册时间<i class="${order=='DESC'? 'lab-down' : 'lab-top' }"></i></th>
                        <th>用户状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list}" var="item">
                            <tr>
                                <td>${item.uMobile}</td>
                                <td>${item.uNickname}</td>
                                <td>${item.uAuthentication == 0 ? '未认证' :  '已认证'}</td>
                                <td>${item.uName == null ? '----' :  item.uName}</td>
                                <td>${item.uSource == 0 ? '微信' : item.uSource == 1 ? 'web' : 'm站'}</td>
                                <td>${item.createTimeStr}</td>
                                <td>${item.uState == 0 ? '正常' : item.uState == 1 ? '禁用' : '删除'}</td>
                                <td>
                                    <a class="check" style="color: #6693c8;" href="${rlab}/bg/user/detail?uuid=${item.uUid}">查看详情</a>
                                    <%--审核权限--%>
                                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                                        <a class="forbidden" onclick="openshade(this)" data-user-state="${item.uState}" data-user-id="${item.uUid}" >${item.uState == 0 ? '禁用': '开启'}</a>
                                    <%--</c:if>--%>
                                    <%--撤销权限--%>
                                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">--%>
                                        <a class="remove" onclick="deleteshade(this)"  data-user-state="${item.uState}" data-user-id="${item.uUid}">删除</a>
                                    <%--</c:if>--%>
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
                            <option value="10" ${pageSize == 10 ? "selected": ""}>10条/页</option>
                            <option value="25" ${pageSize == 25 ? "selected": ""}>25条/页</option>
                            <option value="50" ${pageSize == 50 ? "selected": ""}>50条/页</option>
                            <option value="100" ${pageSize == 100 ? "selected": ""}>100条/页</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <%--弹窗--%>
    <div id="ban" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认<em class="tishi1">启用</em>此用户</p>
            <p style="font-size: 16px;color: #909090" class="tishi2">开启后用户可登录网站</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="banCommit(this)" id="banCommit">确认</button>
        </div>
    </div>
    <div id="delete" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认删除此用户</p>
            <p style="font-size: 16px;color: #909090">删除后用户不可登录网站</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="deleteCommit(this)" id="deleteCommit">确认</button>
        </div>
    </div>
</div>
</body>
<script src="../../common/assets/layui/layui.js"></script>
<script src="../js/main.js"></script>
<script>

    function showAll() {
        window.location.href = '${rlab}/bg/user/list?pageNo=1&pageSize=10';
    }
    function listSort($this) {
        $this = $($this);
        if ($this.data("sort")=="DESC"){
            order="&order=asc";
        }else {
            order="";
        }
        window.location.href ='${rlab}/bg/user/list?keyword=' + keyword + '&type=' + renzhengType + '&source=' + sourceType + '&beginTime=' + startDate + '&endTime=' + endDate + '&pageNo=1&pageSize=' + pageSize+order;
    }
    var keyword = $(".seachInp").val();
    var pageSize = ${pageSize};
    var renzhengType = ${type};
    var sourceType = ${source};
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var order='${order=="DESC"? "":"&order=asc"}';
    keyword=keyencode(keyword);
    layui.use(['form', 'layer'], function(){
        var form = layui.form()
            ,layer = layui.layer;


        form.on('select(renzhengtype)', function (data) {
            renzhengType = data.value;
            console.log(renzhengType);
        });

        form.on('select(sourcetype)', function (data) {
            sourceType = data.value;
            console.log(sourceType);
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/user/list?pageNo=1&pageSize=' + pageSize + '&keyword=' + keyword + '&type=' + renzhengType + '&source=' + sourceType + '&beginTime=' + startDate + '&endTime=' + endDate +order;
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
                    window.location.href = '${rlab}/bg/user/list?pageNo=' + obj.curr + '&pageSize=' + pageSize + '&keyword=' + keyword + '&type=' + renzhengType + '&source=' + sourceType + '&beginTime=' + startDate + '&endTime=' + endDate +order;
                }
            }
        });
    });

    $('#daterange-btn').daterangepicker({
            startDate: '${requestScope.get("beginTime")}',
            endDate: '${requestScope.get("endTime")}',
            minDate:'2016-01-01',
            maxDate:new Date()
//            setStartDate:
        },
        function (start, end) {
            $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年M月D日'));
            startDate = start.format('YYYY-MM-DD');
            endDate = end.format('YYYY-MM-DD');
//            alert(start.format('YYYY-MM-DD') + " " + end.format('YYYY-MM-DD'));
//            console.log(startDate);
//            console.log(endDate);
        }
    );
    $('#daterange-btn span').html('${requestScope.get("beginTime")}' + ' - ' + '${requestScope.get("endTime")}');
    function gosearch() {
        keyword=$(".seachInp").val();
        keyword=keyencode(keyword);
        var url = '${rlab}/bg/user/list?keyword=' + keyword + '&type=' + renzhengType + '&source=' + sourceType + '&beginTime=' + startDate + '&endTime=' + endDate + '&pageNo=1&pageSize=' + pageSize+order;
        window.location.href = url;
    }

    function closethis() {
        $(".shade").hide();
    }
    function openshade($this) {
        $this = $($this);
        var state = $this.data("userState");
        var id = $this.data("userId");
//        console.log(data);
        if(state==0){
            $(".tishi1").html("禁用");
            $(".tishi2").html("禁用后用户不可登录网站");
        }else {
            $(".tishi1").html("开启");
            $(".tishi2").html("开启后用户可登录网站");
        }
        $("#ban").show();
        $("#ban #banCommit").data("userState", state);
        $("#ban #banCommit").data("userId", id);
//        console.log($("#ban #banCommit").data("userState"));
    }

    function deleteshade($this) {
        $this = $($this);
        var state = $this.data("userState");
        var id = $this.data("userId");
//        console.log(data);
        $("#delete").show();
        $("#delete #deleteCommit").data("userState", state);
        $("#delete #deleteCommit").data("userId", id);
//        console.log($("#ban #banCommit").data("userState"));
    }

    function banCommit($this) {
        $this = $($this);
        var state = $this.data("userState") == 0 ? 1 : 0;
        var id = $this.data("userId");

        $.ajax({
            url: '${rlab}/bg/user/modify?uuid=' + id + '&state=' + state,
            type: 'PUT',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                console.log(data);
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }

                <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function deleteCommit($this) {
        $this = $($this);
        var state = 2;
        var id = $this.data("userId");

        console.log('------------------');
        console.log(id);
        $.ajax({
            url: '${rlab}/bg/user/modify?uuid=' + id + '&state=' + state,
            type: 'PUT',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
                <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
            })
            .fail(function (data) {
                alert("失败");
            });
    }
</script>
</html>


