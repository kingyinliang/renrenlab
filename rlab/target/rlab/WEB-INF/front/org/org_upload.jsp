<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css">
    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <!--[if lt IE 8]>
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

    <script src="${rlab}/front/js/view/jq.form.js"></script>
    <style type="text/css">
        body, .wrapper {
            background-color: #f3f6f9 !important;
        }

        .org_main {
            margin-bottom: 80px;
        }

        .org_upload {
            width: 1120px;
            background: #fff;
            margin: 0 auto;
            overflow: hidden;
            margin-top: 16px;
            min-height: 760px;
        }

        .org_upload .tips {
            background: #f9fbfc;
            font-size: 12px;
            color: #999;
            line-height: 30px;
            padding-left: 20px;
        }

        .org_upload .ctnt {
            padding-left: 32px;
            width: 570px;
            /*background: pink;*/
        }

        .org_upload .ctnt h2 {
            font-size: 22px;
            line-height: 74px;
            color: #508DF0;
        }

        .org_upload .ctnt > div {
            padding-left: 114px;
            position: relative;
        }

        .org_upload .ctnt > div > span {
            position: absolute;
            left: 0;
            top: 0;
            line-height: 46px;
            font-size: 16px;
            color: #333;
        }

        input.org_ipt {
            width: 442px;
            height: 46px;
            border: 1px solid #f3f6f9;
            font-size: 16px;
            color: #666;
            padding-left: 10px;
            line-height:46px;
        }

        .ctnt .up_main > p a {
            line-height: 46px;
            font-size: 16px;
            color: #508DF0;
            text-decoration: underline;
        }

        .ctnt .up_main .upload {
            width: 408px;
            height: 206px;
            background: #f9fbfc;
        }

        .ctnt .up_main .btn {
            text-align: center;
            margin-top: 45px;
        }

        .ctnt .up_main .btn > button {
            height: 40px;
            width: 88px;
            text-align: center;
        }

        /*滚动条*/
        .progress {
            padding-left: 4px;
        }

        .prgrs_item {
            margin-top: 20px;
        }

        .prgrs_item .gress_bar {
            width: 400px;
            height: 10px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            background-color: #d7dbe1;
            display: block;
            position: relative;
            overflow: hidden;
        }

        .prgrs_item .gress_bar s {
            background-color: #508DF0;
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            height: 10px;
            width: 392px;
        }

        .prgrs_name {
            overflow: hidden;

        }

        .prgrs_name i {
            overflow: hidden;

        }

        .prgrs_name {
            line-height: 26px;
        }

        .prgrs_name s {
            overflow: hidden;
        }

        .prgrs_name span {
            font-size: 12px;
            color: #333;
        }

        .prgrs_name s {
            float: right;
            margin-right: 27px;
            font-size: 20px;
            color: #cecece;
            cursor: pointer;
            line-height: 22px;
        }

        .filebut {
            cursor: pointer;
            width: 408px;
            height: 206px;
            display: block;
            font-size: 50px;
            text-align: center;
            line-height: 200px;
            position: relative;
        }

        .filebut span {
            position: absolute;
            display: block;
            height: 120px;
            width: 100%;
            top: 50px;
            text-align: center;
        }

        .filebut span i {
            line-height: 20px;
            position: absolute;
            top: 25px;
            left: 191px;
            margin-left: -30px;
        }

        .filebut span s {
            line-height: 20px;
            position: absolute;
            width: 260px;
            left: 50%;
            margin-left: -130px;
            font-size: 14px;
            color: #4f5e6e;
            line-height: 30px;
        }

        form input {
            position: absolute;
            z-index: -100;
        }

        .course {
            /*display: none;*/
            margin: 20px 0 0 0px;
            font-size: 12px;
            color: #666666;
            width: 400px;
            line-height: 18px;
        }

        .course span {
            width: 335px;
            display: inline-block;
            overflow: hidden;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            white-space: nowrap;
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
    </style>
</head>
<body>
<div class="wrapper" style="background-color: white">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--模块-->
    <div class="org_upload">
        <div class="tips">请填写好机构名称，将共享的仪器文件上传，工作人员会尽快在后台为您上线哟！</div>
        <div class="left ctnt">
            <h2>服务机构仪器共享</h2>
            <div>
                <span>机构名称：</span>
                <input class="org_ipt companyName" type="text" maxlength="30" value="">
            </div>
            <div class="up_main">
                <span>仪器资源：</span>
                <p><a href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/2017/08/02/%E4%BB%AA%E5%99%A8%E6%89%B9%E9%87%8F%E4%B8%8A%E4%BC%A0%E6%A0%BC%E5%BC%8F.xls" download="download">人人实验仪器共享模板文件下载.xls</a></p>
                <div class="upload">
                    <form id="files" method="post" action="${rlab}/front/file/ie/upload/image" enctype="multipart/form-data">
                        <p class="put">
                            <label class="filebut" for="file">
                                <span>
                                   <i class="lab-shangchuan_1" style="color: #508df0;font-size: 80px;"></i><br>
                                <s style="top: 65px;">点击这里上传文件 </s><br>
                                <s style="top: 90px;color: #a7b6c7;">支持扩展名：.doc .docx .pdf .xlsx</s>
                                </span>
                            </label>
                            <input type="file" id="file" name="file">
                        </p>
                    </form>
                </div>
                <div id="progress" class="progress">
                    <%--<div class="course" data-file-url="">--%>
                        <%--<p>--%>
                            <%--<label class="lab-biaoqian_2 icon"></label><span>asdasd.pdf</span>--%>
                            <%--<label class="lab-close-1 close" onclick="closebar(this)"></label>--%>
                        <%--</p>--%>
                        <%--<div class="probar">--%>
                            <%--<p class="probarbul"></p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                </div>
                <div class="btn">
                    <button class="init-btn bg-blue sub" type="button">提交</button>
                </div>
            </div>

        </div>
        <div class="right" style="margin-top: 142px;margin-right: 50px;">
            <img src="${rlab}/front/imgs/rt_link.jpg" alt="">
        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js"></script>
<script>
    // 初始化页面分页

    $("#file").change(function () {
//        morefiless("#progress", "file", "#files");
        if($("#progress .course").length >= 3){
            layer.msg("最多上传3个文件");
            $("#file").val("");
            return false;
        }

        morefiless("file", "files");
    });


    // 上传文件
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

    function morefiless(fileTagId, formTagId) {

        // 滚动轴
        var progress = $('<div class="course" data-file-url="" style="display: block" ></div>');
        progress.html('\
        <p><label class="lab-biaoqian_2 icon"></label><span></span><label class="lab-close-1 close" onclick="closemorebar(this)"></label></p>\
         <div class="probar">\
            <p class="probarbul"></p>\
         </div>\
        ');

        //文件限制兼容ie
        if (!document.getElementById(fileTagId).files) {
            var filenames = document.getElementById(fileTagId).value;
            var filename = filenames.substring(filenames.lastIndexOf('\\') + 1);
            if (!verifyFileSuffx("doc|docx|pdf|xlsx|xls", filename)) {
                layer.msg("文件格式不正确");
                return;
            }

            progress.find("span").html(filename);
        } else {

            var file = document.getElementById(fileTagId).files[0];
            if (!verifyFileSuffx("doc|docx|pdf|xlsx|xls", file.name)) {
                layer.msg("文件格式不正确");
                return;
            }

            if (file.size > 1048576 * 10) {
                layer.msg("文件大小不能超过10M");
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
            clearForm: true,
            xhr: xhrOnProgress(function (e) {
                var percent = e.loaded * 100 / e.total - 5 + "%";
                progress.find(".probarbul").css("width", percent);
            }),
            beforeSend: function () {
                $("#progress").append(progress);// 添加滚动轴
            },
            success: function (data) {  //表单提交成功后执行的函数

                if(!data.code){
                    data = JSON.parse(data);
                }
                if(data.code === 0){
                    if (data.size > 1048576 * 10) {
                        if(progress.length > 0){
                            progress.remove();
                        }
                        layer.msg("文件大小不能超过10M");
                        return;
                    }
                    progress.find(".probarbul").animate({"width": "100%"}, 500);
                    progress.data("fileUrl", data.payload);
                    progress.data("uploadStatus", 1);
                    if(progress.length > 0 && progress.data("removeFlag") != 1){
//                        layer.msg("上传成功");
                    }

                }else if(data.code === 1012){

                    if(progress.length > 0){
                        progress.remove();
                    }

                    layer.msg("请先登录，即将跳转登录页面");
                    logins();
                }else{
                    if(progress.length > 0){
                        progress.remove();
                    }
                }
            },
            error: function () {
                $('#files').clearForm(); // 提交后重置表单
                if(progress.length > 0){
                    progress.remove();
                }
                return false;
            },
            complete:function () {
                $("#file").val("");
            }
        }
        $('#' + formTagId).ajaxSubmit(ajax_option);
        return false;
    }

    // 点击提交
    $(".sub").on("click", function () {
        var companyName = $(".companyName").val();
        var re = /^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/;
        if (!re.test(companyName) || companyName.length == 0) {
            layer.msg("公司名称为30位内中文、英文、数字,不能为空");
            return;
        }

        if ($(".progress .course").length < 1) {
            layer.msg("请上传基本信息表");
            return;
        }

        var orgReport = [];
        for (var i = 0; i < $(".progress .course").length; i++) {
            if($(".progress .course").eq(i).data("uploadStatus") != 1){
                layer.msg("请等待文件上传完毕")
                return false;
            }
            orgReport.push($(".progress .course").eq(i).data("fileUrl"));
        }
        var data = {
            "orgName": companyName,
            "fileUrls": orgReport,
        }
        doUpload(data);
    })

    var UPLOAD_FLAG = true;
    function  doUpload(data) {
        if(!UPLOAD_FLAG){
            return false;
        }

        $.ajax({
            url: BASE_URL + '/front/uploadTmp/upload',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            beforeSend:function () {
                UPLOAD_FLAG = false;
            },
            success:function (data) {
                if(data.code === 0){
                    layer.msg("提交成功,请等待审核");
                    setTimeout(function () {
                        location.href = BASE_URL + '/front/org/upload';
                    },3000)
                }else{
                    console.log("请重新操作");
                }
            },
            error:function (err) {
                console.log(err);
            },
            complete:function () {
                UPLOAD_FLAG = true;
            }
        })

    }
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

    // 清除DOM
    function closemorebar($_this) {
        var $_this = $($_this).parent().parent();
        $_this.remove();
    }
</script>
</body>
</html>
