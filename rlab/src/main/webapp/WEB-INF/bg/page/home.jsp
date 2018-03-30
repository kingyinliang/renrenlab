<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，主页</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/bg/css/home.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <%--<link rel="stylesheet" href="../../common/assets/bootstrap-3.3.7-dist/css/bootstrap.css">--%>

    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>
    <script src="${rlab}/common/assets/layui/layui.js"></script>
    <script src="${rlab}/common/assets/echarts/echarts.js"></script>
    <script src="${rlab}/common/assets/echarts/macarons.js"></script>
    <%--<script src="${rlab}/bg/common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <style>

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
                <jsp:param name="levelNum" value="1"/>
                <jsp:param name="firstMenu" value="1"/>
                <jsp:param name="secondMenu" value="0"/>
            </jsp:include>

        </div>
        <div class="main" style="padding-left: 40px; padding-right: 40px;">
            <%-- 编写代码的地方，内容区域 --%>
            <div class="main_head">
                <p style="font-size: 18px; color: #4c5e70">首页</p>
                <p style="font-size: 14px; color: #7b8da0; margin-top: 5px">统计数据均为截止至前一天数据</p>
                <div></div>
            </div>

            <div class="chart_container" style="width: 100%; height: 490px; background-color: white; margin-bottom: 50px">
                <div style="width: 100%; height: 20%">
                    <p style="margin-left: 40px;  font-size: 16px; color: #4c5e70; line-height: 50px">用户数量统计</p>
                    <div style="background-color: #dce3ea; height: 1px"></div>
                    <div style="width: 100%; text-align: center; margin-top: 15px">
                        <p style="display: inline-block;  font-size: 18px; color: #4c5e70">用户总数:</p>
                        <p style="display: inline-block; color: #40a6ff; font-size: 18px">${userCounts}</p>
                    </div>
                </div>
                <div id="user" style="width: 80%; height: 80%; margin: 0 auto"></div>
            </div>
            <div class="chart_container" ; style="background-color: white; height: 490px; margin-bottom: 50px;margin-top: 54px">
                <div style="width: 100%; height: 20%">
                    <p style="margin-left: 40px;  font-size: 16px; color: #4c5e70; line-height: 50px">机构数量统计</p>
                    <div style="background-color: #dce3ea; height: 1px"></div>
                    <div style="width: 100%; text-align: center; margin-top: 15px">
                        <p style="display: inline-block;  font-size: 18px; color: #4c5e70">机构总数:</p>
                        <p style="display: inline-block; color: #5bcdd1; font-size: 18px">${orgCounts}</p>
                    </div>
                </div>
                <div id="org" style="width: 80%; height: 80%; margin: 0 auto"></div>
            </div>
            <div class="chart_container" ; style="background-color: white; height: 490px; margin-bottom: 50px">
                <div style="width: 100%; height: 20%">
                    <p style="margin-left: 40px;  font-size: 16px; color: #4c5e70; line-height: 50px">仪器数量统计</p>
                    <div style="background-color: #dce3ea; height: 1px"></div>
                    <div style="width: 100%; text-align: center; margin-top: 15px">
                        <p style="display: inline-block;  font-size: 18px; color: #4c5e70">仪器总数:</p>
                        <p style="display: inline-block; color: #5bcdd1; font-size: 18px">${insCounts}</p>
                    </div>
                </div>
                <div id="machine" style="width: 80%; height: 80%; margin: 0 auto"></div>
            </div>
            <div class="chart_container" ; style="background-color: white; height: 490px; margin-bottom: 150px">
                <div style="width: 100%; height: 20%">
                    <p style="margin-left: 40px;  font-size: 16px; color: #4c5e70; line-height: 50px">服务数量统计</p>
                    <div style="background-color: #dce3ea; height: 1px"></div>
                    <div style="width: 100%; text-align: center; margin-top: 15px">
                        <p style="display: inline-block;  font-size: 18px; color: #4c5e70">服务总数:</p>
                        <p style="display: inline-block; color: #58c2ff; font-size: 18px">${serviceCounts}</p>
                    </div>
                </div>
                <div id="service" style="width: 80%; height: 80%; margin: 0 auto"></div>
            </div>

            <%--<div class="chart_container" style="background-color: white; height: 490px">--%>
            <%--<div style="width: 100%; height: 20%">--%>
            <%--<p style="margin-left: 40px;  font-size: 16px; color: #4c5e70; line-height: 50px">需求数量统计</p>--%>
            <%--<div style="background-color: #dce3ea; height: 1px"></div>--%>
            <%--<div style="width: 100%; margin-top: 15px; margin-left: 40px">--%>
            <%--<p style="display: inline-block; font-size: 16px; color: #4c5e70">需求总数:</p>--%>
            <%--<p style="display: inline-block; color: #40a6ff; font-size: 16px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 16px; color: #4c5e70; margin-left: 15px">进行中:</p>--%>
            <%--<p style="display: inline-block; color: #fba45f; font-size: 16px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 16px; color: #4c5e70; margin-left: 15px">已解决:</p>--%>
            <%--<p style="display: inline-block; color: #5bcdd1; font-size: 16px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 16px; color: #4c5e70; margin-left: 15px">已过期:</p>--%>
            <%--<p style="display: inline-block; color: #cacaca; font-size: 16px">10000</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div id="need" style="width: 80%; height: 70%; margin: 0 auto"></div>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;<div id="need" class="chart_container"></div>&ndash;%&gt;--%>
            <%--<div class="chart_container" style="margin-bottom: 100px; margin-bottom: 150px">--%>
            <%--<div style="width: 48%; height: 100%; float: left; background-color: white">--%>
            <%--<div style="width: 100%; height: 10%">--%>
            <%--<p style="margin-left: 40px;  font-size: 15px; line-height: 50px">创新券申请统计</p>--%>
            <%--<div style="background-color: #dce3ea; height: 1px"></div>--%>
            <%--<div style="margin-left: 15%; width: 100%; margin-top: 10px">--%>
            <%--<p style="display: inline-block; font-size: 12px">申请认证总数:</p>--%>
            <%--<p style="display: inline-block; color: #40a6ff; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">待审核:</p>--%>
            <%--<p style="display: inline-block; color: #fba45f; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">审核通过:</p>--%>
            <%--<p style="display: inline-block; color: #5bcdd1; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">审核拒绝:</p>--%>
            <%--<p style="display: inline-block; color: #cacaca; font-size: 12px">10000</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div id="tickets" style="width: 100%; height: 90%"></div>--%>
            <%--</div>--%>
            <%--<div style="width: 48%; height: 100%; float: right; background-color: white">--%>
            <%--<div style="width: 100%; height: 10%">--%>
            <%--<p style="margin-left: 40px; font-size: 15px; line-height: 50px">机构数量统计</p>--%>
            <%--<div style="background-color: #dce3ea; height: 1px"></div>--%>
            <%--<div style="margin-left: 15%; width: 100%; margin-top: 10px">--%>
            <%--<p style="display: inline-block; font-size: 12px">项目总数:</p>--%>
            <%--<p style="display: inline-block; color: #40a6ff; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">待审核:</p>--%>
            <%--<p style="display: inline-block; color: #fba45f; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">审核通过:</p>--%>
            <%--<p style="display: inline-block; color: #5bcdd1; font-size: 12px">10000</p>--%>
            <%--<p style="display: inline-block; font-size: 12px; margin-left: 10px">审核拒绝:</p>--%>
            <%--<p style="display: inline-block; color: #cacaca; font-size: 12px">10000</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div id="project" style="width: 100%; height: 90%"></div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>


        </div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
//    var days = new Array();
//    var date = new Date(new Date() - 7 * 24 * 60 * 60 * 1000);
//
//    for (var i = 1; i < 8; i++) {
//        var day = (date.getMonth() + 1) + '/' + date.getDate();
//        days[i - 1] = day;
//        date = new Date(date.getTime() + 24 * 60 * 60 * 1000);
//    }

    var userChart = echarts.init(document.getElementById('user'));
    // 使用刚指定的配置项和数据显示图表。
    userChart.setOption({
        color: ['#40a6ff'],
//        title: {
//            text: '用户数量统计',
//        },
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data:${month}
            <%--data: [<c:forEach var="month" items="${month}">'${month.time}', </c:forEach>]--%>
//            data:['01', '02', '03', '04', '05', '06', '07'],
        },
        yAxis: {
            show: 'false',
            type: 'value'
        },
        series: [{
            name: '用户量',
            type: 'line',
            smooth: true,
//            data: [10, 12, 21, 54, 260, 830, 710],
            data: [<c:forEach var="user" items="${userInfo}">${user}, </c:forEach>],
            lineStyle: {
                normal: {
                    width: 3
                }
            }
        }]
    });

    var orgChart = echarts.init(document.getElementById('org'));
    orgChart.setOption({
        color: ['#fba45f'],
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ${month}
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '机构量',
            type: 'line',
            smooth: true,
//            data: [500, 550, 600, 700, 800, 1000, 1500],
            data: [<c:forEach var="org" items="${orgInfo}">${org}, </c:forEach>],
            lineStyle: {
                normal: {
                    width: 3
                }
            }
        }]
    });

    var machineChart = echarts.init(document.getElementById('machine'));
    machineChart.setOption({
        color: ['#5bcdd1'],
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ${month}
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '仪器增长量',
            type: 'line',
            smooth: true,
//            data: [500, 550, 600, 700, 800, 1000, 1500],
            data: [<c:forEach var="ins" items="${insInfo}">${ins}, </c:forEach>],
            lineStyle: {
                normal: {
                    width: 3
                }
            }
        }]
    });


    var fuwueChart = echarts.init(document.getElementById('service'));
    fuwueChart.setOption({
        color: ['#58c2ff'],
        tooltip: {
            trigger: 'axis'
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ${month}
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '服务量',
            type: 'line',
            smooth: true,
//            data: [500, 550, 600, 700, 800, 1000, 1500],
            data: [<c:forEach var="service" items="${serviceInfo}">${service}, </c:forEach>],
            lineStyle: {
                normal: {
                    width: 3
                }
            }
        }]
    });

    //    var needChart = echarts.init(document.getElementById('need'));
    //    needChart.setOption({
    //        color: ['#40a6ff', '#fba45f', '#5bcdd1', '#cacaca'],
    //        legend: {
    //            data:['需求总数', '进行中', '已解决', '已过期'],
    //            bottom: 0
    //        },
    //        tooltip: {
    //            trigger: 'axis'
    //        },
    //        xAxis: {
    //            type: 'category',
    //            boundaryGap: false,
    //            data: days
    //        },
    //        yAxis: {
    //            type: 'value'
    //        },
    //        series: [{
    //            name: '需求总数',
    //            type: 'line',
    //            smooth: true,
    //            data: [500, 550, 600, 700, 800, 1000, 1500]
    //        },
    //            {
    //                name: '进行中',
    //                type: 'line',
    //                smooth: true,
    //                data: [2, 500, 1, 2, 3, 2, 5]
    //            },
    //            {
    //                name: '已解决',
    //                type: 'line',
    //                smooth: true,
    //                data: [1, 0, 3, 200, 0, 3, 2]
    //            },
    //            {
    //                name: '已过期',
    //                type: 'line',
    //                smooth: true,
    //                data: [100, 200, 300, 500, 900, 500, 600],
    //                lineStyle: {
    //                    normal: {
    //                        type: 'dashed'
    //                    }
    //                }
    //            }]
    //    });
    //
    //    var ticketsChart = echarts.init(document.getElementById('tickets'));
    //    ticketsChart.setOption({
    //        color: ['#40a6ff', '#fba45f', '#5bcdd1', '#cacaca'],
    //        legend: {
    //            data:['申请认证总数', '待审核', '审核通过', '审核拒绝'],
    //            bottom: 5
    //        },
    //        tooltip: {
    //            trigger: 'axis'
    //        },
    //        xAxis: {
    //            type: 'category',
    //            boundaryGap: false,
    //            data: days
    //        },
    //        yAxis: {
    //            type: 'value'
    //        },
    //        series: [{
    //            name: '申请认证总数',
    //            type: 'line',
    //            smooth: true,
    //            data: [500, 550, 600, 700, 800, 1000, 1500]
    //        },
    //            {
    //                name: '待审核',
    //                type: 'line',
    //                smooth: true,
    //                data: [2, 5, 1, 2, 3, 2, 5]
    //            },
    //            {
    //                name: '审核通过',
    //                type: 'line',
    //                smooth: true,
    //                data: [1, 0, 3, 2, 0, 3, 2]
    //            },
    //            {
    //                name: '审核拒绝',
    //                type: 'line',
    //                smooth: true,
    //                data: [100, 200, 300, 500, 900, 500, 600],
    //                lineStyle: {
    //                    normal: {
    //                        type: 'dashed'
    //                    }
    //                }
    //            }]
    //    });
    //
    //    var projectChart = echarts.init(document.getElementById('project'));
    //    projectChart.setOption({
    //        color: ['#40a6ff', '#fba45f', '#5bcdd1', '#cacaca'],
    //        legend: {
    //            data:['项目总数', '待审核', '审核通过', '审核拒绝'],
    //            bottom: 5
    //        },
    //        tooltip: {
    //            trigger: 'axis'
    //        },
    //        xAxis: {
    //            type: 'category',
    //            boundaryGap: false,
    //            data: days
    //        },
    //        yAxis: {
    //            type: 'value'
    //        },
    //        series: [{
    //            name: '项目总数',
    //            type: 'line',
    //            smooth: true,
    //            data: [500, 550, 600, 700, 800, 1000, 1500]
    //        },
    //            {
    //                name: '待审核',
    //                type: 'line',
    //                smooth: true,
    //                data: [2, 5, 1, 2, 3, 2, 5]
    //            },
    //            {
    //                name: '审核通过',
    //                type: 'line',
    //                smooth: true,
    //                data: [1, 0, 3, 2, 0, 3, 2]
    //            },
    //            {
    //                name: '审核拒绝',
    //                type: 'line',
    //                smooth: true,
    //                data: [100, 200, 300, 500, 900, 500, 600],
    //                lineStyle: {
    //                    normal: {
    //                        type: 'dashed'
    //                    }
    //                }
    //            }]
    //    });
</script>
</html>
