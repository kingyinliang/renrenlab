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
        /* 无搜索结果缺省页 */

        .list_default {
            height: 362px;
            background: #fff;
            margin-top: 18px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
        }

        .list_default > div.default_icon {
            float: left;
            height: 362px;
            line-height: 362px;
            margin-left: 185px;
        }

        .list_default > div.default_txt {
            float: left;
            height: 362px;
            margin-left: 88px;
            position: relative;
        }

        .list_default > div.default_txt > div {
            margin-top: 122px;
        }

        .list_default > div.default_txt h3 {
            font-size: 24px;
            margin-bottom: 32px;
            color: #666;
        }

        .list_default > div.default_txt p {
            font-size: 14px;
            color: #999;
        }

    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>
    <!--内容部分-->
    <div class="scientificSearch">
        <div class="list_default" style="display: block">
            <div class="default_icon">
                <img src="${rlab}/front/imgs/icon/list_default.png" alt="没有检索到搜索结果">
            </div>
            <div class="default_txt">
                <div >
                    <h3>抱歉，没有找到与“<c:out value='${keyword.length() > 15 ? keyword.substring(0,15).concat("..."):keyword}' escapeXml="true"/>”相关的资料</h3>
                    <p>您可以关注人人实验服务号，客服为您解决</p>

                </div>
            </div>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>

</div>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script src="${rlab}/front/js/util/pagination.js"></script>
<script src="${rlab}/front/assets/echarts/echarts-plain.js" type="text/javascript" charset="utf-8"></script>
<%-- <script src="${rlab}/front/js/view/echarts_database.js" type="text/javascript" charset="utf-8"></script> --%>
<script>

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }

    function toGoodsDetail(){

    }

</script>
<script src="${rlab}/front/js/view/goods_list.js?v_=20170905"></script>

</body>
</html>