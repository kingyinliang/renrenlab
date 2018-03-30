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
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
	<link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170905">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/scientific_search.css"/>

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
		.company_info_layer {
			width: auto!important;
		}
		#qrCode{
			width: 585px;
			height: 438px;
			background: white;
			margin: auto;
			text-align: center;
			border-radius: 4px;
			overflow: hidden;
		}
		#qrCode p{
			margin-top: 54px;
			line-height: 35px;
			font-size: 18px;
			color: #666666;
		}
		#qrCode img{
			margin-top: 53px;
			width: 143px;
			height: 143px;
		}
		#close{
			color: white;
			font-size: 16px;
			display: block;
			width: 260px;
			height: 38px;
			background: #508DF0;
			line-height: 38px;
			margin: auto;
			margin-top: 50px;
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
    <!--内容部分-->
    <div class="scientificSearch" style="height: ;">
		<div id="project" style="margin-bottom: 25px;padding-bottom: 20px;">
			<div class="tit">
				<p>相关项目</p>
			</div>
			<div class="list">
				<ul>
						<c:forEach items="${result.re}" var="prolist" begin="0" end="9" varStatus="st">
                        <li>
                            <a  class="projectTit" title="${prolist.title_cn_ais}" style="cursor: pointer"><p>${prolist.title_cn_ais}</p></a>
                            <p >负责单位：<span style="color: #4E4E4E;">${prolist.organization_if}</span></p> 
                            <p class="rightMark"><span class="mark" style="width:32px;">${prolist.year_is}</span> <span style="float:right;margin: 0 6px;">|</span> <span title="${prolist.leader_ims}" style="color: #4E4E4E;float: right;">${prolist.leader_ims}</span></p>
                        </li>
                        </c:forEach>
					<!-- <li>
						<a href="" class="projectTit" title="到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道"><p>到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道</p></a>
						<p>负责单位：<span class="mark">郑州大学</span></p>
						<p class="rightMark"><span class="mark">崔静</span> | <span class="mark">2011</span></p>
					</li>
					<li>
						<a href="" class="projectTit" title="到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道"><p>到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道</p></a>
						<p>负责单位：<span class="mark">郑州大学</span></p>
						<p class="rightMark"><span class="mark">崔静</span> | <span class="mark">2011</span></p>
					</li>
					<li class="last">
						<a href="" class="projectTit" title="到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道"><p>到瑞米发骚拉稀，希腊扫发迷蕊道到瑞米发骚拉稀，希腊扫发迷蕊道</p></a>
						<p>负责单位：<span class="mark">郑州大学</span></p>
						<p class="rightMark"><span class="mark">崔静</span> | <span class="mark">2011</span></p>
					</li> -->
				</ul>
				<div id="pages" style="text-align: center;overflow: hidden;">
						<a id="next" href="JavaScript:location.href='${rlab}/front/kejso/morePro?pageNo=${pageNo +1}&pageSize=10&query='+encodeURI('${keyword}');">下一页</a>
					<c:if test="${pageNo != 0}">
						<a id="top" href="JavaScript:location.href='${rlab}/front/kejso/morePro?pageNo=${pageNo -1}&pageSize=10&query='+encodeURI('${keyword}');">上一页</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
    

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>

</div>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>
<script src="${rlab}/front/js/util/pagination.js?v_=20170905"></script>
<script type="text/javascript">

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }
    //$("#serach").val('<c:out value="${keyword}" escapeXml="true"/>');
    function toGoodsDetail(){

    }

    $(".projectTit").on("click", function () {
        var $this = $(this);
        var data = $this.data();
        var html =
            '<div id="qrCode">\
                 <p>如果您需要查看相关项目<br />请关注人人实验公众号，联系客服人员</p>\
                 <img src="../imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>\
                 <a id="close">我知道了</a>\
            </div>';

        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        $("#close").off("click").on("click", function () {
            layer.close(layer_info);
        })

    })

</script>
<script src="${rlab}/front/js/view/goods_list.js?v_=20170905"></script>
</body>
</html>