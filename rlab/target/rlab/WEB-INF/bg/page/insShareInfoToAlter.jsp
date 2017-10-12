<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
    <%--<script src="https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v" type="text/javascript"></script>--%>
    <script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h"
            type="text/javascript"></script>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/ins_share_base.css">
    <link rel="stylesheet" href="${rlab}/bg/css/component_base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <style>
        .btm .lab_cart {
            margin-top: 20px;
        }

        /*右侧私有样式*/
        .sre_rt {
            padding-left: 25px;
        }

        .ins_trait .lab_tag {
            margin-right: 16px;
            margin-bottom: 10px;
        }

        .sre_lft h4 > a {
            color: #16b8be;
            font-size: 14px;
            margin-left: 20px;
        }

        .sre_lft h4 > a:hover {
            text-decoration: underline;
        }

        a.add_row_user {
            color: #6693c8;
        }

        a.add_row_user:hover {
            text-decoration: underline;
        }

        .ad_detail {
            margin-top: 10px;
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
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                 <span class="layui-breadcrumb">
                      <a><cite>仪器管理</cite></a>
                      <a href="${rlab}/bg/share/list">共享信息管理</a>
                      <a><cite>共享信息修改</cite></a>
                </span>
            </div>

            <%--START审核状态--%>
            <div class="clearfix">
                <div class="share_dtl_tip ">
                    <span class="ins_num">商品编号：${detail.mapId}</span>
                    <span class="ins_status">状态：<i>${detail.mapState[2] == 0? '审核通过': detail.mapState[2] == 1? '待审核': detail.mapState[2] == 2? '审核拒绝': '已下架'}</i></span>
                </div>
            </div>
            <%--END审核状态--%>

            <%--START仪器基本信息详情--%>
            <div class="share_main clearfix">
                <%--左侧开始--%>
                <div class="sre_lft sre_base">

                    <h4>仪器基本信息 <a href="${rlab}/bg/share/modifybase?mapId=${detail.mapId}"><i
                            class="layui-icon">&#xe642;</i>修改仪器基本信息</a></h4>

                    <div class="dt_1 clearfix">
                        <h5>仪器名称<span>*</span>:</h5>
                        <div class="rt">
                            <span>${detail.insName}</span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>仪器型号<span>*</span>:</h5>
                        <div class="rt">
                            <span>${detail.insMode==null ?"未知":detail.insMode}</span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>仪器图片<span>*</span></h5>
                        <div class="rt ins_img">
                            <c:choose>
                                <c:when test="${detail.insPic == null || detail.insPic.size() == 0}">
                                    <li>
                                        <a href="javascript:void (0)" target="_blank">
                                         <img onerror="imgOnError(this)" src="${rlab}/common/common_img/default/ins_280x280.jpg" alt="商品图片"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${detail.insPic}" var="item">
                                        <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${fn:substringBefore(item, "?")}" target="_blank"><img
                                                        onerror="imgOnError(this)"
                                                        src="${item}" alt="商品图片"></a>
                                            </li>
                                        </c:if>

                                        <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${item}" target="_blank"><img
                                                        onerror="imgOnError(this)"
                                                        src="${item}" alt="商品图片"></a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>仪器品牌:</h5>
                        <div class="rt">
                            <span>${detail.insBrand ==null ?"未知":detail.insBrand}</span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>仪器产地:</h5>
                        <div class="rt">
                            <span>${detail.insOrigin==null ?"未知":detail.insOrigin}</span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>仪器分类:</h5>
                        <div class="rt">
                            <span>
                                <%--${detail.insCategoryList}--%>
                                ${detail.insCategoryList[0].categoryName==''?'':detail.insCategoryList[0].categoryName.concat(" -> ")}${detail.insCategoryList[1].categoryName==''?'':detail.insCategoryList[1].categoryName.concat(" -> ")}${detail.insCategoryList[2].categoryName}
                                <%--<c:forEach items="${detail.insCategoryList}" var="category" varStatus="st">--%>
                                    <%--${category.categoryName}--%>
                                <%--</c:forEach>--%>
                            </span>
                        </div>
                    </div>

                    <div class="dt_2 clearfix">
                        <h5>核心参数:</h5>
                        <div class="btm">
                            <table class="lab_table_param">
                                <c:forEach items="${detail.insCoreParam}" var="core" varStatus="st">
                                    <tr>
                                        <td class="tit" width="50%">${core.title}</td>
                                        <td width="50%">${core.content}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>

                    <div class="dt_2 clearfix">
                        <h5>仪器简介:</h5>
                        <div class="btm">
                            <c:forEach items="${detail.insDescription}" var="des">
                                <div class="lab_cart">
                                    <h6>${des.title}</h6>
                                    <p>${des.content}</p>
                                </div>
                            </c:forEach>

                        </div>
                    </div>


                </div>
                <%--左侧结束--%>

                <%--右侧开始--%>
                <div class="sre_rt sre_base">
                    <h4>仪器共享信息</h4>
                    <div class="dt_1 clearfix">
                        <h5>持有机构<span>*</span>:</h5>
                        <div class="rt">
                            <%--STAR搜索下拉--%>
                            <form class="layui-form lab_select_search" action="javascript:void(0)">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select id="orgList" name="" lay-verify="required" lay-filter="orgList"
                                                lay-search>
                                            <option value="" }>请选择</option>

                                            <%--${detail.orgName}--%>
                                        </select>
                                    </div>
                                </div>
                            </form>
                            <%--END搜索下拉--%>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>参考报价<span>*</span>:</h5>
                        <div class="rt">
                            <%--START价格组件--%>
                            <div id="priceRadio" class="cm_price_btn">
                                <label for="localPrice">
                                    <input onchange="priceChange(this)" id="localPrice" data-type-info="0"
                                           type="radio"
                                           name="chosePrice" ${detail.insOrgPriceList.flag == 3? 'checked': ''}>
                                    <span>面议</span>
                                </label>

                                <label for="fixedPrice">
                                    <input id="fixedPrice" onchange="priceChange(this)" data-type-info="1" type="radio"
                                           name="chosePrice"  ${detail.insOrgPriceList.flag == 1? 'checked': ''}>
                                    <span>具体价格</span>
                                </label>

                                <label for="rangePrice">
                                    <input id="rangePrice" onchange="priceChange(this)" data-type-info="2" type="radio"
                                           name="chosePrice"  ${detail.insOrgPriceList.flag == 2? 'checked': ''}>
                                    <span>价格范围</span>
                                </label>

                            </div>
                            <div class="cm_price_down">

                                <div id="fixedBox" class="fixed_price"
                                     style="display: ${detail.insOrgPriceList.flag == 1?'block':'none'};">
                                    <input class="price" type="number" placeholder="具体价格"
                                           value="${detail.insOrgPriceList.accPrice != null && detail.insOrgPriceList.accPrice != ''?detail.insOrgPriceList.accPrice:''}">元/
                                    <input class="unit" type="text" placeholder="单位"
                                           value="${detail.insOrgPriceList.unit}">
                                </div>

                                <div id="rangeBox" class="range_price"
                                     style="display: ${detail.insOrgPriceList.flag == 2?'block':'none'}">
                                    <input class="price" type="number" placeholder="最低价"
                                           value="${detail.insOrgPriceList.scopeLowPrice}">元~<input class="price"
                                                                                                    type="number"
                                                                                                    placeholder="最高价"
                                                                                                    value="${detail.insOrgPriceList.scopeHighPrice == '0'?'':detail.insOrgPriceList.scopeHighPrice}">元/<input
                                        class="unit" type="text" placeholder="单位"
                                        value="${detail.insOrgPriceList.unit}">
                                </div>
                            </div>
                            <%--START价格组件--%>
                        </div>
                    </div>

                    <%--报价说明--%>
                    <div class="dt_1 clearfix">
                        <h5>报价说明:</h5>
                        <div class="rt">
                            <textarea name="" id="priceRemark" cols="42" rows="8"
                                      style="border: 0 none;color: #4c5e70;">${detail.insOrgPriceList.remark}</textarea>
                        </div>
                    </div>

                    <div class="dt_1 clearfix" style="display: none;">
                        <h5>适用领域<span>*</span>:</h5>
                        <div id="fieldLabel" class="rt">
                            <c:forEach items="${detail.insScopeList}" var="item">
                                <em><span>${item.insScopeName}</span><s onclick="removeOnself(this)" class="layui-icon"
                                                                        data-scope-id="${item.insScopeId}">&#x1006;</s></em>
                            </c:forEach>
                        </div>
                        <button onclick="choseFieldFactory()" class="layui-btn" style="margin-top: 20px;" type="button">
                            选择使用领域
                        </button>
                    </div>

                    <div class="dt_1 clearfix ins_trait">
                        <h5>仪器特点:</h5>
                        <div id="featureLabel" class="rt">
                            <c:forEach items="${detail.insFeatureList}" var="item">
                                <em><span>${item.insFeatureName}</span><s onclick="removeOnself(this)"
                                                                          class="layui-icon"
                                                                          data-feature-id="${item.insFeatureId}">&#x1006;</s></em>
                            </c:forEach>
                        </div>
                        <button onclick="choseTagFactory()" class="layui-btn" style="margin-top: 20px;">添加标签</button>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>服务方式<span>*</span>:</h5>
                        <div class="rt">
                            <%--STAR搜索下拉--%>
                            <form class="layui-form lab_select_search" action="javascript:void(0)">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select id="serviceType" name="" lay-verify="">
                                            <c:forEach items="${detail.types}" var="item">
                                                <option value="${item.insServiceId}" ${item.insServiceName == detail.insServiceName? 'selected': ''}>${item.insServiceName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </form>
                            <%--END搜索下拉--%>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>联系电话<span>*</span>:</h5>
                        <div class="btm">
                            <a class="add_row_user" href="javascript:void (0)" onclick="addRowAboutUser()">
                                <i class="layui-icon">&#xe61f;</i>
                                <span>添加一行</span>
                            </a>
                            <table id="contacts" class="lab_table_phone">
                                <thead>
                                <tr>
                                    <th>联系人姓名</th>
                                    <th>联系电话</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${detail.conList}" var="item">
                                    <tr>
                                        <td>
                                            <input type="text" value="${item.conName}" data-con-id="${item.conId}">
                                        </td>
                                        <td>
                                            <input type="text" value="${item.conPhone}">
                                        </td>
                                        <td>
                                            <button onclick="deleteUser(this)" class="layui-btn layui-btn-mini"
                                                    style="background: orangered;" type="button">删除
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>联系地址<span>*</span>:</h5>
                        <div class="rt">
                            <div class="ad_city">
                                <%--START三级联动--%>
                                <form class="layui-form" action="">
                                    <div class="layui-form-item city_select">
                                        <div class="layui-input-inline">
                                            <select id="province" name="quiz1" lay-filter="province">
                                                <%--<option value="">${detail.orgAddrProvince}</option>--%>
                                                <option value="">请选择省</option>

                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select id="city" name="quiz2" lay-filter="city">
                                                <option value="">请选择市</option>
                                                <%--<option value="">${detail.orgAddrProvince == '北京'? '北京市': detail.orgAddrProvince == '天津'? '天津市': detail.orgAddrProvince == '重庆'? '重庆市': detail.orgAddrProvince == '上海'? '上海市': detail.orgAddrCity}</option>--%>
                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select id="county" name="quiz3" lay-filter="county">
                                                <option value="">请选择县/区</option>
                                                <%--<option value="">${detail.orgAddrDistrict}</option>--%>
                                            </select>
                                        </div>
                                    </div>
                                </form>
                                <%--END三级联动--%>
                            </div>
                            <div class="ad_detail">
                                <input id="addressDetail" class="lab_input_base lab_input_middle" type="text"
                                       placeholder="详细地址" value="${detail.orgAddrStreet}">
                            </div>
                        </div>
                    </div>
                    <div class="dt_1 clearfix">
                        <h5 style="line-height: 50px">地址经纬度<span>*</span>:</h5>
                        <div class="rt">
                            东经 <input id="longitude" class="lab_input_base lab_input_small" type="text"
                                      placeholder="请输入" value="${detail.orgAddrLongitude}">
                            北纬 <input id="latitude" class="lab_input_base lab_input_small"
                                      type="text" placeholder="请输入" value="${detail.orgAddrLatitude}">
                        </div>
                    </div>

                    <div id="baidumap" class="baidumap" style="height: 300px;width: 400px;margin-top: 20px;">
                    </div>

                </div>
                <%--右侧结束--%>

            </div>
            <%--END仪器基本信息详情--%>

            <%--START操作按鈕--%>
            <div class="share_btn" style="text-align: center;margin-top: 60px;">
                <button id="save" class="layui-btn layui-btn-big layui-btn-normal">保存仪器所有信息</button>
            </div>
            <%--END操作按钮--%>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<script src="${rlab}/bg//js/main.js"></script>
<script src="${rlab}/bg/js/component_base.js"></script>

<script>


    var OTHER_CONFIG = {
        <%--${detail.orgName}--%>
        PARENT_NAME_ORG_NAME: '${detail.orgName}'
    }

    var MAP_CONFIG = {
        ADDRESS: '${ detail.orgAddrProvince}${detail.orgAddrCity}${detail.orgAddrDistrict}${detail.orgAddrStreet}'
    }
    var ADDRESS_CONFIG = {
        INIT_PROVINCE: '${ detail.orgAddrProvince}',
        INIT_CITY: '${detail.orgAddrCity}',
        INIT_CONUNTY: '${detail.orgAddrDistrict}'
    }

    var form;
    // 挂载和初始化Layui相关组件
    layui.use(['form'], function () {
        form = layui.form();

        form.on('select(orgList)', function (data) {

            $.ajax({
                url: "${rlab}/bg/share/getmore?orgId=" + data.value,
                type: 'GET',
                async: false
            }).done(function (data) {

                if (data.code == 0) {

                    console.log('---------------getmore');
                    console.log(data);
                    // 初始化地址联系人列表
                    addressId = data.payload.orgAddrId;
                    var htmlContent = '\
                    <thead>\
                        <tr>\
                        <th>联系人姓名</th>\
                        <th>联系电话</th>\
                        <th>操作</th>\
                        </tr>\
                    </thead>\
                    <tbody>';
                    var conList = data.payload.conList;
                    htmlContent += '<tr>\
                            <td>\
                            <input type="text">\
                            </td>\
                            <td>\
                            <input type="text">\
                            </td>\
                            <td>\
                            <button onclick="deleteUser(this)" class="layui-btn layui-btn-mini" style="background: orangered;" type="button">删除\
                            </button>\
                            </td>\
                            </tr>';
//                    for (var i = 0; i < conList.length; i++) {
//                        htmlContent += '<tr>\
//                            <td>\
//                            <input type="text">\
//                            </td>\
//                            <td>\
//                            <input type="text">\
//                            </td>\
//                            <td>\
//                            <button onclick="deleteUser(this)" class="layui-btn layui-btn-mini" style="background: orangered;" type="button">删除\
//                            </button>\
//                            </td>\
//                            </tr>';
//                    }
                    htmlContent += '</tbody>';
                    $("#contacts").empty();
                    $("#contacts").append(htmlContent);

//                    console.log($("#province"));
                    //  $("#province").html('<option value="0">请选择省</option>');
//                    console.log($("#province option"));

                    // 初始化省份
                    var orgAddrProvince = data.payload.orgAddrProvince;// 省
                    var orgAddrCity = data.payload.orgAddrCity;// 市
                    var orgAddrDistrict = data.payload.orgAddrDistrict;// 县
                    var ProvinceOptionId;// 省份ID
                    ProvinceOptionId = initProvince(orgAddrProvince);
                    form.render("select");

                    // 遍历获取选中的Selected
//                    $("#province option").each(function () {
//                        if ($(this).attr("selected")) {
//                            ProvinceOptionId = $(this).val();
//                            return false;
//                        }
//                    })

                    $("#city").html('<option value="0">请选择市</option>'); // 初始化市
                    $("#county").html('<option value="0">请选择县/区</option>');// 初始化县

                    dealProvinceId(ProvinceOptionId, function (cityList) {
                        fillCity(cityList);

                        // 如果市区存在，初始化市
                        if (orgAddrCity) {
                            $("#city option").each(function () {

                                if ($.trim($(this).text()) === orgAddrCity) {
                                    $(this).attr("selected", true);
                                    form.render("select")

                                    // 发送Ajax获取县级城市
                                    getCity($(this).val(), function (countyList) {
                                        fillCounty(countyList);
                                        // 如果县存在，再去初始化默认选中县
                                        if (orgAddrDistrict) {
                                            $("#county option").each(function () {
                                                if ($.trim($(this).text()) && $.trim($(this).text()) === orgAddrDistrict) {
                                                    $(this).attr("selected", true);
                                                    form.render("select");
                                                    return false;
                                                }
                                            })
                                        }

                                    })

                                }

                            })
                        }

                    });
//                    getCity(ProvinceOptionId, function (cityList) {
//                        console.log("222")
//                        fillCity(cityList);
//                        if (data.orgAddrCity) {
//                            $("#city option").each(function () {
//
//                                if ($.trim($(this).text()) === data.orgAddrCity) {
//                                    console.log($(this))
//                                    console.log($(this).text())
//                                }
//
//                            })
//                        }
//                    })

//                    fillCity(ProvinceOptionId, data.payload.orgAddrCity, function () {
//
//                        if (data.payload.orgAddrDistrict) {
//                            fillCounty($("#city option:selected").val(), data.payload.orgAddrDistrict, function (data) {
//                                console.log(3)
//                                form.render('select');
//
//                            });
//
//                        } else {
//                            fillCounty($("#city option:selected").val());
//                        }
//
//
//                    });

//                    fillCounty($("#city option:selected").val(), data.payload.orgAddrDistrict,function (data) {
//                        form.render('select');
//                    });

                    $("#addressDetail").val(data.payload.orgAddrStreet);
                    $("#longitude").val(data.payload.orgAddrLongitude);
                    $("#latitude").val(data.payload.orgAddrLatitude);
                    form.render('select');

                } else {
                    alert('获取机构对应联系人和地址失败');
                }

            }).fail(function () {
                /*layer.msg("系统繁忙 , 请稍后再试");*/
                alert('获取机构对应联系人和地址失败');
            });
        });

        // 监听省
        form.on('select(province)', function (data) {
            // 地图变更
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#city").html('<option value="0">请选择市</option>'); // 初始化市
            $("#county").html('<option value="0">请选择县/区</option>');// 初始化县
            // 获取到省份ID
            var provinceId = $("#province").val();
            dealProvinceId(provinceId, function (cityList) {
                fillCity(cityList);
            });
        });

        // 监听市
        form.on('select(city)', function (data) {
            if (!data.value || data.value == 0) {
                return false;
            }
            // 地图变更
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

            $("#county").html('<option value="0">请选择县/区</option>');
            // 获取到cityID
            var countyList;
            var cityId = $("#city").val();
            // var cityId = $("#city").find("option:selected").data("cityId");
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
            // 地图变更
            var flag = searchByStationName(map, $("#province").val() + $("#city").val() + $("#county").val() + $("#addressDetail").val());
            if (!flag) {
                searchByStationName(map, $("#province").val() + $("#city").val());
            }

        })
        initOrgList();
        initAddressAndMap();

    });
    var map = initMap();
    function initAddressAndMap() {
        var provinId = initProvince('${detail.orgAddrProvince}');// 初始化省份
        dealProvinceId(provinId, function (cityList) {
            fillCity(cityList);
            // 初始化县列表
            $("#city").find("option").each(function (index) {

                if ($.trim($(this).text()) === $.trim(ADDRESS_CONFIG.INIT_CITY)) {
                    $(this).attr("selected", true);
                    form.render();
                    getCity($(this).val(), function (cityList) {
                        fillCounty(cityList);
                        // 初始化区县
                        $("#county").find("option").each(function () {
                            if ($.trim($(this).text()) == $.trim(ADDRESS_CONFIG.INIT_CONUNTY)) {
                                $(this).attr("selected", true);
                                form.render();
                                return false;
                            }
                        })
                    })

                } else if ($(this).data("cityId") === 110000 || $(this).data("cityId") === 120000 || $(this).data("cityId") === 310000 || $(this).data("cityId") === 500000) {

                    if (index == 1) {
                        $(this).attr("selected", true);
                        form.render();
                        // 初始化区县
                        getCity($(this).data("cityId"), function (countyList) {
                            fillCounty(countyList);
                            $("#county").find("option").each(function () {
                                if ($.trim($(this).text()) == $.trim(ADDRESS_CONFIG.INIT_CITY)) {
                                    $(this).attr("selected", true);
                                    form.render();
                                    return false;
                                }
                            })

                        })

                    }

                }
            })

        });
        if (MAP_CONFIG.ADDRESS != undefined && MAP_CONFIG.ADDRESS !== "" && MAP_CONFIG.ADDRESS != null) {
            try {
                searchByStationName(map, MAP_CONFIG.ADDRESS);
            } catch (e) {
                searchByStationName(map, '中国');
            }
        } else {
            searchByStationName(map, '中国');
        }


    }



    var addressId = ${detail.orgAddrId};
    var mapId = ${detail.mapId};
    $("#save").on("click", function () {
        //价格
        var priceRemark = $("#priceRemark").val();
        var pricaData;
        if (priceType == 3) {
            pricaData = {
                'flag': '3',
                'remark': priceRemark
            }
        } else if (priceType == 1) {
            var unitReg = /^[\u4e00-\u9fa5]{0,5}$/;
            if (!unitReg.test($("#fixedBox input").eq(1).val()) || $("#fixedBox input").eq(1).val().length == 0) {
                alert("单位为1-5个汉字");
                return;
            }
            var priceReg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
            var price = $("#fixedBox input").eq(0).val();
            if (price.length == 0 || !priceReg.test(price) || price <= 0) {
                alert("价格需为大于0的正数");
                return;
            }
            if (price * 1 > 100000){
                alert("价格不能大于十万");
                return;
            }
            pricaData = {
                'flag': '1',
                'remark': priceRemark,
                'accPrice': $("#fixedBox input").eq(0).val() * 100,
                'unit': $("#fixedBox input").eq(1).val()
            }
        } else if (priceType == 2) {
            var unitReg = /^[\u4e00-\u9fa5]{0,5}$/;
            if (!unitReg.test($("#rangeBox input").eq(2).val()) || $("#rangeBox input").eq(2).val().length == 0) {
                alert("单位为1-5个汉字");
                return;
            }
            var priceReg = /^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
            var lowPrice = $("#rangeBox input").eq(0).val() * 1;
            var highPrice = $("#rangeBox input").eq(1).val() * 1;

            if (lowPrice.length == 0 || !priceReg.test(lowPrice) || lowPrice <= 0) {
                alert("最低价格需为大于0的正数");
                return;
            }
            if (highPrice.length > 0) {
                if (!priceReg.test(highPrice) || highPrice <= 0) {
                    alert("最高价格需为大于0的数字,或不填");
                    return;
                }
            }
            if (lowPrice >= highPrice && highPrice != 0) {
                alert("最高价格需大于最低价格");
                return;
            }
            if (lowPrice * 1 > 100000 || highPrice * 1 > 100000){
                alert("价格不能大于十万");
                return;
            }

            pricaData = {
                'flag': '2',
                'remark': priceRemark,
                'scopeLowPrice': $("#rangeBox input").eq(0).val() * 100,
                'scopeHighPrice': $("#rangeBox input").eq(1).val() * 100,
                'unit': $("#rangeBox input").eq(2).val()
            }
        }


        var scopelabels = $("#fieldLabel em > s");
        var scopeIds = [];
        for (var i = 0; i < scopelabels.length; i++) {
            scopeIds.push($(scopelabels[i]).data("scopeId") + '');
        }

        var featurelabels = $("#featureLabel em > s");
        var featureIds = [];
        for (var i = 0; i < featurelabels.length; i++) {
            featureIds.push($(featurelabels[i]).data("featureId") + "");
        }

        var serviceType = $("#serviceType option:selected").val();

        var contacts = $("#contacts tr");
        var contactsData = [];

        for (var i = 1; i < contacts.length; i++) {
            var conName = $(contacts[i]).find("td").eq(0).find("input").val();
            var conPhone = $(contacts[i]).find("td").eq(1).find("input").val();

            var nameReg = /^[a-z\u4e00-\u9fa5]{1,8}$/;
//            var phoneReg = /^[0-9]{1,20}$/;
            var phoneReg = /^[-0-9]{1,20}$/;
            if (!nameReg.test(conName)) {
                alert('联系人' + conName + '输入不合法');
                return;
            }
            if (!phoneReg.test(conPhone)) {
                alert('联系电话' + conPhone + '输入不合法');
                return;
            }

            var contact = {
                'conId': $(contacts[i]).find("td").eq(0).find("input").data("conId"),
                'conName': $(contacts[i]).find("td").eq(0).find("input").val(),
                'conPhone': $(contacts[i]).find("td").eq(1).find("input").val()
            }
            contactsData.push(contact);
        }

        if (contactsData.length > 5 || contactsData.length < 1) {
            alert("联系人数量在1-5个");
            return;
        }

        var province = $("#province option:selected").text();
        var city = $("#city option:selected").text();
        var country = $("#county option:selected").text();
        var street = $("#addressDetail").val();
        var long = $("#longitude").val();
        var lat = $("#latitude").val();

        if (city == '请选择市'){
            alert("请选择市");
            return;
        }
        if (country == '请选择县/区'){
            alert("请选择县/区");
            return;
        }
        if (street == ''){
            alert("请输入地址");
            return;
        }
        if (long == ''){
            long = '0';
        }
        if (lat == ''){
            lat = '0';
        }

        var data = {
            "mapId": mapId,
            'orgOid': $("#orgList").val(),
            'objInsFeatureList': JSON.stringify(featureIds),
            'insServiceType': serviceType,
            'objConList': JSON.stringify(contactsData),
            'orgAddrProvince': province,
            'orgAddrCity': city,
            'orgAddrDistrict': country,
            'orgAddrId': addressId,
            'orgAddrStreet': street,
            'orgAddrLongitude': long,
            'orgAddrLatitude': lat,
            'insOrgPriceList': JSON.stringify(pricaData)
        };

//        console.log(data);
        $.ajax({
            url: "${rlab}/bg/share/modify",
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            async: false,
            data: JSON.stringify(data)
        }).done(function (data) {
            console.log(data);
            if (data.code == 0) {
                window.location.href = '${rlab}/bg/share/detail?mapId=' + mapId
            } else {
                layer.msg("系统繁忙 , 请稍后再试");
            }
        }).fail(function () {
            layer.msg("系统繁忙 , 请稍后再试");
        });
    });

    // 初始化ORGlist
    function initOrgList() {
        $.ajax({
            url: "${rlab}/bg/share/queryorg?keyword=" + '',
            type: 'get'
        }).done(function (data) {
            var list;
            var orgListTag = $("#orgList");
            var itemHtml;
            if (data.code === 0) {
                list = data.payload;
                for (var i = 0; i < list.length; i++) {
                    if (list[i].orgName === OTHER_CONFIG.PARENT_NAME_ORG_NAME) {
                        itemHtml = '<option selected value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                    } else {
                        itemHtml = '<option  value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                    }
                    orgListTag.append(itemHtml);
                }
                form.render("select");
            }


        }).fail(function () {
            /*layer.msg("系统繁忙 , 请稍后再试");*/
        });
    }
    /**
     * 初始化省份
     */
    function initProvince(curCity) {

        var proArr = [
            {
                name: "北京市",
                id: 110000
            },
            {
                name: "天津市",
                id: 120000
            },
            {
                name: "河北省",
                id: 130000
            },
            {
                name: "山西省",
                id: 140000
            },
            {
                name: "内蒙古自治区",
                id: 150000
            },
            {
                name: "辽宁省",
                id: 210000
            },
            {
                name: "吉林省",
                id: 220000
            },
            {
                name: "黑龙江省",
                id: 230000
            },
            {
                name: "上海市",
                id: 310000
            },
            {
                name: "江苏省",
                id: 320000
            },
            {
                name: "浙江省",
                id: 330000
            },
            {
                name: "安徽省",
                id: 340000
            },
            {
                name: "福建省",
                id: 350000
            },
            {
                name: "江西省",
                id: 360000
            },
            {
                name: "山东省",
                id: 370000
            },
            {
                name: "河南省",
                id: 410000
            },
            {
                name: "湖北省",
                id: 420000
            },
            {
                name: "湖南省",
                id: 430000
            },
            {
                name: "广东省",
                id: 440000
            },
            {
                name: "广西壮族自治区",
                id: 450000
            },
            {
                name: "海南省",
                id: 460000
            },
            {
                name: "重庆市",
                id: 500000
            },
            {
                name: "四川省",
                id: 510000
            },
            {
                name: "贵州省",
                id: 520000
            },
            {
                name: "云南省",
                id: 530000
            },
            {
                name: "西藏自治区",
                id: 540000
            },
            {
                name: "陕西省",
                id: 610000
            },
            {
                name: "甘肃省",
                id: 620000
            },
            {
                name: "青海省",
                id: 630000
            },
            {
                name: "宁夏回族自治区",
                id: 640000
            },
            {
                name: "新疆维吾尔自治区",
                id: 650000
            }

        ];
        var curId;
        // 初始化
        $("#province").html("<option value=''>请选择省</option>")
        for (var i = 0; i < proArr.length; i++) {
            if (curCity && curCity === proArr[i].name) {
                $("#province").append('<option value="' + proArr[i].id + '" } selected>' + proArr[i].name + '</option>');
                curId = proArr[i].id;
            } else {
                $("#province").append('<option value="' + proArr[i].id + '" }>' + proArr[i].name + '</option>');
            }
        }

        if (curId) {
            return curId;
        }
    }
    /**
     * 获取到省份ID，处理省份ID，并且执行回调
     */
    function dealProvinceId(provinceId, cb) {

        var cityList;

        if (provinceId == 110000) {
            cityList = [{
                name: "北京市",
                id: 110000
            }]
            cb(cityList);
        } else if (provinceId == 120000) {
            cityList = [{
                name: "天津市",
                id: 120000
            }]
            cb(cityList);
        } else if (provinceId == 310000) {
            cityList = [{
                name: "上海市",
                id: 310000
            }]
            cb(cityList);

        } else if (provinceId == 500000) {
            cityList = [{
                name: "重庆市",
                id: 500000
            }]
            cb(cityList);

        } else {

            getCity(provinceId, function (cityList) {
                cb(cityList);
            })

        }
    }

    /**
     * 填充城市（市级别）province, orgAddrCity, cb
     */
    function fillCity(cityList) {

        var cityDom = $("#city");

        for (var i = 0; i < cityList.length; i++) {
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].id + '">' + cityList[i].name + '</option>');
        }

        form.render("select");
    }

    /**
     * 填充城市（县级别）city, orgAddrDistrict, cb
     */
    function fillCounty(countyList) {
        var countyDom = $("#county");

        for (var i = 0; i < countyList.length; i++) {
            countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
        }

        form.render("select");
        <%--$.ajax({--%>
        <%--url: "${rlab}/bg/org/city?id=" + city,--%>
        <%--type: 'GET'--%>
        <%--}).done(function (data) {--%>

        <%--if (data.code == 0) {--%>
        <%--$("#county").empty();--%>
        <%--var $option;--%>

        <%--for (var i = 0; i < data.payload.length; i++) {--%>
        <%--var flag = '';--%>
        <%--$option = $('<option value="' + data.payload[i].id + '">' + data.payload[i].name + '</option>');--%>

        <%--if (orgAddrDistrict && orgAddrDistrict == data.payload[i].name) {--%>
        <%--//                        flag = ' selected ';--%>
        <%--$option.attr("selected", true);--%>
        <%--}--%>
        <%--$("#county").append($option);--%>
        <%--}--%>

        <%--if (cb) {--%>
        <%--cb(data);--%>
        <%--}--%>

        <%--}--%>

//        }).fail(function () {
//            layer.msg("系统繁忙 , 请稍后再试");
//        });

    }

    /**
     * 获取城市
     */
    function getCity(cityId, cb) {

        $.ajax({
            url: '${rlab}/bg/org/city?id=' + cityId,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                if (data.code === 0 && data.payload.length > 0) {
                    console.log(data);
                    cb(data.payload);

                } else {
                    layer.msg("网络繁忙，请重新选择城市");
                }
            },
            error: function (err) {
                layer.msg("网络繁忙，请重新选择城市");
            }

        });

    }


    /**
     * 选择使用领域
     */
    function choseFieldFactory() {
        var scopeArr = [];
        var idArr = [];
        var labels = $("#fieldLabel em > s");

        for (var i = 0; i < labels.length; i++) {
            idArr.push($(labels[i]).data("scopeId"));
        }

        if (scopeArr.length == 0) {
            $.ajax({
                url: '${rlab}/bg/share/scope?arr=' + idArr,
                type: 'GET',
                dataType: "json",
                contentType: "application/json"
            })
                .done(function (data) {
//                    console.log(data);
                    if (data.code == 200) {
                        scopeArr = data.payload;
                        var htmlcontent = '\
                <div style="padding:0 20px;width: 500px; height: 300px; background-color: #fff; overflow: hidden;">\
                <p style=" margin-top: 10px">选择关联领域 (可多选，最多选择20个)</p>\
                <div id="filedList" style=" margin-top: 5px;overflow-y:auto;height: 120px;line-height:26px;background:#f4f5f5;">';

                        for (var i = 0; i < scopeArr.length; i++) {
                            if (scopeArr[i].id == 1) {
                                htmlcontent += '<div style="min-width: 20%; display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                <input type="checkbox" name="filedLabel" value=' + scopeArr[i].insScopeName + ' style="display: inline-block" data-scope-id=' + scopeArr[i].insScopeId + ' checked>\
                                <p style="display: inline-block">' + scopeArr[i].insScopeName + '</p></div>';
                            } else {
                                htmlcontent += '<div style="min-width: 20%; display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                <input type="checkbox" name="filedLabel" value=' + scopeArr[i].insScopeName + ' style="display: inline-block" data-scope-id=' + scopeArr[i].insScopeId + '>\
                                <p style="display: inline-block">' + scopeArr[i].insScopeName + '</p></div>';
                            }
                        }

                        htmlcontent += '</div>\
                        <div style="padding: 20px 0;border-top:1px solid #eee;border-bottom:1px solid #eee" >\
                            <p style="height: 30px; line-height: 30px; display: inline-block">添加领域: </p>\
                            <input id="addFiledIpt" type="text" style="width: 100px; height: 30px; margin-left: 15px;border: 1px solid #b0b0b0;">\
                            <button id="addFiled" class="layui-btn layui-btn-small"  style="margin-left: 5px;">添 加</button>\
                        </div>\
                        <div style="margin: 0 auto;width: 200px;padding: 20px 0; overflow: hidden">\
                            <button id="closeFiled" class="layui-btn layui-btn-primary" style="margin-right: 10px" >取消</button>\
                            <button id="saveFiled" class="layui-btn layui-btn-normal">保存领域</button>\
                        </div>\
                        </div>';

                        var fieldLayer = layer.open({
                            title: false,
                            type: 1,
                            area: ['500px', '300px'],
                            skin: 'label_modal',
                            content: htmlcontent
                        });

                        // 給添加按钮注册事件
                        $("#addFiled").off("click").on("click", function () {
                            var iptVal = $("#addFiledIpt").val().trim(),
                                isExisting = false;

                            if (iptVal.length > 10) {
                                layer.msg("新领域名最多十个字");
                                return false;
                            }

                            // 校验是否为空
                            if (iptVal == '') {
                                layer.msg("新领域名不能为空");
                                return false;
                            }

                            // 校验是否重复
                            $("input[name=filedLabel]").each(function (index, val) {
                                if (iptVal === this.value) {
                                    isExisting = true;
                                    return false;
                                }
                            })

                            if (isExisting === true) {
                                layer.msg("该领域名已存在");
                                return false;
                            }

                            // 发送ajax，成功回调里添加到页面中；
                            $.ajax({
                                url: '${rlab}/bg/share/addScope',
                                type: 'POST',
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify({'insScopeName': iptVal})
                            })
                                .done(function (data) {
                                    console.log(data);
                                    if (data.code == 200) {
                                        var list = $("#filedList div > input[name=filedLabel]:checked");
                                        if (list.length < 20) {
                                            $("#filedList").append('\
                                                    <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                                        <input type="checkbox" name="filedLabel" value="' + iptVal + '" style="display: inline-block" ' + data.payload.insScopeId + ' checked>\
                                                        <p style="display: inline-block">' + iptVal + '</p>');
                                        } else {
                                            $("#filedList").append('\
                                                    <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                                        <input type="checkbox" name="filedLabel" value="' + iptVal + '" style="display: inline-block" ' + data.payload.insScopeId + '>\
                                                        <p style="display: inline-block">' + iptVal + '</p>');
                                        }

                                    } else {
                                        alert("添加适用领域失败");
                                    }
                                })
                                .fail(function (data) {
                                    alert("添加适用领域失败");
                                });
                        });

                        // 给取消按钮注册事件
                        $("#closeFiled").off("click").on("click", function () {
                            layer.close(fieldLayer);
                        });

                        // 给保存共享信息注册事件
                        $("#saveFiled").off("click").on("click", function () {
                            var htmlContent = '';
                            var list = $("#filedList div > input[name=filedLabel]:checked");
                            if (list.length > 20) {
                                alert("使用领域最多20个");
                                return;
                            }
                            $("#fieldLabel").empty();
                            for (var i = 0; i < list.length; i++) {
//                                console.log($(list[i]).val());
//                                console.log($(list[i]).data("scopeId"));
                                $("#fieldLabel").append('<em><span>' + $(list[i]).val() + '</span><s onclick="removeOnself(this)" class="layui-icon" data-scope-id="' + $(list[i]).data("scopeId") + '">&#x1006;</s></em>');
                            }
                            layer.close(fieldLayer);
                        });
                    } else {
                        alert("适用领域获取失败");
                    }
                })
                .fail(function (data) {
                    alert("适用领域获取失败");
                });
        }
    }


    /**
     * 选择使用标签
     */
    function choseTagFactory() {
        var featureArr = [];
        var featureIdArr = [];
        var labels = $("#featureLabel em > s");
        for (var i = 0; i < labels.length; i++) {
            featureIdArr.push($(labels[i]).data("featureId"));
        }

        if (featureArr.length == 0) {
            $.ajax({
                url: '${rlab}/bg/share/feature?arr=' + featureIdArr,
                type: 'GET',
                dataType: "json",
                contentType: "application/json"
            })
                .done(function (data) {
                    if (data.code == 200) {
                        featureArr = data.payload;
                        console.log(featureArr);
                        var htmlcontent = '\
                <div style="padding:0 20px;width: 500px; height: 300px; background-color: #fff; overflow: hidden;">\
                <p style=" margin-top: 10px">选择仪器特点: (可多选，最多选择10个)</p>\
                <div id="filedList" style=" margin-top: 5px;overflow-y:auto;height: 120px;line-height:26px;background:#f4f5f5;">';

                        for (var i = 0; i < featureArr.length; i++) {
                            if (featureArr[i].id == 1) {
                                htmlcontent += '<div style="min-width: 20%; display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                <input type="checkbox" name="filedLabel" value=' + featureArr[i].insFeatureName + ' style="display: inline-block" data-feature-id=' + featureArr[i].insFeatureId + ' checked>\
                                <p style="display: inline-block">' + featureArr[i].insFeatureName + '</p></div>';
                            } else {
                                htmlcontent += '<div style="min-width: 20%; display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                <input type="checkbox" name="filedLabel" value=' + featureArr[i].insFeatureName + ' style="display: inline-block" data-feature-id=' + featureArr[i].insFeatureId + '>\
                                <p style="display: inline-block">' + featureArr[i].insFeatureName + '</p></div>';
                            }
                        }

                        htmlcontent += '</div>\
                        <div style="padding: 20px 0;border-top:1px solid #eee;border-bottom:1px solid #eee" >\
                            <p style="height: 30px; line-height: 30px; display: inline-block">添加标签: </p>\
                            <input id="addFiledIpt" type="text" style="width: 100px; height: 30px; margin-left: 15px;border: 1px solid #b0b0b0;">\
                            <button id="addFiled" class="layui-btn layui-btn-small"  style="margin-left: 5px;">添 加</button>\
                        </div>\
                        <div style="margin: 0 auto;width: 200px;padding: 20px 0; overflow: hidden">\
                            <button id="closeFiled" class="layui-btn layui-btn-primary" style="margin-right: 10px" >取消</button>\
                            <button id="saveFiled" class="layui-btn layui-btn-normal">保存标签</button>\
                        </div>\
                        </div>';
                        var fieldLayer = layer.open({
                            title: false,
                            type: 1,
                            area: ['500px', '300px'],
                            skin: 'label_modal',
                            content: htmlcontent
                        });

                        // 給添加按钮注册事件
                        $("#addFiled").off("click").on("click", function () {
                            var iptVal = $("#addFiledIpt").val().trim(),
                                isExisting = false;

                            if (iptVal.length > 10) {
                                layer.msg("新标签名最多十个字");
                                return false;
                            }

                            // 校验是否为空
                            if (iptVal == '') {
                                layer.msg("新标签名不能为空");
                                return false;
                            }

                            // 校验是否重复
                            $("input[name=filedLabel]").each(function (index, val) {
                                if (iptVal === this.value) {
                                    isExisting = true;
                                    return false;
                                }
                            })

                            if (isExisting === true) {
                                layer.msg("该标签名已存在");
                                return false;
                            }

                            // 发送ajax，成功回调里添加到页面中；
                            $.ajax({
                                url: '${rlab}/bg/share/addFeature',
                                type: 'POST',
                                dataType: "json",
                                contentType: "application/json",
                                data: JSON.stringify({'insFeatureName': iptVal})
                            })
                                .done(function (data) {
                                    console.log(data);
                                    if (data.code == 200) {
                                        $("#addFiledIpt").val('');
                                        var list = $("#filedList div > input[name=filedLabel]:checked");
                                        if (list.length < 10) {
                                            $("#filedList").append('\
                                                    <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                                        <input type="checkbox" name="filedLabel" value="' + iptVal + '" style="display: inline-block"  data-feature-id=' + data.payload.insFeatureId + ' checked>\
                                                        <p style="display: inline-block">' + iptVal + '</p>');
                                        } else {
                                            $("#filedList").append('\
                                                    <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                                        <input type="checkbox" name="filedLabel" value="' + iptVal + '" style="display: inline-block"  data-feature-id=' + data.payload.insFeatureId + '>\
                                                        <p style="display: inline-block">' + iptVal + '</p>');
                                        }

                                    } else {
                                        alert("添加标签失败");
                                    }
                                })
                                .fail(function (data) {
                                    alert("添加标签失败");
                                });


                        });

                        // 给取消按钮注册事件
                        $("#closeFiled").off("click").on("click", function () {
                            layer.close(fieldLayer);
                        });

                        // 给保存共享信息注册事件
                        $("#saveFiled").off("click").on("click", function () {
                            var htmlContent = '';
                            var list = $("#filedList div > input[name=filedLabel]:checked");
                            if (list.length > 10) {
                                alert("标签最多10个");
                                return;
                            }
                            $("#featureLabel").empty();
                            for (var i = 0; i < list.length; i++) {
//                                console.log($(list[i]).val());
//                                console.log($(list[i]).data("featureId"));
                                $("#featureLabel").append('<em style="margin-left: 5px"><span>' + $(list[i]).val() + '</span><s onclick="removeOnself(this)" class="layui-icon" data-feature-id="' + $(list[i]).data("featureId") + '">&#x1006;</s></em>');
                            }
                            layer.close(fieldLayer);
                        });
                    } else {
                        alert("标签获取失败");
                    }
                })
                .fail(function (data) {
                    alert("标签获取失败");
                });
        }
    }

    /**
     * 添加一行手机号
     */
    function addRowPhone() {
        $("#orgPhone").append('<div class="phone_row" style="margin-bottom: 10px">\
            <input class="lab_input_base lab_input_middle" type="text" placeholder="电话...">\
            <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>\
        </div>');

    }

    /**
     * 价格修改
     */
    var priceType = ${detail.insOrgPriceList.flag};
    function priceChange($this) {

        $this = $($this);
        var typeInfo = $this.data("typeInfo");

        if (typeInfo == "0") {
            priceType = 3;
            $("#fixedBox").hide();
            $("#rangeBox").hide();

        } else if (typeInfo == "1") {
            priceType = 1;
            $("#rangeBox").hide();
            $("#fixedBox").show();

        } else if (typeInfo == "2") {
            priceType = 2;
            $("#fixedBox").hide();
            $("#rangeBox").show();
        }


    }

    /**
     * 添加联系人
     */
    function addRowAboutUser() {

        $("#contacts").append('<tr>\
            <td>\
            <input type="text" value="">\
            </td>\
            <td>\
            <input type="text" value="">\
            </td>\
            <td>\
            <button onclick="deleteUser(this)" class="layui-btn layui-btn-mini" style="background: orangered;" type="button">删除</button>\
            </td>\
            </tr>'
        );

    }

    /**
     * 删除用户
     */
    function removeOnself($this) {
        $($this).parent().remove();
    }

    /**
     * 删除联系人
     */
    function deleteUser($this) {
        $($this).parent().parent().remove();
    }

    /**
     * 初始化Map
     * @returns {BMap.Map}
     */
    function initMap() {
        var map = new BMap.Map("baidumap");    // 创建Map实例
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.centerAndZoom(new BMap.Point('${detail.orgAddrLongitude}', '${detail.orgAddrLatitude}'), 15);  // 初始化地图,设置中心点坐标和地图级别
        map.setCurrentCity("${detail.orgAddrCity}");          // 设置地图显示的城市 此项是必须设置的
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

            var poi = searchResult.getPoi(0);
            try {
                $("#longitude").val(poi.point.lng);// 更新视图
                $("#latitude").val(poi.point.lat);// 更新视图
            } catch (e) {
                return false;
            }
            map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);// 添加标注

        });

        localSearch.search(keyword);// 启动查询
        return true;
    }

    <%--searchByStationName(map, "${detail.orgAddrProvince}${detail.orgAddrCity}${detail.orgAddrStreet}");--%>

    // initPrivoce
    function prvince() {

    }
</script>
</html>

