<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <script src="https://api.map.baidu.com/api?v=2.0&ak=ZlEwMqIMtChz8MEj1mV6Tc6v" type="text/javascript"></script>

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="${rlab}/common/assets/layui/layui.js"></script>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="${rlab}/common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>

    <link rel="stylesheet" href="${rlab}/bg/css/ins_share_base.css">
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
            margin-bottom: 15px;
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
                      <a><cite>共享信息详情</cite></a>
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

                    <h4>仪器基本信息</h4>

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
                                        <a href="javascript:void (0)" target="_blank"><img onerror="imgOnError(this)"
                                                                                           src="${rlab}/common/common_img/default/ins_280x280.jpg"
                                                                                           alt="商品图片"></a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${detail.insPic}" var="item">
                                        <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${fn:substringBefore(item, "?")}" target="_blank"><img
                                                        onerror="imgOnError(this)" src="${item}" alt="商品图片"></a>
                                            </li>
                                        </c:if>

                                        <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${item}" target="_blank"><img onerror="imgOnError(this)"
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
                                <c:forEach items="${detail.insCategoryList}" var="category" varStatus="st">
                                    ${category.categoryName}
                                </c:forEach>
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
                        <h5>持有机构:</h5>
                        <div class="rt">
                            <span>${detail.orgName}</span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>参考报价:</h5>
                        <div class="rt">
                            <span><c:choose>
                                <c:when test="${detail.insOrgPriceList.flag == 1}">
                                    <c:if test='${"无".equals(detail.insOrgPriceList.unit)}'>
                                        ${detail.insOrgPriceList.accPrice}元
                                    </c:if>
                                    <c:if test='${!"无".equals(detail.insOrgPriceList.unit)}'>
                                        ${detail.insOrgPriceList.accPrice}元/${detail.insOrgPriceList.unit}
                                    </c:if>
                                </c:when>
                                <c:when test="${detail.insOrgPriceList.flag == 2}">
                                    <c:if test='${detail.insOrgPriceList.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(detail.insOrgPriceList.unit)}'>
                                            ${detail.insOrgPriceList.scopeLowPrice}元起
                                        </c:if>
                                        <c:if test='${!"无".equals(detail.insOrgPriceList.unit)}'>
                                            ${detail.insOrgPriceList.scopeLowPrice}元/${detail.insOrgPriceList.unit}起
                                        </c:if>
                                    </c:if>
                                    <c:if test='${!detail.insOrgPriceList.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(detail.insOrgPriceList.unit)}'>
                                            ${detail.insOrgPriceList.scopeLowPrice} - ${detail.insOrgPriceList.scopeHighPrice}元
                                        </c:if>
                                        <c:if test='${!"无".equals(detail.insOrgPriceList.unit)}'>
                                            ${detail.insOrgPriceList.scopeLowPrice} - ${detail.insOrgPriceList.scopeHighPrice}元/${detail.insOrgPriceList.unit}
                                        </c:if>
                                    </c:if>
                                </c:when>
                                <c:when test="${detail.insOrgPriceList.flag == 3}">
                                    面议
                                </c:when>
                            </c:choose></span>
                        </div>
                    </div>


                    <div class="dt_1 clearfix">
                        <h5>报价说明:</h5>
                        <div class="rt">
                            <span><c:choose>
                                <c:when test="${detail.insOrgPriceList.remark == null||detail.insOrgPriceList.remark == '' || fn:length(detail.insOrgPriceList.remark) == 0} ">无</c:when>
                                <c:otherwise>
                                    ${detail.insOrgPriceList.remark}
                                </c:otherwise>
                            </c:choose></span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>适用领域:</h5>
                        <div class="rt">
                            <span>
                               <c:choose>
                                   <c:when test="${detail.insScopeList != null && fn:length(detail.insScopeList)>0}">
                                       <c:forEach items="${detail.insScopeList}" var="insScopes">
                                           ${insScopes.insScopeName}
                                       </c:forEach>
                                   </c:when>
                                   <c:otherwise>
                                       未知
                                   </c:otherwise>
                               </c:choose>
                            </span>
                        </div>
                    </div>

                    <div class="dt_1 clearfix ins_trait">
                        <h5>仪器特点:</h5>
                        <div class="rt">
                            <c:choose>
                                <c:when test="${detail.insFeatureList != null && fn:length(detail.insFeatureList)>0}">
                                    <c:forEach items="${detail.insFeatureList}" var="feature">
                                        <i class="lab_tag lab_tag_blue">${feature.insFeatureName}</i>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <i class="lab_tag lab_tag_blue">未知</i>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>服务方式:</h5>
                        <div class="rt">
                            <span>${detail.insServiceName==null?"暂无":detail.insServiceName}</span>
                        </div>
                    </div>

                    <div class="dt_2 clearfix">
                        <h5>联系电话:</h5>
                        <div class="btm">
                            <table class="lab_table_phone">
                                <thead>
                                <tr>
                                    <th>联系人姓名</th>
                                    <th>联系电话</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:if test="${detail.conList != null && fn:length(detail.conList)>0}">
                                    <c:forEach items="${detail.conList}" var="conList">
                                        <tr>
                                            <td>${conList.conName}</td>
                                            <td>${conList.conPhone}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>联系地址<span>*</span>:</h5>
                        <div class="rt">
                            <span>${detail.orgAddrProvince}${detail.orgAddrCity}${detail.orgAddrStreet}</span>
                        </div>
                    </div>
                    <div id="baidumap" class="baidu_map" style="height: 300px;width: 400px;margin-top: 20px;">

                    </div>

                </div>
                <%--右侧结束--%>

            </div>
            <%--END仪器基本信息详情--%>


            <%--START操作按鈕--%>
            <div class="share_btn" style="margin: 0 auto; text-align: center">
                <c:if test="${detail.mapState[2] == '0'}">
                    <%--修改权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">--%>
                        <button class="layui-btn btn" style="background: #49aaff; width: 150px" onclick="modify()">修改</button>
                    <%--</c:if>--%>
                    <%--撤销权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">--%>
                        <button class="layui-btn btn" style="margin-right: 23px;background: #7c7c7c; width: 150px" onclick="dropAlert()">下架</button>
                    <%--</c:if>--%>
                </c:if>
                <c:if test="${detail.mapState[2] == '1'}">
                    <%--审核权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                        <button class="layui-btn btn" style="background: #16b8be; width: 150px" onclick="agreeAlert()">审核通过</button>
                        <button class="layui-btn btn" style="background: #ec8086; width: 150px" onclick="refuseAlert()">审核拒绝</button>
                    <%--</c:if>--%>
                    <%--修改权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">--%>
                        <button class="layui-btn btn" style="background: #49aaff; width: 150px" onclick="modify()">修改</button>
                    <%--</c:if>--%>
                </c:if>
                <c:if test="${detail.mapState[2] == '2'}">
                    <%--修改权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">--%>
                        <button class="layui-btn btn" style="background: #49aaff; width: 150px" onclick="modify()">修改</button>
                    <%--</c:if>--%>
                </c:if>
                <c:if test="${detail.mapState[2] == '3'}">
                    <%--撤销权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">--%>
                        <button class="layui-btn btn" style="background: #16b8be; width: 150px" onclick="agreeAlert()">启用</button>
                    <%--</c:if>--%>
                    <%--修改权限--%>
                    <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">--%>
                        <button class="layui-btn btn" style="background: #49aaff; width: 150px" onclick="modify()">修改</button>
                    <%--</c:if>--%>
                </c:if>
            </div>
            <%--END操作按钮--%>
        </div>
    </div>
</div>
<div class="shade" id="agree">
    <div class="tit" style="height: 240px;">
        <span class="lab-adress"></span>
        <p>确认审核通过？</p>
        <%--<p style="font-size: 16px;color: #909090">关闭机构后，该机构用户不可看到</p>--%>
        <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
        <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
        <button class="layui-btn" onclick="agree()">确认</button>
    </div>
</div>
<div class="shade" id="refuse">
    <div class="tit" style="height: 240px;">
        <span class="lab-adress"></span>
        <p>确认审核拒绝？</p>
        <%--<p style="font-size: 16px;color: #909090">关闭机构后，该机构用户不可看到</p>--%>
        <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
        <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
        <button class="layui-btn" onclick="refuse()">确认</button>
    </div>
</div>
<div class="shade" id="drop">
    <div class="tit" style="height: 240px;">
        <span class="lab-adress"></span>
        <p>确认下架该仪器？</p>
        <%--<p style="font-size: 16px;color: #909090">关闭机构后，该机构用户不可看到</p>--%>
        <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
        <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
        <button class="layui-btn" onclick="drop()">确认</button>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>

    function hide() {
        $("#agree").hide();
        $("#refuse").hide();
        $("#drop").hide();
    }

    /**
     * 修改
     */
    function modify() {
        window.location.href = '${rlab}/bg/share/modify?mapId='+${detail.mapId};
    }

    /**
     * 下架
     */
    function dropAlert() {
        $("#drop").show();
    }
    function drop() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + ${detail.mapId} + '&state=' + '3',
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
            })
            .fail(function (data) {
                alert("下架失败");
            });
    }

    /**
     * 审核通过
     */
    function agreeAlert() {
        $("#agree").show();
    }
    function agree() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + ${detail.mapId} + '&state=' + '0',
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
            })
            .fail(function (data) {
                alert("审核通过失败");
            });
    }

    /**
     * 审核拒绝
     */
    function refuseAlert() {
        $("#refuse").show();
    }
    function refuse() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + ${detail.mapId} + '&state=' + '2',
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
            })
            .fail(function (data) {
                alert("审核拒绝失败");
            });
    }

    /**
     * 初始化Map
     * @returns {BMap.Map}
     */
    function initMap() {
        var map = new BMap.Map("baidumap");    // 创建Map实例
        map.centerAndZoom(new BMap.Point(${detail.orgAddrLongitude}, ${detail.orgAddrLatitude}), 11);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
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
    }

    var map = initMap();
    searchByStationName(map, "${detail.orgAddrProvince}${detail.orgAddrCity}${detail.orgAddrStreet}");

    /**
     * 图片加载失败
     * @param $_this
     */
    function imgOnError($_this) {
        $($_this).attr("src", "${rlab}/common/common_img/default/ins_280x280.jpg")
    }
</script>
</html>
