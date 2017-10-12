<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../config/taglibs.jsp" %>


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
                <jsp:param name="firstMenu" value="7"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">创新券管理</a>
                  <a href="">认证审核</a>
                  <a href="">认证审核详情</a>
                </span>
            </div>

            <%--②认证审核详情--%>
            <div class="result">
                <p>
                    <span>申请人账号：</span>
                    1111
                </p>
                <p>
                    <span>申请时间：</span>
                    2017-08-18 16:20
                </p>
                <p>
                    <span>审核状态：</span>
                    <s class="status">待审核</s>
                </p>
                <p>
                    <span>机构名称：</span>
                    人人实验科技有限公司
                </p>
                <p>
                    <span>项目名称：</span>
                    人人实验科技有限公司
                </p>

                <p>
                    <span>项目申请表：</span>
                    <a href="" download="download">项目申请表.doc</a> <br>
                </p>

                <p style="margin-top: 100px">
                    <span>项目合同：</span>
                    <a href="" download="download">合同文件名.pdf</a> <br>
                </p>
                <p>
                    <span>项目发票：</span>
                    <a href="" download="download">这是发票的连接.pdf</a> <br>
                </p>
                <p>
                    <span>成果证明材料：</span>
                    <a href="" download="download">这是成果证明材料.pdf</a> <br>
                </p>
            </div>
            <%--操作按钮--%>
            <div style="text-align: center;" >
                <button class="lab_btn_base  lab_btn_type1" onclick="acceptStatus()" type="button">审核通过</button>
                <button class="lab_btn_base  lab_btn_type5" onclick="rejectStatus()" type="button" style="margin-left: 26px;">审核不通过</button>
            </div>
            <div style="text-align: center;margin-top: 40px;">
                <button class="lab_btn_base  lab_btn_type1" onclick="acceptStatus()" type="button">放款</button>
            </div>
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
    function acceptStatus() {
        $.ajax({
            url: "${rlab}/bg/baseins/category?level=1",
            type: 'POST',
            data: 1,
            contentType: "application/x-www-form-urlencoded",
            success: function (data) {

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
            console.log(txt);// 输入的拒绝原因
            $.ajax({
                url: "${rlab}/bg/baseins/category?level=1",
                type: 'POST',
                data: 1,
                contentType: "application/x-www-form-urlencoded",
                success: function (data) {

                },
                complete: function () {

                },
                error: function () {

                }
            })
        })
    }
</script>
</html>
