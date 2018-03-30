<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../../config/taglibs.jsp" %>


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
    <style type="text/css">
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

        .shade .tit {
            padding: 26px 0 0 0;
            overflow: hidden;
        }

        .shade .tit span {
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 15px;
        }

        .shade .tit p {
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }

        .shade .tit button {
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

        .sre_base .dt_1 > .rt {
            word-break:break-all;
            min-height: 25px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>

    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="4"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                 <span class="layui-breadcrumb">
                      <a href="${rlab}/bg/service/list?pageSize=10&pageNo=1">服务管理</a>
                      <a><cite>服务详情</cite></a>
                </span>
            </div>

            <%--START审核状态--%>
            <div class="clearfix">
                <div class="share_dtl_tip ">
                    <span class="ins_num">服务编号：${result.serviceId}</span>
                    <%--<span class="ins_num">服务编号：${detail.mapId}</span>--%>
                    <span class="ins_status">状态：
                        <i>
                            ${result.stateStr}
                        <%--${detail.mapState[2] == 0? '审核通过': detail.mapState[2] == 1? '待审核': detail.mapState[2] == 2? '审核拒绝': '已下架'}--%>
                        </i>
                    </span>
                </div>
            </div>

            <%--END审核状态--%>

            <%--START仪器基本信息详情--%>
            <div class="share_main clearfix">
                <%-- START 左侧服务基本信息--%>
                <div class="sre_lft sre_base" style="border: 0 none">
                    <h4>服务基本信息</h4>
                    <%--服务名称--%>
                    <div class="dt_1 clearfix">
                        <h5>服务名称:</h5>
                        <div class="rt">
                            <%--<span>${detail.insName}</span>--%>
                            <span>${result.serviceName}</span>
                        </div>
                    </div>
                    <div class="dt_1 clearfix">
                        <h5>机构名称:</h5>
                        <div class="rt">
                            <span>${result.orgName}</span>
                        </div>
                    </div>
                    <%--服务图片--%>
                    <div class="dt_1 clearfix">
                        <h5>服务图片</h5>
                        <div class="rt ins_img">
                            <ul>
                                <c:forEach items="${result.servicePics}" var="item">
                                    <li>
                                        <a href="javascript:void (0)" target="_blank">
                                            <img onerror="imgOnError(this)" src="${item}500_500">
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                    <%--服务特点--%>
                    <div class="dt_1 clearfix">
                        <h5>服务特点:</h5>
                        <div class="rt">
                            <c:forEach var="item" items="${result.serviceFeature}">
                                <span>${item}</span>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="dt_1 clearfix">
                        <h5>服务资质:</h5>
                        <div class="rt">
                            <c:forEach var="item" items="${result.serviceCredit}">
                                <span>${item}</span>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="dt_1 clearfix">
                        <h5>参考价格:</h5>
                        <div class="rt">
                            <span><c:if test="${result.servicePrice.flag == 1}">
                                ￥${result.servicePrice.accPrice} / ${result.servicePrice.unit}
                            </c:if>
                                <c:if test="${result.servicePrice.flag == 2}">
                                    <c:choose>
                                        <c:when test='${result.servicePrice.scopeHighPrice.equals("0")}'>
                                            ￥${result.servicePrice.scopeLowPrice}/${result.servicePrice.unit}起
                                        </c:when>
                                        <c:otherwise>
                                            ￥${result.servicePrice.scopeLowPrice} - ￥${result.servicePrice.scopeHighPrice} / ${result.servicePrice.unit}
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:if test="${result.servicePrice.flag == 3}">
                                    面议
                                </c:if></span>
                        </div>
                    </div>
                    <div class="dt_1 clearfix">
                        <h5>报价说明:</h5>
                        <div class="rt">
                            <span>${result.servicePrice.remark}</span>
                        </div>
                    </div>
                </div>
                <%--END 左侧服务基本信息--%>

                <%-- START 右侧服务详细信息--%>
                <div class="sre_rt sre_base" style="    border-left: 2px solid #dde4eb;">
                    <h4>服务详细信息</h4>
                    <%--服务简介--%>
                    <div class="dt_1 clearfix">
                        <h5>服务简介:</h5>
                        <div class="rt">
                            <span>${result.serviceDes}</span>
                        </div>
                    </div>
                    <%--服务领域--%>
                    <div class="dt_1 clearfix" style="display: none">
                        <h5>服务领域:</h5>
                        <div class="rt">
                            <c:forEach var="item" items="${result.serviceScope}">
                                <span>${item}</span>
                            </c:forEach>
                        </div>
                    </div>
                    <%-- 使用设备 --%>
                    <div class="dt_1 clearfix">
                        <h5>使用设备:</h5>
                        <div class="rt">
                            <c:forEach var="item" items="${result.serviceMachine}">
                                <span>${item}</span>
                            </c:forEach>
                        </div>
                    </div>
                    <%--依据方法--%>
                    <div class="dt_1 clearfix">
                        <h5>依据方法:</h5>
                        <div class="rt">
                            <span>${result.serviceMethod}</span>
                            <%--<c:forEach var="item" items="${result.serviceMethod}">--%>
                                <%--<span>${item}</span>--%>
                            <%--</c:forEach>--%>
                        </div>
                    </div>
                    <%--服务周期--%>
                    <div class="dt_1 clearfix ins_trait">
                        <h5>服务周期:</h5>
                        <div class="rt">
                          <span>${result.servicePeriod}</span>
                        </div>
                    </div>
                    <div class="dt_1 clearfix ins_trait">
                        <h5>其他备注:</h5>
                        <div class="rt">
                            <span>${result.serviceNote}</span>
                        </div>
                    </div>
                    <%--联系方式--%>
                    <div class="dt_2 clearfix">
                        <h5>联系方式:</h5>
                        <div class="btm">
                            <table class="lab_table_phone">
                                <thead>
                                <tr>
                                    <th>联系人姓名</th>
                                    <th>联系电话</th>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${result.serviceContacts}" var="item">
                                        <tr>
                                            <td>${item.conName}</td>
                                            <td>${item.conPhone}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="dt_1 clearfix">
                        <h5>联系地址:</h5>
                        <div class="rt">
                            <span>${result.serviceProvince}${result.serviceCity}${result.serviceDistrict}${result.serviceAddress}</span>
                        </div>
                    </div>
                    <div  class="dt_1 clearfix">
                        <h5>地址经纬度:</h5>
                        <div class="rt">
                            <span>东经 ${result.serviceLon}</span>
                            &nbsp;&nbsp;&nbsp;
                            <span>北纬 ${result.serviceLat}</span>
                        </div>
                    </div>
                    <div id="baidumap" class="baidu_map" style="height: 300px;width: 400px;margin-top: 20px;">
                        百度地图占位
                    </div>

                </div>
                <%-- END 右侧服务详细信息--%>

            </div>
            <%--END仪器基本信息详情--%>

            <%--START操作按鈕--%>
            <div class="share_btn" style="margin: 0 auto; text-align: center">
                <%--审核权限--%>
                <%--<c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">--%>
                    <%--<c:if test="${result.serviceState == 1}">--%>
                        <button class="layui-btn btn" style="background: #16b8be; width: 150px" onclick="agreeAlert()">
                            审核通过
                        </button>
                        <button class="layui-btn btn" style="background: #ec8086; width: 150px" onclick="refuseAlert()">
                            审核拒绝
                        </button>
                    <%--</c:if>--%>
                <%--</c:if>--%>
                <button class="layui-btn btn" style="background: #49aaff; width: 150px" onclick="modify()">修改服务
                </button>
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
        window.location.href = '${rlab}/bg/service/modify?serviceId=' + '${result.serviceId}';
    }

    /**
     * 下架
     */
    function dropAlert() {
        $("#drop").show();
    }

    function drop() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=',
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
        var data = {
            'serviceIds': [${result.serviceId}],
            'state': 0
        };
        $.ajax({
            url: '${rlab}/bg/service/audit',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data:JSON.stringify(data)
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
        var data = {
            'serviceIds': [${result.serviceId}],
            'state': 3
        };
        $.ajax({
            url: '${rlab}/bg/service/audit',
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            data:JSON.stringify(data)
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
        map.centerAndZoom(new BMap.Point(${result.serviceLon}, ${result.serviceLat}), 11);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
        map.setCurrentCity("${result.serviceCity}");          // 设置地图显示的城市 此项是必须设置的
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
    searchByStationName(map, "${result.serviceProvince}${result.serviceCity}${result.serviceAddress}");

    /**
     * 图片加载失败
     * @param $_this
     */
    function imgOnError($_this) {
        $($_this).attr("src", "${rlab}/common/common_img/default/ins_280x280.jpg")
    }
</script>
</html>
