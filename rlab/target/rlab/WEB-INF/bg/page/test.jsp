<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
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

    <%--<link rel="stylesheet" href="${rlab}/front/js/view/webuploader.css">
    <script src="${rlab}/front/js/view/webuploader.js"></script>
    <script src="${rlab}/front/js/view/ajaxFileUpload.js"></script>--%>
    <script src="${rlab}/front/js/view/jq.form.js"></script>
    <style>

    </style>
</head>
<body>

    <form  id="pro_change" method="post" enctype="multipart/form-data">
        <input type="file" id="file" name="file" >
        <button type="button" onclick="uptDogProInfo()">提交</button>
    </form>

<script>
    $("#file").change(function(){
        uptDogProInfo()
    });
    function uptDogProInfo(){
        if(!document.getElementById("file").files){
            var ajax_option={
                url:"${rlab}/bg/file/upload/image",//form 的action
                type:"post",  //form 的method方法
    //            beforeSubmit:checkUppro,  //在表达提交前执行的验证函数
                contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
                success:function(data){  //表单提交成功后执行的函数
                    alert("执行成功！");
                }
            }
            $('#pro_change').ajaxSubmit(ajax_option);
            return false;
        }
    }

</script>

</body>
</html>
