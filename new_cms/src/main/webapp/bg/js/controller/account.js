var laypage = new Function();
$(function () {
    layui.use(['laypage', 'layer'], function () {
        laypage = layui.laypage;
    });
    getselect();
    updateAccountStatus();
});

// 检索
$("#searching").on("click", function () {

    var name = escape($("#inpName").val());
    name=name.replace(/\+/g, "%2B");

    var coId=$(".selectCoupon div").attr("data-user-info");
    getAccountList(1, 7, coId, name, laypage);

})

//全选
$('#CheckAll').click(function () {
    $('input[name="subbox"]').prop("checked", this.checked);
    $(".noopt").prop("checked", "")
});

//下拉列表获取
function getselect() {

    $.ajax({
        type: "get",
        url: "/wx/activity/getTicketInfo.do",
        async: true

    }).done(function (data) {

        var html='<li data-user-info="0">全部</li>';
    	for (var i=0; i<data.payload.length; i++){
    		html+='<li data-user-info="'+data.payload[i].oCid+'">'+data.payload[i].oCouponName+'</li>';
    	}
    	$(".selectCoupon").find("ul").html(html);
    	$(document).mouseup(function(e){
			if (!$(".selectCoupon").is(e.target) && $(".selectCoupon").has(e.target).length === 0) {
				$(".selectCoupon ul").hide();
			}
		})
    	$(".selectCoupon").on("click", function(e){
    		if ($(this).find("ul").css("display") == "none"){
	        	$(".selectCoupon ul").show();
	        }else {
	           $(".selectCoupon ul").hide();
	        }
	        $(".selectCoupon div").html(e.target.html);
	    });
	    $(".selectCoupon ul li").on("click",function(e){
	    	$(".selectCoupon div").text($(this).text()).attr("data-user-info",$(this).data("userInfo"));
	    })

    }).fail(function (data) {

    });

}


// 获取优惠券列表
function getAccountList(pageNo, pageSize, coId, name, laypage) {

    $.ajax({

        type: "get",
        url: '/wx/activity/getScreenTicket.do?searchMsg=' + name + '&coId=' + coId + '&pageNo=' + pageNo + '&pageSize=' + pageSize + '&_mm=' +  new Date().getTime(),

    }).done(function (data) {

        if (data.code === 0) {

            var html = '';
            var list = data.payload.content;
            for (var i = 0; i < list.length; i++) {
                var state = "";
                if (list[i].cState == 0) {
                    state = "正常";
                } else if (list[i].cState == 1) {
                    state = "已使用";
                } else {
                    state = "已过期";
                }

                html += '<tr class="trs">\
					        <td><div class="chex">\
					        	<input type="checkbox" name="subbox">\
					        	<div class="shade"></div>\
					        </div>\
					        </td>\
					        <td class="listname" data-user-info="' + list[i].uId + '">' + list[i].uName + '</td>\
					        <td>' + list[i].uPhone + '</td>\
					        <td class="coId" data-user-info="' + list[i].coId + '">' + list[i].cName + '</td>\
					        <td class="cState" data-user-info="' + list[i].cState + '">' + state + '</td>\
					        <td style="color: #2fcba8; position: relative; cursor: pointer" class="td">\
					        	<div class="handovers">切换创新券状态<img src="../imgs/icon/list_arrow.png">\
					            	<ul class="ticket_details_tr_ul">\
					                	<li data-index="1" class="activated">已过期</li>\
					                	<li data-index="2" class="">已使用</li>\
				           			 </ul>\
					        	</div>\
					            <div class="shade"></div>\
					        </td>\
					      </tr>';
            }

            $(".couponMain").find("tbody").html(html);
            updateAccountStatus();
            for (var i = 0; i < $(".trs").length; i++) {
                if ($(".trs").eq(i).find(".cState").html() == "已过期" || $(".trs").eq(i).find(".cState").html() == "已使用") {
                    var bg = $(".trs").eq(i).css("background-color");
                    $(".trs").eq(i).find(".shade").css("background-color", bg)
                    $(".trs").eq(i).find("input").attr("class", "noopt")
                    $(".trs").eq(i).find(".shade").show();
                    $(".noopt").prop("checked", "")
                }
            }

            // 分页
            if (laypage) {

                var page = data.payload.total;
                laypage({
                    cont: 'demo',
                    pages: page,//总页数
                    jump: function (obj, first) {
                        // var name = encodeURI($("#inpName").val());
                        // var coId = $(".typeInp select option:selected").val();
                        getAccountList(obj.curr, 7, coId, name);

                    }
                });

            }

        } else {
            layer.msg("列表获取失败");
        }

    }).fail(function (data) {
        layer.msg("列表获取失败");
    });
}

// 更新优惠券状态
function updateAccountStatus() {

    //修改过期与使用
    $(document).off().mouseup(function (e) {
        if (!$(".td").is(e.target) && $(".td").has(e.target).length === 0) {
            $(".ticket_details_tr_ul").hide();
        }
    })

    $(".handovers").off().on("click", function (e) {

        if ($(this).find("ul").css("display") == "none") {
            $(".ticket_details_tr_ul").hide();
            $(this).find("ul").css("display", "block");
        } else {
            $(".ticket_details_tr_ul").hide();
        }

    });

    //过期与使用
    $(".ticket_details_tr_ul").off().on("click", function (e) {

        //所有
        var that = $(this);
        if (that.attr("id") == "numss") {
            var ucState;
            if (e.target.textContent == "已使用") {
                ucState = 1;
            } else {
                ucState = 2;
            }
            ;
            var objs = [];
            $('input:checkbox[name=subbox]:checked').each(function (i) {
                var uId = $(this).parents(".trs").find(".listname").data("userInfo");
                var coId = $(this).parents(".trs").find(".coId").data("userInfo");

                var obj = {
                    uId: uId,
                    coId: coId,
                    ucState: ucState
                };
                objs.push(obj);
                $(this).parents(".trs").find("td").eq(4).html(e.target.textContent);
                var bg = that.parents("tr").css("background-color");
                $(this).parents(".trs").find(".shade").css("background-color", bg)
                $(this).parents(".trs").find("input").attr("class", "noopt")
                $(this).parents(".trs").find(".shade").show();
                $(".noopt").prop("checked", "")
            })

            $.ajax({

                type: "post",
                url: "/wx/activity/updateTicketInfo.do",
                data: JSON.stringify(objs),
                contentType: "application/json"

            }).done(function (data) {
                console.log("todo2");
                console.log(data);

            }).fail(function (data) {
                console.log('失败1')
            })

        } else {

            var ucState;
            if (e.target.textContent == "已使用") {
                ucState = 1;
            } else {
                ucState = 2;
            }

            var uId = that.parents(".trs").find(".listname").data("userInfo");
            var coId = that.parents(".trs").find(".coId").data("userInfo");
            var arr = [{
                uId: uId,
                coId: coId,
                ucState: ucState
            }];

            $.ajax({
                type: "post",
                url: "/wx/activity/updateTicketInfo.do",
                data: JSON.stringify(arr),
                contentType: "application/json"

            }).done(function (data) {


                that.parents(".trs").find("td").eq(4).html(e.target.textContent);
                var bg = that.parents("tr").css("background-color");
                that.parents(".trs").find(".shade").css("background-color", bg)
                that.parents(".trs").find("input").attr("class", "noopt")
                that.parents(".trs").find(".shade").show();
                $(".noopt").prop("checked", "")

            }).fail(function (data) {
                console.log('失败2')
            })
        }
    })

}