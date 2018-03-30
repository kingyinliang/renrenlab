<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">

    <%--<link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css ">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--<script src="assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>-->
    <!--<script src="assets/bootstrapvalidator-master/dist/js/bootstrapValidator.js"></script>-->

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
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
        html, body, .sp_main {
            background-color: #f6f7ff;
        }

        .banners img {
            width: 100%;
        }

        /*导航部分*/
        .navigator {
            margin: 0 auto;
            margin-top: 30px;
            width: 1200px;
            background-color: #3d8cf8;
            height: 50px;
            line-height: 50px;
        }

        .navigator .ad {
            float: left;
            line-height: 48px;
            height: 50px;
            margin-left: 15px;

        }

        .navigator .ad img {
            vertical-align: middle;
        }

        .navigator .txt {
            float: left;
            margin-left: 15px
        }

        .navigator .txt a {

        }

        .navigator .txt a:hover {
            text-decoration: underline;
        }

        /*列表部分*/
        .nt_list {
            width: 1200px;
            margin: 0 auto;
            background: #fff;
            border: solid 1px rgba(239, 239, 239, 1);
            margin-top: 9px;
            padding: 20px 35px;
            height:646px;
            position: relative;
        }

        .nt_list > ul.list {
            list-style: none;
        }

        .nt_list > ul.list li {
            height: 50px;
            line-height: 50px;
            padding-left: 26px;
            position: relative;
        }

        .nt_list > ul.list i {
            color: #3d8cf8;
            display: block;
            line-height: 50px;
            position: absolute;
            left: 0;
        }

        .nt_list > ul.list a {
            font-size: 18px;
            color: #414141;
        }

        .nt_list > ul.list a:hover {
            text-decoration: underline;
            cursor: pointer;
        }

        .nt_list > ul.list s {
            font-size: 18px;
            color: #9f9f9f;
            position: absolute;
            right: 6px;
        }

        /*底部通栏*/
        .btm_tip {
            font-size: 14px;
            letter-spacing: 1.3px;
            color: #5a5a5a;
            text-align: center;
            line-height: 100px;
        }
        /*分页样式*/
        .paging {
            overflow: hidden;
            text-align: center;
            position: absolute;
            bottom: 20px;
            width: 100%;
        }

        .paging .page_list {
            display: inline-block;
        }

        .paging .page_list > li {
            float: left;
            list-style: none;
            text-indent: 0;
            /*width: 26px;*/
            min-width: 26px;
            max-width: 50px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
            margin-left: 5px;
            margin-right: 5px;
        }

        .paging .page_list > li a {
            color: #7a7a7a;
        }

        .paging .page_list > li.active a {
            color: #508df0;
        }

        .paging .page_list > li:active a {
            color: #508df0;
        }

        .paging .page_list > button {
            float: left;
            outline: 0 none;
            border: 0 none;
            width: 30px;
            height: 30px;
            font-size: 10px;
            color: #508df0;
            text-align: center;
            line-height: 30px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            cursor: pointer;
        }

        .paging .page_list > button:active {
            background: #508DF0;
            color: #fff;
        }

        .paging .page_list > button.disabled:active {
            background: #fff;
            color: #b5b5b5;
        }

        .paging .page_list > button.disabled {
            color: #b5b5b5;
        }


    </style>
</head>
<body>
<div id="main" class="sp_main wrapper">
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <div class="cxj_content">
        <%--banner--%>
        <div class="banners">
            <img src="${rlab}/front/imgs/cxj/activityBanner.png">
        </div>
        <%--导航--%>
        <div class="navigator">
            <div class="ad" style="">
                <img src="${rlab}/front/imgs/cxj/add@1x.png" alt="">
            </div>
            <div class="txt">
                <a style="color: white" href="${rlab}/page/activity?source=0">人人创新券</a>
                <i class="lab-youjian_1" style="color: #9ec5fb; font-size: 14px;"></i>
                <a style="color: white" href="${rlab}/page/activity/notice">人人创新券公告信息</a>
            </div>
        </div>
        <%--内容列表页面--%>
        <div class="nt_list">
            <ul class="list">
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=6">关于人人创新券2017年第五批支持项目公示的公告</a>
                    <s>2018-1-8</s>
                </li>
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=5">关于人人创新券2017年第四批支持项目公示的公告</a>
                    <s>2017-12-22</s>
                </li>
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=4">关于人人创新券2017年第三批支持项目公示的公告</a>
                    <s>2017-12-20</s>
                </li>
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=3">关于人人创新券2017年第二批支持项目公示的公告</a>
                    <s>2017-12-08</s>
                </li>
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=1">关于人人创新券2017年第一批支持项目公示的公告</a>
                    <s>2017-09-28</s>
                </li>
                <li>
                    <i class="lab-arrow-right"></i>
                    <a href="${rlab}/page/activity/details?noticeId=2">人人创新券项目管理办法</a>
                    <s>2017-09-25</s>
                </li>

            </ul>
            <%--START分页--%>
            <%--<div class="paging" style="display:block">--%>
                <%--<div id="page_container" class="page_list"></div>--%>
            <%--</div>--%>
            <%--END分页--%>

        </div>
        <%--底部通栏--%>
        <div class="btm_tip ">
            主办单位：人人实验（北京）科技有限公司人人创新券工作小组
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<script src="${rlab}/front/js/util/pagination.js?v_=20170905"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">
    // 初始化页面分页
    showPages(40, 0, 10, function (from, max) {
//            PAGE_NO = from / 10 + 1;
//            dealUrlFilterParams();
//            toGoodsList();
        }, "page_container"
    )
</script>
</body>
</html>
</html>
