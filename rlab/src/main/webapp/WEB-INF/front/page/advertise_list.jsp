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


    <link rel="stylesheet" href="${rlab}/front/css/message.css">
    <style type="text/css">

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
        <div class="rlab_leftmain">
            <div class="rlab_list">
                <%--招聘信息列表--%>
                <c:if test="${classify==1}">
                    <div class="box_tit clearfix">
                        <p class="bi">
                            <i></i>
                        </p>
                        <span>招聘信息</span>
                    </div>
                    <div class="recruitMessage rlab_listbox">
                        <c:forEach items="${recruitsList.list}" var="info">
                            <p class="box_tit_li clearfix"><a
                                    href="${rlab}/news/get_work_detail?classify=2&id=${info.recruitId}"
                                    target="_blank">${info.recruitTitle.length() > 50 ?info.recruitTitle.substring(0,50).concat("..."):info.recruitTitle}</a><span>${info.createTime.toLocalDate()} ${info.createTime.toLocalTime().withNano(0)}</span>
                            </p>
                        </c:forEach>
                    </div>
                </c:if>
                <%--简历推荐列表--%>
                <c:if test="${classify==2}">
                    <div class="recruitMessage rlab_listbox">
                        <div class="box_tit clearfix">
                            <p class="bi">
                                <i></i>
                            </p>
                            <span>简历推荐</span>
                        </div>
                        <c:forEach items="${resumeList.list}" var="info">
                            <p class="box_tit_li clearfix">${info.resumeTitle.length() > 50 ?info.resumeTitle.substring(0,50).concat("..."):info.resumeTitle}<span><a
                                    href="${rlab}/news/get_work_detail?classify=3&id=${info.resumeId}"
                                    style="color: #588eff" target="_blank">查看详情</a></span></p>
                        </c:forEach>
                    </div>
                </c:if>
                <%--职场快讯列表--%>
                <c:if test="${classify==3}">
                    <div class="recruitMessage rlab_listbox">
                        <div class="box_tit clearfix">
                            <p class="bi">
                                <i></i>
                            </p>
                            <span>职场资讯</span>
                        </div>
                        <c:forEach items="${careerList.list}" var="info">
                            <p class="box_tit_li clearfix"><a
                                    href="${rlab}/news/get_work_detail?classify=1&id=${info.careerId}"
                                    target="_blank">${info.careerTitle.length() > 50 ?info.careerTitle.substring(0,50).concat("..."):info.careerTitle}</a><span>${info.createTime.toLocalDate()} ${info.createTime.toLocalTime().withNano(0)}</span>
                            </p>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
            <%--START分页--%>
            <div class="paging" style="display: ${careerList.total > 10? "block" : resumeList.total > 10? "block":recruitsList.total > 10? "block" :"none"}">
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
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>



</html>


<script type="text/javascript">
    <c:if test="${classify==1}">
        var PAGE_NO = '${recruitsList.pageNum}'||1,// 初始化当前页数
            INS_TOTAL = '${recruitsList.total}';
    </c:if>
    <c:if test="${classify==2}">
    var PAGE_NO = '${resumeList.pageNum}'||1,// 初始化当前页数
        INS_TOTAL = '${resumeList.total}';
    </c:if><c:if test="${classify==3}">
    var PAGE_NO = '${careerList.pageNum}'||1,// 初始化当前页数
        INS_TOTAL = '${careerList.total}';
    </c:if>
        var FROM_NO = (PAGE_NO - 1) * 10;

    // 初始化页面分页
    showPages(INS_TOTAL, FROM_NO, 10, function (from, max) {
            PAGE_NO = from / 10 + 1;
        window.location.href = "${rlab}/news/get_works?classify=" + ${classify} +"&pageNo=" + PAGE_NO + "&pageSize=10";
        }, "page_container"
    )
    $(".lableBox a").on("click",function () {
        window.location.href = '${rlab}/news/get_tag_articles_page?tagName=' + $(this).html();
    })
</script>
