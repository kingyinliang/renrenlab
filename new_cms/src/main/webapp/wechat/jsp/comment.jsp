<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ebebeb">
<%@ include file="/common/taglibs.jsp"%>
<head>
    <meta charset="UTF-8">
    <title>评价</title>
    <script src="http://g.tbcdn.cn/mtb/lib-flexible/0.3.4/??flexible_css.js,flexible.js"></script>
    <script src="${cms}/wechat/scripts/jquery-3.2.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${cms}/wechat/css/comment.css">
</head>
<body>
<div class="xq_modal">
    <div class="xq_modal_contant">
        <!--弹窗内容替换掉    -->
        <div class="xq_modal_main alert">
            <div class="title">确定要提交吗?</div>
            <div class="buttons">
                <button id="cancel_button" class="cancel_button">取消</button>
                <button id="submit_button" class="submit_button">确定</button>
            </div>
        </div>
    </div>
</div>
<!--遮照-->
<div class="xq_modal_back"></div>


    <div class="comment_head"></div>
    <div class="comment_comment">
        <div class="title">${orderInfo.scheme.schProject}</div>
        <div class="comment_text">对本次服务的满意度</div>
        <div class="starts">
            <div id="start1" class="start"><img src="${cms}/wechat/img/start_n_l.png"></div>
            <div id="start2" class="start"><img src="${cms}/wechat/img/start_n_l.png"></div>
            <div id="start3" class="start"><img src="${cms}/wechat/img/start_n_l.png"></div>
            <div id="start4" class="start"><img src="${cms}/wechat/img/start_n_l.png"></div>
            <div id="start5" class="start"><img src="${cms}/wechat/img/start_n_l.png"></div>
        </div>
        <div class="comment_textarea">
            <textarea id="textArea" maxlength="140" placeholder="有什么想说的?"></textarea>
            <p id="text_count">0 / 140</p>
        </div>
    </div>

    <div class="project">
        <div>
            <div  class="project_info">
                <div class="lft">
                    <img src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_default.png">
                    <img src="${cms}/wechat/img/comment_star_half.png">
                    <img src="${cms}/wechat/img/comment_star_normal.png">
                </div>
                <div class="rt">
                    <span style="font-size: 0.64rem; color: #2fcba8; margin-left: 0.2rem"><fmt:formatNumber type="number" value="${orderInfo.scheme.schPraise/2}" pattern="#.0"/></span>
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
    </div>

    <div id="order_submit" class="order_submit">
        提交评价
    </div>

<script>
$(function () {
	 var score=${orderInfo.scheme.schPraise}
	 showStarts(score)
	 
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


    var score = 0;
    $("#start1").on("click", function(){
        $(".starts div > img").attr("src", "${cms}/wechat/img/start_n_l.png");
        $(".starts div > img").eq(0).attr("src", "${cms}/wechat/img/start_d_l.png");
        score = 1;
        console.log(score);
    });

    $("#start2").on("click", function(){
        $(".starts div > img").attr("src", "${cms}/wechat/img/start_n_l.png");
        for(var i=0; i<2; i++){
            $(".starts div > img").eq(i).attr("src", "${cms}/wechat/img/start_d_l.png");
        }
        score = 2;
        console.log(score);
    });

    $("#start3").on("click", function(){
        $(".starts div > img").attr("src", "${cms}/wechat/img/start_n_l.png");
        for(var i=0; i<3; i++){
            $(".starts div > img").eq(i).attr("src", "${cms}/wechat/img/start_d_l.png");
        }
        score = 3;
        console.log(score);
    });

    $("#start4").on("click", function(){
        $(".starts div > img").attr("src", "${cms}/wechat/img/start_n_l.png");
        for(var i=0; i<4; i++){
            $(".starts div > img").eq(i).attr("src", "${cms}/wechat/img/start_d_l.png");
        }
        score = 4;
        console.log(score);
    });

    $("#start5").on("click", function(){
        $(".starts div > img").attr("src", "${cms}/wechat/img/start_n_l.png");
        for(var i=0; i<5; i++){
            $(".starts div > img").eq(i).attr("src", "${cms}/wechat/img/start_d_l.png");
        }
        score = 5;
        console.log(score);
    });


    $("#textArea").on("input", function(){
        var count = getIptValLen($(this).val());
        if (count < 0){
            count = 0;
        }
        $("#text_count").text(+count+" / 140");
    });

    $("#order_submit").on("click", function(){
        $(".xq_modal").css("display","block").animate({opacity:1},170,"swing").next(".xq_modal_back").css("display","block").animate({opacity:.5},170,"swing");
        $("body").css({"overflow":"hidden"});
        $(".xq_modal_contant").css("display","block").animate({height:'5rem'},170,"swing");
    });

    
    $("#submit_button").on("click", function(){
        console.log("submit click");
        var oId=${orderInfo.order.oId};
        var uUid=${orderInfo.order.uUid};
        var content=$("#textArea").val();
        
        console.log("score="+score);
        console.log("oId="+oId);
        console.log("uUid="+uUid);
        console.log("content="+content);

        var data = {
            cmScore:2*score,
            cmContent:$("#textArea").val(),
            oId:oId,
            uUid:uUid
        }

        $.ajax({
        	type: "post",
        	url:"${cms}/wx/order/commitComment.do",
            dataType: "json",
            contentType:"application/json",
            async:false,
        	data:JSON.stringify(data),
        	success:function(data){
        		console.log("data="+data);
        		if(data==1){
        			alert("感谢您的评价");
        			//window.location.reload(); 
        			WeixinJSBridge.call('closeWindow');
        		}else{
        			alert("评价失败 请重新评价");
        		}
        		
        		}
        	
        	
        });
    });

    $("#cancel_button").on("click", function(){
        $(".xq_modal").css("display","none").animate({opacity:0},50,"swing").next(".xq_modal_back").css("display","none").animate({opacity:0},50,"swing");
        $("body").css({"overflow":"visible","padding-right":0});
        $(".xq_modal_contant").animate({height:0},0,"swing");
    });

    function getIptValLen(valStr) {
        var enterVal = valStr.split(/\n|\r/);
        $.each(enterVal, function (i, v) {
            if (i > 0) {
                v === "" ? enterVal[i] = "00" : enterVal[i] = "00" + v;
            }
        })
        return enterVal.join("").length;
    }
</script>
</body>
</html>