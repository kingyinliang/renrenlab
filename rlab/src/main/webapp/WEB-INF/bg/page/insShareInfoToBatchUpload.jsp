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

    <script src="${rlab}/common/assets/layui/layui.js"></script>

    <script src="${rlab}/common/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .guide_tip {
            background-color: #e3e9f0;
            font-size: 14px;
            color: #a3b6c9;
            height: 26px;
            line-height: 26px;
            padding-left: 10px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
        }

        /*START 基本信息组件*/
        .lab_info_base {
            width: 100%;
            min-height: 50px;
            padding-left: 120px;
            position: relative;
        }

        .lab_info_base > .lft {
            width: 120px;
            height: 50px;
            position: absolute;
            left: 0;
            top: 0;
            line-height: 50px;
            font-size: 18px;
            color: #7b8da0;
        }

        .lab_info_base > .rt {
            width: 100%;
            min-height: 50px;

        }

        .lab_info_base > .rt > span {
            padding: 10px;
            display: block;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            background-color: #fff;

        }

        .lab_info_base > .rt > a {
            padding: 16px 0;
            display: block;
            color: #16b8be;
            font-size: 16px;
        }

        .lab_info_base > .rt > a:link {
            text-decoration: underline;
        }

        .lab_info_base .lab_search_type1 {
            width: 100%;
        }

        .lab_info_base .lab_search_type1 input {
            width: 250px;
        }

        /*END 基本信息组件*/

        .check_branch {
        }

        .check_branch a {
            display: inline-block;
            height: 30px;
            line-height: 30px;
            background: #fff;
            color: #000;
            padding: 0 15px;
            float: left;
        }

        .check_branch a.cur {
            color: #fff;
            background: #9ea0a2;
        }

        .batch_upload {
            position: relative;
            width: 494px;
            background: #fff;
            height: 240px;
            overflow: hidden;
        }

        .batch_upload > input {
            position: absolute;
            width: 100%;
            height: 110%;
            z-index: 1;
            margin-top: -30px;
        }

        .batch_upload .layui-upload-button {
            height: 240px;
            width: 494px;
            border: 0 none;

        }

        .batch_upload .layui-upload-icon {
            display: none;
        }

        .batch_upload .load_icon {
            width: 100%;
            text-align: center;
            height: 100%;
            background: #fff;
            padding-top: 50px;
            /*position: relative;*/
            /*z-index: 2;*/
        }

        .batch_upload .load_icon i {
            font-size: 60px;
            color: #49aaff;
        }

        .upload_main {
            width: 494px;
            margin-left: 120px;
        }

        .batch_result {
            margin-top: 15px;

        }

        .batch_result .file_info {
            margin-bottom: 12px;
        }

        .file_info .file_name {
            font-size: 12px;
            color: #4c5e70;
        }

        .file_info .file_name i {
            color: #16b8be;
        }

        .file_info .cancel_upload {
            margin-left: 5px;
            cursor: pointer;
        }

        .file_info .cancel_upload:active i {
            color: #0e676a;
            font-weight: 700;
        }

        .file_info .cancel_upload i {
            font-size: 18px;
        }

        .batch_result .file_rate {
            margin-top: 10px;
        }

        .load_btn {

        }

        .lab_info_base form {
            width: 680px;
            line-height: 50px;
            height: 50px;
            background: #fff;
        }

        .lab_info_base form input {
            background: #fff;
            height: 50px;
            border: 0 none;

        }

        .lab_info_base .layui-form-select dl {
            top: 52px !important;
        }
    </style>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
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
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="3"/>
            </jsp:include>
        </div>

        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">仪器管理</a>
                  <a href="">共享信息管理</a>
                  <a href="${rlab}/bg/instrument/upload/uploadInstruments">批量上传</a>
                </span>
            </div>

            <div class="check_branch clearfix">
                <a class="cur" href="${rlab}/bg/instrument/upload/uploadInstruments">批量上传</a>
                <a href="${rlab}/bg/instrument/upload/history?pageNo=1&pageSize=10">历史记录</a>
            </div>

            <%-- 头部tip --%>
            <div class="guide_tip ">
                批量上传仪器的所属机构必须为数据库已有机构，若无此机构须先添加机构再上传文件
            </div>
            <%--功能列表--%>
            <div style="width: 424px;margin-bottom: 20px;margin-top: 26px;">
                <div class="lab_info_base">
                    <div class="lft">机构名称：</div>
                    <div class="rt">
                        <%--STAR搜索下拉--%>
                        <form class="layui-form lab_select_search" action="javascript:void(0)">
                            <div class="layui-inline" style="width: 100%">
                                <div class="layui-input-inline" style="width: 100%">
                                    <select id="orgList" name="modules" lay-verify="required" lay-search=""
                                            lay-filter="orgList">
                                        <option value="">请选择机构</option>
                                    </select>

                                </div>
                            </div>
                        </form>
                        <%--END搜索下拉--%>
                    </div>
                </div>
            </div>
            <div style="width: 424px;">
                <div class="lab_info_base" style="padding-left: 150px;">
                    <div class="lft" style="width: 150px">批量上传文件：</div>
                    <div class="rt">
                        <a download href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E6%96%B0%E7%89%88%E6%89%B9%E9%87%8F%E4%B8%8A%E4%BC%A0%E8%A1%A8%E6%A0%BC%E6%A8%A1%E6%9D%BF%20(%E6%81%A2%E5%A4%8D%E7%9A%84).xlsx">
                            人人实验仪器共享模板文件下载.xlsx
                        </a>
                    </div>
                </div>
            </div>
            <div class="upload_main">
                <div class="batch_upload">
                <input id="loadInput" onchange="loadInsListFile(this)" style="cursor: pointer;" type="file" lay-type="file" name="loadInput">
                <div class="load_icon">
                    <p>
                        <i class="layui-icon">&#xe62f;</i>
                    </p>
                    <p style="line-height: 24px;font-size: 14px;color: #4c5e70;">
                        点击上传文件
                    </p>
                    <p style="line-height: 24px;font-size: 14px;color: #a3b6c9;">
                        支持扩展名：xlsx和xls
                    </p>
                </div>
            </div>
            <div id="batchResult" class="batch_result" style="display:block;">

                <div id="fileInfo" class="file_info">
                        <span id="fileName" class="file_name">
                            <i class="layui-icon">&#xe64d;</i>

                        </span>
                    <span class="cancel_upload" style="display: none">
                            <i class="layui-icon">&#x1006;</i>
                        </span>
                </div>
                <div class="layui-progress" lay-showpercent="yes" lay-filter="file_scheme">
                    <div style="display: block" class="layui-progress-bar" lay-percent="0%"></div>
                </div>

            </div>
            <div style="text-align: center;margin-top: 35px">
                <%--<button class="load_btn" type="button">确认上传</button>--%>
                <button onclick="submitUpload()" class="lab_btn_base lab_btn_type1" type="button"
                        style="width: 140px">确认上传
                </button>
            </div>
            <div id="imgs">

            </div>
        </div>

        <%--<div>--%>
        <%----%>
        <%--</div>--%>
    </div>
</div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    (function () {
        initOrgList();
    })();

    var timer = 0;
    var currentStatus = 0;// 初始化文件上传状态
    var key = "";
    var form;
    layui.use(['form', 'layer', 'element'], function () {
        form = layui.form();
        element = layui.element();
        form.on('select(orgList)', function (data) {
            initProgressBar();
            form.render();
        });
        layui.element().progress('file_scheme', 0 + '%');// 初始化进度条

        $("#batchResult").hide();
    });


    // 上传文件
    function loadInsListFile($this) {
        var files = $this.files;
        var file = files[0];
        var fileName = $this.files[0].name
        var formdata = new FormData();

        if (!$("#orgList").val()) {

            $("#loadInput").val("");
            layer.alert('请先选择机构', {
                skin: 'layui-layer-molv' //样式类名
                , closeBtn: 0
            });
            return false;
        }

        if (verifyFileSuffx("xlsx|xls", file.name)) {
            formdata.append('loadInput', file);
            $.ajax({
                url: '${rlab}/bg/instrument/upload/uploadInstruments/' + $("#orgList").val(),
                type: 'POST',
                data: formdata,
                contentType: false,
                processData: false,
                beforeSend: function () {
                    //返回的参数item，即为当前的input DOM对象

                    clearInterval(timer);
                    currentStatus = 1;// 更新当前文件状态
                    $("#batchResult").show();
                    var n = 0,
                        speed = 10;

                    $("#fileName").html('<i class="layui-icon">&#xe64d;</i>' + fileName);

                    //模拟loading
                    timer = setInterval(function () {
                        var random = Math.random();
                        n = n + random * speed | 0;

                        if (n > 89) {
                            n = 99;
                            clearInterval(timer);
                        }

                        layui.element().progress('file_scheme', n + '%');

                    }, 300 + Math.random() * 1000);

                },
                success: function (data) {
                    if (data.code === 200) {

                        layui.element().progress('file_scheme', 100 + '%');

                        clearInterval(timer);
                        currentStatus = 2;// 更新当前文件状态
                    } else {
                        initProgressBar();
                        layer.alert(data.desc, {
                            skin: 'layui-layer-molv' //样式类名
                            , closeBtn: 0
                        });
                    }
                },
                error: function () {
                    initProgressBar();
                    layer.msg("网络繁忙，请重新上传！")
                }
            });

        } else {
            initProgressBar();
            layer.msg("只支持xlsx和xls格式文件上传");
        }

    }

    /**
     *  初始化进度条（回滚进度条）
     */
    function initProgressBar() {
        $("#loadInput").val("");// 清空文件
        $("#batchResult").hide();// 隐藏滚动条
        clearInterval(timer);// 清除滚动条定时器
        layui.element().progress('file_scheme', 0 + '%');// 回滚进度条
    }

    /**
     * 校验文件后缀名
     * format:"xml|img"
     */
    function verifyFileSuffx(format, fileName) {
        var index = fileName.lastIndexOf("."),
            suffix = fileName.slice(index + 1),
            formatArr = format.split("|"),
            flag = false;

        for (var i = 0; i < formatArr.length; i++) {
            if (formatArr[i] === suffix) {
                flag = true;
                break;
            }
        }

        return flag;
    }

    /**
     * 初始化机构列表
     */
    function initOrgList() {

        $.ajax({
            url: BASE_URL + "/bg/share/queryorg?key=",
            type: 'get',
            dataType: 'json',
            contentType: 'application/json',
            success: function (data) {

                var list;
                var orgListTag = $("#orgList");
                if (data.code === 0 && data.payload.length > 0) {
                    list = data.payload;
                    for (var i = 0; i < list.length; i++) {
                        orgListTag.append('<option value="' + list[i].orgOid + '">' + list[i].orgName + '</option>')
                    }
                    form.render("select");
                } else {
                    layer.msg("机构获取失败，请刷新页面");
                }

            },
            error: function () {
                layer.msg("机构获取失败，请刷新页面");
            }
        });

    }

    /**
     * 确定上传
     */
    function submitUpload() {

        if (currentStatus === 0) {

            layer.alert('请先上传文件！', {
                skin: 'layui-layer-molv' //样式类名
                , closeBtn: 0
            });

        } else if (currentStatus === 1) {

            layer.alert('文件还未加载完毕！', {
                skin: 'layui-layer-molv' //样式类名
                , closeBtn: 0
                , anim: 1 //动画类型
            });

        } else {
            initProgressBar();// 初始化进度条
            layer.alert('文件上传成功！', {
                skin: 'layui-layer-molv' //样式类名
                , closeBtn: 0
                , anim: 1 //动画类型
            });
        }
    }

</script>
</html>
