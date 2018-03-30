<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <%--<script src="${rlab}/front/assets/md5/jquery.md5.js"></script>--%>
    <script src="${rlab}/front/js/view/jq.form.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170622">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->



    <style type="text/css">
        .user_content {
            height: auto !important;
        }

        /* START 侧边栏公用样式*/
        .side_dn {
            display: block !important;
        }

        .user_side {
            float: left;
            width: 153px;
            min-height: 800px;
            background: #fff;
        }

        .user_side .avatar {
            padding: 0 20px;
            text-align: center;
        }

        .user_side img {
            width: 100px;
            margin-top: 26px;
        }

        .user_side p {
            width: 113px;
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
            height: 50px;
            line-height: 50px;
            color: #4e4e4e;
            font-size: 16px;
            border-bottom: 1px dashed #dde3ea;
        }

        /*侧边栏bar*/
        ul.u_sd_ul a {
            color: #4e4e4e;
        }

        ul.u_sd_ul {
            list-style: none;
        }

        ul.u_sd_ul > li {
            line-height: 46px;
            margin-top: 20px;
        }

        ul.u_sd_ul > li > a {
            font-size: 16px;
            padding-left: 26px;
            line-height: 46px;
            display: block;
        }

        ul.u_sd_ul > li.actived > a {
            color: #508df0;
        }

        ul.u_sd_ul > li dl {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul.u_sd_ul > li dl dd {
            text-align: left;
            margin: 0;
            padding: 0;
            background: #f9fbfc;
        }

        ul.u_sd_ul > li dd a {
            padding-left: 26px;
            font-size: 14px;
            display: block;
        }

        ul.u_sd_ul > li.actived dd.actived a {
            color: #508df0;
        }

        ul.u_sd_ul > li dd i {
            font-size: 1px;
            display: inline-block;
            -webkit-transform: scale(0.8, 0.8);
            -moz-transform: scale(0.8, 0.8);
            -ms-transform: scale(0.8, 0.8);
            -o-transform: scale(0.8, 0.8);
            transform: scale(0.8, 0.8);
        }

        /*END 侧边栏公用样式*/

        /*START 内容部分公用样式*/
        .user_main {
            margin-left: 10px;
            min-height: 800px;
            float: left;
            width: 957px;
            background: #fff;
        }

        /*END 内容部分公用样式*/

    </style>
    <style type="text/css">
        .authentication {
            padding: 42px 34px;
        }

        .tit a {
            color: #508df0;
        }

        .tit {
            font-size: 22px;
            color: #508df0;
        }

        .step {
            margin-top: 48px;
            text-align: center;
            font-size: 16px;
            color: #c1c1c1;
        }

        .step p {
            display: inline-block;
        }

        .num {
            background: white;
            color: #c1c1c1;
            width: 22px;
            height: 22px;
            text-align: center;
            line-height: 20px;
            border-radius: 50%;
            display: inline-block;
            border: 1px solid #c1c1c1;
        }

        .imIne {
            display: inline-block;
            width: 205px;
            border-top: 1px dashed #c1c1c1;
            margin-top: 8px;
            margin: 8px 34px;
        }

        .selects .num {
            background: #508df0;
            color: white;

        }

        .selects .imIne {
            border-color: #508df0;
        }

        .name {
            margin-left: 82px;
            margin-top: 44px;
            font-size: 16px;
            color: #333333;
            line-height: 50px;
        }

        .name b, .page2 .put b, .page3 .statement b {
            color: red;
        }

        .companyName {
            width: 501px;
            height: 46px;
            border: 2px solid #f3f6f9;
            margin-left: 12px;
            font-size: 16px;
            line-height: 50px;
            padding-left: 10px;
        }

        .name .down {
            color: #508df0;
            font-style: oblique;
            text-decoration: underline;
        }

        .put {
            margin: 14px 0 0 200px;
        }

        .put a label {
            font-size: 17px;
            float: left;
            margin-top: 11px;
            margin-left: 15px;
        }

        .put .filebut {
            cursor: pointer;
            width: 115px;
            height: 39px;
            border: 1px solid #508df0;
            background: white;
            color: #508df0;
            display: block;
            line-height: 39px;
            font-size: 14px;
            text-align: center;
            border-radius: 5px;
        }

        .gonext a {
            cursor: pointer;
            color: white;
            background: #508df0;
            width: 101px;
            height: 39px;
            line-height: 39px;
            font-size: 18px;
            text-align: center;
            display: inline-block;
        }

        .gonext {
            text-align: center;
            position: absolute;
            bottom: 100px;
            width: 100%;
        }

        .page2 .put {
            margin: 45px 0 0 117px;
        }

        .page2 .put a {
            float: left;
        }

        .page2 .put span {
            float: left;
            height: 39px;
            line-height: 39px;
            margin-right: 16px;
        }

        .userImg {
            float: left;
        }

        .userImg img {
            width: 241px;
            height: 149px;
            float: left;
            /*margin-right: 28px;
            margin-top: 41px;*/
            cursor: pointer;
        }

        .imgtit span {
            float: left;
            width: 241px;
            margin-right: 28px;
            text-align: center;
            font-size: 14px;
            color: #bdbdbd;
            line-height: 34px;
        }

        .imgtit label {
            color: #508df0;
        }

        .statement {
            margin: 45px 0 0 117px;
            font-size: 16px;
        }

        .course {
            display: none;
            margin: 11px 0 0 200px;
            font-size: 12px;
            color: #666666;
            width: 300px;
            line-height: 18px;
        }

        .course .close {
            float: right;
            cursor: pointer;
            font-size: 16px;
        }

        .icon {
            margin-right: 5px;
            font-size: 14px;
        }

        .probar {
            width: 100%;
            height: 10px;
            border-radius: 5px;
            background: #d7dbe1;
            margin-top: 8px;
        }

        .probar .probarbul {
            height: 10px;
            background: #508df0;
            border-radius: 5px;
            width: 0%;
        }

        form input {
            position: absolute;
            z-index: -100;
            left: 0;
        }
        .userImg label{
            width: 241px;
            height: 149px;
            margin-right: 28px;
            margin-top: 41px;
        }
        .userImg s{
            cursor: pointer;
            position: absolute;
            z-index: 999;
            width: 100%;
            height: 100%;
            top:0;
            left: 0;
            background: url("${rlab}/front/imgs/opaque.png") no-repeat 100% 100%;
            background-size: 100% 100%;
        }
        .userImg label{
            position: relative;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="user_center user_content clearfix">
        <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
        <jsp:include page="../template/user_side.jsp" flush="true">
            <jsp:param name="levelNum" value="2"/>
            <jsp:param name="firstMenu" value="3"/>
            <jsp:param name="secondMenu" value="1"/>
        </jsp:include>
        <div class="user_main" style="position: relative;overflow: hidden;">
            <div class="authentication">
                <p class="tit"><a href="">我的创新券</a> > <a href="">申请认证</a></p>
                <div class="page1">
                    <div class="step">
                        <p class="selects">
                            <span class="num">1</span>
                        </p>
                        <p class="">
                            <span class="imIne"></span>
                            <span class="num">2</span>
                        </p>
                        <p class="">
                            <span class="imIne"></span>
                            <span class="num">3</span>
                        </p>
                    </div>
                    <p class="name">
                        <span>公司名称 <b>*</b> ：</span>
                        <input type="text" class="companyName" maxlength="30">
                    </p>
                    <p class="name" style="margin-top: 26px">
                        <span>基本信息表 <b>*</b> ：</span>
                        <a download="" href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E4%BA%BA%E4%BA%BA%E5%88%9B%E6%96%B0%E5%88%B8%E4%BC%81%E4%B8%9A%E5%9F%BA%E6%9C%AC%E4%BF%A1%E6%81%AF%E8%A1%A8%EF%BC%88201710%E7%89%88%EF%BC%89.docx" class="down">人人创新券企业基本信息表.doc</a>
                    </p>
                    <form id="file" method="post" enctype="multipart/form-data">
                        <p class="put clearfix">
                            <label class="filebut" for="files"><i class="lab-search"></i>上传文件</label>
                            <input type="file" id="files" name="file">
                        </p>
                    </form>
                    <p style="margin: 11px 0 0 200px;font-size: 12px;color: #999999">支持文件格式：Word、PDF（单个文件限制在10M以内）</p>
                    <div class="course" data-file-url="">
                        <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label
                                class="lab-close-1 close" onclick="closebar(this)"></label></p>
                        <div class="probar">
                            <p class="probarbul"></p>
                        </div>
                    </div>
                    <p class="gonext"><a class="gopage2">下一步</a></p>
                </div>
                <div class="page2" style="display: none">
                    <div class="step">
                        <p class="selects">
                            <span class="num">1</span>
                        </p>
                        <p class="selects">
                            <span class="imIne"></span>
                            <span class="num">2</span>
                        </p>
                        <p class="">
                            <span class="imIne"></span>
                            <span class="num">3</span>
                        </p>
                    </div>
                    <form id="filebasic" method="post" enctype="multipart/form-data">
                        <p class="put clearfix">
                            <span>营业执照 <b>*</b> ：</span>
                            <label class="filebut" for="filebasics" style="margin-left: 42px"><i class="lab-search"></i>上传文件</label>
                            <input type="file" id="filebasics" name="file">
                        </p>
                    </form>
                    <p style="margin: 11px 0 0 275px;font-size: 12px;color: #999999">支持文件格式：PDF（单个文件限制在10M以内）</p>
                    <div class="course" data-file-url="" style="margin-left: 275px">
                        <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label
                                class="lab-close-1 close" onclick="closebar(this)"></label></p>
                        <div class="probar">
                            <p class="probarbul"></p>
                        </div>
                    </div>
                    <p class="name" style="margin: 41px 12px 0 117px;float: left">
                        <span>法人身份证照片 <b>*</b> ：</span>
                    </p>
                    <form id="imgfronts" method="post" enctype="multipart/form-data">
                        <p class="userImg">
                            <label  for="imgfront"><s></s><img src="${rlab}/front/imgs/rrcxj/imgfront.png" alt="" class="imgfront" data-img-src=""></label>
                            <input type="file" id="imgfront" name="file">
                        </p>
                    </form>
                    <form id="imgsides" method="post" enctype="multipart/form-data">
                        <p class="userImg">
                            <label  for="imgside"><s></s><img src="${rlab}/front/imgs/rrcxj/imgside.png" alt="" class="imgside" data-img-src=""></label>
                            <input type="file" id="imgside" name="file">
                        </p>
                    </form>
                    <p style="margin: 0 0 0 275px" class="imgtit clearfix"><span>身份证正面照</span><span>身份证反面照</span></p>
                    <p style="margin: 0 0 0 275px;font-size: 12px;color: #858585" class="imgtit">
                        请上传法人身份证正面照片和反面照片<br>
                        必须看清证件信息，且证件信息不能被遮挡<br>
                        仅支持<label>.jpg .bmp .png .gif</label>的图片格式<br>
                        图片大小不超过<label>2M</label>，长宽<label>4096px</label>以内<br>
                        您提供的照片人人实验将予以保护，不会用于其他用途
                    </p>
                    <p class="gonext">
                        <a style="margin-right: 100px;background: white;color: #666666;border: 1px solid #edeff1"
                           class="gopage1">上一步</a>
                        <a class="gopage3">下一步</a></p>
                </div>
                <div class="page3" style="display: none">
                    <div class="step">
                        <p class="selects">
                            <span class="num">1</span>
                        </p>
                        <p class="selects">
                            <span class="imIne"></span>
                            <span class="num">2</span>
                        </p>
                        <p class="selects">
                            <span class="imIne"></span>
                            <span class="num">3</span>
                        </p>
                    </div>
                    <p class="statement"><span style="margin-right:10px">财务报表 <b>*</b> ：</span><span
                            style="color: #999999;">请上传近两年的财务报表</span><span style="color: #999999;font-size: 12px">（无第三方审计报表，则提交汇算清缴报表：<a href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E4%BA%BA%E4%BA%BA%E5%88%9B%E6%96%B0%E5%88%B8--%E6%8F%90%E4%BA%A4%E8%B4%A2%E5%8A%A1%E8%B5%84%E6%96%99%E7%A4%BA%E4%BE%8B201710.pdf" download="" style="color: #588eff">财务报表示例模板</a>）</span>
                    </p>
                    <form id="statement" method="post" enctype="multipart/form-data">
                        <p class="put clearfix" style="margin-left: 225px">
                            <label class="filebut" for="statements"><i class="lab-search"></i>上传文件</label>
                            <input type="file" id="statements" name="file">
                        </p>
                    </form>
                    <p style="margin: 11px 0 0 220px;font-size: 12px;color: #999999">支持文件格式：PDF（单个文件限制在10M以内）</p>
                    <div class="finance">

                    </div>
                    <p class="statement"><span style="margin-right:20px">其他附件 ：</span><span style="color: #999999;">请上传企业高新证书、知识产权材料等</span>
                    </p>
                    <form id="fileelse" method="post" enctype="multipart/form-data">
                        <p class="put clearfix" style="margin-left: 225px">
                            <label class="filebut" for="elsefile"><i class="lab-search"></i>上传文件</label>
                            <input type="file" id="elsefile" name="file">
                        </p>
                    </form>
                    <p style="margin: 11px 0 0 220px;font-size: 12px;color: #999999">支持文件格式：PDF（单个文件限制在10M以内）</p>
                    <div class="rest">

                    </div>
                    <p class="gonext" style="position: inherit;margin-top: 50px">
                        <a style="margin-right: 100px;background: white;color: #666666;border: 1px solid #edeff1"
                           class="go3page2">上一步</a>
                        <a id="sub" onclick="submitAudit()">提交</a></p>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">

    //检查文件后缀
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

    //
    $(".gopage3").on("click", function () {
        if (!$(".page2 .course").data("fileUrl")) {
            layer.msg("请上传营业执照");
            return;
        }
        if (!$(".imgfront").data("imgSrc") || !$(".imgside").data("imgSrc")) {
            layer.msg("请上传身份证");
            return;
        }
        $(".page1").hide();
        $(".page3").show();
        $(".page2").hide();
    })
    $(".gopage1").on("click", function () {
        $(".page1").show();
        $(".page2").hide();
        $(".page3").hide();
    })
    $(".gopage2").on("click", function () {
        var companyName = $(".companyName").val();
        var re = /^[\w\u4E00-\u9FA5\uF900-\uFA2D（）()]*$/;

        if(companyName.length == 0){
            layer.msg("公司名称不能为空");
            return;
        }

        if (!re.test(companyName)) {
            layer.msg("公司名称为30位内中英文、数字或（）");
            return;
        }

        if (!$(".page1 .course").data("fileUrl")) {
            layer.msg("请上传基本信息表");
            return;
        }
        $(".page1").hide();
        $(".page2").show();
        $(".page3").hide();

    })
    $(".go3page2").on("click", function () {
        $(".page1").hide();
        $(".page2").show();
        $(".page3").hide();
    })

    function closebar($this) {
        $this = $($this);
        $this.parent().parent().hide();
        $this.parent().parent().data("fileUrl", "");
    }

    function closemorebar($this) {
        $this = $($this);
        $this.parent().parent().remove();
    }

    //上传
    $("#files").change(function () {
        filess(".page1", "files", "doc|pdf|docx", "#file",false);
    });

    $("#filebasics").change(function () {
        filess(".page2", "filebasics", "pdf", "#filebasic",false);
    });

    $("#imgfront").change(function (e) {
        filess(".imgfront", "imgfront", "jpg|png|gif|bmp","#imgfronts",true);
    })

    $("#imgside").change(function () {
        filess(".imgside", "imgside", "jpg|png|gif|bmp","#imgsides",true);
    })

    $("#statements").change(function () {
        morefiless(".finance", "statements", "#statement");
    })

    $("#elsefile").change(function () {
        morefiless(".rest", "elsefile", "#fileelse");
    })

    //上传文件
    var xhr = new XMLHttpRequest();
    var xhrOnProgress = function (fun) {
        xhrOnProgress.onprogress = fun; //绑定监听
        //使用闭包实现监听绑
        return function () {
            //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
            var xhr = $.ajaxSettings.xhr();
            //判断监听函数是否为函数
            if (typeof xhrOnProgress.onprogress !== 'function')
                return xhr;
            //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
            if (xhrOnProgress.onprogress && xhr.upload) {
                xhr.upload.onprogress = xhrOnProgress.onprogress;
            }
            return xhr;
        }
    }

    function filess(str, str1, name, str2,size) {

        //文件限制兼容ie
        if (!document.getElementById(str1).files) {
            var filenames = document.getElementById(str1).value;
            var filename = filenames.substring(filenames.lastIndexOf('\\') + 1);
            if (!verifyFileSuffx(name, filename.toLowerCase())) {
                layer.msg("文件格式不正确");
                return;
            }
            $(str).find(".course span").html(filename);
        } else {
            var file = document.getElementById(str1).files[0];
            if (!verifyFileSuffx(name, file.name.toLowerCase())) {
                layer.msg("文件格式不正确");
                return;
            }
            if (size){
                if(file.size > 1048576 * 2){
                    layer.msg("文件大小不能超过2M");
                    return;
                }
            }
            if (file.size > 1048576 * 10) {
                layer.msg("文件大小不能超过10M");
                return;
            }
            $(str).find(".course span").html(file.name);
        }
        $(str).find(".course .probarbul").css("width", "0")
        $(str).find(".course").show();
        //进度条兼容xhr.upload.onprogress
        /*xhrOnProgress.onprogress = function () {};
         if (typeof xhrOnProgress.onprogress !== 'function') {
         console.log("+++");
         $(str).find(".course .probarbul").animate({"width":"40%"},1500);
         }*/

        var ajax_option = {
            url: "${rlab}/front/file/ie/upload/image",//form 的action
            type: "post",
            resetForm: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            xhr: xhrOnProgress(function (e) {
                var percent = e.loaded * 100 / e.total - 5 + "%";
                $(str).find(".probarbul").css("width", percent);
            }),
            success: function (data) {  //表单提交成功后执行的函数
                data = JSON.parse(data);
                if (size){
                    if(data.size > 1048576 * 2){
                        layer.msg("文件大小不能超过2M");
                        return;
                    }
                }
                if (data.size > 1048576 * 10) {
                    $(str).find(".course").hide();
                    $(str).find(".course").data("fileUrl", "");
                    layer.msg("文件大小不能超过10M");
                    return;
                }
                if ($(str).find(".course").length < 1) {
                    $(str).attr("src", data.payload);
                    $(str).data("imgSrc", data.payload);
                } else {
                    $(str).find(".course .probarbul").animate({"width": "100%"}, 500);
                    $(str).find(".course").data("fileUrl", data.payload);
                }
                layer.msg("上传成功");
            },
            error: function () {
                $(str).find(".course").hide();
                $(str).find(".course").data("fileUrl", "");
                layer.msg("上传出错");
            }
        }
        $(str2).ajaxSubmit(ajax_option);
        return false;


    }

    <%--function filess (str,str1,str2,str3) {

        if(!document.getElementById(str1).files){
            /*layer.msg("请升级您的浏览器到最新版本再上传文件");
             return;*/
            //
            $(str).find(".course").show();
            var ajax_option={
                url:"${rlab}/front/file/ie/upload/image",//form 的action
                type:"post",  //form 的method方法
    //                dataType: "json",
    //            beforeSubmit:checkUppro,  //在表达提交前执行的验证函数
                contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
                success : function(data){  //表单提交成功后执行的函数
                    data=JSON.parse(data);
                    alert(data);
                    $(str).find(".course .probarbul").css("width","100%");
                    $(str).find(".course").data("fileUrl",data.payload);
                    layer.msg("done");
                }
            }
            $(str3).ajaxSubmit(ajax_option);
            return false;
            console.log("++++");
            return;
        } else {
            var file = document.getElementById(str1).files[0];
        }


        if (!verifyFileSuffx(str2,file.name)){
            layer.msg("文件格式应为"+str2);
            return;
        }
        if (file.size > 10000000) {
            layer.msg("文件大小不能超过10M");
            return;
        }
        var fd = new FormData();
        fd.append("file", file);
        $(str).find(".course span").html(file.name);
        $(str).find(".course").show();
        $.ajax({
            url: '${rlab}/front/file/ie/upload/image',
            type: 'POST',
            data: fd,
            contentType: false,
            processData: false,
            xhr:xhrOnProgress(function(e){
                var percent=e.loaded*100/e.total-5+"%";
                $(str).find(".course .probarbul").css("width",percent);
            })
        }).done(function (data) {
            data=JSON.parse(data);
            if ($(str).find(".course").length<1){
                $(str).attr("src",data.payload);
                $(str).data("imgSrc",data.payload);
            }else {
                $(str).find(".course .probarbul").css("width","100%");
                $(str).find(".course").data("fileUrl",data.payload);
            }

            layer.msg("done");
        })
        .fail(function (data) {
            $(str).find(".course").hide();
            $(str).find(".course").data("fileUrl","");
            layer.msg("fail");
        });
    }--%>
    // http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-09/6f39b2f0-793e-4414-a97b-b9b69738f5ef.jpg?x-oss-process=style/renrenlab140_110

    function morefiless(str, str1, str2) {
        var progress = $('<div class="course" data-file-url="" style="margin-left: 220px;display: block"></div>');
        progress.html('\
        <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closemorebar(this)"></label></p>\
         <div class="probar">\
            <p class="probarbul"></p>\
         </div>\
        ')
        $(str).append(progress);
        //文件限制兼容ie
        if (!document.getElementById(str1).files) {
            var filenames = document.getElementById(str1).value;
            var filename = filenames.substring(filenames.lastIndexOf('\\') + 1);
            if (!verifyFileSuffx("pdf", filename.toLowerCase())) {
                layer.msg("文件格式不正确");
                progress.remove();
                return;
            }
            progress.find("span").html(filename);
        } else {
            var file = document.getElementById(str1).files[0];
            if (!verifyFileSuffx("pdf", file.name.toLowerCase())) {
                layer.msg("文件格式不正确");
                progress.remove();
                return;
            }
            if (file.size > 1048576 * 10) {
                layer.msg("文件大小不能超过10M");
                progress.remove();
                return;
            }
            progress.find("span").html(file.name);
        }

        //进度条兼容xhr.upload.onprogress
        /*xhrOnProgress.onprogress = function () {};
         if (typeof xhrOnProgress.onprogress !== 'function') {
         console.log("+++");
         $(str).find(".course .probarbul").animate({"width":"40%"},1500);
         }*/
        var ajax_option = {
            url: "${rlab}/front/file/ie/upload/image",//form 的action
            type: "post",
            resetForm: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            xhr: xhrOnProgress(function (e) {
                var percent = e.loaded * 100 / e.total - 5 + "%";
                progress.find(".probarbul").css("width", percent);
            }),
            success: function (data) {  //表单提交成功后执行的函数
                data = JSON.parse(data);
                if (data.size > 1048576 * 10) {
                    progress.remove();
                    layer.msg("文件大小不能超过10M");
                    return;
                }
                progress.find(".probarbul").animate({"width": "100%"}, 500);
                progress.data("fileUrl", data.payload);
                layer.msg("上传成功");
            },
            error: function () {
                progress.remove();
                layer.msg("上传出错");
            }
        }
        $(str2).ajaxSubmit(ajax_option);
        return false;
    }
    <%--function morefiless (str,str1) {
    if(!document.getElementById(str1).files){
        /*layer.msg("请升级您的浏览器到最新版本再上传文件");
         return;*/
        //
        $(str).find(".course").show();
        var ajax_option={
            url:"${rlab}/front/file/ie/upload/image",//form 的action
            type:"post",  //form 的method方法
    //                dataType: "json",
    //            beforeSubmit:checkUppro,  //在表达提交前执行的验证函数
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            success : function(data){  //表单提交成功后执行的函数
                data=JSON.parse(data);
                $(str).find(".course .probarbul").css("width","100%");
                $(str).find(".course").data("fileUrl",data.payload);
                layer.msg("done");
            }
        }
        $(str2).ajaxSubmit(ajax_option);
        return false;
        console.log("++++");
        return;
    } else {
        var file = document.getElementById(str1).files[0];
    }

    if (!verifyFileSuffx("pdf",file.name)){
        layer.msg("文件格式应为PDF");
        return;
    }
    if (file.size > 10000000) {
        layer.msg("文件大小不能超过10M");
        return;
    }
    var fd = new FormData();
    fd.append("file", file);
    var progress = $('<div class="course" data-file-url="" style="margin-left: 220px;display: block"></div>');
    progress.html( '\
    <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closemorebar(this)"></label></p>\
     <div class="probar">\
        <p class="probarbul"></p>\
     </div>\
    ')
    $(str).append(progress);
    progress.find("span").html(file.name);
    $.ajax({
        url: '${rlab}/front/file/ie/upload/image',
        type: 'POST',
        data: fd,
        contentType: false,
        processData: false,
        xhr:xhrOnProgress(function(e){
            var percent=e.loaded*100/e.total-5+"%";
            progress.find(".probarbul").css("width",percent);
        })
    }).done(function (data) {
        data=JSON.parse(data);
        progress.find(".probarbul").css("width","100%");
        progress.data("fileUrl",data.payload);
        layer.msg("done");
    })
    .fail(function (data) {
        progress.remove();
        layer.msg("fail");
    });
    }--%>

    //提交
    var LOGIN_AJAX_FLAG = true;
    function submitAudit() {
        if(!LOGIN_AJAX_FLAG){
            layer.msg('不要频繁点击');
            return false;
        }
        var orgName = $(".companyName").val();
        var orgCerSource =${source};
        var orgBaseReport = $(".page1 .course").data("fileUrl");
        var orgLicensePic = $(".page2 .course").data("fileUrl");
        var orgPersonFrontPic = $(".imgfront").data("imgSrc");
        var orgPersonBackPic = $(".imgside").data("imgSrc");
        var orgReport = [];
        var orgOtherReport = [];
        for (var i = 0; i < $(".finance .course").length; i++) {
            orgReport.push($(".finance .course").eq(i).data("fileUrl"));
        }
        for (var i = 0; i < $(".rest .course").length; i++) {
            orgOtherReport.push($(".rest .course").eq(i).data("fileUrl"));
        }
        if (orgReport.length<1){
            layer.msg("请上传财务报表");
            return;
        }
        var data = {
            "orgName": orgName,
            "orgCerSource": orgCerSource,
            "orgPersonFrontPic": orgPersonFrontPic,
            "orgPersonBackPic": orgPersonBackPic,
            "orgLicensePic": orgLicensePic,
            "orgReport": JSON.stringify(orgReport),
            "orgBaseReport": orgBaseReport,
            "orgOtherReport": JSON.stringify(orgOtherReport)
        }
//        console.log(data);
        $.ajax({
            url: '${rlab}/coupon/applyCertify?operate=${operate}',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            beforeSend:function () {
                LOGIN_AJAX_FLAG = false;
            },
            complete:function () {
                LOGIN_AJAX_FLAG = true;
            },
            contentType: "application/json"
        }).done(function (data) {
            if (data.code == 200) {
                window.location.href = "${rlab}/coupon/page"
            }  else if(data.code == 250){
                layer.msg(data.payload);
            }else if(data.code == 1012){
                layer.msg(data.message);
            }else{
                layer.msg("提交失败，请刷新页面重新尝试");
            }
        })
            .fail(function (data) {
                layer.msg("fail");
            });
    }
</script>
</body>
</html>