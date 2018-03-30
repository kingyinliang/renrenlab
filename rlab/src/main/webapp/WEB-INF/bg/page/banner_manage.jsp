<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/7/14 0014
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp"%>
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <script src="${rlab}/bg/js/jquery-3.2.0.min.js"></script>
    <script src="${rlab}/bg/js/jquery.sortable.js"></script>
    <script src="${rlab}/common/assets/layui/layui.js" charset="utf-8"></script>
    <script src="${rlab}/bg/js/main.js"></script>
    <style>
        .form{
            overflow: hidden;
            height: 100%;
        }
        .table a{
            color: #4c5e70;
            padding-left: 3px;
            padding-right: 3px;
            display: block;
            float: left;
            cursor: pointer;
        }


        .remove:hover{
            color: #ff441f;
        }
        .forbidden:hover{
            color: #f49b28;
        }
        .check:hover{
            color: #49aaff!important;
        }
        .shade .tit{
            padding: 26px 0 0 0;
            overflow: hidden;
        }
        .shade .tit span{
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 25px;
        }
        .shade .tit p{
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }
        .shade .tit button{
            width: 50%;
            box-sizing: content-box;
            margin: 0;
            float: left;
            height: 60px;
            margin-bottom: 0;
            margin-top: 0;
            border-radius: 0;
            border-top: 1px solid #7b8da0;
            background: #78b3e7;
        }
        .btn:hover{color: white!important;}

        .banner_table{
            margin-top: 20px;
        }
        .table_sortable li div{
            height: auto;
            min-height: 20px;
        }
        .table_sortable li{
            background: #f2f5f8;
            height: 93px;
        }
        .table_sortable li p{
            height: 93px;
        }
        .table_sortable li p,.theads p{
            text-align: center;
            float: left;
            padding: 9px 15px;
            min-height: 20px;
            line-height: inherit;
            overflow: hidden;
            border: 1px solid #e2e2e2;
            font-size: 14px;
        }
        .name {
            width: 15%;
        }
        .simg{
            width: 40%;
        }
        .hreftype{
            width: 15%;
        }
        .state{
            width: 10%;
        }
        .operation{
            width: 20%;
        }
        .simg img{
            width: 250px;
            height: 73px;
        }
        #addbanner .addbannermain{
            background: white;
            position: absolute;
            margin: auto;
            background: white;
            position: absolute;
            margin: auto;
            top:50%;
            left: 50%;
            border-radius: 5px;
            padding: 20px;
            width: 550px;
            height: 400px;
            margin-left: -275px;
            margin-top: -200px;
        }
        .addbannermain h3{
            font-size: 17px;
            color: #0a8ddf;
        }
        .addbanneritem{
            margin: 10px 0;
        }
        .addbannermain div{
            line-height: 28px;
        }
        .addbannermain .bannertit{
            line-height: 36px;
            float: left;
        }
        .bannertxt,.bannerhref{
            border: 1px solid #e6e6e6!important;
        }
        .addbanneritem input{
            border: 1px solid #e6e6e6!important;
        }
        .rt{
            margin-left: 110px;
        }
        .org_load {
            width: 250px;
            height: 73px;
            position: relative;
            overflow: hidden;
            cursor: pointer;
        }
        .org_load img {
            width: 250px;
            height: 73px;
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
            height: 73px;
            width: 250px;
            display: block;
            top: 0;
            left: 0;
            cursor: pointer;
        }
        .operation a{
            cursor: pointer;
        }
        .shadetype{
            color: red;
        }
        .checkBox{
            width: 400px;
            height: 200px;
            background: white;
            position: absolute;
            margin: auto;
            background: white;
            position: absolute;
            margin: auto;
            top:50%;
            left: 50%;
            border-radius: 5px;
            padding: 20px;
            margin-left: -200px;
            margin-top: -100px;
        }
        .layui-input-block label,.layui-input-block input[type='radio']{
            cursor: pointer;
            margin-right: 5px;
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
                <jsp:param name="firstMenu" value="11"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main">
            <%-- 编写代码的地方，内容区域 --%>
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>界面管理</cite></a>
                    <a><cite>焦点图管理</cite></a>
                </span>
            </div>
            <div class="clearfix time">
                <div class="listNature state" style="margin-top: 20px;width: 250px;margin-right: 25px;margin-left: 0">
                    <form class="layui-form" style="height: 50px;width: 250px;">
                        <select name="places" lay-verify="" lay-filter="renzhengtype">
                            <%--<option value="">请选择banner位置</option>--%>
                            <option value="1">科创头条banner</option>
                            <%--<option value="0">首页banner</option>--%>
                        </select>
                    </form>
                </div>
                <button class="layui-btn btn" style="margin:20px 23px 0 0;background: #49aaff;float: left;" onclick="showaddbanner()">新增</button>
                <button class="layui-btn btn" style="background: #16b8be;float: left;margin-top: 20px" onclick="gosort()">排序</button>
                <button class="layui-btn btn sort" style="margin-left: 30px;background: red;float: left;margin-top: 20px;display: none" onclick="sort()">确认此排序</button>
            </div>
            <div class="banner_table">
                <div class="clearfix theads" style="background: #6693c8;color: white">
                    <p class="name">名称</p>
                    <p class="simg">缩略图</p>
                    <p class="hreftype">链接类型</p>
                    <p class="state">状态</p>
                    <p class="operation">操作</p>
                </div>
                <ul class="table_sortable">
                    <c:forEach items="${bannerList}" var="banner">

                        <li class="sortableitem" data-ban-id="${banner.bId}">
                            <div class="clearfix">
                                <p class="name">${banner.bTitle}</p>
                                <p class="simg">
                                    <img src="${banner.bPic}" alt="">
                                </p>
                                <p class="hreftype">${banner.bLinkType eq 0?"不跳转":banner.bLinkType eq 1?"站内跳转":"站外跳转"}</p>
                                <p class="state">${banner.bState eq 0 ?"停用":"启用"}</p>
                                <p class="operation">
                                    <a class="check" data-ban-id="${banner.bId}">${banner.bState eq 1 ?"停用":"启用"}</a>
                                    <a class="forbidden" data-b-id="${banner.bId}" data-blink-type="${banner.bLinkType}" data-b-state="${banner.bState}" data-b-href="${banner.bLink}">编辑</a>
                                    <a class="remove" data-ban-id="${banner.bId}">删除</a>
                                </p>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>

        </div>
    </div>
    <%--弹窗--%>
    <div id="addbanner" class="shade">
        <div class="addbannermain">
            <h3><span>新增</span>焦点图</h3>
            <form class="layui-form" action="" id="addbannerform">
                <div class="clearfix addbanneritem">
                    <span class="bannertit">类型</span>
                    <div class="layui-input-block">
                        <input type="radio" name="hrefs" value="1" title="站内链接" class="radios">
                        <input type="radio" name="hrefs" value="2" title="站外链接" class="radios">
                        <input type="radio" name="hrefs" value="0" title="不跳转" checked="checked" class="radios">
                    </div>
                </div>
                <div class="clearfix addbanneritem">
                    <span class="bannertit">标题</span>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input bannertxt">
                    </div>
                </div>
                <div class="clearfix addbanneritem">
                    <span class="bannertit">链接地址</span>
                    <div class="layui-input-block">
                        <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入链接地址" class="layui-input bannerhref">
                    </div>
                </div>
                <div class="clearfix addbanneritem">
                    <span class="bannertit">banner图</span>
                    <div class="rt">
                        <div class="org_load site-demo-upload">
                            <img id="logImg" src="${rlab}/bg/img/addbanner.png">
                            <i class="license_remove layui-icon">&#x1007;</i>
                            <input id="logImgfile" data-img-src="" onchange="uploadImg(this)" name="qualifications"
                                   accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">
                        </div>
                    </div>
                </div>
                <div class="clearfix addbanneritem">
                    <span class="bannertit">状态</span>
                    <div class="layui-input-block">
                        <select name="banstype" lay-verify="" lay-filter="banstype" id="banstype">
                            <option value="1" >正常</option>
                            <option value="0" selected="selected">停用</option>
                        </select>
                    </div>
                </div>
                <button class="layui-btn btn" onclick="closeaddbanner()" type="reset" style="float: right;background: #e0dfe0">取消</button>
            </form>
            <button class="layui-btn btn" onclick="addbanner(this)" style="float: right;margin-right: 15px" id="addban">确认</button>
        </div>
    </div>
    <div class="shade" id="checkBox">
        <div class="checkBox">
            <p style="margin: 20px 0;font-size: 20px;color: #333333;text-align: center">是否确认<span class="shadetype"></span>该banner</p>
            <div style="text-align: center;margin-top: 40px">
                <button class="layui-btn btn bansub" onclick="checkBox(this)" style="">确认</button>
                <button class="layui-btn btn" onclick="closecheckBox()" type="reset" style="background: #e0dfe0">取消</button>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    var places;
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(places)', function (data) {
            places = data.value;
        });
    });
    /*停用删除弹窗*/
    $(".check").on("click",function () {
        $(".shadetype").html($(this).text());
        if($(this).html()=="停用"){
            $(".bansub").data("banState",0)
        }else {
            $(".bansub").data("banState",1)
        }
        $(".bansub").data("banId",$(this).data("banId"));
        $("#checkBox").show();
    })
    $(".remove").on("click",function () {
        $(".shadetype").html($(this).text());
        $(".bansub").data("banState",2)
        $(".bansub").data("banId",$(this).data("banId"));
        $("#checkBox").show();
    })
    /*停用或删除*/
    function checkBox($this) {
        var formData={
            bId:$($this).data("banId"),
            bState:$($this).data("banState")
        }
        $.ajax({
            url: '${rlab}/bg/interface/banner/edit',
            type: 'POST',
            data: JSON.stringify(formData),
            dataType: "json",
            contentType: "application/json",
            beforeSend: function () {
                repeatSubmit=false;
            },
            success: function (data) {
                if(data.code==0){
                    if (data.code == 0) {
                        window.location.reload(true);
                    } else {
                        alert(data.description);
                    }
                }else{
                    alert(data.description);
                }
            },
            error: function () {
                error();
            },
            complete:function () {
                repeatSubmit = true;
            }

        })
    }
    function closecheckBox() {
        $("#checkBox").hide();
    }
    /*编辑*/
    $(".forbidden").on("click",function () {
        $("#addbanner h3 span").text("编辑");
        $("#addbanner").show();
        $("#addban").data("bId",$(this).data("bId"));

        var update=$("#addbannerform");
        update.find("input[type=radio][value="+$(this).data("blinkType")+"]").next().find("i").click();//将value是的单选框选中

        update.find("dd[lay-value="+$(this).data("bState")+"]").click();//将下拉列表value为的项选中

        $(".bannertxt").val($(this).parent().parent().find(".name").text());
        if ($(this).data("bHref")){
            $(".bannerhref").val($(this).data("bHref"));
        }

        $("#logImg").attr("src",$(this).parent().parent().find(".simg img").attr("src"));
        $("#logImgfile").data("imgSrc",$(this).parent().parent().find(".simg img").attr("src"));
    })
    function showaddbanner() {
        $("#addbanner h3 span").text("新增");
        $("#addbanner").show();
    }
    function closeaddbanner() {
        $("#addbanner").hide();
        $(".rt img").attr('src', BASE_URL + '/bg/img/addbanner.png');
        $("#logImgfile").data('imgSrc','');
    }
    function gosort() {
        $(".sort").show();
        $('.table_sortable').sortable('enable').bind('sortupdate', function() {});
    }
    /*排序*/
    function sort() {
        var arrs=[];
        for(var i=0;i<$(".table_sortable li").length;i++){
            $(".table_sortable li").eq(i).data("banId")
            var obj={
                bId:$(".table_sortable li").eq(i).data("banId"),
                bSeq:i+1,
            };
            arrs.push(obj);
        }
        $.ajax({
            url: '${rlab}/bg/interface/banner/sort',
            type: 'POST',
            data: JSON.stringify(arrs),
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if(data.code==0){
                    //$("#addbanner").hide();
                    $(".sort").hide();
                    $('.table_sortable').sortable('disable');
                    window.location.reload(true);
                }else{
                    alert(data.description);
                }
//                success(data);
            },
            error: function () {
                error();
            }
        })
    }






    $("#logImg").on("click", function () {
        $("#logImgfile").trigger('click');
    })
    var repeatSubmit = true;
    /*新增banner*/
    function addbanner($this) {
        if(!repeatSubmit){
            return false;
        }
        if(!$("#logImgfile").data("imgSrc") ){
            alert("请上传图片")
            return false;
        }
        if($($this).data("bId")){
            var formData={
                bId:$($this).data("bId"),
                bPosition:${position},
                bLinkType: $(".radios:checked").val(),
                bTitle:$(".bannertxt").val(),
                bLink:$(".bannerhref").val(),
                bPic:$("#logImgfile").data("imgSrc"),
                bState:$("#banstype").val(),
            };
            $.ajax({
                url: '${rlab}/bg/interface/banner/update',
                type: 'POST',
                data: JSON.stringify(formData),
                dataType: "json",
                contentType: "application/json",
                beforeSend: function () {
                    repeatSubmit=false;
                },
                success: function (data) {
                    if(data.code==0){
                        $("#addbanner").hide();
                        window.location.reload(true);
                    }else{
                        alert(data.description);
                    }
//                success(data);
                },
                error: function () {
                    error();
                },
                complete:function () {
                    repeatSubmit = true;
                }

            })
        }else {
            var formData={
                bPosition:${position},
                bLinkType: $(".radios:checked").val(),
                bTitle:$(".bannertxt").val(),
                bLink:$(".bannerhref").val(),
                bPic:$("#logImgfile").data("imgSrc"),
                bState:$("#banstype").val(),
            };
            $.ajax({
                url: '${rlab}/bg/interface/banner/add',
                type: 'POST',
                data: JSON.stringify(formData),
                dataType: "json",
                contentType: "application/json",
                beforeSend: function () {
                    repeatSubmit=false;
                },
                success: function (data) {
                    if(data.code==0){
                        $("#addbanner").hide();
                        window.location.reload(true);
                    }else{
                        alert(data.description);
                    }
//                success(data);
                },
                error: function () {
                    error();
                },
                complete:function () {
                    repeatSubmit = true;
                }

            })
        }



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
    /*删除图片*/
    $(".license_remove").on("click", function () {
        $(this).parent().find("input").data('imgSrc', '');
        $(this).parent().find("input").val("");
        $(this).parent().find("img").attr('src', BASE_URL + '/bg/img/addbanner.png');
    })
    $('.table_sortable').sortable({items:'.sortableitem'});
    $('.table_sortable').sortable('disable');
</script>
</html>


