<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/12/5
  Time: 18:42
  To change this template use File | Settings | File Templates.
--%>
<%--suppress ALL --%>
<%--suppress ALL --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <%--<script src="https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v" type="text/javascript"></script>--%>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/ins_share_base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/component_base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/css/jquery.Jcrop.min.css">

    <%--富文本--%>
    <script type="text/javascript" charset="utf-8" src="${rlab}/bg/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${rlab}/bg/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${rlab}/bg/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style>
        .logoModal input.jcrop-keymgr {
            display: none !important;
        }

        .lab_p {
            margin-top: 26px;
        }

        .lab_p .lft {
            min-width: 126px;
            float: left;
            font-size: 18px;
            color: #7b8da0;
        }

        .lab_p .rt {
            float: left;

        }

        .lab_p h5 span {
            color: #ff4747;
        }

        /*todo*/
        .parent_org .layui-form-select .layui-input {
            width: 755px !important;
        }

        .lab_p .layui-form-select .layui-input {
            border: 0 none;
            line-height: 50px;
            height: 50px;
            width: 300px;
        }

        input, textarea {
            color: #4c5e70;
        }

        .lab_p .rt {
            color: #788491;
        }

        .lab_p .layui-layedit {
            width: 870px;
            height: 600px;
            background: #fff;
        }

        .city_select input {
            width: 190px !important;

        }

        .phone_row button {
            background: #f2f5f8;
            line-height: 50px;
            border: 0 none;
            padding: 0 10px;
            padding-right: 20px;
            color: #49aaff;
            cursor: pointer;

        }

        .phone_row button i {
            color: orangered;
            font-size: 20px;
        }

        .put_form {
            margin-left: 100px;
            margin-top: 100px;
        }

        /*资质*/
        .org_qua {
            margin-top: 20px;
        }

        .org_qua .item {
            float: left;
            margin-right: 15px;
        }

        .org_qua .item .qualification {
            position: relative;
        }

        .org_qua .item .qualification > i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 30px;
            z-index: 3;
            cursor: pointer;
        }

        .org_qua .item .qualification > i:active {
            color: rgba(59, 63, 68, 0.9);
        }

        .org_qua p {
            line-height: 30px;
            color: #FF5722;
        }

        .org_qua img {
            width: 110px;
            height: 110px;
        }

        .org_load {
            width: 200px;
            height: 200px;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }

        .org_load img {
            width: 200px;
            height: 200px;
            position: absolute;
            top: 0;
            left: 0;
            background: #fff;
            z-index: 2;
        }

        .org_load i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 30px;
            z-index: 3;
            cursor: pointer;
        }

        .org_load input {
            position: absolute;
            height: 200px;
            width: 200px;
            display: block;
            top: 0;
            left: 0;
            cursor: pointer;
        }

        /*营业执照*/
        .license {
            width: 299px;
            /*height: 288px;*/
            height: 203px;
            overflow: hidden;
            position: relative;
        }

        .license_remove {

        }

        .license_remove:active {
            color: rgba(59, 63, 68, 0.9);
        }

        .license i {
            position: absolute;
            right: 0;
            top: 0px;
            font-size: 28px;
            cursor: pointer;
            z-index: 4;
        }

        .license img {
            width: 299px;
            height: 200px;
            background: #fff;
            position: absolute;
            left: 0;
            top: 0;
            z-index: 3;
        }

        .license input {
            position: absolute;
            /*cursor: pointer;*/
            /*height: 258px;*/
            /*width: 299px;*/
            top: 30px;
            /*left: 0;*/
        }

        /*资质图片上传*/
        .qualification {
            width: 110px;
            height: 110px;
            position: relative;
            overflow: hidden;
        }

        .qualification img {
            width: 110px;
            height: 110px;
            background: #fff;
        }

        .qualification input {
            position: absolute;
            cursor: pointer;
            height: 130px;
            width: 110px;
            top: -30px;
            left: 0;
        }

        /*logomodal覆盖*/
        .logoModal {
            width: initial !important;
        }

        .tags p i {
            cursor: pointer;
            color: #000000;
        }

        .tags p {
            padding: 5px 10px;
            float: left;
            margin: 5px 10px 5px 0;
            border: 1px solid #0a8ddf;
            line-height: 20px;
            font-size: 12px;
        }
        body .edui-editor-imagescale{
            box-sizing:content-box!important;
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
                <jsp:param name="firstMenu" value="10"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                 <span class="layui-breadcrumb">
                      <a href="${rlab}/bg/infomation/list">科创头条管理</a>
                      <a><cite>发布科创头条</cite></a>
                </span>
            </div>
            <%--START机构表单--%>
            <div class="share_main clearfix">
                <form class="layui-form" action="">
                    <%--1.科创头条导语--%>
                    <div class="lab_p clearfix">
                        <div class="rt">
                            <input id="tname" value="${info.tInfoTitle}" class="lab_input_base lab_input_middle" type="text"
                                   placeholder="请输入科创头条名称" style="width: 870px">
                        </div>
                    </div>
                    <%--6.科创头条内容--%>
                    <div class="lab_p clearfix">
                        <div class="rt">
                            <script id="editor" type="text/plain" style="width:675px;height:500px;">
                                ${info.tInfoContent}
                            </script>
                        </div>
                    </div>
                    <%--2.科创头条导语--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">科创头条导语：</h5>
                        </div>
                        <div class="rt">
                            <input id="ttit" class="lab_input_base " value="${info.tInfoSubTitle}" type="text" placeholder="请输入科创头条导语"
                                   style="width: 754px;">
                        </div>
                    </div>

                    <%--3.科创头条Logo--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>科创头条图片：</h5>
                        </div>
                        <div class="rt">
                            <div class="org_load site-demo-upload">
                                <img id="logImg" src="${info.tInfoImage}">
                                <i class="license_remove layui-icon">&#x1007;</i>
                                <input id="logImgfile" data-img-src="${info.tInfoImage}" onchange="uploadImg(this)" name="qualifications"
                                       accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">
                            </div>
                        </div>
                    </div>

                    <%--4.科创头条分类--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">科创头条分类：</h5>
                        </div>
                        <div class="rt">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="orgCategoryId" name="modules" lay-verify="required" lay-search="">
                                        <option value="">请选择...</option>
                                        <option value="1" ${info.tInfoClassify == 1 ? 'selected': ''}>政策指南</option>
                                        <option value="2" ${info.tInfoClassify == 2 ? 'selected': ''}>行业动态</option>
                                        <option value="3" ${info.tInfoClassify == 3 ? 'selected': ''}>最新活动</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--5.选择来源--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">来源：</h5>
                        </div>
                        <div class="rt">
                            <input type="checkbox" name="hrefs" value="0" title="人人实验" ${info.tInfoFrom.equals('人人实验') ? 'checked': ''} class="check">
                            <span>其他：</span>
                            <input type="text" class="from" style="width: 500px;height: 50px" value="${info.tInfoFrom}">
                        </div>
                    </div>

                    <%--5.选择推荐--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">选择推荐：</h5>
                        </div>
                        <div class="rt">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="recommend" name="modules" lay-verify="required" lay-search="">
                                        <option value="">请选择...</option>
                                        <option value="0" ${info.tInfoClassifyHot == 0 ? 'selected': ''}>不推荐</option>
                                        <option value="1" ${info.tInfoClassifyHot == 1 ? 'selected': ''}>热门推荐</option>
                                        <option value="2" ${info.tInfoClassifyHot == 2 ? 'selected': ''}>人人实验</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--6.科创头条标签--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>科创头条标签：</h5>
                        </div>
                        <div class="rt">
                            <div class="tags clearfix">
                                <c:forEach var="item" items="${info.tInfoTags}">
                                    <p>${item}<i class="lab-close-1" onclick="deltags(this)"></i></p>
                                </c:forEach>

                            </div>
                            <input type="text" class="lab_input_base tagsname" style="width: 500px;">
                            <button onclick="addtag()" id="" type="button" class="layui-btn">
                                添加标签
                            </button>
                        </div>
                    </div>


                </form>
            </div>
            <%--科创头条内容--%>

            <%--START操作按鈕--%>
            <div class="share_btn">
                <button class="put_form layui-btn layui-btn-normal" type="button" id="putForm" onclick="putOrgForm()">
                    修改科创头条
                </button>
                <button class="put_form layui-btn layui-btn-normal" type="preview" id="preview" onclick="preview()">
                    预览
                </button>
            </div>
            <%--END操作按钮--%>

        </div>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<script src="${rlab}/common/assets/tapmodo-Jcrop-1902fbc/js/jquery.Jcrop.min.js"></script>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var ue = UE.getEditor('editor');




    $(".license_remove").on("click", function () {
        $(this).parent().find("input").data('imgSrc', '');
        $(this).parent().find("img").attr('src', BASE_URL + '/bg/img/add_logo_default.png');
    })
    $("#logImg").on("click", function () {
        $("#logImgfile").trigger('click');
    })

    var form, layedit, ditIndex, layer;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;

        // 构建一个编辑器
        ditIndex = layedit.build('LAY_demo1', {
            height: 550,
            tool: ['strong', 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'image'],
            uploadImage: {
                url: BASE_URL + '/front/file/upload/richText',
                type: 'post', //默认post
                before: function (input) {
                    //返回的参数item，即为当前的input DOM对象
                    console.log('文件上传中');
                },
                success: function (res) {
                    console.log('文件上传成功');
                    console.log(res);
                }
            }
        });
    });
    function addtag() {
        if (!$(".tagsname").val()) {
            alert("请输入标签名字");
            return false;
        }

        var data = {"tTagName": $(".tagsname").val()}

        $.ajax({
            url: '${rlab}/bg/infomation/add_tag',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data)
        })
            .done(function (data) {
                console.log(data);
                if (data.code == 0) {
                    var ht = '<p>' + $(".tagsname").val() + '<i class="lab-close-1" onclick="deltags(this)"></i></p>'
                    $(".tags").append(ht);
                    $(".tagsname").val("");
                }else {
                    alert("标签添加失败");
                }
            })
            .fail(function (data) {
                alert("失败");
            });


    }

    function deltags($this) {
        $($this).parent().remove();
    }

    /*
     ** 上传图片
     */
    function uploadImg($this) {
        var files = $this.files;

        // 兼容触发change事件，却没有选择文件的情况
        if (files.length <= 0) {
            return false;
        }

        var file = files[0],
            fileName = file.name,
            fileSize = file.size,
            $img = $($this).parent().find("img"),
            $imgSrc = $img.attr("src");


        // 校验图片格式
        if (!verifyFileSuffx("png|jpg|jpeg", fileName)) {
            layer.msg("只能上传图片格式");
            return false;
        }

        if (!verifyFileSize(fileSize, 5)) {
            layer.msg("文件大小不能超过5M");
            return false;
        }

        // file文件配置项
        var fileOption = {
            file: file,
            name: "file",
            type: $($this).data("upType")
        }

        // 开始上传时的回调
        var beforeSend = function () {
            $img.attr("src", BASE_URL + "/common/common_img/icon/loading_200_200.gif");// 菊花转
        }

        // 上传完毕的回调
        var success = function (data) {
            if (data.code === 0) {
                $img.attr("src", data.payload);// 更新上传图片
                $($this).data("imgSrc", data.payload);
            } else {
                $img.attr("src", $imgSrc);// 变回原来的图片
            }
        }

        var error = function () {
            $img.attr("src", $imgSrc);// 变回原来的图片
        }

        postUploadImg(fileOption, beforeSend, success, error);
    }
    var LOGIN_AJAX_FLAG = true;
    /*
     ** 发送图片字节流到后台
     */
    function postUploadImg(fileOption, beforeSend, success) {
        var formdata = new FormData();
        formdata.append(fileOption.name, fileOption.file);
        $.ajax({
            url: '${rlab}/bg/file/upload/' + fileOption.type,
            type: 'POST',
            data: formdata,
            contentType: false,
            processData: false,
            beforeSend: function () {
                beforeSend();
            },
            success: function (data) {
                console.log(data);
                success(data);
            },
            error: function () {
                error();
            }

        })

    }

    $(".lab_input_base").on("click", function () {
        $(".check").attr("checked", false);
        $(".check").next().find("layui-unselect").removeClass("layui-form-checked");
    });

    /*
     ** 保存提交表单
     */
    function putOrgForm() {

        var tInfoTitle = $.trim($("#tname").val());
        var tInfoSubTitle = $.trim($("#ttit").val());
        var tInfoImage = $("#logImgfile").data("imgSrc");
        var tInfoClassify = $("#orgCategoryId").val();
        var tInfoClassifyHot = $("#recommend").val();


        var tInfoTags = [];
        var itemList = $(".tags p");
        itemList.each(function () {
            tInfoTags.push($(this).text())
        });

        if (tInfoTags.length == 0) {
            alert("科创头条标签不能为空");
            return false;
        }

        var orgDescription = UE.getEditor('editor').getContent();// 简介
        var tInfoFrom = "人人实验";
        console.log("---");
        console.log($(".from").val());
        if ($(".from").val() != ""){
            tInfoFrom = $(".from").val();
        }

        var formData = {
            "tInfoId": ${info.tInfoId},
            "tUid": ${info.tUid},
            "tInfoTitle": tInfoTitle,
            "tInfoSubTitle": tInfoSubTitle,
            "tInfoImage": tInfoImage,
            "tInfoTags": JSON.stringify(tInfoTags),
            "tInfoClassify": tInfoClassify,
            "tInfoClassifyHot": tInfoClassifyHot,
            "tInfoContent": orgDescription, // 富文本编辑
            "tInfoFrom": tInfoFrom
        }


        if (formData.tInfoTitle.length == 0) {
            alert("科创头条名称不能为空");
            return false;
        } else if (formData.tInfoSubTitle == "") {
            alert("科创头条导语不能为空");
            return false;
        } else if (formData.tInfoImage == "") {
            alert("科创头条图片不能为空");
            return false;
        } else if (formData.tInfoClassify == "") {
            alert("科创头条分类不能为空");
            return false;
        } else if (formData.tInfoContent == "") {
            alert("科创头条内容不能为空");
            return false;
        }
        if (!LOGIN_AJAX_FLAG) {
            console.log('不要频繁点击');
            return false;
        }

        console.log(formData);
        $.ajax({
            url: BASE_URL + '/bg/infomation/modify',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            beforeSend: function () {
                LOGIN_AJAX_FLAG = false;
            },
            success: function (data) {

                if (data.code === 0) {

                    location.href = BASE_URL + "/bg/infomation/list";
                } else if (data.code === 1013) {
                    //墨绿深蓝风
                    layer.alert('科创头条名称已存在，请更换', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                }else {
                    layer.alert('修改失败', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                }

            },
            error: function (err) {
                //  layer.msg("网络繁忙，请重新选择城市");
            },
            complete: function () {
                LOGIN_AJAX_FLAG = true;
            }
        });
    }

    function preview() {
        var tInfoTitle = $.trim($("#tname").val());
        var tInfoSubTitle = $.trim($("#ttit").val());
        var tInfoImage = $("#logImgfile").data("imgSrc");
        var tInfoClassify = $("#orgCategoryId").val();
        var tInfoClassifyHot = $("#recommend").val();


        var tInfoTags = [];
        var itemList = $(".tags p");
        itemList.each(function () {
            tInfoTags.push($(this).text())
        });

        if (tInfoTags.length == 0) {
            alert("科创头条标签不能为空");
            return false;
        }

        var orgDescription = UE.getEditor('editor').getContent();// 机构简介
        var tInfoFrom = "人人实验";
        console.log("---");
        console.log($(".from").val());
        if ($(".from").val() != ""){
            tInfoFrom = $(".from").val();
        }

        var formData = {
            "tInfoTitle": tInfoTitle,
            "tInfoSubTitle": tInfoSubTitle,
            "tInfoImage": tInfoImage,
            "tInfoTags": JSON.stringify(tInfoTags),
            "tInfoClassify": tInfoClassify,
            "tInfoClassifyHot": tInfoClassifyHot,
            "tInfoContent": orgDescription, // 富文本编辑
            "tInfoFrom": tInfoFrom
        }


        if (formData.tInfoTitle.length == 0) {
            alert("科创头条名称不能为空");
            return false;
        } else if (formData.tInfoSubTitle == "") {
            alert("科创头条导语不能为空");
            return false;
        } else if (formData.tInfoImage == "") {
            alert("科创头条图片不能为空");
            return false;
        } else if (formData.tInfoClassify == "") {
            alert("科创头条分类不能为空");
            return false;
        } else if (formData.tInfoContent == "") {
            alert("科创头条内容不能为空");
            return false;
        }
        if (!LOGIN_AJAX_FLAG) {
            console.log('不要频繁点击');
            return false;
        }

        console.log(formData);
        $.ajax({
            url: BASE_URL + '/bg/infomation/preview',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            beforeSend: function () {
                LOGIN_AJAX_FLAG = false;
            },
            success: function (data) {

                window.open(BASE_URL + '/bg/infomation/preview_page');

            },
            error: function (err) {
                //  layer.msg("网络繁忙，请重新选择城市");
            },
            complete: function () {
                LOGIN_AJAX_FLAG = true;
            }
        });
    }
</script>
</html>



