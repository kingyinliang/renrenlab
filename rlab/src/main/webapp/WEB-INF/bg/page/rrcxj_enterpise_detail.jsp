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
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="${rlab}/bg/coupon/search?flag=1">创新券管理</a>
                  <a href="${rlab}/bg/coupon/search?flag=1">认证审核</a>
                  <a href="">认证审核详情</a>
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
                        <c:if test="${detail.orgCerState eq 0}">
                            待审核
                        </c:if>
                        <c:if test="${detail.orgCerState eq 1}">
                            审核通过
                        </c:if>
                        <c:if test="${detail.orgCerState eq 2}">
                            审核拒绝
                        </c:if>
                    </s>
                </p>
                <p>
                    <span>机构名称：</span>
                    ${detail.orgName}
                </p>
                <div class="p">
                    <span>法人照片：</span>
                    <img src="${detail.orgPersonFrontPic}" alt="">
                    <img src="${detail.orgPersonBackPic}" alt="">
                </div>
                <p>
                    <span>营业执照：</span>
                    <a href="${detail.orgLicensePic}" target="_blank" download="">营业执照</a> <br>
                </p>

                <p>
                    <span>基本信息表：</span>
                    <a href="${detail.orgBaseReport}" target="_blank" download="">基本信息表</a> <br>
                </p>
                <p>
                    <span>财务报表：</span>
                    <c:if test="${finance != null && fn:length(finance)>0}">
                        <c:forEach items="${finance}" var="fin" varStatus="st">
                            <a href="${fin}" target="_blank" download="">财务报表${st.index +1}</a>
                            <br>
                        </c:forEach>
                    </c:if>
                </p>
                <p>
                    <span>其他附件：</span>
                    <c:choose>
                        <c:when test="${otherReport != null && fn:length(otherReport)>0}">
                            <c:forEach items="${otherReport}" var="other" varStatus="st">
                                <a href="${other}" target="_blank"
                                   download="">其他附件${st.index +1}</a> <br>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            无
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
            <%--操作按钮--%>
            <%--审核权限--%>
            <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                <div style="margin-bottom: 150px;text-align: center;display: ${detail.orgCerState ne 0 ?"none":"block"}">
                    <button class="lab_btn_base  lab_btn_type1" onclick="acceptStatus()" type="button">审核通过</button>
                    <button class="lab_btn_base  lab_btn_type5" onclick="rejectStatus()" type="button"
                            style="margin-left: 26px;">审核不通过
                    </button>
                </div>
            <%--</c:if>--%>
        </div>
    </div>
    <div id="delete" class="shade">
        <div class="tit">
            <p style="font-size: 20px;margin-top: 42px">你是否确认通过此机构认证申请</p>
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
    function closethis() {
        $(".shade").hide();
    }
    function acceptStatus() {
        $(".shade").show();
    }
    var layer;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });

    // 通过审核
    function deleteCommit() {
        $.ajax({
            url: "${rlab}/bg/coupon/check",
            type: 'POST',
            data: {
                "id":${detail.orgCerId},
                "state": 1,
                "flag": 1
            },
            success: function (data) {
                if (data.code == 200) {
                    window.location.href = '${rlab}/bg/coupon/detail?id=${detail.orgCerId}';
                } else {
                    alert(data.description);
                }
            },
            complete: function () {

            },
            error: function () {

            }
        })
    }

    // 拒绝审核
    function rejectStatus() {

        showRjectModal('审核不通过原因', function (txt) {
            if (txt.length > 50) {
                alert("字数不能超过50字");
            } else {
                $.ajax({
                    url: "${rlab}/bg/coupon/check",
                    type: 'POST',
                    data: {
                        "id":${detail.orgCerId},
                        "state": 2,
                        "flag": 1,
                        "reason": txt
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            window.location.href = '${rlab}/bg/coupon/detail?id=${detail.orgCerId}';
                        } else {
                            alert(data.description);
                        }
                    },
                    complete: function () {

                    },
                    error: function () {

                    }
                })
            }
        })
    }

    //    // 拒绝原因通用弹窗
    //    function showRjectModal(title, callback) {
    //        var html =
    //            '<div style="width: 525px;height: 366px;padding:0 25px;background: #fff;">' +
    //            '<p style="position: relative">' +
    //            '<h3 style="font-size: 18px;color: #333;line-height: 64px;">' +
    //             title +
    //            '<i style="position: absolute;right: 25px;font-size: 26px;top: 4px;cursor: pointer" class="layui-icon">&#x1006;</i>' +
    //            '</h3>' +
    //            '</p>' +
    //            '<div style="height: 220px;overflow: hidden;border: 1px solid #eee;">' +
    //            '<textarea id="txt" placeholder="请输入'+ title +'原因" style="height: 220px;width: 103%;border: 0 none;background: #f2f5f8;padding: 20px;"></textarea>' +
    //            '</div>' +
    //            '<div style="text-align: center;margin-top: 20px;">' +
    //            '<button id="cancel" class="layui-btn layui-btn-primary"  type="button">取消</button>' +
    //            '<button id="cfm" style="margin-left: 40px;" class="layui-btn layui-btn-normal" type="button">确认</button>' +
    //            '</div>'
    //        '</div>'
    //
    //        //页面层-自定义
    //        var layer_1 = layer.open({
    //            type: 1,
    //            title: false,
    //            closeBtn: 0,
    //            shadeClose: true,
    //            skin: 'modal_class',
    //            content: html
    //        });
    //        $(".modal_class").css({
    //            width: 525
    //        })
    //
    //        $("#cancel").off("click").on("click", function () {
    //            layer.close(layer_1);
    //        })
    //
    //        $("#cfm").off("click").on("click", function () {
    //            if(callback && typeof callback == "function" ) {
    //                callback($("#txt").val());
    //            }
    //            layer.close(layer_1);
    //
    //        })
    //    }
</script>
</html>
