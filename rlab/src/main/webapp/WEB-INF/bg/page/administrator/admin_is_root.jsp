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

        /*START是否确认修改弹窗*/
        .acceptModal {
            -webkit-border-radius: 6px!important;
            -moz-border-radius: 6px!important;
            border-radius: 6px!important;
            width:auto!important;
        }
        .acceptModal button {
            cursor: pointer;
        }
        /*END是否确认修改弹窗*/
        .view span{
            color: #b2b2b2;
            font-size: 18px;
            margin-right: 20px;
        }
        .add s{
            font-size: 18px;
        }
        #add{
            width: 300px;
            height: 52px;
            line-height: 52px;
            padding-left: 8px;
        }
        .view{
            border-top: 1px dashed #b2b2b2;
            border-bottom: 1px dashed #b2b2b2;
            margin: 20px 0;
            padding: 10px 0;
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
                <jsp:param name="secondMenu" value="3"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--头部面包屑导航标签--%>
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a href="${rlab}/bg/user/role_manage">角色权限管理</a>
                    <a href="#">管理员权限管理</a>


                </span>
            </div>
            <div class="add clearfix">
                <s>添加角色：</s>
                <input type="text" id="add" placeholder="请输入角色名称">
                <button class="lab_btn_base lab_btn_type1 " type="button" onclick="addrole();" style="float: right">
                    添加角色
                </button>
            </div>
            <div class="view">
                <c:forEach items="${roleInfos}" var="info">
                    <span>${info.roleName}<label class="lab-close-2" style="cursor: pointer" onclick="delroid(this)"  data-ro-id="${info.roleId}"></label></span>
                </c:forEach>
            </div>
            <div class="admin">
                <form class="layui-form" action="">
                    <%-- START角色切换公用--%>
                    <div class="switch clearfix">
                        <label class="form_coomon" style="width: 325px;">
                            <s>角色选择：</s>
                            <div class="ipt_min" style="">
                                <select id="changeAdmin" lay-filter="changeAdmin">
                                    <c:forEach items="${roleInfos}" var="info">
                                        <option value="${info.roleId}">${info.roleName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </label>
                        <button class="lab_btn_base lab_btn_type1 " type="button" onclick="cfmAlter();">确认修改</button>
                    </div>
                </form>


                <%--权限范围列表--%>
                <div class="limit_list" id="list">
                    <s>权限范围：</s>
                    <div class="list">
                        <%--查询权限--%>
                        <div id="p1" class="range_item">
                            <p>
                                <label class="ckbox cancel">
                                    <input id="inputT1" data-types="T1" type="checkbox" onclick="changeCheck(this)" onchange="changes()">
                                </label>
                                <span class="title">查询权限</span>
                            </p>
                            <div class="role">
                                <c:forEach items="${query}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}">${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                        <%--编辑权限--%>
                        <div id="p2" class="range_item">
                            <p>
                                <label class="ckbox cancel" >
                                    <input type="checkbox" data-types="T2" onclick="changeCheck(this)" onchange="changes()">
                                </label>
                                <span class="title">编辑权限<i>（仅包含创建/修改权限）</i></span>
                            </p>
                            <div class="role">
                                <c:forEach items="${modify}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}">${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                        <%--审核权限--%>
                        <div id="p3" class="range_item">
                            <p>
                                <label class="ckbox cancel">
                                    <input type="checkbox" data-types="T3" onclick="changeCheck(this)" onchange="changes()">
                                </label>
                                <span class="title">审核权限</span>
                            </p>
                            <div class="role">
                                <c:forEach items="${audit}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}">${info.url}</span>
                                </c:forEach>
                            </div>
                        </div>
                            <%--撤销权限--%>
                        <%--<div id="p4" class="range_item"  style="display: ${'超级管理员'.equals(sessionScope.u_r_name)?'block':'none'}">--%>
                        <div id="p4" class="range_item">
                            <p>
                                <label class="ckbox cancel">
                                    <input type="checkbox" data-types="T4" onclick="changeCheck(this)" onchange="changes()">
                                </label>
                                <span class="title">撤销权限<i>（仅包含撤销/删除权限）</i></span>
                            </p>
                            <div class="role">
                                <c:forEach items="${del}" var="info">
                                    <span><input type="checkbox" name="${info.permissionId}"
                                                 value="${info.permissionId}">${info.url}</span>
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

    var isChangeFlag = true;// 判断是否修改当前权限列表
    var form, layer;
    var ipt = $(".role input");
    var admins=$("#changeAdmin").val();
    layui.use(['form', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();

        form.on('select(changeAdmin)', function (data) {
            // 1.判断当前页面是否修改
            // 根据不同权限，显示列表
            admins = data.value;

            // 2.获取当前页面的权限选项
            getLimitByGrade(admins, function (data) {

                // 初始化（清空）当前页面的勾选框
                $("#list input").each(function () {
                    $(this).removeAttr("checked");
                    $(this).parent().removeClass("checked").addClass("cancel");
                });
                if(!data.length){
                    return;
                }
                for (var i = 0; i < data.length; i++) {
                    ipt.each(function () {
                        if ($(this).val() == data[i]) {
                            $(this).prop("checked", true);
                        }
                    });
                }

                // 如果存在改动
                // if (!isChangeFlag){
                if (false){
                    var html =
                        '<div style="padding: 0 30px;background-color: #fff;width: 380px;overflow: hidden;border-bottom: 2px solid #16b8bd;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;">\
                                <p style="text-align:center;font-size: 18px;color: #666;height: 120px;line-height:120px;">是否保存上个页面修改？</p>\
                                <p style="margin-top: 20px;margin-bottom: 28px;">\
                                <button id="cancelReject" type="button" style="background-color: #fff;color:#cecece;border: 1px solid #ccc;width: 156px;height: 44px;">取消</button>\
                                <button id="cfmReject" type="button" style="background-color: #15b8bd;color:#fff;border:0 none;width: 156px;height: 44px;">确定</button>\
                                </p>\
                                </div>';

                    //页面层-自定义
                    var layer2 = layer.open({
                        type: 1,
                        title: false,
                        closeBtn: 0,
                        shadeClose: false,
                        skin: 'acceptModal',
                        content: html
                    });

                    $("#cancelReject").off("click").on("click", function () {
                        layer.close(layer2);
                        isChangeFlag = true;
                    });

                    $("#cfmReject").off("click").on("click",function () {
                        isChangeFlag = true;
                        // todo:发送ajax去修改
                    });

                }

            });
//            initRadio();
         });
     });
    getLimitByGrade(admins, function (data) {

        // 初始化（清空）当前页面的勾选框
        $("#list input").each(function () {
            $(this).removeAttr("checked");
            $(this).parent().removeClass("checked").addClass("cancel");
        });
        if(!data.length){
            return;
        }
        for (var i = 0; i < data.length; i++) {
            ipt.each(function () {
                if ($(this).val() == data[i]) {
                    $(this).prop("checked", true);
                }
            });
        }

        // 如果存在改动
        // if (!isChangeFlag){
        if (false){
            var html =
                '<div style="padding: 0 30px;background-color: #fff;width: 380px;overflow: hidden;border-bottom: 2px solid #16b8bd;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;">\
                        <p style="text-align:center;font-size: 18px;color: #666;height: 120px;line-height:120px;">是否保存上个页面修改？</p>\
                        <p style="margin-top: 20px;margin-bottom: 28px;">\
                        <button id="cancelReject" type="button" style="background-color: #fff;color:#cecece;border: 1px solid #ccc;width: 156px;height: 44px;">取消</button>\
                        <button id="cfmReject" type="button" style="background-color: #15b8bd;color:#fff;border:0 none;width: 156px;height: 44px;">确定</button>\
                        </p>\
                        </div>';

            //页面层-自定义
            var layer2 = layer.open({
                type: 1,
                title: false,
                closeBtn: 0,
                shadeClose: false,
                skin: 'acceptModal',
                content: html
            });

            $("#cancelReject").off("click").on("click", function () {
                layer.close(layer2);
                isChangeFlag = true;
            });

            $("#cfmReject").off("click").on("click",function () {
                isChangeFlag = true;
                // todo:发送ajax去修改
            });

        }

    });

    function delroid($this) {
        $this=$($this);
        var data={
            'roleId':$this.data("roId"),
        }
        $.ajax({
            url: '${rlab}/bg/manager/delRole',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                //console.log(data);
                if (data.code == 0) {
                    location.reload();
                }else {
                    alert(data.description);
                }
            },
            error: function () {
                alert("fail");
            },
            complete: function () {

            }
        })
    }
//
//    function initRadio() {
//        var admin = $("#changeAdmin").val();;
//        var rName = "";
//        if (admin == "10008") {
//            rName = "高级管理员";
//        } else if (admin == "10006") {
//            rName = "中级管理员";
//        } else if (admin == "10005") {
//            rName = "初级管理员";
//        }
//
//        // getLimitByGrade(rName, function (data) {
//        //     console.log(data);
//        //     var permission = dealPermission(data.rPermisssion);
//        //     if (permission.p1 == 1) {
//        //         $("#p1 input").prop("checked",true);
//        //         $("#p1 input").parent().removeClass("cancel").addClass("checked");
//        //     }
//        //
//        //
//        //     if (permission.p2 == 1) {
//        //         $("#p2 input").prop("checked",true);
//        //         $("#p2 input").parent().removeClass("cancel").addClass("checked");
//        //     }
//        //
//        //     if (permission.p3 == 1) {
//        //         $("#p3 input").prop("checked",true);
//        //         $("#p3 input").parent().removeClass("cancel").addClass("checked");
//        //     }
//        //
//        //     if (permission.p4 == 1) {
//        //         $("#p4 input").prop("checked",true);
//        //         $("#p4 input").parent().removeClass("cancel").addClass("checked");
//        //     }
//        // });
//
//    }
    // 获取权限，根据管理员级别
    function getLimitByGrade(rName, callback) {

        $.ajax({
            url: BASE_URL + '/bg/manager/getPIds',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify([rName]),
            beforeSend: function () {

            },
            success: function (data) {
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

    function addrole() {
        if ($("#add").val() == '') {
            alert("请输入角色名称");
            return;
        }
        var param = {
            roleName: $("#add").val(),
        }
        $.ajax({
            url: '${rlab}/bg/manager/addRole',
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify(param),
            beforeSend: function () {

            },
            success: function (data) {
                if (data.code === 0) {
                    location.reload();
                }
            },
            error: function () {

            },
            complete: function () {

            }
        })
    }
    // 确认修改
    function cfmAlter() {

//        if(!$("#inputT1").prop("checked")){
//            layer.msg("您必须")
//            return false;
//        }
        var permissionIds=[];
        ipt.each(function () {
            if($(this).prop("checked")){
                permissionIds.push($(this).val());
            }
        })

        var param = {
            roleId:admins,
            permissionIds:permissionIds,
        }

        alterLimitByPost(param,function (data) {
            console.log(data)
        })
        
    }

    // 发送修改http
    function alterLimitByPost(param, callback) {
        $.ajax({
            url: '${rlab}/bg/manager/modifyRolePermission',
            type: 'POST',
            contentType: "application/json",
            data: JSON.stringify(param),
            beforeSend: function () {

            },
            success: function (data) {
                if (data.code === 0) {
                    callback(data);
                }
            },
            error: function () {

            },
            complete: function () {

            }
        })
    }

    // 监听状态
    function changes() {
        isChangeFlag = false;
    }

    // 按鈕切換
    function changeCheck($this) {
        var checkedFlag = $($this).prop("checked");
        var $_this = $($this);

        if (checkedFlag) {
            $_this.parent().removeClass("cancel").addClass("checked");
            $_this.parents(".range_item").find(".role input").prop("checked", true);
        } else {
            $_this.parent().removeClass("checked").addClass("cancel");
            $_this.parents(".range_item").find(".role input").prop("checked", false);
        }

//        // 判断是哪个类型的勾选框
//        var CUR_T = $.trim($_this.data("types"));
//
//        if(CUR_T == "T1") {
//            if(!checkedFlag){
//                $("#list input").not($_this).each(function () {
//                    $(this).parent().removeClass("checked").addClass("cancel");
//                    $(this).removeAttr("checked");
//                })
//            }
//        }else{
//            if(checkedFlag){
//                $("#list input").eq(0).prop("checked", true);
//                $("#list input").eq(0).parent().removeClass("cancel").addClass("checked");
//            }
//        }


    }

//    function dealPermission(rPermisssion) {
//        return {
//            p1:rPermisssion.slice(-1),
//            p2:rPermisssion.slice(-2,-1),
//            p3:rPermisssion.slice(-3,-2),
//            p4:rPermisssion.slice(-4,-3),
//        }
//    }
</script>
</html>
