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
    <style>
        .logoModal input.jcrop-keymgr {
            display: none !important;
        }

        .lab_p {
            margin-top: 26px;
        }

        .lab_p .lft {
            min-width: 100px;
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
            width: 700px;
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
            z-index: 3;
            height: 250px;
            width: 200px;
            display: block;
            top: -50px;
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
            left:0;
            top:0;
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
                <jsp:param name="firstMenu" value="5"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                 <span class="layui-breadcrumb">
                      <a href="${rlab}/bg/org/search?pageNo=1&pageSize=10">机构管理</a>
                      <a><cite>添加机构</cite></a>
                </span>
            </div>
            <%--START机构表单--%>
            <div class="share_main clearfix">
                <form class="layui-form" action="">
                    <%--1.机构名称--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构名称<span>*</span>：</h5>
                        </div>
                        <div class="rt">
                            <input id="orgName" class="lab_input_base " value="" type="text" placeholder="请输入机构名称"
                                   style="width: 754px;" maxlength="100">
                        </div>
                    </div>
                    <%--2.隶属机构--%>

                    <div class="lab_p parent_org clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">隶属机构：</h5>
                        </div>
                        <div class="rt">
                            <select id="orgList" name="modules" lay-verify="required" lay-search=""
                                    lay-filter="orgList">
                                <option value="">请选择机构</option>
                            </select>
                        </div>
                    </div>

                    <%--3.机构Logo--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>机构logo：</h5>
                        </div>
                        <div class="rt">
                            <div class="org_load site-demo-upload" onclick="showOrgLogoModal(this)">
                                <img id="logImg" src="${rlab}/bg/img/add_logo_default.png">
                                <i class="license_remove layui-icon" onclick="removeLogoImgSrc(this,event)"
                                   data-orgin="" data-default-src="${rlab}/bg/img/add_logo_default.png">&#x1007;</i>
                            </div>
                        </div>
                    </div>

                    <%--4.机构性质--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构性质<span>*</span>：</h5>
                        </div>
                        <div class="rt">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="orgCategoryId" name="modules" lay-verify="required" lay-search="">
                                        <option value="">请选择...</option>
                                        <option value="1">科研院所</option>
                                        <option value="2">高等院校</option>
                                        <option value="3">国有企业</option>
                                        <option value="4">民营企业</option>
                                        <option value="5">第三方检测</option>
                                        <option value="6">军队</option>
                                        <option value="99">其他</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%--5.机构地址--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>机构地址<span>*</span>：</h5>
                        </div>
                        <div class="rt">
                            <%--START三级联动--%>
                            <div class="layui-form-item city_select">

                                <div class="layui-input-inline">
                                    <select id="province" name="quiz1" lay-filter="province">
                                        <option value="">请选择省</option>
                                        <option value="北京市" data-province-id="110000">北京市</option>
                                        <option value="天津市" data-province-id="120000">天津市</option>
                                        <option value="河北省" data-province-id="130000">河北省</option>
                                        <option value="山西省" data-province-id="140000">山西省</option>
                                        <option value="内蒙古自治区" data-province-id="150000">内蒙古自治区</option>
                                        <option value="辽宁省" data-province-id="210000">辽宁省</option>
                                        <option value="吉林省" data-province-id="220000">吉林省</option>
                                        <option value="黑龙江省" data-province-id="230000">黑龙江省</option>
                                        <option value="上海市" data-province-id="310000">上海市</option>
                                        <option value="江苏省" data-province-id="320000">江苏省</option>
                                        <option value="浙江省" data-province-id="330000">浙江省</option>
                                        <option value="安徽省" data-province-id="340000">安徽省</option>
                                        <option value="福建省" data-province-id="350000">福建省</option>
                                        <option value="江西省" data-province-id="360000">江西省</option>
                                        <option value="山东省" data-province-id="370000">山东省</option>
                                        <option value="河南省" data-province-id="410000">河南省</option>
                                        <option value="湖北省" data-province-id="420000">湖北省</option>
                                        <option value="湖南省" data-province-id="430000">湖南省</option>
                                        <option value="广东省" data-province-id="440000">广东省</option>
                                        <option value="广西壮族自治区" data-province-id="450000">广西壮族自治区</option>
                                        <option value="海南省" data-province-id="460000">海南省</option>
                                        <option value="重庆市" data-province-id="500000">重庆市</option>
                                        <option value="四川省" data-province-id="510000">四川省</option>
                                        <option value="贵州省" data-province-id="520000">贵州省</option>
                                        <%--${'云南省'.equals(orgInfo.orgAddress.orgAddrProvince)?'selected':''--%>
                                        <option value="云南省" data-province-id="530000">云南省</option>
                                        <option value="西藏自治区" data-province-id="540000">西藏自治区</option>
                                        <option value="陕西省" data-province-id="610000">陕西省</option>
                                        <option value="甘肃省" data-province-id="620000">甘肃省</option>
                                        <option value="青海省" data-province-id="630000">青海省</option>
                                        <option value="宁夏回族自治区" data-province-id="640000">宁夏回族自治区</option>
                                        <option value="新疆维吾尔自治区" data-province-id="650000">新疆维吾尔自治区</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="city" name="quiz2" lay-filter="city">
                                        <option value="">请选择市</option>
                                    </select>
                                </div>

                                <div class="layui-input-inline">
                                    <select id="county" name="quiz3" lay-filter="county">
                                        <option value="">请选择县/区</option>
                                    </select>
                                </div>
                            </div>
                            <%--END三级联动--%>

                            <div>
                                <input value="" id="addressDetail" class="lab_input_base lab_input_middle" type="text"
                                       placeholder="请输入详细地址">

                            </div>
                        </div>
                    </div>

                    <%--6.经纬度--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height: 50px;">机构经纬度<span>*</span>：</h5>
                        </div>
                        <div class="rt">
                            <span style="margin-right: 5px">东经</span>
                            <input id="longitude" type="text" class="lab_input_base" placeholder="请输入"
                                   style="width: 110px;margin-right: 20px;">
                            <span style="margin-right: 5px">北纬</span>
                            <input id="latitude" class="lab_input_base" type="text" placeholder="请输入"
                                   style="width: 110px;">
                        </div>
                    </div>
                    <div id="baidumap" class="" style="height: 300px;width: 600px;margin-top: 20px;">
                    </div>
                    <%--7.机构电话--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>机构电话：</h5>
                        </div>
                        <div id="orgPhone" class="rt">
                            <a href="javascript:void (0)" onclick="addRowPhone()" style="margin-bottom: 10px;color:#6693c8;font-size:14px;line-height: 30px;">添加一行</a>
                            <div class="phone_row" style="margin-bottom: 10px">
                                <input value="" class="lab_input_base lab_input_middle" type="text"
                                       placeholder="电话...">
                                <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>
                            </div>

                        </div>
                    </div>

                    <%--8.机构地址--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构邮编：</h5>
                        </div>
                        <div class="rt">
                            <input id="orgZipcode" value="" class="lab_input_base lab_input_middle" type="text"
                                   placeholder="邮编...">
                        </div>
                    </div>

                    <%--9.机构网址--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构网址：</h5>
                        </div>
                        <div class="rt">
                            <input id="orgWeb" value="" class="lab_input_base lab_input_middle" type="text"
                                   placeholder="网址...">
                        </div>
                    </div>

                    <%--10.机构传真--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构传真：</h5>
                        </div>
                        <div class="rt">
                            <input id="conFax" value="" class="lab_input_base lab_input_middle" type="text"
                                   placeholder="传真...">
                        </div>
                    </div>

                    <%--11.机构邮箱--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构邮箱：</h5>
                        </div>
                        <div class="rt">
                            <input id="conEmail" value=""
                                   class="lab_input_base lab_input_middle"
                                   type="text" placeholder="请输入...">

                        </div>
                    </div>

                    <%--12.组织机构代码--%>
                    <div class="lab_p clearfix">

                        <div class="lft">
                            <h5 style="line-height:50px;">组织机构代码：</h5>
                        </div>
                        <div class="rt">
                            <input id="orgCode" value="" class="lab_input_base lab_input_middle"
                                   type="text"
                                   placeholder="请输入...">

                        </div>
                    </div>

                    <%--13.组织机构代码--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>营业执照副本：</h5>
                        </div>
                        <div class="rt">
                            <p style="color:#a3b6c9;font-size: 14px;">您可以选择JPG或PNG格式，小于5M的图片</p>
                            <div class="license">

                                <label>
                                    <c:choose>
                                        <c:when test="${orgInfo.orgLicensePic != null && !''.equals(orgInfo.orgLicensePic)}">
                                            <img id="orgLicensePic" src="${orgInfo.orgLicensePic}">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="orgLicensePic" src="${rlab}/bg/img/add_license_default.png">
                                        </c:otherwise>
                                    </c:choose>

                                    <input data-up-type="identity" onchange="uploadImg(this)" name="logoFile"
                                           accept="image/jpg,image/jpeg,image/png" type="file">

                                </label>
                                <i class="license_remove layui-icon" onclick="removeImgSrc(this,event)"
                                   data-orgin=""
                                   data-default-src="${rlab}/bg/img/add_license_default.png">&#x1007;</i>
                            </div>
                        </div>
                    </div>

                    <%--14.组织机构代码--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>机构资质：</h5>
                        </div>
                        <div class="rt">
                            <div id="box ">
                                <button onclick="choseTagFactory()" id="selectStatus" type="button" class="layui-btn">
                                    选择资质
                                </button>
                            </div>
                            <div id="qftList" class="org_qua">

                            </div>
                        </div>
                    </div>

                    <%--15.机构简介--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5>机构简介：</h5>
                        </div>
                        <div class="rt">
                            <textarea class="layui-textarea" id="LAY_demo1" style="display: none">

                            </textarea>
                        </div>
                    </div>

                    <%--16.机构创建者电话--%>
                    <div class="lab_p clearfix">
                        <div class="lft">
                            <h5 style="line-height:50px;">机构创建者电话：</h5>
                        </div>
                        <div class="rt">
                            <input id="uUid" onblur="creatorIptBlur(this)" onfocus="creatorIptFocus(this)" data-u-uid=""
                                   value="" class="lab_input_base lab_input_middle" type="text" placeholder="请输入创建者电话">
                        </div>
                    </div>
                    <div style="color: #ff4747;clear: both">机构创建者必须为网站注册用户</div>
                </form>
            </div>
            <%--END仪器基本信息详情--%>

            <%--START操作按鈕--%>
            <div class="share_btn">
                <button class="put_form layui-btn layui-btn-normal" type="button" id="putForm" onclick="putOrgForm()">
                    添加机构
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
<script src="${rlab}/bg/js/myJcropCofig.js"></script>
<script src="${rlab}/bg/js/orgInfoCommon.js"></script>
<script>
    // 修改机构时独有字段
    JcropResult = {
        x: '${orgInfo.orgPositionList.get(0) != null && orgInfo.orgPositionList.get(0) != ''?orgInfo.orgPositionList.get(0):''}',
        y: '${orgInfo.orgPositionList.get(1) != null && orgInfo.orgPositionList.get(1) != ''?orgInfo.orgPositionList.get(1):''}',
        w: '${orgInfo.orgPositionList.get(2) != null && orgInfo.orgPositionList.get(2) != ''?orgInfo.orgPositionList.get(2):''}',
        h: '${orgInfo.orgPositionList.get(3) != null && orgInfo.orgPositionList.get(3) != ''?orgInfo.orgPositionList.get(3):''}',
        src: '${orgInfo.orgLogo != null && orgInfo.orgLogo != "" ? orgInfo.orgLogo:""}'
    };

    // 配置参数
    var MAP_CONFIG = {
        ADDRESS: '${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}'
    }
    var OTHER_CONFIG = {
        PARENT_NAME_ORG_NAME: '${orgInfo.parentOrgName}'
    }

    var ADDRESS_CONFIG = {
        INIT_PROVINCE: '${orgInfo.orgAddress.orgAddrProvince}',
        INIT_CITY: '${orgInfo.orgAddress.orgAddrCity}',
        INIT_CONUNTY: '${orgInfo.orgAddress.orgAddrDistrict}'
    }
    initOrgList();// 初始化机构


    var form, layedit, ditIndex, layer;
    layui.use(['form', 'layedit', 'layer'], function () {
        layer = layui.layer;
        form = layui.form();
        layedit = layui.layedit;

        // 构建一个编辑器
        ditIndex = layedit.build('LAY_demo1', {
            height: 300,
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

        // 监听省
        form.on('select(province)', function (data) {
            // 更新地图
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#city").html('<option value="">请选择市</option>'); // 初始化市
            $("#county").html('<option value="">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province").find("option:selected").data("provinceId");

            dealProvinceId(provinceId, function (cityList) {
                fillCity(cityList);
            });

        });

        // 监听市
        form.on('select(city)', function (data) {

            if (!data.value || data.value == 0) {
                return false;
            }


            // 更新地图
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#county").html('<option value="">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city").find("option:selected").data("cityId");
            getCity(cityId, function (countyList) {
                fillCounty(countyList);
            })

        });

        // 监听县
        form.on('select(county)', function (data) {
            // 地图变更
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

        });

        // 监听详细地址
        $("#addressDetail").on("blur", function () {

            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

        })

    });

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
                success(data);
            },
            error: function () {
                error();
            }

        })

    }


    /**
     * 初始化Map
     * @returns {BMap.Map}
     */
    function initMap() {
        var map = new BMap.Map("baidumap");    // 创建Map实例
        map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
        map.enableScrollWheelZoom(true);
        return map;
    }

    /**
     * 搜索名字
     * @param map
     * @param site
     */
    function searchByStationName(map, site) {
        var localSearch = new BMap.LocalSearch(map);
        map.clearOverlays();//清空原来的标注

        var keyword = site;
        localSearch.setSearchCompleteCallback(function (searchResult) {
            try {
                var poi = searchResult.getPoi(0);
            } catch (e) {
                return false;
            }

            $("#longitude").val(poi.point.lng);// 更新视图
            $("#latitude").val(poi.point.lat);// 更新视图

            map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);// 添加标注

//            var content = keyword + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
//            var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + "</p>");
//            marker.addEventListener("click", function () { this.openInfoWindow(infoWindow); });
            // marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
        });

        localSearch.search(keyword);// 启动查询
        return true;
    }

    var map = initMap();
    if (MAP_CONFIG.ADDRESS != undefined && MAP_CONFIG.ADDRESS !== "" && MAP_CONFIG.ADDRESS != null) {
        try {
            searchByStationName(map, MAP_CONFIG.ADDRESS);
        } catch (e) {
            searchByStationName(map, '中国');
        }
    } else {
        searchByStationName(map, '中国');
    }

    /*
     ** 保存提交表单
     */
    function putOrgForm() {

        $("#box").html(layedit.getContent(ditIndex));
        var orgName = $.trim($("#orgName").val());// 机构名字
        var parentOrgId = $("#orgList").val();// 父机构ID
        var orgLogo = null;// 机构logo路径
        var orgLogoPosition = null;// 机构Logo裁剪值

        if (JcropResult === null) {
            if ('${orgInfo.orgLogo}') {
                orgLogo = '${orgInfo.orgLogo}';
            }

        } else {
            orgLogo = JcropResult.src
            orgLogoPosition = JcropResult.x + ',' + JcropResult.y + ',' + JcropResult.w + ',' + JcropResult.h
        }

        var orgCategoryId = $("#orgCategoryId").val();// 机构性质（分类）
        var orgAddrProvince = $("#province").val();// 省份
        var orgAddrCity = $("#city").val();// 市区
        var orgAddrDistrict = $("#county").val();// 县

        var orgAddrStreet = $("#addressDetail").val();// 详细地址
        var orgAddrLongitude = $("#longitude").val();// 经度
        var orgAddrLatitude = $("#latitude").val();// 纬度

        // OrgContacts联系人部分
        var conPhone = "";// 机构电话“,”

        var orgPhoneIpts = $("#orgPhone input");

        for (var j = 0; j < orgPhoneIpts.length; j++) {
            if ($.trim($(orgPhoneIpts[j]).val()) !== "") {
                if(!/^[-0-9]{1,20}$/.test($(orgPhoneIpts[j]).val())){
                    alert("第" + j + "条机构电话格式错误，请填写11位手机号或座机号!");
                    return false;
                }
                if (j === 0) {
                    conPhone = $.trim($(orgPhoneIpts[j]).val());
                } else {
                    conPhone = conPhone + ',' + $.trim($(orgPhoneIpts[j]).val());
                }

            }
        }

        var orgZipcode = $("#orgZipcode").val();// 机构邮编
        var orgWeb = $("#orgWeb").val();// 机构网址
        var conFax = $("#conFax").val(); // 机构传真
        var conEmail = $("#conEmail").val();// 机构邮箱
        var orgCode = $("#orgCode").val();

        // 组织机构代码
        var orgLicensePic = "";// 营业制造副本
        if (isDefaultImg($("#orgLicensePic").attr("src"))) {
            orgLicensePic = $("#orgLicensePic").attr("src");
        }

        var orgCertificateList = [];// 机构资质 [{},{}]orgCertificateName   orgCertificatePic
        var itemList = $("#qftList .item");
        itemList.each(function () {
            var certificateSrc = $(this).find("img").attr("src");

            if (isDefaultImg(certificateSrc)) {
                certificateSrc = $(this).find("img").attr("src");
            } else {
                certificateSrc = "";
            }
            orgCertificateList.push({
                orgCertificateName: $(this).find("p").text(),
                orgCertificatePic: certificateSrc
            })
        })

        var orgDescription = layedit.getContent(ditIndex);// 机构简介
        $("#qftList item").each(function () {

        })

        var formData = {
            orgName: orgName,// 机构名称
            orgParentId: parentOrgId,// 父机构ID
            orgLogo: orgLogo,//机构LOGO
            orgPosition: orgLogoPosition,//机构LOGO参数
            orgCategoryId: orgCategoryId,// 机构性质ID
            orgAddress: {
                orgAddrProvince: orgAddrProvince,// 省
                orgAddrCity: orgAddrCity,// 市
                orgAddrDistrict: orgAddrDistrict,// 县
                orgAddrStreet: orgAddrStreet,// 详细地址
                orgAddrLongitude: orgAddrLongitude,// 经度
                orgAddrLatitude: orgAddrLatitude,// 维度
                orgZipcode: orgZipcode,// 机构联系人邮编
            },
            orgContacts: {
                conPhone: conPhone,// 机构联系人电话
                conEmail: conEmail,// 机构联系人邮箱
                conFax: conFax// 机构联系人传真
            },
            orgWeb: orgWeb,// 机构网址
            orgCode: orgCode,// 组织机构代码
            orgLicensePic: orgLicensePic,// 营业制造副本
            //uUid: {
            //   uUid: "123"// 创建人ID，// 动态添加
            // },
            orgCertificateList: orgCertificateList,
            orgDescription: orgDescription // 富文本编辑

        }

        if ($("#uUid").val() != null) {
            formData.uUid = $("#uUid").data("uUid");
        }

        if (formData.orgName.length == 0) {
            alert("机构名称不能为空");
            return false;

        } else if (formData.orgCategoryId == "") {
            alert("机构性质不能为空");
            return false;

        } else if (formData.orgAddress.orgAddrProvince.length == 0 || formData.orgAddress.orgAddrCity.length == 0 || formData.orgAddress.orgAddrDistrict.length == 0 || formData.orgAddress.orgAddrStreet.length == 0) {
            alert("机构地址不能为空");
            return false;

        } else if (formData.orgAddress.orgAddrLongitude.length == 0 || formData.orgAddress.orgAddrLatitude.length == 0) {
            alert("经纬度不能为空");
            return false;

        }

//        if (!/^1[34578]\d{9}$/.test(orgContacts)) {
//            alert("联系方式格式错误");
//            return false;
//        }


        if (formData.orgAddress.orgZipcode.length != 0) {
            if (!/^[1-9]\d{5}(?!\d)$/.test(formData.orgAddress.orgZipcode)) {
                alert("机构邮编格式错误");
                return false;
            }
        }

        if (formData.orgContacts.conEmail.length != 0) {
            if (!/[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}/.test(formData.orgContacts.conEmail)) {
                alert("机构邮箱格式错误");
                return false;
            }
        }

        if (formData.orgWeb.length != 0) {
            if (!/^(([A-Za-z0-9-~]+)\.)+([A-Za-z0-9-~\/])+$/.test(formData.orgWeb)) {
                alert("机构网址格式错误");
                return false;
            }
        }

        $.ajax({
            url: BASE_URL + '/bg/org/add',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(formData),
            success: function (data) {

                if (data.code === 0) {

                    location.href = BASE_URL + "/bg/org/search/detail?operator=look&oid=" + data.payload.orgOid;
                } else if (data.code === 1013) {
                    //墨绿深蓝风
                    layer.alert('机构名已存在，请更换', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                } else {
                    alert(data.description);
                }

            },
            error: function (err) {
                //  layer.msg("网络繁忙，请重新选择城市");
            }
        });
    }

</script>
</html>

