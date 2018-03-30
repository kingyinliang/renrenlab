<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>
    <%--<script src="${rlab}/common/assets/layui/layui.js"></script>--%>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <link rel="stylesheet" href="${rlab}/bg/css/admin.css">
    <style type="text/css">

        /* START自定义勾选框公用样式1*/
        label.ckbox {
            display: block;
            position: relative;
            width: 14px;
            height: 14px;
            background: green;
            /*overflow: hidden;*/
            cursor: pointer;
        }

        label.cancel {
            background: url("${rlab}/mobile/imgs/icon/meigouxuan.png") no-repeat 0px 0px/14px 14px;
        }

        label.checked {
            background: url("${rlab}/mobile/imgs/icon/gouxuan.png") no-repeat 0px 0px/14px 14px;
        }

        .ckbox input {
            position: absolute;
            left: -20px;
        }

        /* END自定义勾选框公用样式1*/
        .admin_info {
            /*overflow: hidden;*/
            padding-top: 16px;
        }

        .admin_info label {
            float: left;
            margin-bottom: 45px;
        }

        .admin_info label .ipt_min {
        }

        .admin_info label .ipt_min input {
            width: 100%;
            padding-left: 8px;
            color: #2c415a;
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
                <jsp:param name="firstMenu" value="9"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--头部面包屑导航标签--%>
            <div class="hdNav">
                <span class="layui-breadcrumb">
                      <a href="${rlab}/bg/user/role_manage">角色权限管理</a>
                     <a href="#">管理员新增</a>
                </span>
            </div>

            <%--内容部分--%>
            <div class="admin">
                <form class="layui-form" action="">
                    <%--个人信息部分--%>
                    <div class="admin_info clearfix">
                        <label class="form_coomon" style="width: 325px;">
                            <s>邮&nbsp;&nbsp;&nbsp;&nbsp;箱：</s>
                            <div class="ipt_min">
                                <input id="email" type="text" placeholder="请输入邮箱">
                            </div>
                        </label>
                        <%--<label class="form_coomon" style="width: 325px; margin-left: 68px;">--%>
                            <%--<s>初始密码：</s>--%>
                            <%--<div class="ipt_min">--%>
                                <%--<input id="pw" type="text" placeholder="输入初始密码">--%>
                            <%--</div>--%>
                        <%--</label>--%>
                        <label class="form_coomon" style="width: 325px; margin-left: 68px;">
                            <s>个人姓名：</s>
                            <div class="ipt_min">
                                <input id="name" type="text" placeholder="输入员工姓名">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px">
                            <s>联系电话：</s>
                            <div class="ipt_min">
                                <input id="phone" type="text" placeholder="输入联系电话">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px; margin-left: 68px;">
                            <s>工&nbsp;&nbsp;&nbsp;号：</s>
                            <div class="ipt_min">
                                <input id="number" type="text" placeholder="输入工号">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px;">
                            <s>部&nbsp;&nbsp;&nbsp;门：</s>
                            <div class="ipt_min">
                                <select id="department" lay-filter="changeDepartment">
                                    <%--<option value="">请选择...</option>--%>
                                    <option value="总裁办">总裁办</option>
                                    <option value="运营部">运营部</option>
                                    <option value="产品部">产品部</option>
                                    <option value="市场部" selected>市场部</option>
                                    <option value="技术部">技术部</option>
                                    <option value="客服部">客服部</option>
                                </select>
                            </div>
                        </label>
                    </div>

                    <%-- START角色切换公用--%>
                    <div class="switch clearfix">
                        <label class="form_coomon" style="width: 325px;height: auto">
                            <s>角色选择：</s>
                            <div class="ipt_min" style="width: 400px;height: auto;margin-bottom: 15px">
                                <c:forEach items="${roleInfos}" var="info">
                                    <input type="checkbox" name="changeAdmin" title="${info.roleName}"
                                           lay-filter="admin" value="${info.roleId}">
                                </c:forEach>
                            </div>
                        </label>
                        <button class="lab_btn_base lab_btn_type1 " type="button" onclick="cfmAlter();">添加管理员</button>
                    </div>
                </form>


                <%--权限范围列表--%>
                <div class="limit_list" id="list">
                    <s>权限范围：</s>
                    <div class="list">

                        <%--查询权限--%>
                        <div id="p1" class="range_item" style="display: block">
                            <p>
                                <span class="title" style="color: #49aaff;">查询权限</span>
                            </p>
                            <div class="role">
                                <c:forEach items="${query}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}" disabled>${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                        <%--编辑权限--%>
                        <div id="p2" class="range_item">
                            <p>
                                <span class="title" style="color:#16b8be">编辑权限<i>（仅包含创建/修改权限）</i></span>
                            </p>
                            <div class="role">
                                <c:forEach items="${modify}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}" disabled>${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                        <%--审核权限--%>
                        <div id="p3" class="range_item">
                            <p>
                                <span class="title" style="color:#fba45f">审核权限</span>
                            </p>
                            <div class="role">
                                <c:forEach items="${audit}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}" disabled>${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                        <%--撤销权限--%>
                        <div id="p4" class="range_item">
                            <p>
                                <span class="title" style="color:#f75f7c">查询权限<i>（仅包含撤销/删除权限）</i></span>
                            </p>
                            <div class="role">
                                <c:forEach items="${del}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}" disabled>${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- END角色切换公用--%>

            </div>
        </div>
    </div>
</div>
</div>
</div>

</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<script src="${rlab}/bg/js/main.js"></script>
<script type="text/javascript">
    var form, layer;
    var deparment = '市场部';
    var admin = [];

    layui.use(['form', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();

        form.on('select(changeDepartment)', function (data) {
            deparment = data.value;
        });

        form.on('checkbox(admin)', function (data) {
            var seledid = data.value * 1;
            if (data.elem.checked) {
                if (admin.indexOf(seledid) == -1) {
                    admin.push(seledid);
                }
            } else {
                admin.splice(admin.indexOf(seledid), 1);
            }
            if (admin.length == 0) {
                $("#list input").each(function () {
                    $(this).removeAttr("checked");
                    $(this).parent().removeClass("checked").addClass("cancel");
                });
            }
            $.ajax({
                url: BASE_URL + '/bg/manager/getPIds',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(admin),
                beforeSend: function () {

                },
                success: function (data) {
                    if (data.code === 0) {
                        data = data.payload;
                        // 初始化（清空）当前页面的勾选框
                        $("#list input").each(function () {
                            $(this).removeAttr("checked");
                            $(this).parent().removeClass("checked").addClass("cancel");
                        });
                        if (!data.length) {
                            return;
                        }
                        for (var i = 0; i < data.length; i++) {
                            $(".role input").each(function () {
                                if ($(this).val() == data[i]) {
                                    $(this).prop("checked", true);
                                }
                            });
                        }
                    }
                },
                error: function () {
                },
                complete: function (data) {

                }
            })
        });
    });

    function cfmAlter() {
        var email = $("#email").val();
        var name = $("#name").val();
        var num = $("#number").val();
        var phone = $("#phone").val();

        var emailReg = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
        if (!emailReg.test(email)) {
            layer.msg("邮箱格式不正确");
            return;
        }



        var nameReg = /[\u4e00-\u9fa5]{2,5}/;
        if (!nameReg.test(name)) {
            layer.msg("个人姓名格式不正确");
            return;
        }

        var numReg = /^[0-9]{1,9}$/;
        if (!numReg.test(num)) {
            layer.msg("工号格式不正确");
            return;
        }

        var phoneReg = /^1[34578]\d{9}$/;
        if (!phoneReg.test(phone)) {
            layer.msg("联系电话格式不正确");
            return;
        }

        var data = {
            'uEmail': email,
            'uName': name,
            'uMobile': phone,
            'department': deparment,
            'jobNum': num,
            'roleIds': JSON.stringify(admin)
        };

        $.ajax({
            url: '${rlab}/bg/manager/add',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    window.location.href = '${rlab}/bg/manager/list'
                } else if (data.code == 2000) {
                    layer.msg("该工号已添加为管理员")
                } else {
                    layer.msg(data.message)
                }
            },
            error: function () {
                alert("fail");
            },
            complete: function () {

            }
        })
    }

</script>
</html>
