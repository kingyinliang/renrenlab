<%--
  Created by IntelliJ IDEA.
  User: lihongxun
  Date: 2017/4/20
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<head>
    <%@ include file="/common/taglibs.jsp"%>
    <meta charset="UTF-8">
    <title>我的创新券</title>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <link rel="stylesheet" href="${cms}/wechat/css/ticketsList.css">
    <script src="${cms}/wechat/scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
</head>
<body style="background-color: #ebebeb; padding-bottom: 0.4rem;">
<div id="noticket" class="noticket" style="display: none">
    <img src="${cms}/wechat/img/noTicket.png"  style="margin-top: 4rem;height: 1.6rem;width: 2.56rem;">
	<p style="color: #666666;font-size: 0.34rem;line-height: 0.66rem;margin-top: 1.36rem;">尊敬的用户您好，该创新券发放仅针对<br>第三届“互联网+”大学生创新创业大赛的报名参赛团队</p>
	<p style="line-height: 0.69rem;margin-top: 1rem;">您可点击查看“个人中心”菜单栏内“创新券体系”，<br />了解更多人人实验平台创新券相关信息</p>
</div>
<div id="noauthority" class="noauthority" style="display: none">
    <img src="${cms}/wechat/img/noTicket.png">
    <p>此优惠只针对大学生创业活动<br>欲享受此优惠, 请联系客服, 扫码参加</p>
</div>
<!-- <div id="table" style="display: none"> -->
<div id="table" style="display: block">
		 <c:if test="${coupons!=null && fn:length(coupons)>0}">
			<c:forEach items="${coupons}" var="coupon" varStatus="status">
				<div id="price${status.index}" class="tickets_list_cell">
				<div class="listcell_left">
    			<p class="title">全品类创新券</p>
    			<p class="subtitle">可叠加使用</p>
				</div>
			    <div class="listcell_right">
			    <c:if test="${fn:contains(coupon.couponName,'100')==true}">
			    <p  class="title"><span>¥&nbsp;</span>100</p>
			    </c:if>
			    <c:if test="${fn:contains(coupon.couponName,'300')==true}">
			    <p  class="title"><span>¥&nbsp;</span>300</p>
			    </c:if>
			    <c:if test="${fn:contains(coupon.couponName,'600')==true}">
			    <p  class="title"><span>¥&nbsp;</span>600</p>
			    </c:if>
			    </div>
			    <div class="listcell_bottom">
			    <span class="lab-history icon"></span><span class="text">有效期2017-4-3 至 2017-10-31</span>
			    </div>
			    <div id="cell${status.index}" class="ticket_state">
			    
			    </div>
			    </div>
			</c:forEach>
		</c:if>
		 
</div>

<script>
    $(function () {
    	bindcell();
    	changeState();
    });
    


    /*  function getData() {
        $.ajax({
            url: '../api/organization/'
        }).done(function (data) {
            console.log(data);
        }).fail(function (data) {
            var html='';
            for (var i=0; i<6; i++){

                html += '<div class="tickets_list_cell">\
                        <div class="listcell_left">\
                        <p class="title">全品类创新券</p>\
                        <p class="subtitle">可叠加使用</p>\
                        </div>\
                        <div class="listcell_right">\
                        <p class="title"><span>¥&nbsp;</span>600</p>\
                </div>\
                <div class="listcell_bottom">\
                        <span class="lab-history icon"></span><span class="text">有效期2017-4-3 至 2017-5-30</span>\
                </div>\
                <div class="ticket_state">\
\
                        </div>\
                        </div>';
            }
            $("#table").html(html);
            bindcell();
        });*/

        function bindcell() {
            $("#cell").on("click", function(){
                //console.log("cell click");
            });
        }
        
        function changeState() {
        	 <c:if test="${coupons!=null && fn:length(coupons)>0}">
	 			<c:forEach items="${coupons}" var="coupon" varStatus="status">
					var price ;
					var p ='price${status.index}';
					var i1 = '${cms}/wechat/img/100.jpg';
					var i2 = '${cms}/wechat/img/300.jpg';
					var i3 = '${cms}/wechat/img/600.jpg';
	 				<c:if test="${fn:contains(coupon.couponName,'100')==true}">
	 					price = '100';
	 					$("#"+p).css("background-image", "url("+i1+")");
	 				</c:if>
	 				<c:if test="${fn:contains(coupon.couponName,'300')==true}">
 						price = '300';
 						$("#"+p).css("background-image", "url("+i2+")");
 					</c:if>
	 				<c:if test="${fn:contains(coupon.couponName,'600')==true}">
						price = '600';
						$("#"+p).css("background-image", "url("+i3+")");
					</c:if>
					
					
					var s = '${coupon.cState}'; 
					var i ='cell${status.index}';
					
					var temp = '${cms}/wechat/img/overDate.png';
					var tem = '${cms}/wechat/img/usedBG.jpg';
			            if(s==2){
			            	$("#"+i).css("display", "block");
			            	
			            }
			            if(s==1){
			            	$("#"+i).css("display", "block");
			            	$("#"+i).css("background-image", "url("+temp+")");
							$("#"+p).css("background-image", "url("+tem+")");
			            }
			            console.log(s);	
			            //console.log(i);	
	 			</c:forEach>
 			</c:if>   
 			
 			
 			<c:if test="${coupons==null || fn:length(coupons)<=0}">
			<!-- 显示暂无创新券 -->
				$("#table").css("display", "none");
				$("#noticket").css("display", "block");
			</c:if>

        }
        

     
    
    
    
</script>
</body>
</html>