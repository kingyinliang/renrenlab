<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--jquery-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">
    <link rel="stylesheet" href="${rlab}/front/css/footpage.css?v_=20180129">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style type="text/css">
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }

        .header_content > .city_btn .dorpdow {
            border: 1px solid red;
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

</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>


    <div id="content">
        <div class="main clearfix">
            <div class="lef">
                <div class="tabs">
                    <p style="font-size: 20px;color: #508df0;">人人实验</p>
                    <p class="select"><a href="${rlab}/page/aboutus">关于我们</a></p>
                    <p><a href="${rlab}/page/ournews">媒体报道</a></p>
                    <p><a href="${rlab}/page/joinus">加入我们</a></p>
                    <p><a href="${rlab}/page/callus">联系我们</a></p>
                </div>
                <div class="tabs protocol">
                    <p style="font-size: 20px;color: #508df0;">服务条款</p>
                    <p><a href="${rlab}/page/server">用户服务协议</a></p>
                    <p><a href="${rlab}/page/equity">知识产权协议</a></p>
                </div>
            </div>
            <div class="content">
                <div class="bigtit">关于人人实验</div>
                <div class="littletit">公司简介</div>
                <div class="text">
                    <p class="textP">人人实验成立于2015年10月，是一家致力于运用共享经济理念提升科学研究及工程技术领域研发效率的创新型互联网科技服务公司。</p>
                    <p class="textP">核心团队成员由生物医药、智能制造等领域科学家，航天科工、微软、华为等公司资深工程师，清华、北大、中科院等名校毕业生组成，拥有丰富的互联网与科研行业经验。</p>
                    <p class="textP textP2">人人实验积极响应国家“供给侧改革”和“大众创业万众创新”号</br>召，通过市场化方式全面整合高等院校、大型科研机构、企事业单</br>位中低频使用的仪器设备和相关服务信息以及科研人员服务能力，为企业和个人在产品研发、生产制造和市场推广全过程提供高效便捷的资源信息服务，同时为科技资源供给方拓宽营收渠道，解决供需双方信息不对称的主要矛盾，全面提升全社会科技资源的利用效率。</p>
                    <p class="textP textP2">目前平台已入驻3241家专业实验室，覆盖全国223个城市。上线各类共享仪器设备50万余台，涵盖10个领域的检测、校准、检验及认证等服务12万余项。平台还拥有一支超千人的高级科研顾问团队，覆盖生物医药、智能制造、化学化工、材料科学、能源环保等10多个领域。</p>
                    <img src="${rlab}/front/imgs/news/renrenlab.jpg" alt="" class="aboutimg">
                </div>

            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>
</div>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
</body>
</html>