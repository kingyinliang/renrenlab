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
            padding-left: 130px;
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
            text-decoration: underline!important;
            color: #16b8be;
            display: inline-block;
            margin-bottom:10px;
        }
        .p {
            overflow: hidden;
            min-height: 48px;
            margin-bottom: 10px;
            margin-bottom: 50px;
        }
        .p img{
            width: 250px;
            height:150px;
            margin-right: 14px;
        }
        .p span {
            color: #7b8da0;
            font-size: 18px;
        }
        .shade .tit{
            width: 380px;
            height: 215px;
            border-bottom: 2px solid #16b8be;
        }
        .tit p{
            text-align: center;
        }
        .tit p button{
            width: 155px;
            height: 44px;
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
                <jsp:param name="firstMenu" value="8"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="${rlab}/bg/coupon/search?flag=2">创新券管理</a>
                  <a href="${rlab}/bg/coupon/search?flag=2">项目审核</a>
                  <a href="">项目审核详情</a>
                </span>
            </div>

            <%--②认证审核详情--%>
            <div class="result">
                <p>
                    <span>申请人账号：</span>
                    ${detail.uMobile}
                </p>
                <p>
                    <span>申请时间：</span>
                    <fmt:formatDate value="${detail.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </p>
                <p>
                    <span>审核状态：</span>
                    <s class="status">
                        <c:if test="${detail.orgProState eq 0}">
                        待审核
                    </c:if>
                        <c:if test="${detail.orgProState eq 1}">
                            审核通过
                        </c:if>
                        <c:if test="${detail.orgProState eq 2}">
                            审核拒绝
                        </c:if>
                        <c:if test="${detail.orgProState eq 3}">
                            备案完成、款项发放中
                        </c:if>
                        <c:if test="${detail.orgProState eq 4}">
                            项目已完成
                        </c:if>
                    </s>
                </p>
                <p>
                    <span>机构名称：</span>
                    ${detail.orgName}
                </p>
                <p>
                    <span>项目名称：</span>
                    ${detail.orgProName}
                </p>

                <p>
                    <span>项目申请表：</span>
                    <a href="${detail.orgProApplication}" download="download">项目申请表</a> <br>
                </p>

                <p style="margin-top: 100px;display: ${not empty detail.orgProContract ?"block":"none"}">
                    <span>项目合同：</span>
                    <a href="${detail.orgProContract}" download="download">合同</a> <br>
                </p>
                <p style="display: ${not empty detail.orgProInvoice ?"block":"none"}">
                    <span>财务资料：</span>
                    <a href="${detail.orgProInvoice}" download="download">财务资料</a> <br>
                </p>
                <p style="display: ${not empty detail.orgProAchievement ?"block":"none"}">
                    <span>成果证明材料：</span>
                    <a href="${detail.orgProAchievement}" download="download">成果证明材料</a> <br>
                </p>
            </div>
            <%--操作按钮--%>
            <%--审核权限--%>
            <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                <div style="text-align: center;display: ${detail.orgProState eq 0 ?"block":"none"}" >
                    <button  class="lab_btn_base  lab_btn_type1" onclick="acceptStatus(1)" type="button">审核通过</button>
                    <button class="lab_btn_base  lab_btn_type5" onclick="rejectStatus()" type="button" style="margin-left: 26px;">审核不通过</button>
                </div>
                <div style="text-align: center;margin-top: 40px;display: ${detail.orgProState eq 1 && not empty detail.orgProContract?"block":"none"}">
                    <button class="lab_btn_base  lab_btn_type1" onclick="acceptStatus(3)" type="button">放款</button>
                </div>
                <div style="text-align: center;margin-top: 40px;display: ${detail.orgProState eq 3 ?"block":"none"}">
                    <button class="lab_btn_base  lab_btn_type1" onclick="acceptStatus(4)" type="button">项目已完成</button>
                </div>
            <%--</c:if>--%>
        </div>
    </div>
    <div id="delete" class="shade">
        <div class="tit">
            <p style="font-size: 20px;margin-top: 42px">你是否确认该步操作？</p>
            <p style="font-size: 12px;color: #909090"></p>
            <p style="margin-top: 40px">
                <button class="layui-btn" style="background: white;color: #707070;border: 1px solid #cfcfcf" onclick="closethis()">取消</button>
                <button class="layui-btn" style="background: #16b8be" onclick="deleteCommit(this)" id="deleteCommit">确认</button>
            </p>
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
    var LOGIN_AJAX_FLAG=true;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });
    function closethis() {
        $(".shade").hide();
    }
    function acceptStatus(state) {
        $(".shade").show();
        $(".shade #deleteCommit").data("stateId",state);
    }
    // 通过审核
    function deleteCommit($this) {
        if (!LOGIN_AJAX_FLAG) {
            alert("请勿频繁操作");
            return;
        }
        $this=$($this);
        var state=$this.data("stateId");
        $.ajax({
            url: "${rlab}/bg/coupon/check",
            type: 'POST',
            data: {
                "id":${detail.orgProId},
                "state":state,
                "flag":2
            },
            beforeSend:function () {
                LOGIN_AJAX_FLAG = false;
            },
            success: function (data) {
                if(data.code==200){
                    window.location.href ='${rlab}/bg/coupon/proDetail?id=${detail.orgProId}';
                } else {
                    alert(data.description);
                }
            },
            complete: function () {

            },
            complete:function () {
                LOGIN_AJAX_FLAG = true;
            },
            error: function () {

            }
        })
    }

    // 拒绝审核
    function rejectStatus() {

        showRjectModal('审核不通过原因', function (txt) {
            if (!LOGIN_AJAX_FLAG) {
                alert("请勿频繁操作");
                return;
            }
            if (txt.length > 50) {
                alert("字数不能超过50字");
                return;
            }
            $.ajax({
                url: "${rlab}/bg/coupon/check",
                type: 'POST',
                data: {
                    "id":${detail.orgProId},
                    "state":2,
                    "flag":2,
                    "reason":txt
                },
                beforeSend:function () {
                    LOGIN_AJAX_FLAG = false;
                },
                success: function (data) {
                    if(data.code==200){
                        window.location.href ='${rlab}/bg/coupon/proDetail?id=${detail.orgProId}';
                    } else {
                        alert(data.description);
                    }
                },
                complete: function () {

                },
                complete:function () {
                    LOGIN_AJAX_FLAG = true;
                },
                error: function () {

                }
            })
        })
    }
</script>
</html>
