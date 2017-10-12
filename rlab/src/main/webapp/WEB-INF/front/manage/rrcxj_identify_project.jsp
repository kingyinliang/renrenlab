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

    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">
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

    <%--<link rel="stylesheet" href="${rlab}/front/js/view/webuploader.css">
    <script src="${rlab}/front/js/view/webuploader.js"></script>
    <script src="${rlab}/front/js/view/ajaxFileUpload.js"></script>--%>
    <script src="${rlab}/front/js/view/jq.form.js"></script>
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
        .authentication{
            padding: 42px 34px;
        }
        .tit a{
            color: #508df0;
        }
        .tit{
            font-size: 22px;
            color: #508df0;
        }

        .name{
            margin-left: 82px;
            margin-top: 44px;
            font-size: 16px;
            color: #333333;
            line-height: 50px;
        }
        .name b{
            color: red;
        }
        .companyName{
            width: 501px;
            height: 46px;
            border: 2px solid #f3f6f9;
            margin-left: 12px;
            font-size: 16px;
            line-height: 50px;
            padding-left: 10px;
        }
        .name .down{
            color: #508df0;
            font-style: oblique;
            text-decoration: underline;
        }
        .put{
            margin: 14px 0 0 200px;
        }
        .put a label{
            font-size: 17px;
            float: left;
            margin-top: 11px;
            margin-left: 15px;
        }
        .put .filebut{
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
            float: none;
        }
        .gonext a{
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
        .gonext{
            text-align: center;
            position: absolute;
            bottom: 100px;
            width: 100%;
        }
        .course{
            display: none;
            margin: 11px 0 0 200px;
            font-size: 12px;
            color: #666666;
            width: 300px;
            line-height: 18px;
        }
        .course .close{
            float: right;
            cursor: pointer;
            font-size: 16px;
        }
        .course span{
            width: 250px;
            display: inline-block;
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
        }
        .icon{
            margin-right: 5px;
            font-size: 14px;
        }
        .probar{
            width: 100%;
            height: 10px;
            border-radius: 5px;
            background: #d7dbe1;
            margin-top: 8px;
        }
        .probar .probarbul{
            height: 10px;
            background: #508df0;
            border-radius: 5px;
            width: 0%;
        }
        form input{
            position: absolute;
            z-index: -1;
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
            <jsp:param name="secondMenu" value="1" />
        </jsp:include>
        <div class="user_main" style="position: relative">
            <div class="authentication">
                <p class="tit"><a href="">人人创新券</a> > <a href="">申请创新券</a></p>
                <div class="page1">
                    <p class="name">
                        <span>项目名称 <b>*</b> ：</span>
                        <input type="text" class="companyName" maxlength="30">
                    </p>
                    <p class="name" style="margin-top: 26px">
                        <span>项目申请表 <b>*</b> ：</span>
                        <a download="" href="http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/2017/08/02/%E4%BA%BA%E4%BA%BA%E5%88%9B%E6%96%B0%E5%88%B8%E9%A1%B9%E7%9B%AE%E7%94%B3%E8%AF%B7%E8%A1%A8%EF%BC%88201708%E7%89%88%EF%BC%89.docx" class="down">人人实验项目申请表模板下载.doc</a>
                    </p>
                    <form  id="files" method="post" enctype="multipart/form-data">
                        <p class="put">
                            <label class="filebut" for="file"><i class="lab-search"></i>上传文件</label>
                            <input type="file" id="file" name="file" >
                        </p>
                    </form>
                    <p style="margin: 11px 0 0 200px;font-size: 12px;color: #999999">支持文件格式：Word、PDF（单个文件限制在10M以内）</p>
                    <div class="bar">
                        <div class="course" data-file-url="" style="margin-left: 200px;">
                            <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closemorebar(this)"></label></p>
                            <div class="probar">
                                <p class="probarbul"></p>
                            </div>
                        </div>
                    </div>
                    <p class="gonext"><a class="sub">提交申请</a></p>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
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
    var LOGIN_AJAX_FLAG = true;
    $(".sub").on("click",function () {
        if(!LOGIN_AJAX_FLAG){
            layer.msg('不要频繁点击');
            return false;
        }
        var companyName=$(".companyName").val();
        var re=/^[\w\u4E00-\u9FA5\uF900-\uFA2D]*$/;
        if(!re.test(companyName)||companyName.length==0){
            layer.msg("公司名称为30位内中文、英文、数字,不能为空");
            return;
        }
        if(!$(".page1 .course").data("fileUrl")){
            layer.msg("请上传基本信息表");
            return;
        }
        var orgProApplication=$(".bar .course").data("fileUrl");
        var data={
            "orgProName":companyName,
            "orgProApplication":orgProApplication,
            "orgCerId":${cerId}
        }
        $.ajax({
            url: '${rlab}/front/coupon/applyProject',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            beforeSend:function () {
                LOGIN_AJAX_FLAG = false;
            },
            complete:function () {
                LOGIN_AJAX_FLAG = true;
            }
        }).done(function (data) {
            if(data.code==200){
                window.location.href="${rlab}/front/coupon/page"
            } else if(data.code == 250){
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

    })


    function closemorebar($this) {
        $this=$($this);
        $this.parent().parent().hide();
        $this.parent().parent().data("fileUrl", "");
    }
    //上传
    $("#file").change(function(){
        morefiless(".bar","file","#files");
    });

    //上传文件
    var xhr=new XMLHttpRequest();
    var xhrOnProgress=function(fun) {
        xhrOnProgress.onprogress = fun; //绑定监听
        //使用闭包实现监听绑
        return function() {
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

    // http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-09/6f39b2f0-793e-4414-a97b-b9b69738f5ef.jpg?x-oss-process=style/renrenlab140_110
    function morefiless (str,str1,str2) {

        //文件限制兼容ie
        if(!document.getElementById(str1).files){
            var filenames=document.getElementById(str1).value;
            var filename=filenames.substring( filenames.lastIndexOf('\\')+1 );
            if (!verifyFileSuffx("pdf|doc|docx",filename)){
                layer.msg("文件格式不正确");
                return;
            }
            $(str).find(".course span").html(filename);
        }else {
            var file = document.getElementById(str1).files[0];
            if (!verifyFileSuffx("pdf|doc|docx",file.name)){
                layer.msg("文件格式不正确");
                return;
            }
            if (file.size > 1048576 * 10) {
                layer.msg("文件大小不能超过10M");
                return;
            }
            $(str).find(".course span").html(file.name);
        }
        $(str).find(".course .probarbul").css("width","0");
        $(str).find(".course").show();
        //进度条兼容xhr.upload.onprogress
        /*xhrOnProgress.onprogress = function () {};
         if (typeof xhrOnProgress.onprogress !== 'function') {
         console.log("+++");
         $(str).find(".course .probarbul").animate({"width":"40%"},1500);
         }*/
        var ajax_option={
            url:"${rlab}/front/file/ie/upload/image",//form 的action
            type:"post",
            resetForm: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            xhr:xhrOnProgress(function(e){
                var percent=e.loaded*100/e.total-5+"%";
                $(str).find(".probarbul").css("width",percent);
            }),
            success : function(data){  //表单提交成功后执行的函数
                data=JSON.parse(data);
                if (data.size > 1048576 * 10){
                    $(str).find(".course").hide();
                    $(str).find(".course").data("fileUrl","");
                    layer.msg("文件大小不能超过10M");
                    return;
                }
                $(str).find(".course .probarbul").animate({"width":"100%"},500);
                $(str).find(".course").data("fileUrl",data.payload);
                layer.msg("上传成功");
            },
            error: function () {
                $(str).find(".course").hide();
                $(str).find(".course").data("fileUrl","");
                layer.msg("上传出错");
            }
        }
        $(str2).ajaxSubmit(ajax_option);
        return false;
    }





</script>
</body>
</html>