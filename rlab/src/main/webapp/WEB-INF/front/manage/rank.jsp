<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/11/29
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <%--     <script src="${rlab}/front/assets/echarts/echarts.min.js" type="text/javascript" charset="utf-8"></script> --%>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170622">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/scientific_search.css?v_=20170622"/>

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
        .main {
            width: 1120px;
            margin: auto;
            overflow: hidden;
        }

        #tendencyChart h3 {
            font-size: 18px;
            color: #686868;
            letter-spacing: 1px;
            margin-bottom: 13px;
        }

        #tendencyChart {
            width: 1000px;
            margin: auto;
            margin-top: 56px;
        }

        .box, #rankList {
            background: white;
            padding: 25px 20px;
        }

        .boxHead b {
            width: 14px;
            height: 14px;
            display: block;
            float: left;
            background: #58c1ff;
            margin-right: 6px;
        }

        .boxHead span {
            font-size: 14px;
            letter-spacing: 1px;
            color: #9a9a9a;
            line-height: 14px;
            float: left;
        }

        .boxTab {
            width: 300px;
            float: right;
        }

        .boxTab span {
            line-height: 21px;
            margin-right: 10px;
        }

        .boxTab a {
            cursor: pointer;
            width: 43px;
            height: 21px;
            border-radius: 10px;
            border: solid 1px #e4e4e4;
            display: inline-block;
            font-size: 12px;
            letter-spacing: 1px;
            color: #9f9f9f;
            text-align: center;
            line-height: 21px;
            margin: 0 5px;
        }

        .boxTab .selectA {
            background: #588eff;
            color: white;
        }

        #Chartweek, #Charthamoon, #Chartmonth {
            width: 100%;
            height: 450px;
        }

        #rankList a {
            margin: 0 20px;
            padding: 0 20px;
            height: 33px;
            line-height: 33px;
            background-color: #ffffff;
            border-radius: 16px;
            display: inline-block;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            color: #686868;
        }

        #rankList .seleA {
            color: white;
            background-color: #588eff;
        }

        .tables, .orgTables {
            width: 100%;
            margin-top: 50px;
            padding: 0 50px;
        }

        .tables table td, .orgTables table td {
            font-size: 14px;
            color: #686868;
            height: 34px;
            line-height: 34px;
        }

        .tables table th, .orgTables table th {
            border: none;
            padding: 0;
            margin: 0;
            font-size: 18px;
            color: #686868;
            height: 38px;
            line-height: 38px;
            border-bottom: solid 1px #d6d6d6;
        }

        .tables table, .orgTables table {
            width: 100%;
            text-align: center;
        }

        .bar {
            width: 329px;
            height: 10px;
            margin-left: 30px;
        }

        .bar div {
            height: 10px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--内容部分-->
    <div class="main">
        <div id="tendencyChart">
            <h3>平台趋势</h3>
            <div class="box">
                <div class="boxHead clearfix">
                    <b></b><span>平台指数</span>
                    <p class="boxTab">
                        <span>最近</span>
                        <a class="selectA" data-chart-day="7">7天</a>
                        <a data-chart-day="15">15天</a>
                        <a data-chart-day="30">31天</a>
                    </p>
                </div>
                <div id="Chartweek"></div>
                <div id="Charthamoon"></div>
                <div id="Chartmonth"></div>
            </div>
            <h3 style="margin-top: 50px">平台排行</h3>
            <div id="rankList" style="padding-top: 50px">
                <a class="seleA">类目排行</a>
                <a>机构共享排行</a>
                <div class="tables">
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="30%">
                            <col width="15%">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>排名</th>
                            <th>类目</th>
                            <th>指数</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${rankList}" var="item">
                            <tr>
                                <td>${item.get("rank")}</td>
                                <td style="text-align: left">${item.get("classifyName")}</td>
                                <td style="text-align: right">${item.get("insCount")}</td>
                                <td>
                                    <div class="bar">
                                        <div style="width: ${item.get('insCount')/rankList.get(0).get('insCount')*100}%;background-color: ${item.get('rank')==1?'#ff6767':item.get('rank')==2?'#ff8167':item.get('rank')==3?'#ff9867':item.get('rank')==4?'#ffb167':item.get('rank')==5?'#ffce67':item.get('rank')==6?'#ffde67':item.get('rank')==7?'#fff967':item.get('rank')==8?'#e6ff67':item.get('rank')==9?'#bcff67':'#9aff67'};"></div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="orgTables" style="display: none">
                    <table>
                        <colgroup>
                            <col width="10%">
                            <col width="30%">
                            <col width="15%">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>排名</th>
                            <th>机构名称</th>
                            <th>指数</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orgRank}" var="item">
                            <tr>
                                <td>${item.get("orgRank")}</td>
                                <td style="text-align: left">${item.get("orgName")}</td>
                                <td style="text-align: right">${item.get("shareIndex")}</td>
                                <td>
                                    <div class="bar">
                                        <div style="width: ${item.get('shareIndex')/orgRank.get(0).get('shareIndex')*100}%;background-color: ${item.get('orgRank')==1?'#ff6767':item.get('orgRank')==2?'#ff8167':item.get('orgRank')==3?'#ff9867':item.get('orgRank')==4?'#ffb167':item.get('orgRank')==5?'#ffce67':item.get('orgRank')==6?'#ffde67':item.get('orgRank')==7?'#fff967':item.get('orgRank')==8?'#e6ff67':item.get('orgRank')==9?'#bcff67':'#9aff67'};"></div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <p style="margin-top: 60px;color: #b5b5b5;font-size: 16px">人人实验平台指数V_1.0</p>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
<script src="${rlab}/front/js/util/pagination.js"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>

<script src="${rlab}/front/assets/echarts/echarts.min.js" type="text/javascript" charset="utf-8"></script>
</html>


<script type="text/javascript">


    var dataChart = {
        week: {
            day: [],
            num: []
        },
        halfmoon: {
            day: [],
            num: []
        },
        month: {
            day: [],
            num: []
        },
    }
    var i = 0;
    <c:forEach items="${pv}" var="item">
        if (23 < i && i < 31) {
            dataChart.week.num.push(${item.pvCount});
            dataChart.week.day.push('${item.creatTimeStr}');
        }
        if (i < 31 && i > 15) {
            dataChart.halfmoon.num.push(${item.pvCount});
            dataChart.halfmoon.day.push('${item.creatTimeStr}');
        }
        if (i < 31) {
            dataChart.month.num.push(${item.pvCount});
            dataChart.month.day.push('${item.creatTimeStr}');
        }
        i++;
    </c:forEach>
    console.log(dataChart.week);
    console.log(dataChart.halfmoon);
    console.log(dataChart.month);

    var Chartweek = echarts.init(document.getElementById('Chartweek'));
    var Charthamoon = echarts.init(document.getElementById('Charthamoon'));
    var Chartmonth = echarts.init(document.getElementById('Chartmonth'));

    initChartweek();
    //    initCharthamoon();
    //    initChartmonth();

    function initChartweek() {
        Chartweek.setOption({
            color: ['#5bcdd1'],
            tooltip: {
                trigger: 'axis'
            },
            xAxis: {
                type: 'category',
                splitLine: {show: false},
                axisTick: {show: false},
                axisLabel: {interval: 0},
                axisLine: {lineStyle: {color: '#58c1ff'}},
                axisPointer: {lineStyle: {color: '#58c1ff', opacity: 0.5, width: 2}},
                boundaryGap: false,
                data: dataChart.week.day
            },
            yAxis: {
                type: 'value',
                axisLine: {show: false, lineStyle: {color: '#bcbcbc'}},
                axisTick: {show: false, inside: false},
                splitLine: {lineStyle: {color: '#e7e7e7'}},
                axisLabel: {inside: true, formatter: '{value}\n'}
            },
            grid: {
                top: 55,
                left: 32,
                right: 32,
            },
            series: [{
                name: '平台指数',
                symbol: 'circle',
                type: 'line',
                smooth: true,
                showAllSymbol: true,
                data: dataChart.week.num,
                itemStyle: {
                    normal: {
                        color: '#58c2ff',
                        lineStyle: {
                            color: '#58c2ff',
                            width: 3
                        }
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#c2e5f9'
                        }, {
                            offset: 1,
                            color: '#fff'
                        }])
                    }
                }
            }]
        });
    }

    function initCharthamoon() {
        Charthamoon.setOption({
            color: ['#5bcdd1'],
            tooltip: {
                trigger: 'axis'
            },
            xAxis: {
                type: 'category',
                splitLine: {show: false},
                axisTick: {show: false},
                axisLine: {lineStyle: {color: '#58c1ff'}},
                axisPointer: {lineStyle: {color: '#58c1ff', opacity: 0.5, width: 2}},
                boundaryGap: false,
                data: dataChart.halfmoon.day
            },
            yAxis: {
                type: 'value',
                axisLine: {show: false, lineStyle: {color: '#bcbcbc'}},
                axisTick: {show: false, inside: false},
                splitLine: {lineStyle: {color: '#e7e7e7'}},
                axisLabel: {inside: true, formatter: '{value}\n'}
            },
            grid: {
                top: 55,
                left: 32,
                right: 32,
            },
            series: [{
                name: '平台指数',
                symbol: 'circle',
                type: 'line',
                smooth: true,
                showAllSymbol: true,
                data: dataChart.halfmoon.num,
                itemStyle: {
                    normal: {
                        color: '#58c2ff',
                        lineStyle: {
                            color: '#58c2ff',
                            width: 3
                        }
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#c2e5f9'
                        }, {
                            offset: 1,
                            color: '#fff'
                        }])
                    }
                }
            }]
        });
    }

    function initChartmonth() {
        Chartmonth.setOption({
            color: ['#5bcdd1'],
            tooltip: {
                trigger: 'axis'
            },
            xAxis: {
                type: 'category',
                splitLine: {show: false},
                axisTick: {show: false},
                axisLine: {lineStyle: {color: '#58c1ff'}},
                axisPointer: {lineStyle: {color: '#58c1ff', opacity: 0.5, width: 2}},
                boundaryGap: false,
                data: dataChart.month.day
            },
            yAxis: {
                type: 'value',
                axisLine: {show: false, lineStyle: {color: '#bcbcbc'}},
                axisTick: {show: false, inside: false},
                splitLine: {lineStyle: {color: '#e7e7e7'}},
                axisLabel: {inside: true, formatter: '{value}\n'}
            },
            grid: {
                top: 55,
                left: 32,
                right: 32,
            },
            series: [{
                name: '平台指数',
                symbol: 'circle',
                type: 'line',
                smooth: true,
                showAllSymbol: true,
                data: dataChart.month.num,
                itemStyle: {
                    normal: {
                        color: '#58c2ff',
                        lineStyle: {
                            color: '#58c2ff',
                            width: 3
                        }
                    }
                },
                areaStyle: {
                    normal: {
                        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                            offset: 0,
                            color: '#c2e5f9'
                        }, {
                            offset: 1,
                            color: '#fff'
                        }])
                    }
                }
            }]
        });
    }

    $("#Charthamoon").hide();
    $("#Chartmonth").hide();


    $(".boxTab a").on("click", function () {
        $(".boxTab a").removeClass("selectA");
        $(this).attr("class", "selectA");
        if ($(this).data("chartDay") == "7") {
            $("#Chartweek").show();
            $("#Charthamoon").hide();
            $("#Chartmonth").hide();
            initChartweek();
        } else if ($(this).data("chartDay") == "15") {
            $("#Chartweek").hide();
            $("#Charthamoon").show();
            $("#Chartmonth").hide();
            initCharthamoon()
        } else {
            $("#Chartweek").hide();
            $("#Charthamoon").hide();
            $("#Chartmonth").show();
            initChartmonth();
        }
    })
    $("#rankList a").on("click", function () {
        $("#rankList a").removeClass("seleA");
        $(this).attr("class", "seleA");
        if ($(this).html() == '机构共享排行') {
            $(".orgTables").show();
            $(".tables").hide();
        } else {
            $(".orgTables").hide();
            $(".tables").show();
        }
    })
</script>
