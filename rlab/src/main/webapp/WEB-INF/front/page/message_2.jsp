<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>

    <%@ include file="../../config/taglibs.jsp" %>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css?v_=20170905">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170905">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/scientific_search.css?v_=20170905"/>

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
    <div class="scientificSearch" >
        <div id="message" >
            <div class="tit">
                <p>相关资讯</p>
            </div>
            <div id="correlationMessage">
                <ul>
                    <c:forEach items="${relatedNews}" var="relatedInfo" begin="0" end="9"  varStatus="st">
                        <li>
                            <a href="${relatedInfo.url }" class="messageTit">${relatedInfo.title }</a>
                            <p>${relatedInfo.content }</p>
                            <a href="${relatedInfo.url }">${relatedInfo.url }</a>
                        </li>
                    </c:forEach>
                </ul>
                <div id="pages" style="text-align: center;overflow: hidden;">
                    <c:if test="${relatedNews!=null && fn:length(relatedNews)>9}">
                        <a id="next" href="JavaScript:location.href='${rlab}/front/superSearch/moreRelatedInfo?flag=${flag}&pageNo=${pageNo +1}&pageSize=10&query='+encodeURI('${keyword}');">下一页</a>
                    </c:if>
                    <c:if test="${pageNo != 0}">
                        <a id="top" href="JavaScript:location.href='${rlab}/front/superSearch/moreRelatedInfo?flag=${flag}&pageNo=${pageNo -1}&pageSize=10&query='+encodeURI('${keyword}');">上一页</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>


    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>

</div>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script src="${rlab}/front/js/util/pagination.js?v_=20170905"></script>
<script>
    $(".searchTab a").each(function () {
        $(this).attr("class","");
        if ( $(this).data("searchType")==(${flag}+1)) {
            $(this).attr("class","pitchTab");
            SERCH_TYPE=$(this).data("searchType")-0;
        }
    })
    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }
    //$("#serach").val('<c:out value="${keyword}" escapeXml="true"/>');

    function toGoodsDetail(){

    }
</script>
<script src="${rlab}/front/js/view/goods_list.js?v_=20170905"></script>
</body>
</html>
