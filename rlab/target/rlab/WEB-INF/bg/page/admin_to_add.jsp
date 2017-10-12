<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>
    <%--<script src="${rlab}/common/assets/layui/layui.js"></script>--%>

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
                        <label class="form_coomon" style="width: 325px; margin-left: 68px;">
                            <s>初始密码：</s>
                            <div class="ipt_min">
                                <input id="pw" type="text" placeholder="输入初始密码">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px;">
                            <s>个人姓名：</s>
                            <div class="ipt_min">
                                <input id="name" type="text" placeholder="输入员工姓名">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px;margin-left: 68px;">
                            <s>联系电话：</s>
                            <div class="ipt_min">
                                <input id="phone" type="text" placeholder="输入联系电话">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px;">
                            <s>工&nbsp;&nbsp;&nbsp;号：</s>
                            <div class="ipt_min">
                                <input id="number" type="text" placeholder="输入工号">
                            </div>
                        </label>
                        <label class="form_coomon" style="width: 325px;margin-left: 68px;">
                            <s>部&nbsp;&nbsp;&nbsp;门：</s>
                            <div class="ipt_min">
                                <select id="department" lay-filter="changeDepartment">
                                    <%--<option value="">请选择...</option>--%>
                                    <option value="总裁办" >总裁办</option>
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
                        <label class="form_coomon" style="width: 325px;">
                            <s>角色选择：</s>
                            <div class="ipt_min" style="">
                                <select id="changeAdmin" lay-filter="changeAdmin">
                                    <%--<option value="">请选择...</option>--%>
                                    <c:if test="${'超级管理员'.equals(sessionScope.u_r_name)}">
                                        <option value="10008">高级管理员</option>
                                    </c:if>
                                    <option value="10006"}>中级管理员</option>
                                    <option value="10005" selected>初级管理员</option>
                                </select>
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
                        <div id="p1" class="range_item">
                            <p>
                                <span class="title" style="color: #49aaff;">查询权限</span>
                            </p>
                            <div>
                                <span>用户模块权限</span>
                                <span>机构模块权限</span>
                                <span>仪器模块权限</span>
                                <span>微需求模块权限</span>
                                <span>创新券模块权限</span>
                                <span>认证服务商模块权限</span>
                            </div>
                        </div>
                        <%--编辑权限--%>
                        <div id="p2" class="range_item">
                            <p>
                                <span class="title" style="color:#16b8be">编辑权限<i>（仅包含创建/修改权限）</i></span>
                            </p>
                            <div>
                                <span>用户模块权限</span>
                                <span>机构模块权限</span>
                                <span>仪器模块权限</span>
                                <span>微需求模块权限</span>
                                <span>认证服务商权限</span>
                            </div>
                        </div>
                        <%--审核权限--%>
                        <div id="p3" class="range_item">
                            <p>
                                <span class="title" style="color:#fba45f">审核权限</span>
                            </p>
                            <div>
                                <span>用户身份审核权限</span>
                                <span>机构身份审核权限</span>
                                <span>认证服务商审核权限</span>
                                <span>微需求审核权限</span>
                                <span>创新券审核权限</span>
                            </div>
                        </div>
                        <%--撤销权限--%>
                        <div id="p4" class="range_item"  style="display: ${'超级管理员'.equals(sessionScope.u_r_name)?'block':'none'}">
                            <p>
                                <span class="title" style="color:#f75f7c">查询权限<i>（仅包含撤销/删除权限）</i></span>
                            </p>
                            <div>
                                <span>用户黑名单权限</span>
                                <span>机构撤销权限</span>
                                <span>仪器下架权限</span>
                                <span>微需求撤销权限</span>
                                <span>创新券模块权限</span>
                                <span>认证服务商撤销权限</span>
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
    var admin ='10005';

    function changeIpt() {

    }

    layui.use(['form', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();

        form.on('select(changeDepartment)', function (data) {
            deparment = data.value;
        });

        form.on('select(changeAdmin)', function (data) {
            admin = data.value;
            var rName = "";
            if (admin == "10008") {
                rName = "高级管理员";
            } else if (admin == "10006") {
                rName = "中级管理员";
            } else if (admin == "10005") {
                rName = "初级管理员";
            }

            getLimitByGrade(rName, function (data) {
                var permission = dealPermission(data.rPermisssion);
                if (permission.p1 == 1) {
                    $("#p1").show(400);
                } else {
                    $("#p1").hide(400);
                }

                if (permission.p2 == 1) {
                    $("#p2").show(400);
                } else {
                    $("#p2").hide(400);
                }

                if (permission.p3 == 1) {
                    $("#p3").show(400);
                } else {
                    $("#p3").hide(400);
                }

                if (permission.p4 == 1) {
                    $("#p4").show(400);
                } else {
                    $("#p4").hide(400);
                }
            });

        });
        initSelect();
    });

    function dealPermission(rPermisssion) {
        return {
            p1: rPermisssion.slice(-1),
            p2: rPermisssion.slice(-2, -1),
            p3: rPermisssion.slice(-3, -2),
            p4: rPermisssion.slice(-4, -3),
        }
    }


    function initSelect() {
        var rName;
        var admin = $("#changeAdmin").val();
        if (admin == "10008") {
            rName = "高级管理员";
        } else if (admin == "10006") {
            rName = "中级管理员";
        } else if (admin == "10005") {
            rName = "初级管理员";
        }
        getLimitByGrade(rName, function (data) {
            var permission = dealPermission(data.rPermisssion);
            if (permission.p1 == 1) {
                $("#p1").show();
            } else {
                $("#p1").hide();
            }

            if (permission.p2 == 1) {
                $("#p2").show();
            } else {
                $("#p2").hide();
            }

            if (permission.p3 == 1) {
                $("#p3").show();
            } else {
                $("#p3").hide();
            }

            if (permission.p4 == 1) {
                $("#p4").show();
            } else {
                $("#p4").hide();
            }
        });

    }
    // 获取权限，根据管理员级别
    function getLimitByGrade(rName, callback) {
        $.ajax({
            url: BASE_URL + '/bg/user/get_role_permission?rName=' + rName,
            type: 'GET',
            beforeSend: function () {

            },
            success: function (data) {
                console.log(data);
                if (data.code === 0) {
                    callback(data.payload);
                }
            },
            error: function () {
                callback([0, 1, 3]);
            },
            complete: function (data) {

            }
        })
    }


    function cfmAlter() {
        var email = $("#email").val();
        var name = $("#name").val();
        var num = $("#number").val();
        var pw = $.md5($("#pw").val());
        var phone = $("#phone").val();

        var emailReg = /[\w!#$%&'*+/=?^_`{|}~-]+(?:\.[\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\w](?:[\w-]*[\w])?\.)+[\w](?:[\w-]*[\w])?/;
        if (!emailReg.test(email)) {
            layer.msg("邮箱格式不正确");
            return;
        }

        var pwReg = /^(?=.*[a-zA-z])(?=.*[0-9])([a-zA-z0-9\x21-\x7e]{6,20})$/;
        if (!pwReg.test($("#pw").val())) {
            layer.msg("密码格式不正确");
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
            'uNickname': name,
            'uMobile': phone,
            'uDepartment': deparment,
            'uJobNumber': num,
            'uPassword': pw,
            'rRid': admin
        };

        $.ajax({
            url: '${rlab}/bg/user/role_add',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    window.location.href = '${rlab}/bg/user/role_manage'
                } else if(data.code == 2000){
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
