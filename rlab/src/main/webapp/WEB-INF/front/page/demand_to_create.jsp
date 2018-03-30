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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20170905">
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
        .pageBanner {
            background-color: white;
            height: 150px;
            width: 100%;
            margin-top: 20px;
        }

        .radius {
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -ms-border-radius: 10px;
            -o-border-radius: 10px;
        }

        .inputBG {
            margin-top: 20px;
            width: 100%;
            height: 330px;
            background-color: white;
            overflow: hidden;
            padding: 0 25px;
            position: relative;
        }

        .inputBG h2 {
            line-height: 86px;
        }

        .inputBG .count {
            font-size: 12px;
            color: #999;
            position: absolute;
            ght: 45px;
            position: absolute;
            right: 10px;
            bottom: 6px;
            z-index: 2;
        }

        /*.input{*/
        /*margin: 30px 30px 0 30px;*/
        /*background-color: #fafafa;*/
        /*width: 1050px;*/
        /*height: 130px;*/
        /*color: #4e4e4e;*/
        /*font-size: 14px;*/
        /*resize: none;*/
        /*border: 1px solid #ddd;*/
        /*}*/

        .publish {
            border: 0 none;
            background-color: #508df0;
            color: white;
            font-size: 18px;
            width: 100px;
            height: 40px;
            float: right;
            margin-right: 30px;
            margin-top: 30px;
            cursor: pointer;
        }

        .txt_box {
            /*width: 1064px;*/
            margin: 0 auto;
            height: 130px;
            background-color: #fafafa;
            border: 1px solid #ddd;
            overflow: hidden;
            position: relative;
        }

        .txt_box textarea {
            position: absolute;
            top: -4px;
            left: -4px;
            width: 1088px;
            height: 140px;
            padding: 20px 40px 20px 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            color: #4E4E4E;
        }

        .button {
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            width: 110px;
            height: 40px;
            margin-top: 30px;
        }

    </style>
</head>
<body>
<div class="wrapper" style="background-color: #f3f6f9">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--模块-->
    <div class="user_center user_content clearfix" style="width: 100%; background-color: #f3f6f9; padding-bottom: 30px">
        <div style="width: 1120px; margin: 0 auto">
            <div class="pageBanner radius">
                <img src="${rlab}/front/imgs/demand_create.jpg" style="width: 100%; height: 100%">
            </div>
            <div class="inputBG radius ">
                <h2>需求描述</h2>
                <div class="txt_box">
                    <p id="count" class="count" style="">0/140字</p>
                    <textarea maxlength="140" class="input"
                              placeholder="为了保证您获得质量更佳的服务，请具体描述该实验项目的可公开信息，包括但不限于研究目的/背景介绍、实验样品（名称、数量、状态、处理方式等）、实验方法（标准、技术规范等）、实验仪器设备（名称、品牌、型号等）以及服务方资质要求等。"></textarea>
                </div>
                <button class="publish" type="button" style="">我要发布</button>
            </div>
        </div>

    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <div id="modify" style="width: 400px; height: 170px; background-color: #cccccc; display: none">
        <p style="font-size: 16px; text-align: center; margin-top: 20px">确认发布此需求？</p>
        <button style="cursor:pointer;margin-left: 70px; float: left; background-color: white; border: 1px solid #ccc; color: #999" class="dismiss button">取消
        </button>
        <button style="cursor:pointer;margin-right: 70px; float: right; background-color: #508df0; color: white" class="commit button">
            确定
        </button>
    </div>
</div>
</body>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script type="text/javascript">
    $(".input").on("input", function () {
        var text = $(".input").val();
        $("#count").text(text.length + '/140字');
    });

    var FLAG = true;
    $(".publish").on("click", function () {

        if(!FLAG){
            layer.msg("不要频繁操作哟!");
            return false;
        }

        var text = $(".input").val();
        if (text.length == 0){
            layer.msg("需求描述不能为空");
            return;
        }

        var html = $("#modify").html();
        var laryer = layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 0,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['400px', '150px'], //宽高
            content: html  //弹窗内容
        });

        $(".dismiss").off("click").on("click", function () {
            layer.close(laryer);
        });
        $(".commit").off("click").on("click", function () {

            var text = $(".input").val();
            var data = {
                'uReqDescription': text,
            };

            $.ajax({
                url: '${rlab}/user/req/pub',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:function (data) {
                    if(data.code === 0){
                        layer.msg("需求发布成功，即将跳转");
                        setTimeout(function () {
                            window.location.href = '${rlab}/user/req/tinylist?pageNo=1&pageSize=10&state=0';
                        },1000)
                    }
                },
                error:function () {
                    layer.msg('发布失败，请重新操作！')
                },
                complete:function () {
                    FLAG = true;
                    layer.close(laryer);
                }
            })

        });
    })
</script>
</html>
