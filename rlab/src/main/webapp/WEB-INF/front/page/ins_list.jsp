<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="${rlab}/front/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>

    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_140X110.jpg")
        }

    </script>
    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <%--<link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170622">--%>
    <link rel="stylesheet" href="${rlab}/front/css/ins_list.css?v_=20180330">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style>
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
        }


    </style>
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
        .ins_info .label {
            height: 34px !important;
            padding-top: 5px;
        }

        .ins_info .intro {
            line-height: 14px !important;;
            margin-top: 6px;

        }

        .paging {
            margin-top: 46px;
            margin-bottom: 121px;
        }

        .list_wrapper {
            /*margin-top: 15px;*/
        }

        /*高级搜索样式*/
        .super_sch {
            height: 56px;
            background: #fff;
            width: 1120px;
            margin: 0 auto;
            margin-top: 15px;
            position: relative;
            margin-bottom: 15px;
        }

        .super_sch h4 {
            float: left;
            display: block;
            width: 144px;
            height: 56px;
            text-align: center;
            line-height: 56px;
            font-size: 12px;
            color: #999;

        }

        .super_sch ul {
            position: absolute;
            height: 24px;
            width: 860px;
            top: 50%;
            margin-top: -12px;
            left: 144px;
            list-style: none;
            overflow: hidden;
        }

        .super_sch ul li {
            color: #ed6a5f;
            border: 1px solid #ed6a5f;
            float: left;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 11.5px;
            padding: 0 12px;
            margin-right: 13px;
            margin-bottom: 30px;
            cursor: pointer;
        }

        .super_sch ul li:hover {
            background: #ffeeed;
        }

        .super_sch > a {
            float: right;
            display: block;
            height: 56px;
            width: 96px;
            line-height: 56px;
            color: #508DF0;
            font-size: 12px;
            text-align: center;
        }

        .super_sch > a:hover {
            text-decoration: underline;
        }
        #head{
            margin-bottom: 40px!important;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="4"/>
    </jsp:include>
    <%-- START高级搜索--%>
    <c:if test="${interestArr.size() > 0}">
        <div class="super_sch">
            <h4>您可能感兴趣的内容</h4>
            <ul>
                <c:forEach items="${interestArr}" var="item" varStatus="status">
                    <c:if test="${not empty item}">
                        <li onclick="toSearchFromSuper('${item}',2)">${item}</li>
                    </c:if>
                </c:forEach>
            </ul>
            <a href="javascript:void(0);" target="_blank" onclick="toKejso()">
                点击查看更多
            </a>
        </div>
    </c:if>

    <%-- END高级搜索--%>
    <%-- START仪器筛选--%>
    <div class="ins_filter">
        <%--筛选条件部分1--%>
        <div class="filter">
            <%--已选条件--%>
            <div class="condition p" style="margin-top: 24px">
                <i>已选条件</i>
                <div id="checkedLabel" class="checked_label">
                    <%--市区--%>
                    <c:if test="${district != null && district != ''}">
                        <span data-type="district">
                            ${district}
                            <i onclick="clearCurFilter(this)" data-type="district" class="lab-close-1"></i>
                        </span>
                    </c:if>
                    <%--服务方式--%>
                    <c:if test="${insServiceType != null && insServiceType != ''}">
                        <span>${insServiceType}<i onclick="clearCurFilter(this)" data-type="insServiceType"
                                                  class="lab-close-1"></i></span>
                    </c:if>
                    <%--价格--%>
                    <c:choose>
                        <c:when test="${scopeLowPrice == null && scopeHighPrice != null}">
                            <span data-type="priceFilter">
                                    ${scopeHighPrice}元以下
                                <i onclick="clearCurFilter(this)" data-type="priceFilter" class="lab-close-1"></i>
                            </span>
                        </c:when>
                        <c:when test="${scopeLowPrice != null && scopeHighPrice == null}">
                            <span onclick="clearCurFilter(this)" data-type="priceFilter">${scopeLowPrice}元起<i
                                    data-type="priceFilter"
                                    class="lab-close-1"></i></span>
                        </c:when>
                        <c:when test="${scopeLowPrice != null && scopeHighPrice != null}">
                            <span>${scopeLowPrice}~${scopeHighPrice}元
                                <i onclick="clearCurFilter(this)" data-type="priceFilter"
                                   class="lab-close-1"></i></span>
                        </c:when>
                    </c:choose>
                    <%--仪器大类--%>
                    <c:if test="${category1 != null && category1 != ''}">
                        <span>${category1}<i onclick="clearCurFilter(this)" data-type="category1"
                                             class="lab-close-1"></i></span>
                    </c:if>
                    <%--仪器子类--%>
                    <c:if test="${category2 != null && category2 != ''}">
                        <span>${category2}<i onclick="clearCurFilter(this)" data-type="category2"
                                             class="lab-close-1"></i></span>
                    </c:if>
                    <s onclick="clearAllFilter()" class="clear_label">
                        <i class="lab-del"></i>
                        清空选项
                    </s>
                </div>

            </div>
            <%--所在地区筛选--%>
            <div class="normal p" style="display: ${districts.size() > 0? 'block': 'none'};">
                <i>所在地区</i>
                <div id="district">
                    <span class="${district == null ? 'actived': ''}">不限</span>
                    <c:if test="${districts.size() > 0}">
                        <c:forEach items="${districts}" var="item">
                            <span class="${district != null && district.equals(item)? 'actived': ''}">${item}</span>
                        </c:forEach>
                    </c:if>

                </div>
            </div>
            <%--服务方式筛选--%>
            <div class="normal p">
                <i>服务方式</i>
                <div id="insServiceType">
                    <span class="${insServiceType == null ? 'actived' : ''}">不限</span>
                    <span class="${'仪器租赁'.equals(insServiceType)? 'actived' : ''}">仪器租赁</span>
                    <span class="${'上机使用'.equals(insServiceType)? 'actived' : ''}">上机使用</span>
                    <span class="${'委托测试'.equals(insServiceType)? 'actived' : ''}">委托测试</span>
                </div>
            </div>
        </div>
        <%--筛选条件部分2--%>
        <div id="moreFilter" class="filter" style="display: ${slideFlag != null && slideFlag == 1?'block':'none'};">
            <%--价格筛选--%>
            <div class="normal p">
                <i>价格筛选</i>
                <div id="priceFilter">
                    <span class="${priceFlag == null && scopeLowPrice == null && scopeHighPrice == null? 'actived':''}">不限</span>
                    <span class="${priceFlag == null &&  scopeLowPrice !=null && scopeHighPrice != null && scopeLowPrice == 0 && scopeHighPrice == 1000? 'actived':''}"
                          data-low-price="0" data-hight-price="1000">1000元以下</span>
                    <span class="${priceFlag == null && scopeLowPrice !=null && scopeHighPrice != null && scopeLowPrice == 1000 && scopeHighPrice == 5000? 'actived':''}"
                          data-low-price="1000" data-hight-price="5000" class="actived">1000~5000元</span>
                    <span class="${priceFlag == null && scopeLowPrice !=null && scopeHighPrice != null && scopeLowPrice == 5000 && scopeHighPrice == 10000? 'actived':''}"
                          data-low-price="5000" data-hight-price="10000">5000~1万</span>
                    <div class="range_price">
                        <input value="${priceFlag != null && priceFlag == 1?scopeLowPrice:''}" id="lowPrice"
                               onblur="vertifyPrice()" onfocus="clearPrice()" type="text">
                        <i>-</i>
                        <input value="${priceFlag != null && priceFlag == 1?scopeHighPrice:''}" id="hightPrice"
                               onblur="vertifyPrice()" onfocus="clearPrice()" type="text">
                        <i>元</i>
                    </div>
                    <button id="cfmPrice" style="margin-left:12px;" class="init-btn bg-blue" type="button">确定</button>
                </div>
            </div>
            <%--仪器大类筛选--%>
            <div class="normal p">
                <i>仪器大类</i>
                <div id="category1">
                    <span class="${category1 ==null? 'actived':''}">不限</span>
                    <span data-category-id="03" class="${'实验室常用设备'.equals(category1)? 'actived':''}">实验室常用设备</span>
                    <span data-category-id="11" class="${'光学仪器及设备'.equals(category1)? 'actived':''}">光学仪器及设备</span>
                    <span data-category-id="07"
                          class="${'工业在线及过程控制仪器'.equals(category1)? 'actived':''}">工业在线及过程控制仪器</span>
                    <span data-category-id="08" class="${'行业专用仪器'.equals(category1)? 'actived':''}">行业专用仪器</span>
                    <span data-category-id="06" class="${'测量/计量仪器'.equals(category1)? 'actived':''}">测量/计量仪器</span>
                    <span data-category-id="02" class="${'物性测试仪器及设备'.equals(category1)? 'actived':''}">物性测试仪器及设备</span>
                    <span data-category-id="15" class="${'实验室服务'.equals(category1)? 'actived':''}">实验室服务</span>
                    <span data-category-id="09" class="${'相关仪表'.equals(category1)? 'actived':''}">相关仪表</span>
                    <span data-category-id="05" class="${'环境监测仪器'.equals(category1)? 'actived':''}">环境监测仪器</span>
                    <span data-category-id="01" class="${'化学分析仪器'.equals(category1)? 'actived':''}">化学分析仪器</span>
                    <span data-category-id="04" class="${'生命科学仪器及设备'.equals(category1)? 'actived':''}">生命科学仪器及设备</span>
                </div>
            </div>
            <%--仪器子类筛选--%>
            <c:if test="${categories != null}">
                <div id="categorieBox2" class="normal p">
                    <i>仪器子类</i>
                    <div id="category2">
                        <span class="${category2 == null || ''.equals(category2)? 'actived':''}">不限</span>
                        <c:forEach items="${categories}" var="item">
                            <span class="${item.categoryName == category2? 'actived':''}">${item.categoryName}</span>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
        </div>
        <%--更多筛选--%>
        <div onclick="toggleFilter(this)" data-flag="${slideFlag != null && slideFlag == 1?'1':'0'}"
             class="more_filter">
            <span>
                <s id="slidePrice">${slideFlag != null && slideFlag == 1?'收起筛选':'更多筛选'}</s>
                <i class="${slideFlag != null && slideFlag == 1?'lab-arrow-up':'lab-arrow-down'}"></i>
            </span>
        </div>
    </div>
    <%-- END仪器筛选--%>

    <%-- START第三种搜索结果--%>
    <c:if test="${other == 1 || other == 2 || other == 3}">
        <div class="other_resault">
            <img src="${rlab}/front/imgs/icon/newplot-404-3.png" alt="未搜到结果">
            <span>当前区域未匹配到结果，为您推荐其他地区匹配结果</span>
        </div>
    </c:if>
    <%-- END第三种搜索结果--%>

    <%--SATRT搜索有结果--%>

    <c:if test="${other == 0 || other == 1 || other == 2 || other == 3}">
        <%--<div style="width: 1120px;margin: 0 auto;line-height: 28px;font-size: 12px;color: #4e4e4e;padding-left:5px;">--%>
            <%--共<span style="color: #508df0;">${total}</span>条结果--%>
        <%--</div>--%>
        <div id="listContent" class="list_wrapper">
                <%-- 列表 --%>
            <div class="org_list">
                <c:forEach items="${infos}" var="info">
                    <div class="item" data-goods-id="${info.mapId}" >
                        <div class="ins_img">
                            <c:if test="${info.insPic == null}">
                                <img data-goods-id="${info.mapId}" onclick="toGoodsDetail(this)"
                                     src="${rlab}/common/common_img/default/ins_140X110.jpg" alt="商品图片">
                            </c:if>
                            <c:if test="${info.insPic != null}">
                                <img data-goods-id="${info.mapId}" onerror="imgOnError(this)"
                                     onclick="toGoodsDetail(this)"
                                     src="${info.insPic}140_110" alt="商品图片">
                            </c:if>
                        </div>
                        <div class="ins_info">
                            <div class="title">
                                <a onclick="toGoodsDetail(this)" href="javascript:void (0);"
                                   data-goods-id="${info.mapId}"> ${info.insName}</a>
                            </div>
                            <div class="info">
                                <span title="${info.insMode}">
                                    <i>型号：</i>${info.insMode.length() > 7 ? info.insMode.substring(0,6).concat('...') :info.insMode}
                                </span>
                                <span title="${info.insBrand}">
                                    <i>品牌：</i>${info.insBrand.length() > 7 ? info.insBrand.substring(0,6).concat('...') :info.insBrand}
                                </span>
                                <span><i>分类：</i>
                                    ${info.insCategory[0].length() > 10 ? info.insCategory[0].substring(0,9).concat('...') :info.insCategory[0]}
                                    >
                                    ${info.insCategory[1].length() > 8 ? info.insCategory[1].substring(0,7).concat('...') :info.insCategory[1]}
                            </span>
                                    <%--不存在仪器标签，则领域补位，填空--%>
                                <c:if test="${info.insFeatureName == null || info.insFeatureName == ''}">
                                    <br/>
                                </c:if>
                                <span><i>领域：</i>
                                <c:forEach items="${info.insScopeName}" var="scope">
                                    ${scope}
                                </c:forEach>
                            </span>
                            </div>
                                <%--仪器标签特点--%>
                            <c:if test="${info.insFeatureName != null && info.insFeatureName != ''}">
                                <div class="label">
                                    <label>预约状态：</label><p></p>
                                    <%--<c:forEach items="${info.insFeatureName}" var="scope">
                                        <c:choose>
                                            <c:when test="${'CNAS'.equals(scope)}">
                                                <span class="tp2">${scope}</span>
                                            </c:when>
                                            <c:when test="${'服务好'.equals(scope)}">
                                                <span class="tp1">${scope}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="tp1">${scope}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>--%>
                                    <c:forEach items="${info.insFeatureName}" var="scope">
                                        <c:choose>
                                            <c:when test="${fn:length(scope) == 4}">
                                                <span class="tp2">${scope}</span>
                                            </c:when>
                                            <c:when test="${fn:length(scope) == 3}">
                                                <span class="tp1">${scope}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="tp1">${scope}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <div class="intro">
                             <span>
                             <i class="lab-adress"></i><s>${info.orgAddrStreet.length() > 20 ? info.orgAddrStreet.substring(0,18).concat('...') :info.orgAddrStreet}</s>
                        </span>
                                <span>
                             <i class="lab-company"></i><s>${info.orgName.length() > 20 ? info.orgName.substring(0,18).concat('...') :info.orgName}</s>
                        </span>
                                <span>
                             <i class="lab-biaoqian_1" style="font-size: 14px;"></i><s>${info.insServiceType}</s>
                        </span>
                            </div>

                        </div>
                        <div class="ins_btn">
                            <div class="price">
                                <c:choose>
                                    <c:when test="${info.price.flag == 1}">
                                        <c:if test='${"无".equals(info.price.unit)}'>
                                            ${info.price.accPrice}元
                                        </c:if>
                                        <c:if test='${!"无".equals(info.price.unit)}'>
                                            ${info.price.accPrice}元/${info.price.unit}
                                        </c:if>
                                    </c:when>
                                    <c:when test="${info.price.flag  == 2}">
                                        <c:if test='${info.price.scopeHighPrice.equals("0")}'>
                                            <c:if test='${"无".equals(info.price.unit)}'>
                                                ${info.price.scopeLowPrice}元起
                                            </c:if>
                                            <c:if test='${!"无".equals(info.price.unit)}'>
                                                ${info.price.scopeLowPrice}元/${info.price.unit}起
                                            </c:if>
                                        </c:if>
                                        <c:if test='${!info.price.scopeHighPrice.equals("0")}'>
                                            <c:if test='${"无".equals(info.price.unit)}'>
                                                ${info.price.scopeLowPrice} - ${info.price.scopeHighPrice}元

                                            </c:if>
                                            <c:if test='${!"无".equals(info.price.unit)}'>
                                                ${info.price.scopeLowPrice} - ${info.price.scopeHighPrice}元/${info.price.unit}
                                            </c:if>
                                        </c:if>
                                    </c:when>
                                    <c:when test="${info.price.flag  == 3}">
                                        面议
                                    </c:when>
                                </c:choose>
                            </div>
                            <button class="to_deatil_btn" data-goods-id="${info.mapId}"
                                    onclick="toGoodsDetail(this)" type="button">
                                查看详情
                            </button>
                        </div>
                    </div>
                </c:forEach>
            </div>

        </div>
    </c:if>
    <%-- END搜索结果页面（有结果）--%>

    <%-- START无结果--%>
    <%--<c:if test="${other == 4}">--%>
        <%--<div class="list_default" style="display: block;margin-bottom: 100px;">--%>
            <%--<div class="default_icon">--%>
                <%--<img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">--%>
            <%--</div>--%>
            <%--<div class="default_txt">--%>
                <%--<div>--%>
                    <%--<h3>抱歉，没有找到与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'--%>
                                        <%--escapeXml="true"/>”相关的仪器</h3>--%>
                    <%--<p>1.您可以核对输入的文字是否正确；</p>--%>
                    <%--<p>2.您可以更换一下关键词，或适当扩大您的搜索范围；</p>--%>
                    <%--<p>3.您可以关注“人人实验服务号”，客服为您解决。</p>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</c:if>--%>
    <c:if test="${other == 4}">
    <div class="list_default" style="display: block;margin-bottom: 100px;">
        <div class="default_icon">
            <img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">
        </div>
        <div class="default_txt">
            <br><br><br>
            <h3>抱歉，没有找到与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                escapeXml="true"/>”相关的仪器</h3>
            <p>1.您可以核对输入的文字是否正确；</p>
            <p>2.您可以更换一下关键词，或适当扩大您的搜索范围；</p>
            <p>3.您可以关注“人人实验服务号”，客服为您解决。</p>
            <br>
            <c:choose>
                <c:when test="${orgSize != 0 && serviceSize != 0}">
                    我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                    escapeXml="true"/>”相关的机构（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',3)">
                    ${orgSize}个</a>）和服务（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                    ${serviceSize}个</a>）
                    <br>
                </c:when>
                <c:when test="${orgSize != 0 && serviceSize == 0}">
                    我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                    escapeXml="true"/>”相关的机构（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',3)">
                    ${orgSize}个</a>）
                    <br>
                </c:when>
                <c:when test="${orgSize == 0 && serviceSize != 0}">
                    我们为您找到了与“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                                    escapeXml="true"/>”相关的服务（<a href="javascript:void(0);" target="_blank" onclick="toSearchFromSuper('${keyword}',2)">
                    ${serviceSize}个</a>）
                    <br>
                </c:when>
            </c:choose>
            </br>
            <p>为您找到了“<c:out value='${keyword.length() > 8 ? keyword.substring(0,8).concat("..."):keyword}'
                            escapeXml="true"/>”的相关知识,<a href="javascript:void(0);" target="_blank" onclick="toKejso()">
                了解请点击</a></p>
        </div>
    </div>
</div>
</c:if>
    <%-- END无结果--%>

    <%--START分页--%>
    <div class="paging" style="display: ${total > 10? "block" : "none"}">
        <div id="page_container" class="page_list"></div>
    </div>
    <%--END分页--%>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/front/js/util/pagination.js?v_=20171108"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">
    // 定义URL参数
    var PAGE_NO = '${pageNo}' || 1,// 初始化当前页数
        INS_TOTAL = '${total}',
        FROM_NO = (PAGE_NO - 1) * 10,
        KEY_WORD = $("#search").val();// 关键字

    var isSubscribe='${isSubscribe}';
    if(isSubscribe) {
        instag=true;
    }
    // 初始化
    (function () {
        navDropDownList();
        initDropdown();
        initFilterEvent();
        $("#dorpBox").show();// 显示城市筛选列表
        $('#dorpUl').slimscroll({
            alwaysVisible: true,
            height: '100%', //可滚动区域高度
            size: '3px', //组件宽度
            color: '#a1a1a1', //滚动条颜色
            opacity: 0.3, //滚动条透明度
            allowPageScroll: false, //是否 使用滚轮到达顶端/底端时，滚动窗口
            wheelStep: 10, //滚轮滚动量
        });
    })();
    var dates=new  Date();
    var dateshtml='';
    for (var i=0;i<7;i++){
        dates.setDate(dates.getDate()+1);
        var month=dates.getMonth()+1;
        var day=dates.getDate();
        dateshtml+='<i title="可预约">'+month+'.'+day+'</i>';
    }
    $(".label p").html(dateshtml);
    // 初始化筛选事件
    function initFilterEvent() {

        $(".normal > div > span,.normal > div > button").on("click", function () {
            // 处理价格筛选
            if ($.trim($(this).text()) === '确定') {
                if ($("#lowPrice").val() === '' && $("#hightPrice").val() === '') {
                    return false;// 未输入价格时不跳转
                }
            }

            // 处理跳转前筛选框样式
            $(this).parent().find("span").removeClass("actived");
            $(this).addClass("actived");

            // 处理特殊的仪器大类
            if ($(this).parent().prop("id") == "category1") {
                $("#category2 > span").removeClass("actived");
                $("#category2 > span").eq(0).addClass("actived");
            }


            PAGE_NO = 1;// 查询条件变化，默认查第一页
            var labelArr = [];
            labelArr = dealUrlFilterParams();// 处理参数
            // 处理更新已选条件
            if (labelArr.length > 0) {

                var $box = $("<div></div>");
                $.each(labelArr, function (index, value) {
                    var curItem = $('<span data-type=' + value.type + '>' + value.txt + '<i class="lab-close-1"></i></span>');
                    $box.append(curItem);
                })
                $box.append('<s onclick="clearAllFilter()" class="clear_label"> <i class="lab-del"></i>清空选项 </s>');
                $("#checkedLabel").empty();
                $("#checkedLabel").html($box.html());

            } else {
                $("#checkedLabel").html('<span style="">不限</span>');
            }
            SERCH_TYPE=1;
            toGoodsList();
        })

    }

    /**
     * 列表页，处理各种筛选参数
     */
    function dealUrlFilterParams() {

        KEY_WORD = $("#search").val();// 重新获取关键字
        // 筛选：地区
        var district = $("#district").find("span.actived").text();

        // 筛选：服务方式
        var insServiceType = $("#insServiceType").find("span.actived").text();

        // 筛选：价格
        var priceFilter = $("#priceFilter").find("span.actived").text();
        var lowPrice = "";
        var hightPrice = "";
        if (!!$.trim(priceFilter) && priceFilter !== '不限') {
            var lowPrice = $("#priceFilter").find("span.actived").data("lowPrice");
            var hightPrice = $("#priceFilter").find("span.actived").data("hightPrice");
        } else if (priceFilter !== '不限') {
            var lowPrice = $("#lowPrice").val();
            var hightPrice = $("#hightPrice").val();
            PRICE_FLAG = true;
        }
        // 筛选：仪器大类
        var category1 = $("#category1").find("span.actived").text();
        var code = $("#category1").find("span.actived").data("categoryId");
        // 筛选：仪器子类
        var category2 = $("#category2").find("span.actived").text();

        // 更新：URL参数
        var labelArr = [];
        if (district !== '不限') {
            labelArr.push({
                txt: district,
                type: "district"
            })
            CUR_DISTRICT = district;
        }

        if (insServiceType !== '不限') {
            labelArr.push({
                txt: insServiceType,
                type: "insServiceType"
            })
            SERVICE_TYPE = insServiceType;
        }

        if (priceFilter !== '不限') {
            if ((lowPrice == 0 || lowPrice == '') && hightPrice > 0) {
                labelArr.push({
                    txt: hightPrice + '元以下',
                    type: "priceFilter"
                })
            }else if (hightPrice == '' && lowPrice > 0) {
                labelArr.push({
                    txt: lowPrice + '元起',
                    type: "priceFilter"
                })
            }else{
                labelArr.push({
                    txt: lowPrice + '~' + hightPrice + '元',
                    type: "priceFilter"
                })
            }

            if (lowPrice != "" || lowPrice == 0) {
                SCOPEL_LOW_PRICE = lowPrice;
            }

            if (hightPrice != "") {
                SCOPEL_HIGHT_PRICE = hightPrice;
            }
        }

        if (category1 !== '不限') {
            labelArr.push({
                txt: category1,
                type: "category1"
            })
            CATEGORY_1 = category1;
            CODE = code;
        }

        if (category2 !== '不限' && category2 !== '') {
            labelArr.push({
                txt: category2,
                type: "category2"
            })
            CATEGORY_2 = category2;
        }
        var address = $("#adCurrent").text();
        dealCity(address);// 处理直辖市

        return labelArr;
    }

    // 初始化页面分页
    showPages(INS_TOTAL, FROM_NO, 10, function (from, max) {
            PAGE_NO = from / 10 + 1;
            dealUrlFilterParams();
            SERCH_TYPE=1;
            toGoodsList();
        }, "page_container"
    )
    
    function initCurAdd() {

    }

    /**
     * 初始化城市下拉列表
     */
    function initDropdown() {

        var urlAddress = null, currentAddress = null;
        <c:choose>
        <c:when test='${("".equals(province) || province == null) && city !=null }'>
        urlAddress = "${city}";
        </c:when>
        <c:when test='${("".equals(city) || city == null) && province != null}'>
         urlAddress = "${province}";
        </c:when>
        <c:otherwise>
          urlAddress = null;
        </c:otherwise>
        </c:choose>

        // 地址處理：优先看url地址，其次看缓存，再其次看定位
        if (urlAddress != null) {

            if (urlAddress === "") {
                currentAddress = "全国";
            } else if (urlAddress.slice(-1) === "市") {
                currentAddress = urlAddress.slice(0, -1);
            } else {
                currentAddress = urlAddress;
            }

        } else {
            // 这个应该先优先从
            currentAddress = getCurremtAdress();
            if (currentAddress === -1) {
                currentAddress = "全国";
            }
        }

        $("#adCurrent").text(currentAddress);// 设置title
        $("#dorpDown li").each(function () {
            var $this = $(this);
            $this.removeClass("active");
            if ($this.find("a").text() === currentAddress) {
                $this.addClass("active");
            }
        })

    }

    /**
     * 设置缓存当前地理位置
     * @param value string类型，传入的地理位置
     */
    function setCurrentAdress(value) {
        localStorage.setItem("curAdress", value);
    }

    /**
     * 获取当前地理位置
     * @returns {number}
     */
    function getCurremtAdress() {
        var curAdress = localStorage.getItem("curAdress");
        return curAdress ? curAdress : -1;
    }

    /**
     *选择位置
     * @param $this
     */
    function choseAddress($this) {
        $this = $($this);
        $("#dorpDown li").removeClass("active");
        $this.addClass("active");
        var choseCity = $this.find("a").text();
        $("#adCurrent").text(choseCity);
        $("#dorpDown").addClass("dn");
        setCurrentAdress(choseCity);

        if ($("#listContent").length > 0) {
            initDistrict();
            PAGE_NO = 1;// 查询条件变化，默认查第一页
            dealUrlFilterParams();
            SERCH_TYPE=1;
            toGoodsList();
        }

    }

    /**
     * 导航下拉列表
     */
    function navDropDownList() {
        dropDownFn({"box": $('#dorpBox'), "target": $('#adCurrent'), "list": $('#dorpDown')});
    }


    // ----------xin-------------\
    function toggleFilter($_this) {

        var $_this = $($_this);
        var flag = $_this.data("flag");
        if (flag == 0) {
            $_this.html('<span><s id="slidePrice">收起筛选</s><i class="lab-arrow-up"></i></span>');
            $_this.data("flag", 1);
            $("#moreFilter").stop().slideDown();
        } else {
            $_this.html('<span><s id="slidePrice">更多筛选</s><i class="lab-arrow-down"></i></span>');
            $_this.data("flag", 0);
            $("#moreFilter").stop().slideUp();
        }
    }

    /**
     * 校验输入的价格范围
     */
    function vertifyPrice() {

        var lowPrice = $("#lowPrice").val();
        var hightPrice = $("#hightPrice").val();

        // 1.只能输入数字,输入0 - 999999的整数
        if (!/^\d{0,6}$/.test(lowPrice) || !/^\d{0,6}$/.test(hightPrice)) {
            $("#cfmPrice").attr("disabled", true);
            $("#cfmPrice").addClass("disables");
            return false;
        }

        if (lowPrice - hightPrice > 0 && hightPrice !== "") {
            $("#cfmPrice").attr("disabled", true);
            $("#cfmPrice").addClass("disables");
        }

    }
    /**
     * 清除校验输入的价格范围
     */
    function clearPrice() {
        $("#cfmPrice").removeAttr("disabled");
        $("#cfmPrice").removeClass("disables");
    }


    function initDistrict() {
        // 初始化区
        $("#district > span").removeClass("actived");
        $("#district > span").eq(0).addClass("actived");
    }
    function initInsServiceType() {
        // 初始化区
        $("#insServiceType > span").removeClass("actived");
        $("#insServiceType > span").eq(0).addClass("actived");
    }
    function initPriceFilter() {
        // 初始化区
        $("#priceFilter > span").removeClass("actived");
        $("#priceFilter > span").eq(0).addClass("actived");
        $("#priceFilter input").val("");
    }

    function initCategory1() {
        // 初始化区
        $("#category1 > span").removeClass("actived");
        $("#category1 > span").eq(0).addClass("actived");
        $("#categorieBox2").hide();
    }
    function initCategory2() {
        // 初始化区
        $("#category2 > span").removeClass("actived");
        $("#category2 > span").eq(0).addClass("actived");
    }


    function clearAllFilter() {
        initDistrict();
        initInsServiceType();
        initPriceFilter();
        initCategory1();
        initCategory2();
        PAGE_NO = 1;
        dealUrlFilterParams();
        SERCH_TYPE=1;
        toGoodsList();
    }

    function clearCurFilter($_this) {
        var $_this = $($_this);
        var type = $_this.data("type");
        $_this.append().parent().remove();
        if (type == 'district') {
            initDistrict();
        }
        if (type == 'insServiceType') {
            initInsServiceType();
        }
        if (type == 'priceFilter') {
            initPriceFilter();
        }
        if (type == 'category1') {
            initCategory1();
        }
        if (type == 'category2') {
            initCategory2()
        }

        PAGE_NO = 1;
        dealUrlFilterParams();
        SERCH_TYPE=1;
        toGoodsList();
    }

    /**
     * 跳转高级搜索页面
     */
    function toKejso() {

        var keyword = $("#search").val();
        if (keyword === "") {
            keyword = "仪器"
        }

        keyword = encodeURI(keyword);
        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/</g, "%3c");
        keyword = keyword.replace(/>/g, "%3e");

        var URL = '${rlab}/front/superSearch/search?flag=0&query=' + keyword;
        window.open(URL);

    }
    function toSearchFromSuper(keywords,flag) {
        if(flag==1){
            //1服务
            var URL = BASE_URL + "/service/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }else if(flag==2){
            //2仪器
            var URL = BASE_URL + "/instrument/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }else{
            //3机构
            var URL = BASE_URL + "/org/query?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";
        }
//       var URL = BASE_URL + "/instrument/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";

        var address = getCurremtAdress();
        if (address !== -1) {
            if(address === "北京") {
                CUR_PROVINCE = "北京市";
            } else if(address === "上海"){
                CUR_PROVINCE = "上海";
            } else if(address === "重庆"){
                CUR_PROVINCE = "重庆";
            }else if(address === "天津"){
                CUR_PROVINCE = "天津";
            }else {
                if(address !== "全国") {
                    CUR_CITY = address;
                }
            }


            if (CUR_PROVINCE !== null) {
                // province
                // formData.province = CUR_PROVINCE;
                URL = URL + "&province=" + CUR_PROVINCE
            }

            if (CUR_CITY !== null) {
                // city
                // formData.city = CUR_CITY;
                URL = URL + "&city=" + CUR_CITY
            }
        }

        window.open(URL);
    }
</script>
</body>
</html>