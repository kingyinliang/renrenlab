<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp"%>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="${rlab}/common/assets/layui/layui.js"></script>

    <script src="${rlab}/common/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>
    
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>
    <link rel="stylesheet" href=http://at.alicdn.com/t/font_ac6brlolam26gvi.css>
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
<style>
    .orgDetail p{
        font-size: 18px;
        color: #4c5e70;
        line-height: 30px;
        margin-bottom: 10px;
    }
    .orgDetail p .detailTit{
        color: #7b8da0;
    }
    .orgDetail p .datailText{
        margin-left: 20px;
    }
    .orgDetail p .datailText img{
        width: 130px;
        height: 130px;
        margin-right: 20px;
    }
    .span{
        width: 4px;
        height: 20px;
        background: #669348;
    }
    .table{
        margin-top: 26px;
    }
    .btn{
        width: 140px;
        height: 50px;
        font-size: 18px
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
    .shade p{margin: 0 0 10px}
    .zizhi img{margin-bottom: 10px;width: 130px;height: 130px;}
    .describe{
        margin: 10px 0 10px 140px;
    }
    .orgitem{float: left;margin-right: 10px}
    .orgitem p{text-align: center}
    .mar{margin-left: 55px!important;}
    .approve{margin-left: 20px;color: #7b8da0;font-size: 18px}
    .lls{color: #feaa07;}
    .logo img{border-radius: 7px;overflow: hidden}
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
                <jsp:param name="levelNum" value="2" />
                <jsp:param name="firstMenu" value="4" />
                <jsp:param name="secondMenu" value="1" />
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a href="${rlab}/bg/org/search?pageNo=1&pageSize=10">机构管理</a>
                    <a><cite>机构详情</cite></a>
                </span>
            </div>
            <div class="orgDetail">
                <p><span class="detailTit">机构名称：</span><span class="datailText mar">${orgInfo.orgName}</span><span class="approve" style="display: ${orgInfo.orgIdentification != 2 ? '':"none"}"><label class="iconfont icon-renzheng"></label> ${orgInfo.orgIdentification == 0 ? '企业':"服务商"}</span><span class="approve lls" style="display: ${orgInfo.orgIdentification == 2 ? '':"none"}"><label class="iconfont icon-renzheng"></label> 认证服务商</span></p>
                <p><span class="detailTit">隶属机构：</span><span class="datailText mar">${orgInfo.parentOrgName == null ? '暂无': orgInfo.parentOrgName}</span></p>
                <p><span class="detailTit logo">机构logo：</span><span class="datailText mar" style="border-radius: 7px;overflow: hidden">
                    <c:choose>
                        <c:when test="${orgInfo.orgLogo != null && !''.equals(orgInfo.orgLogo)}">
                            <c:if test="${orgInfo.orgPositionList.size() > 0}">
                                            <img id="logImg"
                                                 src="${orgInfo.orgLogo}?x-oss-process=image/crop,x_${orgInfo.orgPositionList.get(0)},y_${orgInfo.orgPositionList.get(1)},w_${orgInfo.orgPositionList.get(2)},h_${orgInfo.orgPositionList.get(3)}">
                            </c:if>
                            <c:if test="${!(orgInfo.orgPositionList.size() > 0)}">
                                <img id="logImg" src="${orgInfo.orgLogo}">
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <img id="logImg" src="${rlab}/bg/img/logoDefault.jpg">
                        </c:otherwise>
                    </c:choose>
                    <%--<img src="${orgInfo.orgLogo == null? '../../../bg/img/logoDefault.jpg': orgInfo.orgLogo}" alt="" style="border-radius: 50%;overflow: hidden">--%>
                </span></p>
                <p><span class="detailTit">机构性质：</span><span class="datailText mar">${orgInfo.orgCategory}</span></p>
                <p><span class="detailTit">机构地址：</span>
                    <span class="datailText mar">
                        <c:if test="${orgInfo.orgAddress != null}">
                            ${orgInfo.orgAddress.orgAddrProvince == '0' ? '':orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity == '0' ? '':orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict == '0' ? '':orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}
                        </c:if>
                        <c:if test="${orgInfo.orgAddress == null}">
                            暂无
                        </c:if>
                        <%--${orgInfo.orgAddress == null? '暂无':  orgInfo.orgAddress.orgAddrProvince.concat(orgInfo.orgAddress.orgAddrCity==0?'':orgInfo.orgAddress.orgAddrCity)}--%>
                    </span>
                </p>
                <p><span class="detailTit">地址经纬度：</span><span class="datailText" style="margin-left: 40px">经度：${orgInfo.orgAddress == null? '0': orgInfo.orgAddress.orgAddrLongitude}  维度：${orgInfo.orgAddress == null ? '0': orgInfo.orgAddress.orgAddrLatitude}</span></p>
                <div id="map" style="width: 350px;height: 200px;position: relative;margin-left: 145px;margin-bottom: 10px;border-radius: 7px;overflow: hidden;"></div>
                <p><span class="detailTit">机构电话：</span><span class="datailText mar">${orgInfo.orgContacts == null? '暂无': orgInfo.orgContacts.conPhone == null? '暂无': orgInfo.orgContacts.conPhone}</span></p>
                <p><span class="detailTit">机构邮编：</span><span class="datailText mar">${orgInfo.orgAddress == null? '暂无': orgInfo.orgAddress.orgZipcode == null? '暂无': orgInfo.orgAddress.orgZipcode}</span></p>
                <p><span class="detailTit">机构网址：</span><span class="datailText mar">${orgInfo.orgWeb == null? '暂无': orgInfo.orgWeb}</span></p>
                <p><span class="detailTit">机构传真：</span><span class="datailText mar">${orgInfo.orgContacts == null? '暂无': orgInfo.orgContacts.conFax == null? '暂无': orgInfo.orgContacts.conFax}</span></p>
                <p><span class="detailTit">机构邮箱：</span><span class="datailText mar">${orgInfo.orgContacts == null? '暂无': orgInfo.orgContacts.conEmail == null? '暂无': orgInfo.orgContacts.conEmail}</span></p>
                <p><span class="detailTit">组织机构代码：</span><span class="datailText">${orgInfo.orgCode == null? '暂无': orgInfo.orgCode}</span></p>
                <p><span class="detailTit" style="float: left">营业执照副本：</span><span class="datailText">
                        <c:if test="${orgInfo.orgLicensePic != '' && orgInfo.orgLicensePic != null}">
                            <img src="${orgInfo.orgLicensePic}" alt="" style="width: 300px;height: 208px">
                        </c:if>
                        <c:if test="${orgInfo.orgLicensePic == '' || orgInfo.orgLicensePic == null}">
                            <img src="${rlab}/bg/img/licence.jpg" alt="" style="width: 300px;height: 208px">
                        </c:if>
                    <%--<c:if test="${orgInfo.orgLicensePic == null}">--%>
                        <%--<img src="${rlab}/bg/img/licence.jpg" alt="" style="width: 300px;height: 208px">--%>
                    <%--</c:if>--%>
                    </span>
                </p>
                <div class="clearfix">
                    <span class="detailTit" style="color: #7b8da0;font-size: 18px">机构资质：</span>
                    <div class="describe zizhi clearfix">
                        <c:forEach items="${orgInfo.orgCertificateList}" var="orgpic">
                            <div class="orgitem clearfix">
                                <p>${orgpic.orgCertificateName}</p>
                                <c:if test="${orgpic.orgCertificatePic != ''}">
                                    <img src="${orgpic.orgCertificatePic}" alt="">
                                </c:if>
                                <c:if test="${orgpic.orgCertificatePic == ''}">
                                    <img src="${rlab}/bg/img/ziZhiDefault.png" alt="">
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div>
                    <span class="detailTit" style="color: #7b8da0;font-size: 18px">机构简介：</span>
                    <div class="describe">${orgInfo.orgDescription == null? '暂无': orgInfo.orgDescription}</div>
                </div>
                <p style="border-left: 4px solid #6693c8;padding-left: 20px;line-height: 20px;margin-top: 50px"><span class="span"></span><span class="detailTit" style="color: #4c5e70">加入此机构的用户：</span></p>
                <div class="table">
                    <table class="layui-table">
                        <colgroup>
                            <col width="15%">
                            <col width="15%">
                            <col width="15%">
                            <col width="25%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>手机号</th>
                            <th>昵称</th>
                            <th>真实姓名</th>
                            <th>注册时间</th>
                            <th>身份</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${orgInfo.orgManagerList!=null && fn:length(orgInfo.orgManagerList)>0}">
                            <c:forEach items="${orgInfo.orgManagerList}" var="item">
                                <tr>
                                    <td>${item.uMobile}</td>
                                    <td>${item.uNickname}</td>
                                    <td>${item.uName}</td>
                                    <td>${item.createTimeStr}</td>
                                    <td>${item.managerType == 0? '创建者': '管理员'}</td>
                                </tr>
                            </c:forEach>
                        </c:if>


                        </tbody>
                    </table>
                </div>
                <div style="text-align: center;margin-top: 30px">
                    <%--撤销权限--%>
                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                        <button class="layui-btn btn" style="background: #f3737b" onclick="closeOrg(this)">${orgInfo.orgState == 0? '关闭': '开启'}机构</button>
                    </c:if>
                    <%--撤销权限--%>
                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                        <button class="layui-btn btn" style="margin-right: 23px;background: #49aaff" onclick="tomidify()">修改机构</button>
                    </c:if>
                </div>

            </div>
        </div>
    </div>
    <div class="shade" id="close">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认${orgInfo.orgState == 0? '关闭': '开启'}此机构</p>
            <p style="font-size: 16px;color: #909090">${orgInfo.orgState == 0? '关闭': '开启'}机构后，该机构用户${orgInfo.orgState == 0? '不': ''}可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closeshade()">取消</button>
            <button class="layui-btn" onclick="closeorg()">确认</button>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var x=${orgInfo.orgAddress.orgAddrLongitude};
    var y=${orgInfo.orgAddress.orgAddrLatitude};
    var map = new BMap.Map("map");
    var point = new BMap.Point(x,y);
    var marker = new BMap.Marker(point);  // 创建标注
    map.addOverlay(marker);
    map.centerAndZoom(point, 15);


    function tomidify() {
        window.location.href='${rlab}/bg/org/search/detail?operator=modify&oid=${orgInfo.orgOid}';
    }
    function closeOrg($this) {
        $("#close").show();
    }
    function closeorg() {
        var state = ${orgInfo.orgState == 0? 1:0};
        var id = ${orgInfo.orgOid};

        $.ajax({
            url: '${rlab}/bg/org/close?oid=' + id + '&os=' + state,
            type: 'PUT',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("修改失败");
            });
    }
    function closeshade() {
        $("#close").hide();
    }
</script>
</html>
