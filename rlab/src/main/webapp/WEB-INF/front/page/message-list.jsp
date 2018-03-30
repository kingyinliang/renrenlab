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
    <meta name="Keywords" content="人人实验,仪器共享"/>
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


    <link rel="stylesheet" href="${rlab}/front/css/message.css">
    <style type="text/css">
        .listHead label{
            font-size: 19px;
            color: #999999;
            float: left;
        }
        .listHead p{
            float: left;
        }
        .listHead{
            line-height: 20px;
            font-size: 14px;
            letter-spacing: 1px;
            color: #999999;
            margin-bottom: 15px;
        }
        .listHead span{
            color: #588eff;
            margin:0 10px ;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="7"/>
    </jsp:include>
    <!--内容部分-->
    <div class="main">
        <div class="listHead clearfix">
            <label class="lab-search"></label>
            <p>
                <span>${tagName}</span>
                的相关文章
            </p>
        </div>
        <div class="rlab_leftmain">
            <div class="rlab_list">
                <ul>
                    <c:forEach items="${articles.list}" var="item">
                        <li class="clearfix">
                            <div class="rlab_list_img"><img src="${item.tInfoImage}" alt="" style="cursor: pointer" onclick="godetail(this)" data-tinfo-id="${item.tInfoId}"></div>
                            <div class="libox">
                                <h3 class="titles" style="cursor: pointer" onclick="godetail(this)" data-tinfo-id="${item.tInfoId}">${item.tInfoTitle}</h3>
                                <p class="txt">${item.tInfoSubTitle}</p>
                                <p class="titlab">
                                    <label class="lab-history"></label>
                                    <span>
                                        <c:choose>
                                            <c:when test="${item.hours >= 24 }">
                                                ${item.createTime.toLocalDate()}  ${item.createTime.toLocalTime().withNano(0)}
                                            </c:when>
                                            <c:when test="${info.hours == 0}">
                                                刚刚
                                            </c:when>
                                            <c:otherwise>
                                                ${item.hours}小时前
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <label class="lab-yanjing"></label><span style="margin-right: 68px">阅读(${item.tReadCount})</span>
                                    <span class="Tlabel"><c:forEach items="${item.tInfoTags}"
                                                                    var="tag">${tag} </c:forEach></span>
                                </p>
                            </div>
                        </li>
                    </c:forEach>


                </ul>
            </div>
            <%--START分页--%>
            <div class="paging" style="display: ${articles.total > 10? "block" : "none"}">
                <div id="page_container" class="page_list"></div>
            </div>
            <%--END分页--%>
        </div>
        <div class="rlab_rightmain">
            <div class="recommend">
                <p class="rightTit">热门推荐</p>
                <c:forEach items="${hots}" var="info">
                    <c:if test="${info.tInfoClassifyHot == 1}">
                        <p class="rightTxt clearfix">
                            <label class="lab-arrow-right"></label>
                            <a href="${rlab}/news/get_article_detail?id=${info.tInfoId}" target="_blank"
                               title="${info.tInfoTitle}">${fn:length(info.tInfoTitle) > 30 ? info.tInfoTitle.substring(0,30).concat("...") : info.tInfoTitle}</a>
                            <span>
                                <c:choose>
                                    <c:when test="${info.hours >= 24 }">
                                        ${info.createTime.toLocalDate()}  ${info.createTime.toLocalTime().withNano(0)}
                                    </c:when>
                                    <c:when test="${info.hours == 0}">
                                        刚刚
                                    </c:when>
                                    <c:otherwise>
                                        ${info.hours}小时前
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </p>
                    </c:if>
                </c:forEach>
            </div>
            <div class="messages">
                <p class="rightTit">人人实验</p>
                <c:forEach items="${hots}" var="info">
                    <c:if test="${info.tInfoClassifyHot == 2}">
                        <p class="rightTxt clearfix">
                            <label class="lab-arrow-right"></label>
                            <a href="${rlab}/news/get_article_detail?id=${info.tInfoId}" target="_blank"
                               title="${info.tInfoTitle}">${fn:length(info.tInfoTitle) > 30 ? info.tInfoTitle.substring(0,30).concat("...") : info.tInfoTitle}</a>
                            <span>
                                <c:choose>
                                    <c:when test="${info.hours >= 24 }">
                                        ${info.createTime.toLocalDate()}  ${info.createTime.toLocalTime().withNano(0)}
                                    </c:when>
                                    <c:when test="${info.hours == 0}">
                                        刚刚
                                    </c:when>
                                    <c:otherwise>
                                        ${info.hours}小时前
                                    </c:otherwise>
                                </c:choose>
                            </span>
                        </p>
                    </c:if>
                </c:forEach>
            </div>
            <div class="hotlabel">
                <p class="rightTit">热门标签</p>
                <div class="lableBox">
                    <c:forEach items="${tags}" var="info" varStatus="state">
                        <a style="color: ${state.index==0||state.index==4||state.index==8 ? '#ff9393':state.index==1||state.index==5||state.index==9?'#8895ff':state.index==2||state.index==6||state.index==10?'#ffc488':'#87ceff'}">${info.tTagName}</a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
<script src="${rlab}/front/js/util/pagination.js"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>

</html>


<script type="text/javascript">
    var PAGE_NO = '${articles.pageNum}',// 初始化当前页数
        INS_TOTAL = '${articles.total}' || 1,
        FROM_NO = (PAGE_NO - 1) * 10;

    // 初始化页面分页
    showPages(INS_TOTAL, FROM_NO, 10, function (from, max) {
            PAGE_NO = from / 10 + 1;
        window.location.href = "${rlab}/news/get_tag_articles_page?tagName=${tagName}&pageNo=" + PAGE_NO + "&pageSize=10"
        }, "page_container"
    )
    $(".lableBox a").on("click",function () {
        window.location.href = '${rlab}/news/get_tag_articles_page?tagName=' + $(this).html();
    })

    function godetail($this) {
        $this=$($this);
        window.open('${rlab}/news/get_article_detail?id=' + $this.data("tinfoId"));
    }
</script>
