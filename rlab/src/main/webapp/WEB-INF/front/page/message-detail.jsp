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
    <%@ include file="../../config/taglibs.jsp" %>
    <meta charset="UTF-8">
    <title>${info.tInfoTitle},人人实验,科创头条</title>
    <meta name="Keywords" content="<c:forEach var="tag" items="${info.tInfoTags}">${tag},</c:forEach>人人实验,仪器共享"/>
    <meta name="Description" content="${info.tInfoSubTitle}"/>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>

    <%--分享--%>
    <meta property="og:type" content="article">
    <meta name="og:category " content="人人实验" />
    <meta property="og:title" content="${info.tInfoTitle}" />
    <meta property="og:description" content="${info.tInfoSubTitle}"/>
    <meta property="og:image" content="${info.tInfoImage}">
    <meta itemprop="image" content="${info.tInfoImage}" />

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
            font-size: 24px;
            color: #424242;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .detailTxt {
            font-size: 14px;
            color: #404040;
            line-height: 13px;
        }

        .interest {
            font-size: 14px;
            color: #b5b5b5;
            margin: 20px 0;
        }
        .detailTxt img{
            max-width: 657px;
        }
        .detailTxt div{
            line-height: 24px;
            font-size: 14px;
        }
        .detailTxt p{
            line-height: 24px;
            font-size: 14px;
        }
        .goxuqiu{
            display: inline-block;
            width: 100px;
            height: 35px;
            line-height: 35px;
            text-align: center;
            background: #588eff;
            color: white;
            border-radius: 2px;
            margin-left: 25px;
        }
        strong{
            font-weight: bold;
        }
        table{
            line-height: 24px;
            width: 657px!important;
            border-collapse: collapse;
            display: table;
        }

        .detailTxt span {
            line-height: 24px;
        }
        #qrCode img{
            width: 100%;
            height: 100%;
        }
        #qrCode{
            margin: auto;
            width: 150px;
            height: 150px;
        }
        .detailTxt td,.detailTxt th{
            padding: 5px 10px;
            border: 1px solid #DDD;
            margin: 0;
        }
    </style>
</head>
<body>
<div style ='margin:0 auto;width:0px;height:0px;overflow:hidden;'>
    <img src='${info.tInfoImage}'>
</div >
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
                <h3>${info.tInfoTitle}</h3>
                <div class="clearfix">
                    <p class="titlab" style="float: left">
                        <label class="lab-history"></label>
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
                        <%--<span class="Tlabel">${info.tUname}</span>--%>
                    </p>
                    <p class="titlab" style="float: right"><label class="lab-yanjing"></label><span>阅读(${info.tReadCount})</span></p>
                </div>
                <div style="height: 1px;background:#d6d6d6;margin: 15px 0;"></div>
                <div class="lableBox">
                    <c:forEach items="${info.tInfoTags}"
                               var="tag"><a style="color: #ff9393">${tag}</a></c:forEach>
                </div>
                <div class="detailTxt">${info.tInfoContent}</div>
                <div style="margin-top: 30px;display: ${info.tInfoFrom==''?'none':'block'}"><p>来源：${info.tInfoFrom}</p></div>
                <div style="margin-top: 25px">
                    <p style="line-height: 20px">
                        <b>版权声明</b><br><br>
                        ${info.tInfoFrom=='人人实验'?'本网站所有注明“来源：人人实验”的文字、图片和音视频资料，版权均属于人人实验所有，非经授权，任何媒体、网站或个人不得转载，授权转载时须注明“来源：人人实验”。':'本网所有转载文章系出于传递更多信息之目的，且明确注明来源和作者，不希望被转载的媒体或个人可与我们联系，我们将立即进行删除处理。'}
                    </p>
                </div>
                <p style="margin-top: 50px;margin-bottom: 10px" >扫码分享：</p>
                <div id="qrCode"></div>
            </div>
            <div style="color: #333333"><label class="lab-dengpao" style="margin:0 25px"></label>如果您有科研方面的困扰，发布需求让我们帮您解决吧<a href="${rlab}/page/req/listpage" class="goxuqiu" target="_blank">发布需求</a></div>
            <div class="rlab_list">
                <p class="interest">您可能想看</p>
                <ul>
                    <c:forEach items="${list}" var="item">
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
                                            <c:when test="${item.hours == 0}">
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
<script src="${rlab}/front/js/view/qrcode.min.js" type="text/javascript"></script>
<script type="text/javascript">
    (function(){
            var urls = BASE_URL + '/news/get_article_detail?id=${info.tInfoId}';
            new QRCode($("#qrCode").get(0), urls);
        }
    )();
    $(".lableBox a").on("click",function () {
        window.location.href = '${rlab}/news/get_tag_articles_page?tagName=' + $(this).html();
    })
    function godetail($this) {
        $this=$($this);
        window.open('${rlab}/news/get_article_detail?id=' + $this.data("tinfoId"));
    }
</script>
