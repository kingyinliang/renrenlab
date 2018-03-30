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
        .detail {
            background-color: #ffffff;
            border-radius: 5px;
            padding: 25px 27px;
            margin-bottom: 20px;
        }

        .detail h3 {
            font-size: 20px;
            color: #424242;
            margin-bottom: 15px;
        }

        .detailTxt {
            font-size: 14px;
            color: #404040;
            line-height: 13px;
        }

        .detailTxt img {
            width: 100%;
        }

        .interest {
            font-size: 14px;
            color: #b5b5b5;
            margin: 20px 0;
        }
        .detailTxt img{
            width: 100%;
        }
        .detailTxt p{
            line-height: 24px;
            font-size: 14px;
        }
        .ad_main{
            line-height: 24px;
        }
        .ad_main p{
            float: left;
            line-height: 24px;
            font-size: 11px;
            color: #333333;
            width: 578px;
        }
        .ad_main_p div{
            float: left;
            font-size: 11px;
            color:#7d7d7d ;
            width: 75px;
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
            <div class="detail clearfix">
                <c:if test="${classify==2}">
                    <h3>${recruitInfo.recruitTitle}</h3>
                    <div class="clearfix">
                        <p class="titlab" style="float: left">
                            <label class="lab-history"></label>
                            <span>
                             <c:choose>
                                 <c:when test="${recruitInfo.hours >= 24 }">
                                     ${recruitInfo.createTime.toLocalDate()}  ${recruitInfo.createTime.toLocalTime().withNano(0)}
                                 </c:when>
                                 <c:otherwise>
                                     ${recruitInfo.hours}小时前
                                 </c:otherwise>
                             </c:choose>
                            </span>
                            <span class="Tlabel">分享</span>
                        </p>
                        <p class="titlab" style="float: right"><label class="lab-yanjing"></label><span
                                style="margin-right: 68px">阅读(${recruitInfo.recruitReadCount})</span></p>
                    </div>
                    <div style="height: 2px;background:#d6d6d6;margin: 15px 0;"></div>
                    <div class="ad_main">
                        <div class="ad_main_p clearfix"><div>职位描述：</div><p>${recruitInfo.recruitDescription}</p></div>
                        <div class="ad_main_p clearfix"><div>岗位要求：</div><p>${recruitInfo.recruitRequirement}</p></div>
                        <div class="ad_main_p clearfix"><div>薪金待遇：</div><p>${recruitInfo.recruitReward}</p></div>
                        <div class="ad_main_p clearfix"><div>年龄要求：</div><p>${recruitInfo.recruitAgeRequirement}</p></div>
                        <div class="ad_main_p clearfix"><div>学历：</div><p>${recruitInfo.recruitEducational}</p></div>
                        <div class="ad_main_p clearfix"><div>职位有效期：</div><p>${recruitInfo.recruitValidityDate}</p></div>
                        <div class="ad_main_p clearfix"><div>电子邮箱：</div><p>${recruitInfo.recruitEmail}</p></div>
                        <div class="ad_main_p clearfix"><div>联系电话：</div><p>${recruitInfo.recruitContactPhone}</p></div>
                        <div class="ad_main_p clearfix"><div>联系人：</div><p>${recruitInfo.recruitContactName}</p></div>
                        <div class="ad_main_p clearfix"><div>公司地址：</div><p>${recruitInfo.recruitPlace}</p></div>
                        <div class="ad_main_p clearfix"><div>公司福利：</div><p>${recruitInfo.recruitWelfare}</p></div>
                        <div class="ad_main_p clearfix"><div>公司简介：</div><p>${recruitInfo.recruitCompanyDes}</p></div>
                    </div>
                </c:if>
                <c:if test="${classify==3}">
                    <h3>${resumeInfo.resumeTitle}</h3>
                    <div class="clearfix">
                        <p class="titlab" style="float: left">
                            <label class="lab-history"></label>
                            <span>
                             <c:choose>
                                 <c:when test="${resumeInfo.hours >= 24 }">
                                     ${resumeInfo.createTime.toLocalDate()}  ${resumeInfo.createTime.toLocalTime().withNano(0)}
                                 </c:when>
                                 <c:otherwise>
                                     ${resumeInfo.hours}小时前
                                 </c:otherwise>
                             </c:choose>
                            </span>
                            <span class="Tlabel">分享</span>
                        </p>
                        <p class="titlab" style="float: right"><label class="lab-yanjing"></label><span
                                style="margin-right: 68px">阅读(${resumeInfo.resumeReadCount})</span></p>
                    </div>
                    <div style="height: 2px;background:#d6d6d6;margin: 15px 0;"></div>
                    <div class="ad_main">
                        <div class="ad_main_p clearfix"><div>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</div><p>${resumeInfo.resumeName}</p></div>
                        <div class="ad_main_p clearfix"><div>教育背景：</div><p>${resumeInfo.resumeBg}</p></div>
                        <div class="ad_main_p clearfix"><div>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</div><p>${resumeInfo.resumeSex}</p></div>
                        <div class="ad_main_p clearfix"><div>出生年月：</div><p>${resumeInfo.resumeBirth}</p></div>
                        <div class="ad_main_p clearfix"><div>掌握技能：</div><p>${resumeInfo.resumeSkills}</p></div>
                        <div class="ad_main_p clearfix"><div>工作经历：</div><p>${resumeInfo.resumeWorkExperience}</p></div>
                        <div class="ad_main_p clearfix"><div>学术经历：</div><p>${resumeInfo.resumeExperience}</p></div>
                        <div class="ad_main_p clearfix"><div>实践经历：</div><p>${resumeInfo.resumeProjectExperience}</p></div>
                        <div class="ad_main_p clearfix"><div>自我评价：</div><p>${resumeInfo.resumeSelfEvaluation}</p></div>
                        <div class="ad_main_p clearfix"><div>电子邮箱：</div><p>zhaopin@renrenlab.com</p></div>
                        <div class="ad_main_p clearfix"><div>联系电话：</div><p>崔经理--13693304372</p></div>
                    </div>
                </c:if>
                <c:if test="${classify==1}">
                    <h3>${careerInfo.careerTitle}</h3>
                    <div class="clearfix">
                        <p class="titlab" style="float: left">
                            <label class="lab-history"></label>
                            <span>
                             <c:choose>
                                 <c:when test="${careerInfo.hours >= 24 }">
                                     ${careerInfo.createTime.toLocalDate()}  ${careerInfo.createTime.toLocalTime().withNano(0)}
                                 </c:when>
                                 <c:when test="${careerInfo.hours == 0}">
                                     刚刚
                                 </c:when>
                                 <c:otherwise>
                                     ${careerInfo.hours}小时前
                                 </c:otherwise>
                             </c:choose>
                            </span>
                        </p>
                        <p class="titlab" style="float: right"><label class="lab-yanjing"></label><span
                                style="margin-right: 68px">阅读(${careerInfo.careerReadCount})</span></p>
                    </div>
                    <div style="height: 1px;background:#d6d6d6;margin: 15px 0;"></div>
                    <div class="ad_main">
                        ${careerInfo.careerContent}
                    </div>
                </c:if>
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
    $(".lableBox a").on("click",function () {
        window.location.href = '${rlab}/news/get_tag_articles_page?tagName=' + $(this).html();
    })
    function godetail($this) {
        $this=$($this);
        window.open('${rlab}/news/get_article_detail?id=' + $this.data("tinfoId"));
    }
</script>
