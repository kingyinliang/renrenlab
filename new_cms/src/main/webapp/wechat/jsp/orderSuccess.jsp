<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<%@ include file="/common/taglibs.jsp"%>
<head>
    <meta charset="UTF-8">
    <title>创建订单</title>
    <!--<script src="${cms}/wechat/build/flexible_css.debug.js"></script>-->
    <!--<script src="${cms}/wechat/build/flexible.debug.js"></script>-->
    <link rel="stylesheet" href="${cms}/wechat/css/orderSuccess.css">
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="${cms}/wechat/scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
</head>


<body style="background-color: #ebebeb; padding-bottom: 0.6rem">

    <div class="header">
        <img class="image" src="${cms}/wechat/img/tab_image.png">
        <p style="font-size: 0.45333rem; color: white; margin-top: 0.48rem">订单创建成功</p>
    </div>

    <div class="user">
        <div class="user_bg"></div>
        <div class="user_info">
            <div class="title">
                <div class="title_logo"></div>
                <p class="title_text">发起人信息</p>
                <div style="background-color: #cccccc; width: 8rem; height: 1px; margin: 0 auto; margin-top: 1.33333rem;"></div>
            </div>

            <div id="userPhone" class="info_text" style="margin-top: 0.4rem">发起人手机号: <span>${orderInfo.order.oShippingPhone}</span></div>
            <div id="userWX" class="info_text">发起人微信名: <span>${orderInfo.user.uNickname}</span></div>
            <div id="userName" class="info_text">发起人姓名: <span>${orderInfo.order.oShippingName}</span></div>
            <div id="userAddress" class="info_text" style="margin-right: 0.3rem">发起人地址: <span>${orderInfo.order.oShippingAddress}</span></div>
        </div>
    </div>

    <div class="project">
        <div class="title">
            <div class="title_logo"></div>
            <p class="title_text">项目名称: ${orderInfo.scheme.schProject}</p>
            <div style="background-color: #cccccc; width: 8rem; height: 1px; margin: 0 auto; margin-top: 1.33333rem;"></div>
        </div>

        <div>
            <div class="project_info">
                <div class="lft">
                    <img index = "1" src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_half.png">
                    <img src="${cms}/wechat/img/comment_star_normal.png"> 
                     
                 
                </div>
                <div class="rt">
                    <span style="font-size: 0.64rem; color: #2fcba8; margin-left: 0.2rem"><fmt:formatNumber type="number" value="${orderInfo.scheme.schPraise/2}" pattern="0.0"/></span>
                </div>

                <div class="distance">
                    ${orderInfo.scheme.schDistance eq "0.0"? "距离未知":"距离您".concat(orderInfo.scheme.schDistance).concat("KM")}
                </div>
            </div>

        </div>

        <div id="biaozhun" class="info_text">使用标准:&nbsp;&nbsp;<span>${orderInfo.scheme.schStandard eq ""? "未知":orderInfo.scheme.schStandard}</span></div>
        <div id="yiqi" class="info_text">使用仪器:&nbsp;&nbsp;<span>${orderInfo.scheme.schInstrument eq ""? "未知":orderInfo.scheme.schInstrument}</span></div>
        <div id="shouquan" class="info_text">资质授权:&nbsp;&nbsp;<span>${orderInfo.scheme.schQualifications eq ""? "未知":orderInfo.scheme.schQualifications}</span></div>
        <div id="shouqi" class="info_text">周期:&nbsp;&nbsp;<span>${orderInfo.scheme.schPeriod eq "" ?"未知":orderInfo.scheme.schPeriod.concat("个工作日")}</span></div>
        <div id="yangpin" class="info_text">提供样品制备服务:&nbsp;&nbsp;<span>${orderInfo.scheme.schOfferService eq 0?"否":"是"}</span></div>
<c:if test="${orderInfo.order.oPrice/100 eq 0}"><div id="price" class="project_price">￥面议</div></c:if>
<c:if test="${orderInfo.order.oPrice/100 ne 0}"><div id="price" class="project_price">￥<fmt:formatNumber type="number" value="${orderInfo.order.oPrice/100+0.00001}" pattern="0.00"/></div></c:if>

   <%--      <div id="price" class="project_price">￥${orderInfo.order.oPrice/100 eq 0? "面议":orderInfo.order.oPrice/100}</div> --%>
    </div>

    <div class="order">
        <div class="info_text" style="margin-top: 0.45333rem">订单号:&nbsp;&nbsp;<span>${orderInfo.order.oNo}</span></div>
        <div class="info_text">下单时间:&nbsp;&nbsp;<span><fmt:formatDate value="${orderInfo.order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span></div>
    </div>

<script>
      $(function () {
    	 var score=${orderInfo.scheme.schPraise}
    	 showStarts(score);
    }); 
     function showStarts(score) {
    	for (var i=1; i<6; i++){
    		
            var n = score - 2*i;
                
            if (n >= 0 ){
                $(".project_info .lft img").eq(i-1).attr("src", "${cms}/wechat/img/comment_star_default.png");
            }else if(n > -2){
                $(".project_info .lft img").eq(i-1).attr("src", "${cms}/wechat/img/comment_star_half.png");
                
            }else {
                $(".project_info .lft img").eq(i-1).attr("src", "${cms}/wechat/img/comment_star_normal.png");
            }
            
        }
    }
    
</script>
</body>
</html>