<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>

    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>

    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css">

    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <%--<script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>--%>
    <script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
    <style type="text/css">
        /*头部样式在base.css*/

        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            width: 100%;
            height: 100%;
            background: #f5f6fa;
        }

        a {
            text-decoration: none !important;
        }

        a:hover {
            text-decoration: none !important;
        }

        a:link {
            text-decoration: none !important;
        }

        .closes {
            float: right;
            width: 0.5rem;
            font-size: 0.5rem;
            line-height: 1rem;
            color: #4E4E4E;
        }

        #echart {
            width: 100%;
            height: 10rem;
            font-size: 0.2rem;
        }

        #footer {
            text-align: center;
            line-height: 1rem;
            background: #F5F6FA;
            padding-top: 0.89rem;
        }

        #footer p {
            margin: 0;
            font-size: 0.267rem;
            color: #b5b5b5;
        }

        #footer img {
            width: 2.13rem;
            height: 0.56rem;
        }

        #footer p img {
            width: 2.6rem;
            height: 2.6rem;
            margin-bottom: 0.5rem;
        }

        /*super_search主页面*/
        .sp_main {
        }

        .sp_ctnt {
            padding: 0 0.32rem;
        }

        /*tip提示栏*/
        .sp_ctnt > .tip {
            font-size: 0.32rem;
            color: #4083ef;
            line-height: 0.8rem;
            -webkit-border-radius: 0.1rem;
            -moz-border-radius: 0.1rem;
            border-radius: 0.1rem;
            text-align: center;
            margin-top: 0.16rem;
        }

        [data-dpr="1"] .sp_ctnt > .tip {
            border: 1px solid #4083ef;
        }

        [data-dpr="2"] .sp_ctnt > .tip {
            border: 2px solid #4083ef;
        }

        [data-dpr="3"] .sp_ctnt > .tip {
            border: 2px solid #4083ef;
        }

        .sp_ctnt > .tip p {
            position: relative;
            margin-right: 0.20rem;
        }

        .sp_ctnt > .tip a {
            display: inline-block;
            line-height: 0.8rem;
            position: absolute;
            right: -0.1rem;
            top: 0;
        }

        .sp_ctnt > .tip span {
            color: #4083ef;
            font-size: 0.54rem;
            vertical-align: middle;
        }

        /*感兴趣的内容*/
        .funny {
        }

        .funny > h3 {
            margin-top: 0.16rem;
            line-height: 1rem;
            height: 1rem;
            color: #4e4e4e;
            font-size: 0.32rem;
        }

        .funny > div.fn_list {
            overflow: hidden;
        }

        .funny > div.fn_list span {
            display: block;
            float: left;
            padding: 0 0.36rem;
            background-color: #fff;
            -webkit-border-radius: 0.13rem;
            -moz-border-radius: 0.13rem;
            border-radius: 0.13rem;
            height: 0.74rem;
            line-height: 0.74rem;
            margin-right: 0.20rem;
            margin-bottom: 0.20rem;
            font-size: 0.32rem;
        }

        /*相关资讯*/
        .related {
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            background-color: #fff;
            padding: 0.5rem 0 0.2rem 0;
            margin-top: 0.2rem;
        }

        .related .item > p {
            font-size: 0.34rem;
            line-height: 0.38rem;
            height: 0.36rem;
            padding-left: 0.26rem;
        }

        .related .item > p s {
            display: block;
            float: left;
            width: 0.053rem;
            height: 0.36rem;
            background-color: #4083ef;
        }

        .related p span {
            padding-left: 0.13rem;
        }

        .related ul.section {
            padding: 0 0.46rem 0 0.30rem;
        }

        .related ul.section > li {
            border-bottom: 1px solid #f0f0f0;
            padding: 0.46rem 0;
            line-height: 0.48rem;
            font-size: 0.34rem;
            color: #4b4b4b;
        }

        .related ul.section > li.last_section {
            border-bottom: 0 none;
        }

        .related ul.section > li a {
            color: #4083ef;
            line-height: 0.52rem;
        }

        .related ul.section > li p {
            overflow: hidden;
        }

    </style>
</head>
<body>
<div id="main" class="sp_main">

    <%--START 头部公用部分引入--%>
    <%@ include file="../template/header_one.jsp" %>
    <%--END 头部公用部分引入--%>

    <div class="sp_ctnt">
        <%--tip提示部分开始--%>
        <div id="tip" class="tip">
            <p>电脑访问人人实验网站www.renrenlab.com查看更多信息
                <a href="javascript:void(0);" onclick="closeTip()">
                    <span class="lab-close-1"></span>
                </a>
            </p>
        </div>
        <%--tip提示部分结束--%>

        <%--感兴趣的内容开始--%>
        <div class="funny">
            <h3>可能感兴趣的内容</h3>
            <div class="fn_list">
                <c:forEach items="${interestWords}" var="word" varStatus="st">
                    <span onclick="toSearch(this)" >${word.text}</span>
                </c:forEach>
                <%--<span>碳水化合物</span>--%>
            </div>
        </div>
        <%--感兴趣的内容结束--%>

        <%--相关资讯开始--%>
        <c:if test="${relatedNews != null && relatedNews.size() > 0}">
            <div class="related">
                <div class="item">
                    <p><span><s></s>相关资讯</span></p>
                    <ul class="section">
                        <c:forEach items="${relatedNews}" var="news" begin="0" end="1" varStatus="st">
                            <li>
                                <a href="${news.url}" class="messageTit">${news.title}</a>
                                <p>${news.content}</p>
                                <a href="${news.url}" style="word-wrap:break-word;">${news.url}</a>
                            </li>
                        </c:forEach>

                            <%--<li class="last_section">--%>
                            <%--<a href="#" class="messageTit" target="_blank">蓝色标题2</a>--%>
                            <%--<p>洞明皆学问，人情练达即文章。”意思不难懂，说的是：把世间的事弄懂了处处都有学问，把人情世故摸透了处处都是文章。这当然有老于世故的滑头主义应世哲学的意思。</p>--%>
                            <%--<a href="#">http://www.renrenlab.com</a>--%>
                            <%--</li>--%>

                            <%--<c:forEach items="${relatedNews}" var="news" begin="0" end="1" varStatus="st">--%>
                            <%--<li>--%>
                            <%--<a href="${news.url }" class="messageTit" target="_blank">${news.title }</a>--%>
                            <%--<p>${news.content}</p>--%>
                            <%--<a href="${news.url }">${news.url }</a>--%>
                            <%--</li>--%>
                            <%--</c:forEach>--%>
                    </ul>
                </div>

            </div>
        </c:if>
        <%--相关资讯结束--%>

        <%--相关领域部分开始   --%>
        <div id="echart">

        </div>
        <%--相关领域部分结束--%>

        <%--<div id="footer">--%>
        <%--<img src="${rlab}/mobile/imgs/home_logo.png"/>--%>
        <%--<p>关注“人人实验”服务号，体验VIP专业定制服务</p>--%>
        <%--<p><img src="${rlab}/mobile/imgs/two.jpg"></p>--%>
        <%--</div>--%>
    </div>

</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>

</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script src="${rlab}/front/assets/echarts/echarts-plain.js" type="text/javascript" charset="utf-8"></script>
<script>
    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }


    setCallbackUrl();// 设置登录时回跳路径

    function closeTip() {
        $("#tip").hide();
    }
    function eConsole(param) {
        if (typeof param.seriesIndex == 'undefined') {
            return;
        }
        if (param.type == 'click') {
            toSearch(null, param.name);
        }
    }

    var myChart = echarts.init(document.getElementById('echart'));
    myChart.on("click", eConsole);

    var option = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} : {b}'
        },
        series: [{
            type: 'force',
            name: "领域关系",
            lineStyle: {
                normal: {
                    opacity: 0.9,
                    width: 1,
                    curveness: 0,
                    color: '#000',
                    type: 'dotted'
                }
            },
            categories: [{
                name: '中心词',
                itemStyle: {
                    normal: {
                        color: '#009800'
                    }
                }
            }, {
                name: '相关领域',
                itemStyle: {
                    normal: {
                        color: '#4592FF'
                    }
                }
            }, {
                name: '相关领域',
                itemStyle: {
                    normal: {
                        color: '#4592FF'
                    }
                }
            },
                {
                    name: '相关领域',
                    itemStyle: {
                        normal: {
                            color: '#4592FF'
                        }
                    }
                }, {
                    name: '相关领域',
                    itemStyle: {
                        normal: {
                            color: '#4592FF'
                        }
                    }
                }, {
                    name: '相关领域',
                    itemStyle: {
                        normal: {
                            color: '#4592FF'
                        }
                    }
                }],
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        textStyle: {
                            color: '#FFFFFF'
                        }
                    },
                    nodeStyle: {
                        brushType: 'both',
                        strokeColor: 'rgba(255,255,255,0.4)',
                        lineWidth: 0
                    }, linkStyle: {
                        type: 'curve'
                    }
                },
                emphasis: {
                    label: {
                        show: false
                        // textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
                    },
                    nodeStyle: {
                        r: 50
                    },
                    linkStyle: {
                        color: '#000',
                    }
                }
            },
            minRadius: 25,
            maxRadius: 30,
            density: 0.05,
            attractiveness: 0.9,
            nodes: [<c:forEach items="${relatedField.nodes}" var="nodes" varStatus="st">
                {"category": "${nodes.category}", "name": "${nodes.name}", "value": ${nodes.value}},
                </c:forEach>

            ],
            links: [<c:forEach items="${relatedField.links}" var="links" varStatus="st">
                {"source": ${links.source}, "target": ${links.target}, "weight": ${links.weight}},
                </c:forEach>

            ],

        }]
    };

    myChart.setOption(option);

    $(".closes").on("click", function () {
        $(".echartsHead").hide(500)
    })


</script>
</html>