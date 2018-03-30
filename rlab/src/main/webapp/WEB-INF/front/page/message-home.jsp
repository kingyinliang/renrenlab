<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科研领域最新资讯-科技头条-人人实验</title>
    <meta name="Keywords" content="人人实验,仪器共享,科技头条,科研前沿,政策速报,行业动态,最新活动,职来职往"/>
    <meta name="Description" content="科学研究领域最及时，最全面的资讯内容。涵盖相关政策法规，最新行业动态，世界范围内的前瞻研究成果，科技科研圈领域的最新会议、培训、活动等。为广大科研工作者或科技爱好者提供一手资讯，一站式内容聚合平台"/>
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
        .rlab_banner img{
            width: 100%;
            height: 100%;
            display: block;
        }
        .slides li{
            height: 100%;
        }
        .slides{
            height: 100%;
        }
        .pagination{
            left: 92%!important;
            bottom: 7px!important;
        }
        .pagination li {
            background-color: #ddd;
        }

        .pagination li.active {
            background-color: #000;
        }
        .active li{
            border-radius: 50%!important;
        }
        .pagination li.active{
            background: white;
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
        <div class="rlab_leftmain">
            <div class="rlab_banner" id="slider">
                <%--<ul class="slides">--%>
                    <%--<li><img src="${rlab}/front/imgs/2.4/banner1.png" alt=""></li>--%>
                    <%--<li onclick="gonzhilaizhiwang()"><img src="${rlab}/front/imgs/2.4/banner2.png" alt=""></li>--%>
                    <%--<li onclick="gonotice()"><img src="${rlab}/front/imgs/2.4/banner3.png" alt=""></li>--%>
                <%--</ul>--%>
                <%--<ul class="pagination">--%>
                    <%--<li class="active"></li>--%>
                    <%--<li></li>--%>
                    <%--<li></li>--%>
                <%--</ul>--%>
                <ul class="slides">
                    <c:forEach items="${banners}" var="item">
                        <li><a href="${item.bLinkType==0?'javascript:void(0);':item.bLink}"><img src="${item.bPic}" alt=""></a></li>
                    </c:forEach>
                </ul>
                <ul class="pagination">
                    <c:forEach items="${banners}" var="item" varStatus="in">
                        <li class="${in.index==0?'active':''}"></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="rlab_tab">
                <a class="${classifyName==null||classifyName==''?'seleA':''}"
                   href="${rlab}/news/get_articles_page?classifyName=&pageNo=1&pageSize=10">最新文章</a>
                <a class="${classifyName=='政策速报'?'seleA':''}"
                   href="${rlab}/news/get_articles_page?classifyName=政策速报&pageNo=1&pageSize=10">政策速报</a>
                <a class="${classifyName=='行业动态'?'seleA':''}"
                   href="${rlab}/news/get_articles_page?classifyName=行业动态&pageNo=1&pageSize=10">行业动态</a>
                <a class="${classifyName=='最新活动'?'seleA':''}"
                   href="${rlab}/news/get_articles_page?classifyName=最新活动&pageNo=1&pageSize=10">最新活动</a>
                <a class="${classifyName=='职来职往'?'seleA':''}"
                   href="${rlab}/news/get_articles_page?classifyName=职来职往&pageNo=1&pageSize=10">职来职往</a>
            </div>
            <div class="rlab_list">
                <%--职来职往--%>
                <c:if test="${classifyName=='职来职往'}">
                    <div class="recruitMessage rlab_listbox">
                        <div class="box_tit clearfix">
                            <p class="bi">
                                <i></i>
                            </p>
                            <span>招聘信息</span>
                            <a href="${rlab}/news/get_works?classify=1">更多 <i class="lab-youjian_1"></i></a>
                        </div>
                        <c:forEach items="${recruitList}" var="info">
                            <p class="box_tit_li clearfix"><a
                                    href="${rlab}/news/get_work_detail?classify=2&id=${info.recruitId}"
                                    target="_blank">${info.recruitTitle.length() > 50 ?info.recruitTitle.substring(0,50).concat("..."):info.recruitTitle}</a><span>${info.createTime.toLocalDate()} ${item.createTime.toLocalTime().withNano(0)}</span>
                            </p>
                        </c:forEach>
                    </div>


                    <div class="recruitMessage rlab_listbox">
                        <div class="box_tit clearfix">
                            <p class="bi">
                                <i></i>
                            </p>
                            <span>简历推荐</span>
                            <a href="${rlab}/news/get_works?classify=2">更多 <i class="lab-youjian_1"></i></a>
                        </div>
                        <c:forEach items="${resumeListe}" var="info">
                            <p class="box_tit_li clearfix">${info.resumeTitle.length() > 50 ?info.resumeTitle.substring(0,50).concat("..."):info.resumeTitle}<span><a
                                    href="${rlab}/news/get_work_detail?classify=3&id=${info.resumeId}" target="_blank"
                                    style="color: #588eff">查看详情</a></span></p>
                        </c:forEach>
                    </div>

                    <div style="position: relative">
                        <div class="ad clearfix">
                            <span>邀您发布信息</span>
                            <p>
                                招聘岗位信息发布以及自荐简历请邮箱至zhaopin@renrenlab.com:<br>
                                邮件主题“招聘信息发布+公司名称”或“个人简历+姓名+期望工作”
                            </p>
                        </div>
                        <div class="adbg"></div>
                    </div>

                    <div class="recruitMessage rlab_listbox">
                        <div class="box_tit clearfix">
                            <p class="bi">
                                <i></i>
                            </p>
                            <span>职场资讯</span>
                            <a href="${rlab}/news/get_works?classify=3">更多 <i class="lab-youjian_1"></i></a>
                        </div>
                        <c:forEach items="${careerList}" var="info">
                            <p class="box_tit_li clearfix"><a
                                    href="${rlab}/news/get_work_detail?classify=1&id=${info.careerId}"
                                    target="_blank">${info.careerTitle.length() > 50 ?info.careerTitle.substring(0,50).concat("..."):info.careerTitle}</a><span>${info.createTime.toLocalDate()} ${item.createTime.toLocalTime().withNano(0)}</span>
                            </p>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${classifyName!='职来职往'}">
                    <ul>
                        <c:if test="${classifyName=='最新活动'}">
                            <a href="${rlab}/page/activity?source=0">
                                <li class="clearfix">
                                    <div class="rlab_list_img"><img src="${rlab}/front/imgs/3.0/cxq1.png" alt="" style="cursor: pointer"></div>
                                    <div class="libox">
                                        <h3 class="titles" style="cursor: pointer">人人创新券</h3>
                                        <p class="txt">共享科技资源，服务创新创业</p>
                                        <p class="titlab">
                                            <span style="color: #00CC33">进行中</span>
                                            <label class="lab-history"></label><span>2017.07.01-2017.12.31</span>
                                            <label class="lab-yanjing"></label><span style="margin-right: 68px">阅读(112212)</span>
                                        </p>
                                    </div>
                                </li>
                            </a>
                            <a href="${rlab}/page/sdkjcxj">
                                <li class="clearfix">
                                    <div class="rlab_list_img"><img src="${rlab}/front/imgs/3.0/cxq2.png" alt="" style="cursor: pointer" ></div>
                                    <div class="libox">
                                        <h3 class="titles" style="cursor: pointer" >首都科技创新券</h3>
                                        <p class="txt">创新创业 政府助力 创业互帮 合作共赢</p>
                                        <p class="titlab">
                                            <span style="color: #00CC33">进行中</span>
                                            <label class="lab-history"></label><span>2017.07.01-2017.12.31</span>
                                            <label class="lab-yanjing"></label><span style="margin-right: 68px">阅读(112212)</span>
                                        </p>
                                    </div>
                                </li>
                            </a>
                            <a href="${rlab}/page/hdxtcxj">
                                <li class="clearfix">
                                    <div class="rlab_list_img"><img src="${rlab}/front/imgs/3.0/cxq3.png" alt="" style="cursor: pointer"></div>
                                    <div class="libox">
                                        <h3 class="titles" style="cursor: pointer">海淀协同创新券</h3>
                                        <p class="txt">降低企业投入成本  激发创新创业活力</p>
                                        <p class="titlab">
                                            <span style="color: #00CC33">进行中</span>
                                            <label class="lab-history"></label><span>2017.07.01-2017.12.31</span>
                                            <label class="lab-yanjing"></label><span style="margin-right: 68px">阅读(112212)</span>
                                        </p>
                                    </div>
                                </li>
                            </a>
                        </c:if>
                        <c:forEach items="${articles.list}" var="info">
                            <li class="clearfix">
                                <div class="rlab_list_img"><img src="${info.tInfoImage}" alt="" style="cursor: pointer"  onclick="godetail(this)" data-tinfo-id="${info.tInfoId}"></div>
                                <div class="libox">
                                    <h3 class="titles" style="cursor: pointer"  onclick="godetail(this)" data-tinfo-id="${info.tInfoId}">${info.tInfoTitle}</h3>
                                    <p class="txt">${info.tInfoSubTitle}</p>
                                    <p class="titlab">
                                        <label class="lab-history"></label><span>

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
                                        <label class="lab-yanjing"></label><span
                                            style="margin-right: 68px">阅读(${info.tReadCount})</span>
                                        <span class="Tlabel"><c:forEach items="${info.tInfoTags}"
                                                                        var="tag">${tag} </c:forEach></span>
                                    </p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
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
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script src="${rlab}/front/js/common/easySlider.js?v_=new20171218"></script>

</html>


<script type="text/javascript">
    var classifyName = '${classifyName}',
        PAGE_NO = '${articles.pageNum}' || 1,// 初始化当前页数
        INS_TOTAL = '${articles.total}',
        FROM_NO = (PAGE_NO - 1) * 10;

    $(function() {
        $("#slider").easySlider( {
            slidePause:5000,
            slideSpeed: 800,
            autoSlide: true,
            paginationSpacing: "15px",
            paginationDiameter: "5px",
            paginationPositionFromBottom: "0px",
            slidesClass: ".slides",
            controlsClass: ".controls",
            paginationClass: ".pagination"
        });
    });

    // 初始化页面分页
    showPages(INS_TOTAL, FROM_NO, 10, function (from, max) {
            PAGE_NO = from / 10 + 1;
        window.location.href = "${rlab}/news/get_articles_page?classifyName=" + classifyName + "&pageNo=" + PAGE_NO + "&pageSize=10"
        }, "page_container"
    )
    $(".lableBox a").on("click",function () {
        window.location.href = '${rlab}/news/get_tag_articles_page?tagName=' + $(this).html();
    })
    function godetail($this) {
        $this=$($this);
        window.open('${rlab}/news/get_article_detail?id=' + $this.data("tinfoId"));
    }
    function gonotice() {
        window.open('${rlab}/page/activity/notice');
    }
    function gonzhilaizhiwang() {
        window.location.href = '${rlab}/news/get_articles_page?classifyName=职来职往&pageNo=1&pageSize=10';
    }
</script>
