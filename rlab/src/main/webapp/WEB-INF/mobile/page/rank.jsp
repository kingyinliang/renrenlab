<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <%--<link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>--%>
    <%--<script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>--%>

    <style>
        .headtitle{
            margin: 0;
            position: absolute;
            top: 0;
            left: 50%;
            width: 2rem;
            margin-left: -1rem;
            text-align: center;
            font-size: 0.32rem;
            color: black;
            line-height: 1.175rem;
        }
        .ranktab{
            padding-top: 0.427rem;
            text-align: center;
        }
        .ranktab span{
            display: inline-block;
            width: 1.867rem;
            height: 0.56rem;
            line-height: 0.56rem;
            font-size: 0.32rem;
            margin: 0 0.293rem;
            border-radius: 0.267rem;
            color: #555f69;
            background-color: #ffffff;
            box-shadow: 0rem 0.107rem 0.187rem 0rem
            rgba(0, 0, 0, 0.12);
        }
        .ranktab .seleranktab{
            background-color: #6aa0ff;
            color: white;
            box-shadow: none;
        }
        .categoryRank,.orgRank{
            padding: 0 0.53rem;
            margin-top: 0.6rem;
        }
        .categoryItem{
            margin-bottom: 0.64rem;
        }
        .categoryItem span{
            line-height: 0.5rem;
            letter-spacing: 0.013rem;
            float: left;
            font-size: 0.373rem;
        }
        .rankNum{
            width: 1rem;
            text-align: left;
        }
        .categoryName{
            color: #555f69;
            text-align: left;
            width: 5.8rem;
            overflow: hidden;
            white-space: nowrap;
            text-overflow:ellipsis;
        }
        .categoryCount{
            width: 2rem;
            text-align: right;
        }
        .orgRank{
            padding: 0 0.32rem;
            margin-top: 0.6rem;
        }
        .orgItem{
            margin-bottom: 0.5rem;
        }
        .orgItem img{
            overflow: hidden;
            float: left;
            width: 0.987rem;
            height: 0.987rem;
            background-color: #ffffff;
            border-radius: 0.4935rem;
        }
        .orgItem .orgName{
            line-height: 0.5rem;
            float: left;
            margin-left: 0.32rem;
            width: 6.5rem;
        }
        .orgName .names{
            font-size: 0.373rem;
            letter-spacing: 0.013rem;
            color: #555f69;
            width: 100%;
            overflow: hidden;
            white-space: nowrap;
            text-overflow:ellipsis;
        }
        .orgName .nums{
            font-size: 0.293rem;
            color: #f5a623;
            letter-spacing: 0.01rem;
        }
        .orgrank{
            line-height: 0.85rem;
            text-align: right;
            width: 1.5rem;
            float: left;
        }
        .orgrank .brank{
            font-size: 0.85rem;
        }
        .orgrank .srank{
            font-size: 0.373rem;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_two.jsp" %>
        <p class="headtitle">共享指数</p>
    </header>
    <div class="ranktab">
        <span class="seleranktab">类目排行</span>
        <span>机构排行</span>
    </div>
    <div class="categoryRank">
        <c:forEach items="${rankList}" var="item">
            <p class="categoryItem clearfix">
                <span class="rankNum" style="color: ${item.get("rank")==1?"#f24f2e":item.get("rank")==2?"#ff895a":item.get("rank")==3?"#f5a623":"#6aa0ff"}">${item.get("rank")}</span>
                <span class="categoryName">${item.get("classifyName")}</span>
                <span class="categoryCount" style="color: ${item.get("rank")==1?"#f24f2e":item.get("rank")==2?"#ff895a":item.get("rank")==3?"#f5a623":"#6aa0ff"}">${item.get("insCount")}</span>
            </p>
        </c:forEach>
    </div>
    <div class="orgRank" style="display: none">
        <c:forEach items="${orgRank}" var="item">
            <div class="orgItem clearfix" onclick="goorghome(this)" data-org-id="${item.orgId}">
                <c:choose>
                    <c:when test="${item.orgLogo != null && item.orgLogo.trim()  != ''}">
                        <img src="${item.orgLogo}500_500" alt="">
                    </c:when>
                    <c:otherwise>
                        <img src="${rlab}/front/imgs/icon/org_logo_default.png" alt="">
                    </c:otherwise>
                </c:choose>
                <div class="orgName">
                    <p class="names">${item.get("orgName")}</p>
                    <p class="nums">共享指数 ${item.get("shareIndex")}</p>
                </div>
                <p class="orgrank" style="color: ${item.get("orgRank")==1?"#ec3724":item.get("orgRank")==2?"#fc7349":item.get("orgRank")==3?"#f1961c":"#588bff"}">
                    <span class="brank">${item.get("orgRank")}</span>
                    <span class="srank">${item.get("orgRank")==1?"st":item.get("orgRank")==2?"nd":item.get("orgRank")==3?"rd":"th"}</span>
                </p>
            </div>
        </c:forEach>
    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */

    function goBack() {
        history.go(-1);
    }

    $(".ranktab span").on("click",function () {
        $(".ranktab span").attr("class","");
        $(this).attr("class","seleranktab");
        if($(this).text()=="类目排行"){
            $(".orgRank").hide();
            $(".categoryRank").show();
        }else {
            $(".orgRank").show();
            $(".categoryRank").hide();
        }
    })
    function goorghome($this) {
        window.location.href = BASE_URL + '/org/' + $($this).data("orgId");
    }

</script>
</html>