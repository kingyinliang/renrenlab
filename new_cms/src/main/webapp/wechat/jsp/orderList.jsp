<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<head>
<%@ include file="/common/taglibs.jsp"%>
<meta charset="UTF-8">
<title>订单列表</title>
<script
	src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
<link rel="stylesheet" href="${cms}/wechat/css/orderList.css">
<script src="${cms}/wechat/scripts/jquery-3.2.0.min.js"
	type="text/javascript"></script>
</head>
<body style="background-color: #ebebeb">
	<div id="table" style="overflow:hidden;">
		<c:if test="${orderList!=null && fn:length(orderList)>0}">
			<c:forEach items="${orderList}" var="order">
				<div class="orderlist_cell" id="${order.oId}"
					onclick="javascript:orderDetail(this);">
					<div style="height: 1rem">
						<div class="line"></div>
						<div class="time">
							<fmt:formatDate value="${order.createTime}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
						<c:if test="${order.oState == 0}">
							<div class="state">进行中</div>
						</c:if>
						<c:if test="${order.oState == 1}">
							<div class="state">已完成</div>
						</c:if>
						<c:if test="${order.oState == 2}">
							<div class="state">已结束</div>
						</c:if>
					</div>
					<div
						style="margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>
					<div class="title">
						<img src="${cms}/wechat/img/plan_click.png"
							style="width: 0.53333rem; height: 0.53333rem; margin-left: 0.66666rem">
						&nbsp;&nbsp;${order.schProject}
						<div style="float: right">
							<img src="${cms}/wechat/img/arrow.png"
								style="vertical-align: middle; margin-right: 0.66666rem; line-height: 1.65333rem; width: 0.15rem">
						</div>
					</div>
					<div
						style="margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>
					<c:if test="${order.oPrice/100 == 0}">
						<div class="price">￥面议</div>
					</c:if>
					<c:if test="${order.oPrice/100 != 0}">
						<div class="price">￥<fmt:formatNumber type="number" value="${order.oPrice/100+0.00001}" pattern="0.00"/></div>
					</c:if>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${orderList==null || fn:length(orderList)<=0}">
			<span>暂无订单！请联系客服下单！</span>
		</c:if>
	</div>
	<script>
		function orderDetail(e) {
			var oId = e.id;
			location.href = "${cms}/wx/order/queryOrder.do?oId=" + oId;
		}
		/*    $(function () {
		       getData();
		   });

		   function getData() {
		       $.ajax({
		           url: '../api/organization/'
		       }).done(function (data) {
		           console.log(data);
		       }).fail(function (data) {
		           var html='';
		           for (var i=0; i<6; i++){
		               html += '<div class="orderlist_cell">\
		                       <div style="height: 1rem">\
		                       <div class="line"></div>\
		                       <div class="time">2017-03-25 17:19:25</div>\
		               <div class="state">进行中</div>\
		                       </div>\
		\
		                       <div style="margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>\
		\
		                       <div class="title">\
		                       <img src="./img/plan_click.png" style="width: 0.53333rem; height: 0.53333rem; margin-left: 0.66666rem">\
		                       &nbsp;&nbsp;abs材料分析\
		               <div style="float: right">\
		                       <img src="img/arrow.png" style="vertical-align: middle; margin-right: 0.66666rem; line-height: 1.65333rem; width: 0.15rem">\
		                       </div>\
		                       </div>\
		\
		                       <div style="margin-left: 0.66666rem; margin-right: 0.66666rem; height: 1px; background-color: #cccccc"></div>\
		\
		                       <div class="price">\
		                       ¥ 1500.00\
		               </div>\
		               </div>';
		           }
		           $("#table").html(html);
		       });
		   } */
	</script>
</body>
</html>