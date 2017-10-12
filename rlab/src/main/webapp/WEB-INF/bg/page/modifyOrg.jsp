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
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .infModify p, .infP {
            line-height: 50px;
            font-size: 16px;
            color: #7b8da0;
            margin-top: 20px;
        }

        .infModify p em, .infP em {
            color: #ff4747;
            font-size: 18px;
            line-height: 50px;
            margin-left: 5px;
            font-weight: bold;
        }

        .infModify p input[type="text"] {
            width: 80%;
            height: 50px;
            padding-left: 20px;
            margin-left: 13px;
            border-radius: 5px;
        }

        .infP img {
            width: 110px;
            height: 110px;
        }

        .insImg {
            width: 110px;
            height: 110px;
            float: left;
            display: block;
            border-radius: 15px;
            position: relative;
            margin: 0 7px 0 13px;
        }

        .insImg .lab-close-2 {
            position: absolute;
            right: -5px;
            top: -5px;
            color: #49aaff;
            font-size: 20px;
            cursor: pointer;
        }

        .file {
            cursor: pointer;
        }

        #addImageInput {
            display: none;
        }

        .fileText {
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -25px;
            margin-left: -32px;
        }

        .listNature {
            margin-left: 13px;
        }

        .infTable {
            width: 540px;
            float: left;
            margin-left: 13px;
        }

        .infTable table {
            width: 100%;
        }

        .infArg {
            background: #6693c8;
            color: white;
        }

        .infTable input {
            width: 100%;
            height: 100%;
        }

        .infTable .layui-table tr:hover {
            background-color: white;
        }

        .addDes button {
            background: white;
            color: #16b8be;
            border: 1px solid #16b8be;
            border-radius: 3px;
            margin-left: 13px
        }

        .addDes button:hover {
            color: #16b8be !important;
        }

        .addDesmain {
            margin-bottom: 30px;
        }

        .addDesmain a {
            color: #16b8be;
            margin-right: 11px;
            float: right;
            cursor: pointer;
        }

        .addDesmain a label {
            margin-right: 5px;
        }

        .desMain {
            margin-top: 10px;
            background: white;
            padding: 23px;
            border-radius: 2px;
        }

        .desMain h2 {
            font-size: 20px;
            color: #4c5e70;
            font-weight: bold;
        }

        .desMain p {
            font-size: 16px;
            color: #627587;
            line-height: 30px;
        }

        .save {
            text-align: center;
            margin-top: 60px;
        }

        .save button {
            width: 140px;
            height: 50px;
            background: #49aaff;
        }

        .shade .tit {
            width: 600px;
            height: 330px;
            background: #f2f5f8;
            position: absolute;
            margin: auto;
            margin-left: -320px;
            margin-top: -185px;
            top: 50%;
            left: 50%;
            padding: 20px;
            border-radius: 1px;
            -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
            -moz-box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
            box-shadow: 0 5px 15px rgba(0, 0, 0, .5);
        }

        .tit input {
            width: 100%;
            height: 50px;
            padding-left: 20px;
            border-radius: 5px;
        }

        .tit p {
            line-height: 30px;
        }

        .tit textarea {
            width: 100%;
            height: 110px;
        }

        .tit button {
            float: right;
            margin-top: 15px;
        }

        .listNature {
            width: 230px;
            position: relative;
            font-size: 14px !important;
            color: #333333;
        }

        .input {
            width: 100%;
            height: 100%;
            padding: 0 30px 0 10px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            cursor: pointer;
        }

        .dldd {
            display: none;
            position: absolute;
            left: 0;
            top: 51px;
            padding: 5px 0;
            z-index: 999;
            min-width: 100%;
            border: 1px solid #d2d2d2;
            max-height: 300px;
            overflow-y: auto;
            background-color: #fff;
        }

        .dldd dd {
            padding: 0 10px;
            cursor: pointer;
        }

        .dldd dd:hover {
            color: white;
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
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>仪器管理</cite></a>
                    <a href="${rlab}/bg/baseins/list">基本信息管理</a>
                    <a><cite>共享基本信息修改</cite></a>
                </span>
            </div>
            <div class="infModify">
                <p>仪器名称
                    <em>*</em>：
                    <input id="mname" class="insName" placeholder="" value="${detail.insName}" type="text"
                           maxlength="100">
                </p>
                <p>仪器型号
                    <em>*</em>：
                    <input id="mtype" type="text" class="insType" placeholder="" value="${detail.insMode}"
                           maxlength="100">
                </p>
                <div class="clearfix infP">
                    <span style="float: left">仪器图片<em>*</em>：</span>
                    <div class="imageList clearfix" id="imageList" style="float: left;">
                        <c:if test="${detail.insPic != null && detail.insPic.size() > 0}">
                            <c:forEach items="${detail.insPic}" var="info">
                                <a class="insImg imgs" data-img-src="${info}">
                                    <img src="${info}" alt="">
                                    <span class="lab-close-2" onclick="removeImg(this)"></span>
                                </a>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div class="addImageBtn clearfix" id="addImageBtn" style="float: left">
                        <a class="insImg file">
                            <img src="${rlab}/bg/img/add_status_default.png" alt="">
                            <span class="fileText"></span>
                        </a>
                        <input id="addImageInput" type="file" name="file">
                    </div>
                </div>
                <p>仪器品牌<em>*</em>：
                    <input id="insBrand" class="insBrand" placeholder="请输入仪器品牌"
                           value="${detail.insBrand ==null ?"":detail.insBrand}" type="text" maxlength="100">
                </p>
                <p>仪器产地<em>*</em>：
                    <input id="insOrigin" class="insAddress" placeholder="请输入仪器产地"
                           value="${detail.insOrigin==null ?"":detail.insOrigin}" type="text" maxlength="100">
                </p>
                <div class="clearfix infP">
                    <span style="float: left">仪器分类<em>*</em>：</span>
                    <div class="listNature" id="instype1" style="width: 170px;">
                        <form class="layui-form" style="height: 50px;width: 170px">
                            <select name="city" lay-verify="" lay-filter="instype1">
                                <option value="">请选择认证状态</option>
                                <option value="0">全部</option>
                                <option value="1">已认证</option>
                                <option value="2">未认证</option>
                            </select>
                        </form>
                    </div>
                    <%--1111111111--%>
                    <%--${detail.insCategoryList}--%>
                    <%--222222222222222--%>
                    <div class="listNature" id="instype2">
                        <div class="input layui-form-select">
                            <span data-cate-id="${detail.insCategoryList[1].insCategory}">${detail.insCategoryList[1].categoryName}</span>
                            <i class="layui-edge"></i>
                        </div>
                        <dl class="dldd">
                            <dd data-cate-id="${detail.insCategoryList[1].insCategory}">${detail.insCategoryList[1].categoryName}</dd>
                        </dl>
                    </div>
                    <div class="listNature" id="instype3">
                        <div class="input layui-form-select">
                            <span data-cate-id="${detail.insCategoryList[2].insCategory}">${detail.insCategoryList[2].categoryName}</span>
                            <i class="layui-edge"></i></div>
                        <dl class="dldd">
                            <dd data-cate-id="${detail.insCategoryList[2].insCategory}">${detail.insCategoryList[2].categoryName}</dd>
                        </dl>
                    </div>
                </div>
                <div class="infP clearfix">
                    <span style="float: left">核心参数<em>*</em>：</span>
                    <div class="infTable">
                        <table class="layui-table">
                            <colgroup>
                                <col width="50%">
                                <col>
                            </colgroup>
                            <tbody>
                            <c:forEach items="${detail.insCoreParam}" var="core">
                                <tr>
                                    <td class="infArg">${core.title}</td>
                                    <td><input type="text" placeholder="" value="${core.content}"></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <p class="addDes">仪器简介<em>*</em>：
                    <button class="layui-btn btn" id="addDes">
                        <div class="lab-qr-code-1"></div>
                        添加描述
                    </button>
                </p>
                <div class="addDesap">
                    <c:forEach items="${detail.insDescription}" var="des">
                        <div class="addDesmain">
                            <div class="clearfix">
                                <a onclick="removeDes(this)"><label class="lab-del"></label>删除</a>
                                <a onclick="modifyDes(this)"><label class="lab-alter"></label>编辑</a>
                            </div>
                            <div class="desMain">
                                <h2 class="currTit">${des.title}</h2>
                                <p class="currTextarea">${des.content}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <div class="save">
                    <button class="layui-btn" onclick="save()" data-map-id=" ${detail.mapId}" id="save">保存仪器</button>
                </div>
            </div>
        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="shade">
        <div class="tit">
            <p>添加标题</p>
            <input type="text" name="" value="" id="tit" placeholder="请输入..."
                   style="margin-top: 10px; border-color: #666; border-width: 1px;"/>
            <p style="margin: 10px 0px">描述正文</p>
            <textarea name="" rows="" cols="" id="describe" placeholder="请输入..."
                      style="border-color: #666; border-width: 1px;"></textarea>
            <button id="abolish" class="layui-btn layui-btn-radius">取消</button>
            <button id="confirm" class="layui-btn layui-btn-radius" style="margin-right: 10px">确定</button>
        </div>
    </div>
    <div class="shade" id="shadeModify">
        <div class="tit">
            <p>添加标题</p>
            <input type="text" name="" value="" id="tits" placeholder="请输入..."
                   style="margin-top: 10px; border-color: #666; border-width: 1px;"/>
            <p style="margin: 10px 0px">描述正文</p>
            <textarea name="" rows="" cols="" id="describes" placeholder="请输入..."
                      style="border-color: #666; border-width: 1px;"></textarea>
            <button id="abolishModify" class="layui-btn layui-btn-radius">取消</button>
            <button id="confirmModify" class="layui-btn layui-btn-radius" style="margin-right: 10px">确定</button>
        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>

    var instype1 = "${detail.insCategoryList[0].insCategory}",
        instype2 = "${detail.insCategoryList[1].insCategory}",
        instype3 = "${detail.insCategoryList[2].insCategory}";
    var instypeValue = '${detail.insCategoryList[0].categoryName}';

    //一级分类
    $.ajax({
        url: "${rlab}/bg/baseins/category?level=1",
        type: 'get',
        async: false
    }).done(function (data) {

        var html = '<option value="">请选择仪器分类</option>';
        for (var i = 0; i < data.payload.length; i++) {
            if (data.payload[i].categoryName.toString() == instypeValue) {
                html += '<option value="' + data.payload[i].insCategory + '" selected>' + data.payload[i].categoryName + '</option>';
            } else {
                html += '<option value="' + data.payload[i].insCategory + '">' + data.payload[i].categoryName + '</option>';
            }
        }
        $("#instype1 select").html(html);

    }).fail(function () {
        layer.msg("系统繁忙 , 请稍后再试");
    });

    //下拉三级
    function ddclick() {
        $(".dldd dd").on("click", function () {
            $(this).parent().parent().find(".input span").html($(this).text());
            $(this).parent().parent().find(".input span").data("cateId", $(this).data("cateId"));
            $(this).parent().hide(300);
        })
    }

    $(".input").on("click", function () {
        if ($(this).parent().find(".dldd").css("display") == "none") {
            $(this).parent().find(".dldd").show(300);
        } else {
            $(this).parent().find(".dldd").hide(300);
        }
    })

    ddclick();
    $(document).mouseup(function (e) {
        var target_con = $('#instype2');
        if (!target_con.is(e.target) && target_con.has(e.target).length === 0) {
            target_con.find(".dldd").hide(300);
        }
    });

    $(document).mouseup(function (e) {
        var target_con = $('#instype3');
        if (!target_con.is(e.target) && target_con.has(e.target).length === 0) {
            target_con.find(".dldd").hide(300);
        }
    });

    //from初始化
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(instype1)', function (data) {
            instype1 = data.value;

            $.ajax({
                url: "${rlab}/bg/baseins/category?level=2&code=" + instype1,
                type: 'get',
                async: true
            }).done(function (data) {

                $("#instype2 .input span").html("请选择二级仪器分类");
                var html = "";
                for (var i = 0; i < data.payload.length; i++) {
                    html += '<dd data-cate-id="' + data.payload[i].insCategory + '">' + data.payload[i].categoryName + '</dd>';
                }
                $("#instype2 .dldd").html(html);
                ddclick();
                $("#instype2 .dldd dd").on("click", function () {
                    instype2 = $(this).data("cateId");
                    $.ajax({
                        url: "/bg/baseins/category?level=3&code=" + instype2,
                        type: 'get',
                        async: true

                    }).done(function (data) {
                        $("#instype3 .input span").html("请选择三级仪器分类");
                        var html = "";
                        for (var i = 0; i < data.payload.length; i++) {
                            html += '<dd data-cate-id="' + data.payload[i].insCategory + '">' + data.payload[i].categoryName + '</dd>';
                        }
                        $("#instype3 .dldd").html(html);
                        $("#instype3 .dldd dd").on("click", function () {
                            instype3 = $(this).data("cateId");
                        })
                        ddclick();
                    }).fail(function () {
                        layer.msg("系统繁忙 , 请稍后再试");
                    });
                })

            }).fail(function () {
                layer.msg("系统繁忙 , 请稍后再试");
            });
        });
    });

    //上传图片
    $(".file").on("click", function () {
        $("#addImageInput").trigger('click');
    })

    //选择图片，马上预览
    var totalImages = 0;

    function imgPreview(fileDom) {
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            layer.msg("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }

        //获取文件
        var file = document.getElementById('addImageInput').files[0];
        /*if (file.size > 100000) {
         layer.msg("图片大小不能超过100K");
         return;
         }*/
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            layer.msg("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function (e) {
            //获取图片dom
//            var img = document.getElementById("img");
            //图片路径设置为读取的图片
//            img.src = e.target.result;
//            console.log(e);
            var image = new Image();
            image.onload = function () {
                var width = image.width;
                var height = image.height;

                if (/*width == 400 && height == 300*/true) {
                    var fd = new FormData();
                    fd.append("file", file);
                    $.ajax({
                        url: '${rlab}/bg/file/upload/image',
                        type: 'POST',
                        data: fd,
                        contentType: false,
                        processData: false
                    })
                        .done(function (data) {
                            if (data.code == 0) {
                                $("#imageList").append('<a class="insImg imgs" data-img-src="' + data.payload + '"><img src="' + e.target.result + '" alt=""><span class="lab-close-2" onclick="removeImg(this)"></span></a>');
                                totalImages++;
                                if (totalImages == 8) {
                                    $("#addImageBtn").hide();
                                }
                            }
                        })
                        .fail(function (data) {
                            layer.msg("fail");
                            console.log(data.description);
                        });
                } else {
                    layer.msg("尺寸不合格");
                }
            };
            image.src = e.target.result;
        };
        reader.readAsDataURL(file);
    }

    $("#addImageInput").change(function () {
        imgPreview();
    });

    // 删除图片按钮
    function removeImg($this) {
        $this = $($this);
        $this.parent().detach();

        $("#addImageInput").detach();
        $("#addImageBtn").append('<input id="addImageInput" type="file" name="file">');
        $("#addImageInput").change(function () {
            imgPreview();
        });

        if (totalImages-- == 8) {
            $("#addImageBtn").show();
        }
    }

    //  添加描述
    $("#addDes").on("click", function () {
        $("#shade").show();
    });

    $("#abolish").on("click", function () {
        $("#shade").hide();
    });

    $("#confirm").on("click", function () {
        $("#shade").hide();
        var tit = $("#shade .tit input").val();
        var des = $("#shade .tit textarea").val().replace(/\n/g, "<br>");
        console.log(des);
        if (tit.length == 0) {
            layer.msg("标题不能为空");
            return;
        } else if (des.length == 0) {
            layer.msg("简介不能为空");
            return;
        }

        $(".addDesap").append('\
       <div class="addDesmain">\
            <div class="clearfix"><a onclick="removeDes(this)"><label class="lab-del"></label>删除</a><a onclick="modifyDes(this)"><label class="lab-alter"></label>编辑</a></div>\
            <div class="desMain">\
            <h2 class="currTit">' + tit + '</h2>\
            <p class="currTextarea">' + des + '</p>\
            </div>\
            </div>');

        $("#shade .tit input").val("");
        $("#shade .tit textarea").val("");
    });

    //  删除简介
    function removeDes($this) {
        $this = $($this);
        $this.parent().parent().remove();
    }

    //  修改简介
    var currTit, currTextarea;

    function modifyDes($this) {
        $this = $($this);
        var title = $this.parent().parent().find('h2').text();
        var text = $this.parent().parent().find('p').html().replace(/<br>/g, "\n");
        currTit = $this.parent().parent().find('h2');
        currTextarea = $this.parent().parent().find('p');

        $("#shadeModify .tit input").val(title);
        $("#shadeModify .tit textarea").val(text);
        $("#shadeModify").show();
    }

    //    修改简介弹框
    $("#abolishModify").on("click", function () {
        $("#shadeModify").hide();
    });

    $("#confirmModify").on("click", function () {
        var tit = $("#shadeModify .tit input").val();
        var des = $("#shadeModify .tit textarea").val().replace(/\n/g, "<br>");
        if (tit.length == 0) {
            layer.msg("标题不能为空");
            return;
        } else if (des.length == 0) {
            layer.msg("简介不能为空");
            return;
        }

        currTit.text(tit);
        currTextarea.html(des);
        $("#shadeModify").hide();
    });

    //保存仪器
    function save() {

        var mapId = $.trim($("#save").data("mapId")) - 0;
        var name = $("#mname").val();
        var type = $("#mtype").val();
        var insBrand = $("#insBrand").val();
        var insOrigin = $("#insOrigin").val();
        var objs = [];
        var imgSrc = [];
        var insCategory = [];
        insCategory.push(instype1+"");
        insCategory.push(instype2+"");
        insCategory.push(instype3+"");

        // 描述
        for (var i = 0; i < $(".currTit").length; i++) {
            var obj = {
                title: $(".currTit").eq(i).html(),
                content: $(".currTextarea").eq(i).html()
            }
            objs.push(obj);
        }


        // 图片
        for (var j = 0; j < $(".imgs").length; j++) {
            var imgsrc = $(".imgs").eq(j).data("imgSrc");
            imgsrc = imgsrc.split('?')[0];
            var texts = imgsrc.split("/");
            if (texts[0] == "http:") {
                var temp = imgsrc.split("image/");
                var url = temp[temp.length - 1];
                imgSrc.push(url);
            } else {
                imgSrc.push(imgsrc);
            }
        }

        var insDescription = JSON.stringify(objs);
        var imgSrcParam = JSON.stringify(imgSrc);
        var insCategorys = JSON.stringify(insCategory);

        var mapNewIns = {
            insMode: type,// 仪器型号
            insPic: imgSrcParam,// 仪器图片
            insBrand: insBrand,// 仪器品牌
            insOrigin: insOrigin,// 仪器产地
            insDescription: insDescription,// 仪器简介
            insCategory: insCategorys,// 仪器分类
            insName: name// 仪器名称
        }
        // 仪器名不能为空
        console.log($.trim(mapNewIns.insName));
        if ($.trim(mapNewIns.insName) === "") {

            alert("仪器名称不能为空")
            return false;
        }
        // 仪器型号
        if ($.trim(mapNewIns.insMode) === "") {
            alert("仪器型号不能为空")
            return false;
        }

        // 仪器图片至少
        if (imgSrc.length < 1) {
            alert("请至少添加1张仪器图片;")
            return false;
        }

        // 仪器图片至多
        if (imgSrc.length > 8) {
            alert("请至多添加8张仪器图片;")
            return false;
        }

        // 仪器品牌不能为空
        if ($.trim(mapNewIns.insBrand) == "") {
            alert("仪器品牌不能为空");
            return false;
        }

        // 仪器产地必须为空
        if ($.trim(mapNewIns.insOrigin) == "") {
            alert("仪器产地必须为空");
            return false;
        }

        // 仪器简介不能为空
        if (objs.length < 1) {
            alert("必须填写仪器分类");
            return false;
        }

        var data = {
            mapId: mapId,// 机构仪器Map表，map_id
            mapNewIns: JSON.stringify(mapNewIns)
        };

        $.ajax({
            url: "${rlab}/bg/share/modify",
            type: 'post',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data),
            async: true

        }).done(function (data) {
            if (data.code === 0) {
                window.location.href = '${rlab}/bg/share/modify?mapId=${detail.mapId}';
            }
        }).fail(function (data) {
            layer.msg("失败");
        });
    }

</script>
</html>

