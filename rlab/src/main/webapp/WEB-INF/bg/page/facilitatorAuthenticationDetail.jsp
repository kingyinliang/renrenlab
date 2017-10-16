<%--
  Created by IntelliJ IDEA.
  User: ChenXuan
  Date: 2017/9/18 0018
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <script src="${rlab}/common/assets/layui/layui.js"></script>
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .infModify p, .infP {
            line-height: 34px;
            font-size: 14px;
            color: #7b8da0;
            padding-left: 15px;
        }
        .infModify .tit{
            width: 130px;
            float: left;
            color: #333;padding: 0;font-size: 16px;
            margin-bottom: 10px;
        }
        .infModify p em{
            color: red;
        }
        .orgCorporation,.orgMessage{
            border-bottom: 1px dashed  #dce3ea;
            padding-bottom: 20px;
        }
        .business span{
            margin-right: 20px;
        }
        .business s{
            color: red;
        }
        .business button{
            background-color: #4f8df0;
        }
        .business{
            float: right;
        }
        .lab-gantanhao{
            color: red;
            cursor: pointer;
            margin-left: 5px;
        }
        .save button{
            background-color: #4f8df0;
        }
        .save{
            text-align: center;
            margin-top: 20px;
        }
        .txt{
            color: #4E4E4E;
        }
        .orgCorporation img{
            width: 240px;
            height: 148px;
        }
        .box{
            margin: 10px 0;
        }
        .box p{
            float: left;
        }
        .layui-btn{
            background-color: #4f8df0;
        }
        .phones p{
            float: left;
            color: #4E4E4E;
        }
        .phonesdiv{
            float: left;
        }
        .phonesdiv p{
            float: none;
        }
        .titinp{
            width: 130px;
            display: inline-block;
        }
        .box img{
            width: 140px;
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
        <div class="sd" >
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="5"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a><cite>服务商管理</cite></a>
                    <a href="${rlab}/page/facilitator/un">认证服务商列表</a>
                    <a><cite>详情</cite></a>
                </span>
            </div>
            <div class="infModify">
                <div class="orgCorporation">
                    <div class="clearfix">
                        <p class="tit">机构法人信息：</p>
                        <p class="business">
                            <span>业务人员：${empty orgInfo.orgBizName ?"无名":orgInfo.orgBizName}</span>
                            <span>业务状态：${orgInfo.orgBizUid eq 0?"公有":"私有"}</span>
                            <c:if test="${orgInfo.orgBizUid eq 0}">
                                <span><button class="layui-btn" onclick="jihuo()">激活</button></span>
                            </c:if>

                        </p>
                    </div>
                    <p><span class="titinp">真实姓名<em>**</em>：</span><span class="txt">${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.orgPerson}</span></p>
                    <p><span class="titinp">身份证号码<em>**</em>：</span><span class="txt">${orgInfo.orgLicense == null?'未知':orgInfo.orgLicense.identificationNumber}</span></p>
                    <p style="float: left"><span class="titinp">身份证照片<em>**</em>：</span></p>
                    <c:if test="${orgInfo.orgLicense != null}">
                        <img src="${orgInfo.orgLicense.legalPersonPic1}" style="margin-right: 10px;width: 240px">
                    </c:if>
                    <c:if test="${orgInfo.orgLogo == null}">
                        <img src="${rlab}/bg/img/usercard1.png" style="margin-right: 10px;width: 240px">
                    </c:if>
                    <c:if test="${orgInfo.orgLicense != null}">
                        <img src="${orgInfo.orgLicense.legalPersonPic2}" style="margin-right: 10px;width: 240px">
                    </c:if>
                    <c:if test="${orgInfo.orgLogo == null}">
                        <img src="${rlab}/bg/img/usercard2.png" style="margin-right: 10px;width: 240px">
                    </c:if>
                </div>
                <div class="orgMessage">
                    <p class="tit" style="margin-top: 20px;width: auto;float: none">机构信息：<c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                        <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                            <c:if test="${orgInfo.orgBizUid==0||sessionScope.uid==orgInfo.orgBizUid}">
                                <span style="float: right"><a href="${rlab}/bg/provider/modify/${orgInfo.orgOid}" ><button class="layui-btn">修改</button></a></span>
                            </c:if>
                        </c:if>
                    </c:if></p>
                    <p><span class="titinp">机构名称<em>**</em>：</span><span class="txt">${orgInfo.orgName}</span></p>
                    <p style="float: left"><span class="titinp">机构logo：</span><span class="txt"></span></p>
                    <c:if test="${!empty orgInfo.orgLogo}">
                        <img class="org_logo" src="${orgInfo.orgLogo}" style="width: 140px">
                    </c:if>
                    <c:if test="${empty orgInfo.orgLogo}">
                        <img class="org_logo" src="${rlab}/front/imgs/icon/org_logo_default.png" style="width: 140px">
                    </c:if>
                    <p><span class="titinp">组织机构代码<em>**</em>：</span><span class="txt">${orgInfo.orgCode}</span></p>
                    <p><span class="titinp">机构性质<em>*</em>：</span><span class="txt">${orgInfo.orgCategory}</span></p>
                    <p><span class="titinp">机构注册地<em>**</em>：</span><span class="txt">${orgInfo.orgLicense.orgAddrProvince}${orgInfo.orgLicense.orgAddrCity}${orgInfo.orgLicense.orgAddrDistrict}</span></p>
                    <p><span class="titinp">详细地址<em>**</em>：</span><span class="txt">${orgInfo.orgLicense.orgAddress}</span></p>
                    <p><span class="titinp">机构所在地<em>*</em>：</span><span class="txt">${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}</span></p>
                    <p><span class="titinp">详细地址<em>*</em>：</span><span class="txt">${orgInfo.orgAddress.orgAddrStreet}</span></p>
                    <p><span class="titinp">地址经纬度<em>*</em>：</span>东经<span class="txt">${orgInfo.orgAddress.orgAddrLatitude}</span>北纬<span class="txt">${orgInfo.orgAddress.orgAddrLongitude}</span></p>
                    <p><span class="titinp">机构座机：</span><span class="txt">${orgInfo.orgContacts.conPhone}</span></p>
                    <p><span class="titinp">机构邮编：</span><span class="txt">${orgInfo.orgAddress.orgZipcode}</span></p>
                    <p><span class="titinp">机构网址：</span><span class="txt">${orgInfo.orgWeb}</span></p>
                    <p><span class="titinp">机构传真：</span><span class="txt">${orgInfo.orgContacts.conFax}</span></p>
                    <p><span class="titinp">机构邮箱：</span><span class="txt">${orgInfo.orgContacts.conEmail}</span></p>
                    <div class="clearfix phones">
                        <p style="color: #7b8da0"><span class="titinp">联系方式<em>*</em>：</span></p>
                        <c:forEach items="${orgInfo.orgContactsList}" var="item">
                            <p>${item.conName}</p>
                            <div class="phonesdiv">
                                <p>${item.conPhone}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <p><span class="titinp">机构来源<em>**</em>：</span><span class="txt">${orgInfo.orgSourceStr}</span></p>
                    <div class="clearfix box">
                        <p style="float: left"><span class="titinp">机构资质：</span></p>
                        <c:forEach items="${orgInfo.orgCertificateList}" var="item">
                            <div style="float: left;margin-right: 10px">
                                <p style="text-align: center;float: none">${item.orgCertificateName}</p>
                                <img src="${item.orgCertificatePic}" alt="" style="width: 130px">
                            </div>
                        </c:forEach>
                    </div>
                    <div class="clearfix box">
                        <p style="float: left"><span class="titinp">营业执照副本<em>**</em>：</span><span class="txt"></span></p>
                        <img src="${empty orgInfo.orgLicense?'未知':orgInfo.orgLicense.orgLicensePic}" alt="" style="float: left">
                    </div>
                    <div class="clearfix box" style="display: ${empty orgInfo.orgCodeObject.orgCodePic ?"none":"block"}">
                        <p style="float: left"><span class="titinp">组织机构代码证<em>**</em>：</span><span class="txt"></span></p>
                        <img src="${empty orgInfo.orgCodeObject.orgCodePic?'未知':orgInfo.orgCodeObject.orgCodePic}" alt="" style="float: left">
                    </div>
                    <div class="clearfix box" style="display: ${empty orgInfo.orgLicense.taxEnrolCertificatePic ?"none":"block"}">
                        <p style="float: left"><span class="titinp">税务登记证<em>**</em>：</span><span class="txt"></span></p>
                        <img src="${empty orgInfo.orgLicense?'未知':orgInfo.orgLicense.taxEnrolCertificatePic}" alt="" style="float: left">
                    </div>
                    <p style="color: #4e4e4e"><span style="color: #7b8da0;">机构简介</span><em>*</em>：<br>
                        ${orgInfo.orgDescription}
                    </p>
                </div>
                <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                    <div class="save" style="display: ${orgInfo.orgIdentification eq 2?"block":"none" }">
                        <button class="layui-btn" onclick="gotan()">撤销</button>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var layer;
    layui.use(['layer'], function () {
        layer = layui.layer;
    });
    function jihuo() {
        var html='<div class="tan" style="padding: 20px">\
            <span class="lab-close-1" style="font-size: 22px;position: absolute;right: 10px;top: 10px;cursor: pointer" id="closetan"></span>\
            <p style="text-align: center;font-size: 16px;color: #333;line-height: 50px">确认激活该服务商？</p>\
            <div style="text-align: center;margin-top: 10px">\
            <button class="layui-btn" style="background-color:#7b8da0" id="closeTan">取消</button>\
            <button class="layui-btn" id="revocation">确定</button>\
            </div>\
            </div>';
        //页面层-自定义
        var layer_2 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'modal_class',
            content: html
        });

        $(".modal_class").css({
            width: 525
        })

        $("#closetan").off("click").on("click", function () {
            layer.close(layer_2);
        })

        $("#closeTan").off("click").on("click", function () {
            layer.close(layer_2);
        })

        $("#revocation").off("click").on("click", function () {
            activate();
        })
    }
    function activate() {
        $.ajax({
            url: '${rlab}/bg/provider/activate',
            type: 'get',
//            traditional: true,
            data:{
                oid:${orgInfo.orgOid}
            }
        })
        .done(function (data) {
            if (data.code==0){
                window.location.reload(true);
            }
        })
        .fail(function (data) {
            alert("失败");
        });
    }
    function gotan($this) {
        $this=$($this);
        var orgId=$this.data("orgId");
        var html='<div class="tan" style="padding: 20px">\
            <span class="lab-close-1" style="font-size: 22px;position: absolute;right: 10px;top: 10px;cursor: pointer" id="closetan"></span>\
            <p style="text-align: center;font-size: 16px;color: #333;line-height: 50px">撤销认证</p>\
            <textarea placeholder="请输入撤销原因" style="width: 485px;height: 200px" id="reason"></textarea>\
            <div style="text-align: center;margin-top: 10px">\
            <button class="layui-btn" style="background-color:#7b8da0" id="closeTan">取消</button>\
            <button class="layui-btn" id="revocation">确定</button>\
            </div>\
            </div>';
        //页面层-自定义
        var layer_1 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'modal_class',
            content: html
        });

        $(".modal_class").css({
            width: 525
        })

        $("#closetan").off("click").on("click", function () {
            layer.close(layer_1);
        })

        $("#closeTan").off("click").on("click", function () {
            layer.close(layer_1);
        })

        $("#revocation").off("click").on("click", function () {
            revocation(orgId);
        })
    }
    function revocation($this) {
        var oids=[];
        var reason=$("#reason").val();
        if ($("#reason").val().length==0){
            layer.msg("请输入撤销的原因");
            return;
        }

        oids.push(${orgInfo.orgOid});
        $.ajax({
            url: '${rlab}/bg/provider/auth/backout',
            type: 'post',
            traditional: true,
            data:{
                oids:oids,
                reason:reason
            }
        })
            .done(function (data) {
                window.location.href="${rlab}/bg/provider/detail/uncertificated/${orgInfo.orgOid}";
            })
            .fail(function (data) {
                alert("失败");
            });
    }
</script>
</html>

