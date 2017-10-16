<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="/common/taglibs.jsp"%>
	<head>
		<meta charset="UTF-8">

		<script src="${cms}/wechat/build/flexible_css.js" type="text/javascript" charset="utf-8"></script>
		<script src="${cms}/wechat/scripts/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="${cms}/activity/mobile-datect.js" type="text/javascript" charset="utf-8"></script>
		<script src="${cms}/wechat/build/flexible.js" type="text/javascript" charset="utf-8"></script>
		<title>您的优惠</title>
		<style type="text/css">
			*{margin: 0;padding: 0;}
			body,html{width: 100%;height: 100%;background: #1b6bff;}
			img{width: 100%;height: 100%;}
			p{width: 5.786rem;margin: auto;text-align: center;font-size: 0.533rem;color: #916612;position: absolute;z-index: 999;top: 7.36rem;left:50%;margin-left: -2.893rem;line-height: 0.85rem;}
			span,em{color: #de3b2a;}
			.p1{top: 9.5rem;}
		</style>
	</head>
	<body>
		<img src="${cms}/activity/weixinbeijing.jpg"/>
		<c:if test="${area eq 0}">
			<p class="p2">企业购买创新创业服务 可享<em>5</em><em>~</em><em>6</em>折优惠</p>
			<p class="p1">最高优惠额度<span><em>20</em>万元 </span></p>
		</c:if>
		<c:if test="${area eq 1}">
			<p class="p2">企业购买创新创业服务 可享<em>7</em><em>~</em><em>8</em>折优惠</p>
			<p class="p1">最高优惠额度<span><em>10</em>万元 </span></p>
		</c:if>
	</body>
<script type="text/javascript">
	Array.prototype.contains = function(needle) {
	for (i in this) {
	if (this[i].indexOf(needle) > 0)
	return i;
	}
	return -1;
	}
	var device_type = navigator.userAgent;//获取userAgent信息
	var md = new MobileDetect(device_type);//初始化mobile-detect
	var os = md.os();//获取系统
	var model = "";
	if (os == "iOS") {//ios系统的处理
	os = md.os() + md.version("iPhone");
	model = md.mobile();
	} else if (os == "AndroidOS") {//Android系统的处理
	os = md.os() + md.version("Android");
	var sss = device_type.split(";");
	var i = sss.contains("Build/");
	if (i > -1) {
	model = sss[i].substring(0, sss[i].indexOf("Build/"));
	}
	}
	var mode=model.split("");
	if (mode[1]=="M" && mode[2]=="i" && mode[4]=="N" && mode[5]=="o" && mode[6]=="t" && mode[7]=="e" && mode[9]=="2") {
	$(".p2").css("top","5rem")
	$(".p1").css("top","7rem")
	}
</script>
</html>
