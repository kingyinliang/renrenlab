<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <!--bootstrapValidator-->
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170608">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170608">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/scientific_search.css?v_=20170608"/>

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
        #pages a{cursor: pointer;}
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>
    <!--内容部分-->
    <div class="scientificSearch" style="height: ;">
        <div id="thesis" style="margin-bottom: 25px;padding-bottom: 20px;">
            <div class="tit">
                <p>相关论文</p>
            </div>
            <div id="list">
                <ul>
                    <c:forEach items="${relatedPaper}" var="paperlist" begin="0" end="9"  varStatus="st">
                        <li>
                            <a href="${paperlist.url}" class="messageTit">${paperlist.title }</a>
                            <c:if test="${paperlist.brief !=null && paperlist.brief!=''}">
                                <p class="thesisText" title="${paperlist.brief }">${paperlist.brief  }</p>
                            </c:if>
                            <c:if test="${paperlist.authors!=null && fn:length(paperlist.authors)>0}">
                                <p class="writer"><c:forEach items="${paperlist.authors}" var="author" >${author eq "null"?"不详":author} </c:forEach>| ${paperlist.year} | ${paperlist.journal }</p>
                            </c:if>
                            <c:if test="${paperlist.authors==null && fn:length(paperlist.authors)<=0}">
                                <p class="writer">不详 | ${paperlist.year} | ${paperlist.journal }</p>
                            </c:if>
                            <a href="${paperlist.url}">${paperlist.url }</a>
                        </li>
                    </c:forEach>
                    <!-- <li>
                        <a href="" class="messageTit">质谱仪名称变拉其他部时纵向下其他</a>
                        <p title="模块名称变更：“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。">其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。</p>
                        <p class="writer"><span>海光凡</span> | <span>2009</span> | <span>新科技报</span></p>
                        <a href="http://www.renrenlab.com/pages/home.html">http://www.renrenlab.com/pages/home.html</a>
                    </li>
                    <li>
                        <a href="" class="messageTit">质谱仪名称变拉其他部时纵向下其他</a>
                        <p title="模块名称变更：“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。">模块名称变更：纵向下拉，其他模块下移。领收回名称变更部时，纵向下拉，其他模块下移</p>
                        <p class="writer">海光凡 | 2009 | 新科技报</p>
                        <a href="http://www.renrenlab.com/pages/home.html">http://www.renrenlab.com/pages/home.html</a>
                    </li>
                    <li>
                        <a href="" class="messageTit">质谱仪名称变拉其他部时纵向下其他</a>
                        <p title="模块名称变更：“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。">其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。其他模块下移。起】收回名称变更部时，纵向下拉，其他模块下移。</p>
                        <p class="writer"><span>海光凡</span> | <span>2009</span> | <span>新科技报</span></p>
                        <a href="http://www.renrenlab.com/pages/home.html">http://www.renrenlab.com/pages/home.html</a>
                    </li>
                    <li class="last">
                        <a href="" class="messageTit">质谱仪名称变拉其他部时纵向下其他</a>
                        <p title="模块名称变更：“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。“您可能对这些领域感兴趣”，【收起】收回名称变更部时，纵向下拉，其他模块下移。">模块名称变更：纵向下拉，其他模块下移。领收回名称变更部时，纵向下拉，其他模块下移</p>
                        <p class="writer">海光凡 | 2009 | 新科技报</p>
                        <a href="http://www.renrenlab.com/pages/home.html">http://www.renrenlab.com/pages/home.html</a>
                    </li> -->
                </ul>
                <div id="pages" style="text-align: center;overflow: hidden;">
                    <c:if test="${relatedPaper!=null && fn:length(relatedPaper)>9}">
                        <a id="next" href="JavaScript:location.href='${rlab}/front/superSearch/morePaper?pageNo=${pageNo +1}&pageSize=10&query='+encodeURI('${keyword}');">下一页</a>
                    </c:if>
                    <c:if test="${pageNo != 0}">
                        <a id="top" href="JavaScript:location.href='${rlab}/front/superSearch/morePaper?pageNo=${pageNo -1}&pageSize=10&query='+encodeURI('${keyword}');">上一页</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>


    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>

</div>
<script src="${rlab}/front/js/common/main.js"></script>
<script src="${rlab}/front/js/util/pagination.js"></script>
<script>

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }
    /* $("#serach").val('<c:out value="${keyword}" escapeXml="true"/>'); */
    function toGoodsDetail(){

    }
</script>
<script src="${rlab}/front/js/view/goods_list.js?v_=20170608"></script>
</body>
</html>
