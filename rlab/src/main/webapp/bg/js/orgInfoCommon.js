/**
 * 初始化机构列表
 */
function initOrgList() {
    $.ajax({
        url: BASE_URL + "/bg/share/queryorg?key=",
        type: 'get',
        dataType: 'json',
        contentType: 'application/json',
        success: function (data) {
            var list;
            var orgListTag = $("#orgList");
            var itemHtml;
            if (data.code === 0 && data.payload.length > 0) {
                list = data.payload;
                orgListTag.append('<option value="">请选择机构</option>');
                for (var i = 0; i < list.length; i++) {
                    if (list[i].orgName === OTHER_CONFIG.PARENT_NAME_ORG_NAME) {
                        itemHtml = '<option selected value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                    } else {
                        itemHtml = '<option  value="' + list[i].orgOid + '">' + list[i].orgName + '</option>';
                    }
                    orgListTag.append(itemHtml);
                }
                form.render("select");
            } else {
                layer.msg("机构获取失败，请刷新页面");

            }

        },
        error: function () {
            layer.msg("机构获取失败，请刷新页面");
        }
    });
}
/*
 ** 勾选资质，并点击保存资质
 */
function saveFiled() {

    var checkedsIpt = $("#filedList input[name=qualifications]:checked");
    var qftList = $("#qftList");
    var html = '';
    if (checkedsIpt.length > 8) {
        alert("最多选择8条资质");
        return false;
    }

    qftList.empty();// 清空列表
    for (var i = 0; i < checkedsIpt.length; i++) {

        if ($(checkedsIpt[i]).data("src")) {
            html =
                ' <div class="item">\
                    <p>' + checkedsIpt[i].value + '</p>\
                    <div class="qualification">\
                     <i class="layui-icon" onclick="removeImgSrc(this)" data-default-src="' + BASE_URL + '/bg/img/add_status_default.png">&#x1007;</i>\
                     <img src="' + $(checkedsIpt[i]).data("src") + '">\
                     <input data-qft-id="' + $(checkedsIpt[i]).data("qftId") + '" data-qft-name="' + checkedsIpt[i].value + '"  onchange="uploadImg(this)"   data-up-type="other" name="qualifications" accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">\
                    </div>\
                </div>';

        } else {
            html =
                ' <div class="item">\
                    <p>' + checkedsIpt[i].value + '</p>\
                    <div class="qualification">\
                    <i class="layui-icon" onclick="removeImgSrc(this)" data-default-src="' + BASE_URL + '/bg/img/add_status_default.png">&#x1007;</i>\
                    <img src="' + BASE_URL + '/bg/img/add_status_default.png">\
                    <input  data-qft-name="' + checkedsIpt[i].value + '"  data-up-type="other"  onchange="uploadImg(this)" name="qualifications" accept="image/jpg,image/jpeg,image/png,image/bmp" type="file">\
                    </div>\
                </div>';

        }

        qftList.append(html);

    }

    return true;
}
/**
 * 选择使用标签
 */
function choseTagFactory() {

    var fieldLayer = layer.open({
        title: false,
        type: 1,
        area: ['500px', '300px'],
        skin: 'label_modal',
        content: '\
                <div style="padding:0 20px;width: 600px; height: 400px; background-color: #fff; overflow: hidden;">\
                <p style=" margin-top: 10px">选择资质: (可多选，最多选择8个)</p>\
                <div id="filedList" style=" margin-top: 5px;overflow-y:auto;height: 210px;background:#f4f5f5;">\
                </div>\
                    <div style="padding: 20px 0;border-top:1px solid #eee;border-bottom:1px solid #eee" >\
                        <p style="height: 30px; line-height: 30px; display: inline-block">添加资质: </p>\
                        <input id="addFiledIpt" type="text" style="width: 100px; height: 30px; margin-left: 15px;border: 1px solid #b0b0b0;">\
                        <button id="addFiled" class="layui-btn layui-btn-small"  style="margin-left: 5px;">添 加</button>\
                    </div>\
                    <div style="margin: 0 auto;text-align:center;padding: 20px 0; overflow: hidden">\
                        <button id="closeFiled" class="layui-btn layui-btn-primary" style="margin-right: 10px" >取消</button>\
                        <button id="saveFiled" class="layui-btn layui-btn-normal">保存标签</button>\
                    </div>\
                </div>'
    });

    // 初始化时，是从后台拿数据的，拿数据时判断一下是否和这里面的三个值相等，相等的话就渲染为checked 默认选中
    getIdentify(function (data) {

        var flag = true;// 标记状态，默认为选中
        if (data.code === 0 && data.payload.length > 0) {
            var fileList = $("#filedList");
            var qftLists = $("#qftList").find("input");

            for (var i = 0; i < data.payload.length; i++) {
                flag = true;
                qftLists.each(function () {
                    if ($.trim($(this).data('qftName')) == data.payload[i].orgCertificateName) {
                        fileList.append(
                            '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                                 <input data-qft-id="' + $(this).data('qftId') + '" data-src="' + $(this).prev("img").attr("src") + '" checked data-qft-name="' + data.payload[i].name + '"  type="checkbox" name="qualifications" value="' + data.payload[i].orgCertificateName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                  <p style="display: inline-block;">' + data.payload[i].orgCertificateName + '</p>\
                                </div>')
                        flag = false;
                        return false;
                    }
                });

                // 不是库里的
                if (flag) {
                    fileList.append(
                        '<div style="min-width: 24%; line-height: 27px;display: inline-block; margin-top: 5px;padding: 0 5px;">\
                            <input  data-qft-id="' + data.payload[i].orgCertificateId + '" type="checkbox" name="qualifications" value="' + data.payload[i].orgCertificateName + '" style="display: inline-block;height: 14px;width: 14px;" >\
                                    <p style="display: inline-block;">' + data.payload[i].orgCertificateName + '</p>\
                                </div>')
                }

            }

        }

    });

    // 給添加按钮注册事件
    $("#addFiled").off("click").on("click", function () {
        var iptVal = $.trim($("#addFiledIpt").val()),
            isExisting = false;

        // 校验是否为空
        if (iptVal == '') {
            layer.msg("新标签名不能为空");
            return false;
        }

        // 校验是否重复
        $("input[name=qualifications]").each(function (index, val) {
            if (iptVal === this.value) {
                isExisting = true;
                return false;
            }
        })

        if (isExisting === true) {
            layer.msg("该标签名已存在");
            return false;
        }

        // 发送ajax，成功回调里添加到页面中；
        addIdentify(iptVal, function (data) {

            if (data.code === 0) {
                if ($("#filedList input[name=qualifications]:checked").length < 8) {
                    $("#filedList").append('\
                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block" checked>\
                            <p style="display: inline-block">' + iptVal + '</p>')
                } else {

                    $("#filedList").append('\
                            <div style="min-width: 20%; display: inline-block; margin-top: 5px; padding: 0 5px;">\
                                <input type="checkbox" name="qualifications" value="' + iptVal + '" style="display: inline-block">\
                            <p style="display: inline-block">' + iptVal + '</p>')
                }

            }
        })


    });

    // 给取消按钮注册事件
    $("#closeFiled").off("click").on("click", function () {
        layer.close(fieldLayer);
    });

    // 给保存共享信息注册事件
    $("#saveFiled").off("click").on("click", function () {
        var flag = saveFiled();
        if (flag) {
            layer.close(fieldLayer);
        }
    });

}
/*
 ** 添加一条资质到资质库
 */
function addIdentify(name, success, error) {
    $.ajax({
        url: BASE_URL + "/bg/org/OrgcertificateTmp/add?name=" + name,
        type: 'post',
        dataType: 'json',
        contentType: 'application/json',
        success: function (data) {
            success(data);
        },
        error: function () {
            layer.msg("机构获取失败，请刷新页面");
        }
    })
}
/*
 ** 获取资质库的所有资质
 */
function getIdentify(success, error) {
    $.ajax({
        url: BASE_URL + "/bg/org/OrgcertificateTmp/query",
        type: 'get',
        dataType: 'json',
        contentType: 'application/json',
        success: function (data) {
            success(data);
        },
        error: function () {
            layer.msg("机构获取失败，请刷新页面");
        }
    })
}

/*
 ** 发送Ajax获取城市列表
 */
function getCity(cityId, cb) {

    $.ajax({
        url: BASE_URL + '/bg/org/city?id=' + cityId,
        async: false,
        type: 'GET',
        dataType: "json",
        contentType: "application/json",
        success: function (data) {
            if (data.code === 0 && data.payload.length > 0) {

                cb(data.payload);

            } else {
                // layer.msg("网络繁忙，请重新选择城市");
            }
        },
        error: function (err) {
            // layer.msg("网络繁忙，请重新选择城市");
        }

    });

}
/*
 ** 处理省ID
 */
function dealProvinceId(provinceId, cb) {

    var cityList;

    if (provinceId == 110000) {
        cityList = [{
            name: "北京市",
            id: 110000
        }]
        cb(cityList);
    } else if (provinceId == 120000) {
        cityList = [{
            name: "天津市",
            id: 120000
        }]
        cb(cityList);
    } else if (provinceId == 310000) {
        cityList = [{
            name: "上海市",
            id: 310000
        }]
        cb(cityList);

    } else if (provinceId == 500000) {
        cityList = [{
            name: "重庆市",
            id: 500000
        }]
        cb(cityList);

    } else {

        getCity(provinceId, function (cityList) {
            cb(cityList);
        })

    }
}
/**
 * 填充城市（市级别）
 */
function fillCity1(cityList) {

    var cityDom = $("#city1");

    for (var i = 0; i < cityList.length; i++) {
        cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
    }

    form.render("select");
}

function fillCity1_cb(cityList, cityName) {

    var cityDom = $("#city1");

    for (var i = 0; i < cityList.length; i++) {
        if(cityName==cityList[i].name){
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '" selected>' + cityList[i].name + '</option>');
        }else {
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>')
        }
    }

    form.render("select");
}
/**
 * 填充城市（县级别）
 */
function fillCounty1(countyList) {

    var countyDom = $("#county1");

    for (var i = 0; i < countyList.length; i++) {
        countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
    }

    form.render("select");
}
function fillCounty1_cb(countyList,cityName) {

    var countyDom = $("#county1");

    for (var i = 0; i < countyList.length; i++) {
        if(cityName==countyList[i].name){
            countyDom.append('<option  value="' + countyList[i].name + '" selected>' + countyList[i].name + '</option>');
        }else {
            countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
        }
    }

    form.render("select");
}
/**
 * 填充城市（市级别）
 */
function fillCity(cityList) {

    var cityDom = $("#city");

    for (var i = 0; i < cityList.length; i++) {
        cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
    }

    form.render("select");
}
function fillCity_cb(cityList, cityName) {

    var cityDom = $("#city1");

    for (var i = 0; i < cityList.length; i++) {
        if(cityName==cityList[i].name){
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '" selected>' + cityList[i].name + '</option>');
        }else {
            cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>')
        }
    }

    form.render("select");
}
/**
 * 填充城市（县级别）
 */
function fillCounty(countyList) {

    var countyDom = $("#county");

    for (var i = 0; i < countyList.length; i++) {
        countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
    }

    form.render("select");
}
function fillCounty_cb(countyList,cityName) {

    var countyDom = $("#county1");

    for (var i = 0; i < countyList.length; i++) {
        if(cityName==countyList[i].name){
            countyDom.append('<option  value="' + countyList[i].name + '" selected>' + countyList[i].name + '</option>');
        }else {
            countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
        }
    }

    form.render("select");
}
/**
 * 机构创建者输入框，失去焦点触发事件
 */
function creatorIptBlur($this) {

    var $this = $($this),
        $val = $this.val();
    $("#putForm").attr("disabled", "disabled");// 禁用按钮
    $("#putForm").addClass("layui-btn-disabled");// 禁用按钮样式

    // 如果不为空
    if ($val != "") {
        $.ajax({
            url: BASE_URL + '/bg/user/find?mobile=' + $val,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            success: function (data) {

                if (data.code === 0 && data.payload != null) {
                    $("#putForm").removeAttr("disabled");// 禁用按钮
                    $("#putForm").removeClass("layui-btn-disabled");// 禁用按钮样式
                    $("#uUid").data("uUid", data.payload.uUid)
                } else {
                    // 该用户不存在，请
                    //墨绿深蓝风
                    layer.alert('用户不存在，请填写已注册用户手机号', {
                        skin: 'layui-layer-molv' //样式类名
                        , closeBtn: 0
                    });
                }

            },
            error: function (err) {

                // layer.msg("网络繁忙，请重新选择城市");
            }
        });
    } else {
        $("#putForm").removeAttr("disabled");// 禁用按钮
        $("#putForm").removeClass("layui-btn-disabled");// 禁用按钮样式
    }

}
/**
 * 机构创建者输入框，获取焦点触发事件
 */
function creatorIptFocus() {

}
/**
 * 移除一行联系电话
 */
function removePhoneRow($this) {
    var $this = $($this);
    $this.parent().remove();
}
/**
 * 添加一行联系电话
 */
function addRowPhone() {
    if ($("#orgPhone .phone_row").length < 5) {
        $("#orgPhone").append('<div class="phone_row" style="margin-bottom: 10px">\
            <input class="lab_input_base lab_input_middle" type="text" placeholder="电话...">\
            <button onclick="removePhoneRow(this)"><i class="layui-icon">&#xe640;</i> 删除</button>\
        </div>');
    } else {
        layer.msg("最多添加5条机构电话");
    }
}
/*
 ** 获取上传文件的本地URL
 */
function getObjectURL(file) {

    var url = null;
    if (window.createObjectURL != undefined) { // basic
        url = window.createObjectURL(file);
    } else if (window.URL != undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file);
    } else if (window.webkitURL != undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file);
    }
    return window.URL.createObjectURL(file);

}
// isDefaultImg("/bg/img/add_license_default.png");
// 提交时判断图片是否为默认图片
function isDefaultImg(src) {
    if (src.slice(-11, -4) === "default") {
        return false;
    }
    return true;
}
// 移除Logo的Src
function removeLogoImgSrc($this, event) {
    event = event || window.event;
    event.stopPropagation();
    JcropResult.x = "",
        JcropResult.y = "",
        JcropResult.w = "",
        JcropResult.h = "",
        JcropResult.src = "",
        $($this).parent().find("img").attr("src", $($this).data("defaultSrc"));

}
// 移除IMG里面的Src
function removeImgSrc($this, event) {
    var e = event || window.event;
    if (e.stopPropagation) {
        e.stopPropagation();
    } else {
        e.cancelBubble = true;
    }
    console.log(e.stopPropagation)
    // console.log($($this).parent().find("img"));
    $($this).parent().find("img").attr("src", $($this).data("defaultSrc"));
}
