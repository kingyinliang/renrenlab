<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="/common/taglibs.jsp"%>
	<head>
		<meta charset="UTF-8">
		<!--<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />-->
		<script src="${cms}/wechat/build/flexible_css.js" type="text/javascript" charset="utf-8"></script>
		<script src="${cms}/wechat/build/flexible.js" type="text/javascript" charset="utf-8"></script>
		<script src="${cms}/wechat/scripts/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<title>企业问卷</title>
		<style type="text/css">
			*{margin: 0;padding: 0;}
			body,html{background: #6262fa;}
			img{width: 100%;z-index: -1;}
			#main{width: 95%;background: white;padding: 0.5468rem 0.28rem;box-sizing: border-box;margin: auto;border-radius: 15px;margin-top: -4.5rem;position: relative;font-size: 0.32rem;margin-bottom: 0.6rem;}
			p{color: #666666;line-height: 0.6rem;}em{color: #de3b2a;}
			.tit{width: 0.42rem;height: 0.42rem;display: inline-block;background: #649af1;color: white;text-align: center;line-height: 0.42rem;border-radius:50% ;margin-right: 0.2rem;}
			.tits{color: #333333;margin-top: 0.3rem;border-bottom: 3px solid #e1e7ef;line-height: 0.9rem;}
			input{width: 0.3rem;height: 0.3rem;}
			.input{color: #333333;background: #e9edf4;line-height: 0.906rem;margin-top: 0.4rem;padding-left: 0.3rem;}
			.input input{width: 50%;height: 100%;background: #e9edf4;border: none;}
			.radio span{float: right;margin-right: 0.5rem;}
			.save{width: 5.067rem;height: 1.067rem;line-height: 1.067rem;text-align: center;margin: auto;background: #649af1;color: white;margin-top: 0.9rem;margin-bottom: 0.2rem;border-radius: 0.1rem;}
			#shade{width: 100%;height: 100%;background: rgba(0,0,0,0.6);position: fixed;top: 0;left: 0;display:none}
			#shadeMain{position: absolute;top: 50%;left: 50%;width: 6.16rem;height: 4.053rem;margin-left: -3.08rem;margin-top: -2.0265rem;background: white;border-radius: 0.2rem;}
			.shadetit1{margin-top: 1.12rem;text-align: center;font-size: 0.37rem;color: #333333;}
			.shadetit2{margin-top: 0.37rem;text-align: center;font-size: 0.32rem;color: #717171;}
			#shade a{font-size: 0.3467rem;text-align: center;line-height: 0.773rem;display: inline-block;width: 2.4rem;height: 0.773rem;border-radius: 0.3865rem;}
			.cancel{margin-left: 0.52rem;background: white;color: #9c9c9c;border: 0.013rem solid #e9e9e9;margin-right: 0.32rem;}
			.saves{background: #649af1;color: white;}
			#toast{width: 6rem;border-radius: 0.1rem; background: rgba(0,0,0,0.6);position: fixed;top: 50%;left: 50%;margin-left: -3rem;display: none;}
			#toast p{text-align: center;font-size: 0.32rem;color: white;line-height: 1rem;}

		</style>
	</head>
	<body>
		<img src="${cms}/activity/weixinheard.jpg"/>
		<div id="main">
			<p>请填写相关信息，查询您的企业是否具备创新券领取资格、优惠 折扣和额度上限等信息（以下选项均为必填）</p>
			<p style="margin-top: 0.53rem;color: #333333;"><span class="tit">1</span>企业名称<em>*</em> </p>
			<p class="input"><input type="text" id="pubOrgName" placeholder="请输入企业名称"  maxlength="25"/></p>
			<p class="tits" style="border: 0;"><span class="tit">2</span>联系人姓名 <em>* </em></p>
			<p class="input"><input type="text" id="pubContactName" placeholder="请输入联系人姓名"  maxlength="20"/></p>
			<p class="tits" style="border: 0;"><span class="tit">3</span>联系人手机号 <em>* </em></p>
			<p class="input"><input type="text" id="pubContactPhone" placeholder="请输入联系人手机号"  maxlength="11"/></p>
			<p class="tits"><span class="tit">4</span>您所在企业的注册地区<span style="color: #999999;">（单选）</span> <em>* </em></p>
			<p class="radio">北京市昌平区内<span><input type="radio" name="pubDistrict" data-true="0"/></span></p>
			<p class="radio">北京市昌平区外<span><input type="radio" name="pubDistrict" data-true="1"/></span></p>
			<p class="tits"><span class="tit">5</span>您所在企业的注册资金<span style="color: #999999;">（单选）</span> <em>* </em></p>
			<p class="radio">1000万元及以下<span><input type="radio" name="pubRegisteredFund" data-true="0"/></span></p>
			<p class="radio">1000~2000万元（包括2000万）<span><input type="radio" name="pubRegisteredFund" data-true="1"/></span></p>
			<p class="radio">2000~3000万元（包括3000万）<span><input type="radio" name="pubRegisteredFund" data-true="2"/></span></p>
			<p class="radio">3000万元以上<span><input type="radio" name="pubRegisteredFund" data-true="3"/></span></p>
			<p class="tits"><span class="tit">6</span>您所在企业的职工人数<span style="color: #999999;">（单选）</span> <em>* </em></p>
			<p class="radio">20人以下<span><input type="radio" name="pubStaffNum" data-true="0"/></span></p>
			<p class="radio">20~100人<span><input type="radio" name="pubStaffNum" data-true="1"/></span></p>
			<p class="radio">101~500人<span><input type="radio" name="pubStaffNum" data-true="2"/></span></p>
			<p class="radio">500人以上<span><input type="radio" name="pubStaffNum" data-true="3"/></span></p>
			<p class="tits"><span class="tit">7</span>您所在企业的近两年营业收入情况<span style="color: #999999;">（单选）</span> <em>* </em></p>
			<p class="radio" style="color: #333333;">1）2016年营业收入 </p>
			<p class="radio">500万元以下<span><input type="radio" name="pubTaking" data-true="0"/></span></p>
			<p class="radio">500~1000万元（不包括1000万）<span><input type="radio" name="pubTaking" data-true="1"/></span></p>
			<p class="radio">1000~2000万元（不包括2000万）<span><input type="radio" name="pubTaking" data-true="2"/></span></p>
			<p class="radio">2000万元及以上<span><input type="radio" name="pubTaking" data-true="3"/></span></p>
			<p class="radio" style="color: #333333;margin-top: 0.5rem;">2）2015年营业收入  </p>
			<p class="radio">500万元以下<span><input type="radio" name="pubLastTaking" data-true="0"/></span></p>
			<p class="radio">500~1000万元（不包括1000万）<span><input type="radio" name="pubLastTaking" data-true="1"/></span></p>
			<p class="radio">1000~2000万元（不包括2000万）<span><input type="radio" name="pubLastTaking" data-true="2"/></span></p>
			<p class="radio">2000万元及以上<span><input type="radio" name="pubLastTaking" data-true="3"/></span></p>
			<p class="save" onclick="show()">提交审核</p>
		</div>
		<div id="shade">
			<div id="shadeMain">
				<p class="shadetit1">是否确认提交</p>
				<p class="shadetit2">企业预审核信息提交后不可修改</p>
				<p style="margin-top: 0.293rem;"><a class="cancel" onclick="cancel()">返回修改</a><a class="saves" onclick="save()">确认提交</a></p>

			</div>
		</div>
		<div id="toast">
			<p>您已提交过预审核信息，请勿重复操作~</p>
		</div>

	</body>
	<script type="text/javascript">
		function show() {
			$("#shade").show();
        }

        function cancel() {
            $("#shade").hide();
        }

		function save(){
			var seve=false;
			var pubOrgName=$("#pubOrgName").val();
			var pubContactName=$("#pubContactName").val();
			var pubContactPhone=$("#pubContactPhone").val();
			var pubDistrict=$("input[name=pubDistrict]:checked").data("true");
			var pubRegisteredFund=$("input[name=pubRegisteredFund]:checked").data("true");
			var pubStaffNum=$("input[name=pubStaffNum]:checked").data("true");
			var pubTaking=$("input[name=pubTaking]:checked").data("true");
			var pubLastTaking=$("input[name=pubLastTaking]:checked").data("true");
            var regPhone = /^0?(10|13|15|18|14|17)[0-9]{9}$/;
            if (!regPhone.test(pubContactPhone)) {
                alert("手机号填写错误");
                return;
            }


			if ($("input:checked").length==5 && pubOrgName!="" && pubContactName!=""&& pubContactPhone!="") {
				if (pubRegisteredFund<="2"&&pubStaffNum<="1"&&pubTaking<="1"&&pubLastTaking<="1") {
					seve=true;
				}else{
					seve=false;
				}
			} else{
				alert("有选项未填写")
				return;
			}
			if (seve) {
                var data = {
                    pubOrgName:pubOrgName,
                    pubDistrict:pubDistrict,
                    pubRegisteredFund:pubRegisteredFund,
                    pubStaffNum:pubStaffNum,
                    pubTaking:pubTaking,
                    pubLastTaking:pubLastTaking,
                    pubContactName:pubContactName,
                    pubContactPhone:pubContactPhone,
                };
				$.ajax({
					url:"${cms}/wx/publish/result.do",
					type:'post',
					dataType:"json",
					contentType:'application/json',
					data:JSON.stringify(data),
					async:false
				}).done(function (data) {
                    if (data.code == 200) {
                        window.location.href = '${cms}/wx/publish/result.do?area='+pubDistrict;
                    }
                    if (data.code == 201) {
                        $("#toast").fadeIn(1000);
                        setTimeout(function(){
                            $("#toast").fadeOut(1000)
                        },2000)

                    }
                }).fail(function (data) {
                    alert("保存失败")
                });
			}else{
				window.location.href="../../activity/errorActivity.jsp"
			}
		}
	</script>
</html>
