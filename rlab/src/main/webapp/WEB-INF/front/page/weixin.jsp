<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <style type="text/css">
        *{margin: 0;padding: 0;}
        html,body{width: 100%;height: 100%;background: rgb(51,51,51);}
        #weixin{width: 322px;box-sizing: border-box;padding: 20px;margin-top: 100px;margin: 50px auto;text-align: center;}
        #weixin img{width: 282px;height: 282px;}#weixin h3{color: white;font-size: 20px;line-height: 60px;}#text p{color: white;}
        #text{box-sizing: border-box;width: 280px;padding: 7px 14px;margin-top: 15px;background-color: #232323;border-radius: 100px;-moz-border-radius: 100px;-webkit-border-radius: 100px;box-shadow: inset 0 5px 10px -5px #191919, 0 1px 0 0 #444;-moz-box-shadow: inset 0 5px 10px -5px #191919,0 1px 0 0 #444;-webkit-box-shadow: inset 0 5px 10px -5px #191919, 0 1px 0 0 #444;}
    </style>
</head>
<body>
<div id="weixin">
    <h3>人人实验服务号</h3>
    <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>
    <div id="text">
        <p>请使用微信扫描二维码关注</p>
        <p>服务号</p>
    </div>
</div>
<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
</body>
</html>
