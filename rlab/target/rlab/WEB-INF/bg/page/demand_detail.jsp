<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">

    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .result {
            margin-top: 26px;
        }

        .result p {
            padding-left: 110px;
            position: relative;
            overflow: hidden;
            min-height: 48px;
            margin-bottom: 10px;
            font-size: 18px;
            color: #4c5e70;
        }

        .result p s.status {
            color: #fba45f;
        }

        .result p span {
            position: absolute;
            left: 0;
            top: 0;
            color: #7b8da0;
        }

        .result p a {
            text-decoration: underline !important;
            color: #16b8be;
            display: inline-block;
            margin-bottom: 10px;
        }

        .p {
            overflow: hidden;
            min-height: 48px;
            margin-bottom: 10px;
            margin-bottom: 50px;
        }

        .p img {
            width: 250px;
            height: 150px;
            margin-right: 14px;
        }

        .p span {
            color: #7b8da0;
            font-size: 18px;
        }

        .shade .tit {
            padding: 26px 0 0 0;
            overflow: hidden;
        }

        .shade .tit span {
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 25px;
        }

        .shade .tit p {
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }

        .shade .tit button {
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

        tr td a {
            cursor: pointer;
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
                <jsp:param name="firstMenu" value="6"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="${rlab}/bg/req/list">需求管理</a>
                  <a href="javascript:void(0)">需求详情</a>
                </span>
            </div>

            <%--②需求详情--%>
            <div class="result">
                <p>
                    <span>需求人：</span>
                    ${detail.uName}
                </p>
                <p>
                    <span>手机号：</span>
                    ${detail.uMobile}
                </p>
                <p>
                    <span>需求状态：</span>
                    <c:if test="${detail.uReqState == 0}">
                        <s class="status">待审核</s>
                    </c:if>
                    <c:if test="${detail.uReqState == 1}">
                        <s class="status">审核拒绝</s>
                    </c:if>
                    <c:if test="${detail.uReqState == 2}">
                        <s class="status">已过期</s>
                    </c:if>
                    <c:if test="${detail.uReqState == 3}">
                        <s class="status">已解决</s>
                    </c:if>
                    <c:if test="${detail.uReqState == 4}">
                        <s class="status">未解决</s>
                    </c:if>
                </p>
                <c:if test="${detail.uReqState==1}">
                <p>
                    <span>拒绝原因：</span>
                    ${detail.uReqReason}
                </p>
                </c:if>
                <p>
                    <span>发布时间：</span>
                    ${detail.beginTime}
                </p>
                <c:if test="${detail.uReqState==3}">
                <p>
                    <span>解决时间：</span>
                    ${detail.modifyTimeStr}
                </p>
                </c:if>
                <c:if test="${detail.uReqState==2||detail.uReqState==3||detail.uReqState==4}">
                <p>
                    <span>截止时间：</span>
                    ${detail.endTime}
                    <c:if test="${detail.uReqState==4}">
                        <s style="color: #ff5730;margin-left: 20px;">${detail.remainTime}天后过期</s>
                    </c:if>
                </p>
                </c:if>
                <p>
                    <span>需求描述：</span>
                    ${detail.uReqDescription}
                </p>

            </div>
            <%--操作按钮--%>
            <div style="text-align: center;margin-top: 50px;">
                <%--审核权限--%>
                <c:if test="${detail.uReqState == 0 && '1'.equals(sessionScope.u_permission.substring(2,3))}">
                    <button class="lab_btn_base  lab_btn_type1" onclick="acceptDemand()" type="button">审核通过</button>
                    <button class="lab_btn_base  lab_btn_type5" onclick="rejectDemand()" type="button" style="margin-left: 26px;">审核拒绝
                    </button>
                </c:if>
                <%--审核权限--%>
                <c:if test="${detail.uReqState == 4 && '1'.equals(sessionScope.u_permission.substring(2,3))}">
                    <button class="lab_btn_base  lab_btn_type1" onclick="completeDemand()" type="button">已解决</button>
                    <c:if test="${detail.uHasDelay==0&&detail.remainTime<=3}">
                        <button class="lab_btn_base  lab_btn_type5" onclick="addTimeDemand()" type="button" style="margin-left: 26px;">延长有效期
                        </button>
                    </c:if>
                </c:if>
            </div>

        </div>
    </div>
    <div id="pass" class="shade">
        <div class="tit" style="height: 265px">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认审核通过</p>
            <p style="font-size: 16px;color: #909090">确认后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closePass()">取消</button>
            <button class="layui-btn" onclick="passCommit(this)" id="passCommit">确认</button>
        </div>
    </div>
    <div id="complete" class="shade">
        <div class="tit" style="height: 265px">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认完成需求</p>
            <p style="font-size: 16px;color: #909090">确认后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closeComplete()">取消</button>
            <button class="layui-btn" onclick="completeCommit()" id="completeCommit">确认</button>
        </div>
    </div>
    <div id="addTime" class="shade">
        <div class="tit" style="height: 265px">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认延长时间</p>
            <p style="font-size: 16px;color: #909090">确认后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closeAddTime()">取消</button>
            <button class="layui-btn" onclick="addTimeCommit()" id="addTimeCommit">确认</button>
        </div>
    </div>
</div>
</body>
<%--开发环境--%>
<script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
<script src="${rlab}/common/assets/layui/layui.js" charset="utf-8"></script>
<script src="${rlab}/bg/js/main.js"></script>
<script type="text/javascript">
    var layer;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });

    // 通过审核
    function acceptDemand() {
        $("#pass").show();
    }

    function closePass() {
        $("#pass").hide();
    }

    function passCommit() {
        var data = {
            uReqIds: [${detail.uReqId}],
            uReqState: 4
        }
        $.ajax({
            url: '${rlab}/bg/req/auditing',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json"
        }).done(function (data) {
            window.location.reload(true);
        })
            .fail(function (data) {
                alert("失败");
            });
    }

    // 拒绝审核
    function rejectDemand() {

        showRjectModal('审核不通过原因', function (txt) {
            if (txt.length > 50) {
                alert("字数不能超过50字");
                return;
            }
            var data = {
                uReqIds: [${detail.uReqId}],
                uReqState: 1,
                uReqReason:txt
            };
            $.ajax({
                url: '${rlab}/bg/req/auditing',
                type: 'POST',
                data: JSON.stringify(data),
                dataType: "json",
                contentType: "application/json"
            }).done(function (data) {
                window.location.reload(true);
            })
                .fail(function (data) {
                    alert("失败");
                });
        })
    }

    //已解决
    function completeDemand() {
        $("#complete").show();
    }

    function closeComplete() {
        $("#complete").hide();
    }

    function completeCommit() {
        var data = {
            uReqIds: [${detail.uReqId}],
            uReqState: 3
        }
        $.ajax({
            url: '${rlab}/bg/req/auditing',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json"
        }).done(function (data) {
            window.location.reload(true);
        })
            .fail(function (data) {
                alert("失败");
            });
    }


    //延长有效期
    function addTimeDemand() {
        $("#addTime").show()
    }

    function closeAddTime() {
        $("#addTime").hide();
    }

    function addTimeCommit() {
        $.ajax({
            url: '${rlab}/bg/req/delay?uReqId=' + ${detail.uReqId},
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
                <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
            })
            .fail(function (data) {
                alert("失败");
            });
    }

</script>
</html>
