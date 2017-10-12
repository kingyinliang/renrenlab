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
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">
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
        .company_info_layer {
            width: auto !important;
        }

        #qrCode {
            width: 585px;
            height: 438px;
            background: white;
            margin: auto;
            text-align: center;
            border-radius: 4px;
            overflow: hidden;
        }

        #qrCode p {
            margin-top: 54px;
            line-height: 35px;
            font-size: 18px;
            color: #666666;
        }

        #qrCode img {
            margin-top: 53px;
            width: 143px;
            height: 143px;
        }

        #close {
            color: white;
            font-size: 16px;
            display: block;
            width: 260px;
            height: 38px;
            background: #508DF0;
            line-height: 38px;
            margin: auto;
            margin-top: 50px;
        }

        .shademain {
            max-width: 900px;
            padding: 20px;
        }

        /*.shademain{
            width: 900px;
            height: 500px;
            background: white;
            position: absolute;
            margin: auto;
            margin-left: -450px;
            margin-top: -153px;
            top: 50%;
            left: 50%;
            padding: 20px;
            border-radius: 5px;
            -webkit-box-shadow: 0 5px 15px rgba(0,0,0,.5);
            -moz-box-shadow: 0 5px 15px rgba(0,0,0,.5);
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
        }
        .shade{
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            z-index: 99;
            !*display: none;*!
        }*/
        .shadetit {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .shademain td {
            font-size: 12px;
            color: #999;
            margin: 0;
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
        }

        .shademain tr {
            border-top: 1px solid #ddd;
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
    <div class="scientificSearch">
        <div class="mainLeft">
            <c:if test="${interestWords!=null && fn:length(interestWords)>0}">
                <div id="Interest">
                    <div class="tit">
                        <p>您可能感兴趣的内容</p>
                    </div>
                    <div id="correlation">
                        <c:forEach items="${interestWords}" var="word" varStatus="st">
                            <%--<a onclick="toSearchFromSuper(${word })" href="JavaScript:location.href='${rlab}/front/instrument/search?pageNo=1&pageSize=10&keyword='+encodeURI('${word }');" target="_blank">${word }</a>--%>
                            <a onclick="toSearchFromSuper('${word.text }')"  href="javascript:void (0)">${word.text}</a>
                            <%-- <a href="${rlab}/front/instrument/search?pageNo=1&pageSize=10&keyword=${word}" target="_blank">${word }</a> --%>
                        </c:forEach>
                    </div>
                </div>
            </c:if>
            <c:if test="${relatedField!=null}">
                <div id="echarts">

                    <div class="tit">
                        <p>相关领域</p>
                    </div>
                    <div id="echartsView">

                    </div>
                </div>
            </c:if>
            <c:if test="${relatedNews!=null && fn:length(relatedNews)>0}">
                <div id="message">
                    <div class="tit">
                        <p>相关资讯</p>
                            <%--<a href="JavaScript:location.href='/front/kejso/moreRelatedInfo?pageNo=0&pageSize=10&query='+encodeURI('${keyword}');" target="_blank"><span class="lab-more"></span></a>--%>
                        <a onclick="toInformation()" href="javascript:void (0)"><span class="lab-more"></span></a>
                    </div>
                    <div id="correlationMessage">
                        <ul>
                            <c:forEach items="${relatedNews}" var="news" begin="0" end="1" varStatus="st">
                                <li style="overflow: hidden">
                                    <a href="${news.url }" class="messageTit" target="_blank">${news.title }</a>
                                    <p>${news.content }</p>
                                    <a href="${news.url }">${news.url }</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
        </div>
        <div class="mainRight">
            <c:if test="${relatedPaper!=null && fn:length(relatedPaper)>0}">
                <div id="thesis">
                    <div class="tit">
                        <p>相关论文</p>
                            <%--<a href="JavaScript:location.href='/front/kejso/morePaper?pageNo=0&pageSize=10&query='+encodeURI('${keyword}');" target="_blank"><span class="lab-more"></span></a>--%>
                            <%--<a href="${rlab}/front/kejso/morePaper?pageNo=0&pageSize=10&query=${keyword}" target="_blank"><span class="lab-more"></span></a>--%>
                        <a onclick="toThesis()" href="javascript:void (0)"><span class="lab-more"></span></a>
                    </div>
                    <div id="list">
                        <ul>
                            <c:forEach items="${relatedPaper}" var="paperlist" begin="0" end="1" varStatus="st">
                                <li>
                                    <a href="${paperlist.url }" class="messageTit"
                                       target="_blank">${paperlist.title}</a>
                                    <c:set var="keywords" value="${paperlist.brief }"/>
                                    <c:if test="${paperlist.brief !=null && paperlist.brief!=''}">
                                        <p class="thesisText" title="${paperlist.brief }"><c:out
                                                value="${paperlist.brief }"/></p>
                                    </c:if>
                                    <c:if test="${paperlist.authors!=null && fn:length(paperlist.authors)>0}">
                                        <p class="writer"><span><c:forEach items="${paperlist.authors}" var="author" >${author eq "null"?"不详":empty author ?"不详":author} </c:forEach></span> <span class="line">|</span> <span>${paperlist.year}</span> <span class="line">|</span> <span class="thOrg" title="${paperlist.journal}">${paperlist.journal}</span></p>
                                    </c:if>
                                    <c:if test="${paperlist.authors==null && fn:length(paperlist.authors)<=0}">
                                        <p class="writer"><span>不详</span> <span class="line">|</span>
                                            <span>${paperlist.year}</span> <span class="line">|</span> <span
                                                    class="thOrg"
                                                    title="${paperlist.journal}">${paperlist.journal}</span></p>
                                    </c:if>
                                    <a href="${paperlist.url}" style="word-wrap:break-word;"
                                       target="_blank">${paperlist.url}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
            <c:if test="${relatedProject!=null && fn:length(relatedProject)>0}">
                <div id="project">
                    <div class="tit">
                        <p>相关项目</p>
                        <a onclick="toProject()" href="javascript:void (0)"><span class="lab-more"></span></a>
                    </div>
                    <div class="list">
                        <ul>
                            <c:forEach items="${relatedProject}" var="prolist" begin="0" end="1" varStatus="st">
                                <li>
                                    <a class="projectTit" title="${prolist.title}" style="cursor: pointer" data-project-title="${prolist.title}" data-project-category="${prolist.category}" data-project-year="${prolist.year}"
                                       data-project-organization="${prolist.organization}"
                                       data-project-keywordsCn="${prolist.keywordsCn}" data-project-keywordsEn="${prolist.keywordsEn}" data-project-summaryCn="${prolist.intro}"  data-project-summaryEn="${prolist.summaryEn}"
                                       data-project-status="${prolist.status}"
                                       data-project-subject="${prolist.subject}" data-project-source="${prolist.source}" >
                                        <p>${prolist.title}</p></a>
                                    <div class="projectSort clearfix">
                                        <p class="sortP"><span class="sortTit">类别：</span><span
                                                class="sortName">${empty prolist.category ?"不详":prolist.category}</span>
                                        </p>
                                        <c:if test="${prolist.leader!=null && fn:length(prolist.leader)>0}">
                                            <p class="rightMark"><span class="mark"
                                                                       style="width:32px;">${prolist.year}</span> <span
                                                    style="float:right;margin: 0 6px;">|</span> <span class="mark"
                                                                                                      title="${prolist.leader}"><c:forEach
                                                    items="${prolist.leader}"
                                                    var="leader">${leader eq "null"?"不详":empty leader ?"不详":leader} </c:forEach></span></p>
                                        </c:if>
                                        <c:if test="${prolist.leader==null && fn:length(prolist.leader)<=0}">
                                            <p class="rightMark"><span class="mark"
                                                                       style="width:32px;">${prolist.year}</span> <span
                                                    style="float:right;margin: 0 6px;">|</span> <span class="mark"
                                                                                                      title="${prolist.leader}">不详</span>
                                            </p>
                                        </c:if>
                                    </div>
                                    <p class="projectMain">
                                            ${empty prolist.brief ?"":prolist.brief}
                                    </p>

                                    <c:if test="${prolist.organization!=null && fn:length(prolist.organization)>0}">
                                        <p style="line-height: 25px;">负责单位：<span style="color: #4E4E4E;"><c:forEach
                                                items="${prolist.organization}"
                                                var="org">${org eq "null"?"不详":org} </c:forEach></span></p>
                                    </c:if>
                                    <c:if test="${prolist.organization==null && fn:length(prolist.organization)<=0}">
                                        <p style="line-height: 25px;">负责单位：<span style="color: #4E4E4E;">不详</span></p>
                                    </c:if>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </c:if>
            <c:if test="${orgrank!=null && fn:length(orgrank)>0}">
                <div id="organization">
                    <div class="tit">
                        <p>相关机构</p>
                    </div>
                    <div id="orgList">
                        <div class="listLeft">
                            <ul>
                                <c:forEach items="${orgrank}" var="orglist" begin="0" end="4" varStatus="st">
                                    <li>
                                        <p><a href="${rlab}/front/org/${orglist.oid}"
                                              style="color: #5080df;font-size: 14px">${st.index +1}.${orglist.orgname }</a>
                                        </p>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="listRight">
                            <ul>
                                <c:forEach items="${orgrank}" var="orglist" begin="5" end="9" varStatus="st">
                                    <li>
                                        <p><a href="${rlab}/front/org/${orglist.oid}"
                                              style="color: #5080df;font-size: 14px">${st.index +1}.${orglist.orgname }</a>
                                        </p>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>

</div>

<script src="${rlab}/front/js/util/pagination.js"></script>
<script src="${rlab}/front/js/common/main.js?v_=20170608"></script>

<script src="${rlab}/front/assets/echarts/echarts-plain.js" type="text/javascript" charset="utf-8"></script>
<%-- <script src="${rlab}/front/js/view/echarts_database.js" type="text/javascript" charset="utf-8"></script> --%>

<script>

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }

    function toGoodsDetail() {

    }

    //$("#serach").val('<c:out value="${keyword}" escapeXml="true"/>');
    function eConsole(param) {
        if (typeof param.seriesIndex == 'undefined') {
            return;
        }


        if (param.type == 'click') {
            toSearchFromSuper(param.name);
        }
    }


    var myChart = echarts.init(document.getElementById('echartsView'));
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

    $(".projectTit").on("click", function () {
        var $this = $(this);
        var data = $this.data();
        var tr1,tr2,tr3,tr4,tr5,tr6,tr7,tr8;
        if(!$this.data("projectCategory")){
            tr1='none';
        }else {
            tr1='';
        }

        if(!$this.data("projectYear")){
            tr2='none';
        }else {
            tr2='';
        }

        if(!$this.data("projectOrganization")){
            tr3='none';
        }else {
            tr3='';
        }

        if(!$this.data("projectKeywordscn")){
            tr4='none';
        }else {
            tr4='';
        }

        if(!$this.data("projectKeywordsen")){
            tr5='none';
        }else {
            tr5='';
        }

        if(!$this.data("projectSummarycn")){
            tr6='none';
        }else {
            tr6='';
        }

        if(!$this.data("projectSubject")){
            tr7='none';
        }else {
            tr7='';
        }
        if(!$this.data("projectSource")){
            tr8='none';
        }else {
            tr8='';
        }
        var html =
            '<div class="shademain">\
                <p class="shadetit">'+$this.data("projectTitle")+'</p>\
                <table class="layui-table">\
                    <colgroup>\
                        <col width="80px">\
                        <col>\
                    </colgroup>\
                    <tbody>\
                        <tr style="display: '+tr1+'">\
                            <td style="width: 80px">类别</td>\
                            <td>'+$this.data("projectCategory")+'</td>\
                        </tr>\
                        <tr style="display: '+tr2+'">\
                            <td>年份</td>\
                            <td>'+$this.data("projectYear")+'</td>\
                        </tr>\
                        <tr style="display: '+tr3+'">\
                            <td>负责单位</td>\
                            <td>'+$this.data("projectOrganization")+'</td>\
                        </tr>\
                        <tr style="display: '+tr4+'">\
                            <td>关 键 字</td>\
                            <td>'+$this.data("projectKeywordscn")+'</td>\
                        </tr>\
                        <tr style="display: '+tr5+'">\
                            <td>英文关键字</td>\
                            <td>'+$this.data("projectKeywordsen")+'</td>\
                        </tr>\
                        <tr style="display: '+tr6+'">\
                            <td>摘  要</td>\
                            <td>'+$this.data("projectSummarycn")+'</td>\
                        </tr>\
                        <tr style="display: '+tr7+'">\
                            <td>课  题</td>\
                            <td>'+$this.data("projectSubject")+'</td>\
                        </tr>\
                        <tr style="display: '+tr8+'">\
                            <td>来  源</td>\
                            <td>'+$this.data("projectSource")+'</td>\
                        </tr>\
                    </tbody>\
                </table>\
            </div>';

        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        $("#close").off("click").on("click", function () {
            layer.close(layer_info);
        })

    })

    // 跳转到相关项目
    function toProject() {

        var keyword = encodeURI($("#serach").val());
        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/</g, "%3c");
        keyword = keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/superSearch/morePro?pageNo=0&pageSize=10&query=' + keyword;
        window.open(URL);

    }

    // 跳转到论文页面
    function toThesis() {

        var keyword = encodeURI($("#serach").val());

        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/</g, "%3c");
        keyword = keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/superSearch/morePaper?pageNo=0&pageSize=10&query=' + keyword;
        window.open(URL);

    }

    function toInformation() {
        var keyword = encodeURI($("#serach").val());

        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/</g, "%3c");
        keyword = keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/superSearch/moreRelatedInfo?pageNo=0&pageSize=10&query=' + keyword;

        window.open(URL);

    }


    function toSearchFromSuper(keywords) {

        var URL = BASE_URL + "/front/instrument/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";

        var address = getCurremtAdress();

        if (address !== -1) {
            if (address === "北京") {
                CUR_PROVINCE = "北京市";
            } else if (address === "上海") {
                CUR_PROVINCE = "上海";
            } else if (address === "重庆") {
                CUR_PROVINCE = "重庆";
            } else if (address === "天津") {
                CUR_PROVINCE = "天津";
            } else {
                if (address !== "全国") {
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
<script src="${rlab}/front/js/view/goods_list.js?v_=20170622"></script>

</body>
</html>
