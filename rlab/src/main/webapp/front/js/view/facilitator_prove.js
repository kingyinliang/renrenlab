var layer, layedit, ditIndex;
layui.use(['form', 'layedit', 'layer'], function () {
    layer = layui.layer;
    form = layui.form();
    layedit = layui.layedit;
    // 监听省1（注册地）
    form.on('select(province1)', function (data) {
        $("#orgAd1Tip").hide();// 隐藏error提示

        $("#city_1").html('<option value="">请选择市</option>'); // 初始化市
        $("#county_1").html('<option value="">请选择县/区</option>');// 初始化县
        // 获取到省份ID
        var provinceId = $("#province_1").find("option:selected").data("provinceId");
        dealProvinceId(provinceId, function (cityList) {
            fillCity1(cityList);
        });

    });

    // 监听市1（注册地）
    form.on('select(city1)', function (data) {
        $("#orgAd1Tip").hide();// 隐藏error提示
        if (!data.value || data.value == 0) {
            return false;
        }


        $("#county_1").html('<option value="">请选择县/区</option>');
        // 获取到cityID
        var countyList;
        var cityId = $("#city_1").find("option:selected").data("cityId");
        getCity(cityId, function (countyList) {
            fillCounty1(countyList);
        })
    });

    // 监听县1（注册地）
    form.on('select(county1)', function (data) {
        $("#orgAd1Tip").hide();// 隐藏error提示

    });

    // 监听省2（所在地）
    form.on('select(province2)', function (data) {
        $("#orgAd2Tip").hide();// 隐藏error提示


        // 更新经纬度
        var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
        if (!flag) {
            searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
        }
        $("#orgJWD2").hide();

        $("#city_2").html('<option value="">请选择市</option>'); // 初始化市
        $("#county_2").html('<option value="">请选择县/区</option>');// 初始化县
        // 获取到省份ID
        var provinceId = $("#province_2").find("option:selected").data("provinceId");

        dealProvinceId(provinceId, function (cityList) {
            fillCity2(cityList);
        });

    });

    // 监听市2（所在地）
    form.on('select(city2)', function (data) {
        $("#orgAd2Tip").hide();// 隐藏error提示

        if (!data.value || data.value == 0) {
            return false;
        }


        // 更新经纬度
        var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
        if (!flag) {
            searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
        }
        $("#orgJWD2").hide();

        $("#county_2").html('<option value="">请选择县/区</option>');
        // 获取到cityID
        var countyList;
        var cityId = $("#city_2").find("option:selected").data("cityId");
        getCity(cityId, function (countyList) {
            fillCounty2(countyList);
        })

    });

    // 监听县2（所在地）
    form.on('select(county2)', function (data) {
        $("#orgAd2Tip").hide();// 隐藏error提示
        // 更新经纬度
        var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
        if (!flag) {
            searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
        }
        $("#orgJWD2").hide();
    });

    // 机构性质监听
    form.on('select(orgNature)', function (data) {
        $("#orgNatureTip").hide();

    });
    // 机构来源
    form.on('select(orgOrigin)', function (data) {

        $("#orgOriginTip").hide();

    });

    // 构建一个编辑器
    ditIndex = layedit.build('LAY_demo1', {
        height: 245,
        color: "#333",
        tool: ['strong', 'italic', 'underline', 'del', '|', 'left', 'center', 'right', '|', 'image'],
        uploadImage: {
            url: BASE_URL + '/front/file/upload/richText',
            type: 'post', //默认post
            before: function (input) {
                //返回的参数item，即为当前的input DOM对象
                console.log('文件上传中');
            },
            success: function (res) {
                console.log('文件上传成功');
                console.log(res);
            }
        }
    });
    if (isLtIE9) {
        JPlaceHolder.init();

    }

});

/*
 ** 发送Ajax获取城市列表
 */
function getCity(cityId, cb) {
    $.ajax({
        url: BASE_URL + '/bg/org/city?id=' + cityId,
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
 * 填充城市（市级别 注册地）
 */
function fillCity1(cityList) {

    var cityDom = $("#city_1");

    for (var i = 0; i < cityList.length; i++) {
        cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
    }

    form.render("select");
}
/**
 * 填充城市（县级别 注册地）
 */
function fillCounty1(countyList) {

    var countyDom = $("#county_1");

    for (var i = 0; i < countyList.length; i++) {
        countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
    }

    form.render("select");
}
/**
 * 填充城市（市级别 所在地）
 */
function fillCity2(cityList) {

    var cityDom = $("#city_2");

    for (var i = 0; i < cityList.length; i++) {
        cityDom.append('<option data-city-id="' + cityList[i].id + '" value="' + cityList[i].name + '">' + cityList[i].name + '</option>');
    }

    form.render("select");
}
/**
 * 填充城市（县级别 所在地）
 */
function fillCounty2(countyList) {

    var countyDom = $("#county_2");

    for (var i = 0; i < countyList.length; i++) {
        countyDom.append('<option  value="' + countyList[i].name + '">' + countyList[i].name + '</option>');
    }

    form.render("select");
}
// 按鈕切換
function changeCheck($this) {
    var checkedFlag = $($this).prop("checked");

    var $_this = $($this);
    if (checkedFlag) {
        $_this.parent().removeClass("checkbox_cancel").addClass("checkbox_checked");
    } else {
        $_this.parent().removeClass("checkbox_checked").addClass("checkbox_cancel");
    }
}
// 三证合一
function slideUp($_this) {
    if ($($_this).prop("checked")) {
        $("#orgPapers2").hide();
        $("#orgPapers3").hide();
    } else {
        $("#orgPapers2").show();
        $("#orgPapers3").show();
    }
}

var map = initMap();
searchByStationName('初始化');
// 失去详细地址的焦点时触发
function updateJingWeiDu() {
    var flag = searchByStationName($("#province_2").val() + $("#city_2").val() + $("#county_2").val() + $("#addressDetail_2").val(), 2);
    if (!flag) {
        searchByStationName($("#province_2").val() + $("#city_2").val(), 2);
    }
}

/**
 * 初始化Map
 * @returns {BMap.Map}
 */
function initMap() {
    var map = new BMap.Map("baidumap");    // 创建Map实例
    map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);  // 初始化地图,设置中心点坐标和地图级别
    map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
    map.setCurrentCity("北京");          // 设置地图显示的城市 此项是必须设置的
    map.enableScrollWheelZoom(true);
    return map;
}
/**
 * 搜索名字
 * @param map
 * @param site
 */
function searchByStationName(keyword, orginBoxType) {
    var localSearch = new BMap.LocalSearch(map);
    localSearch.setSearchCompleteCallback(function (searchResult) {
        try {
            var poi = searchResult.getPoi(0);
        } catch (e) {
            return false;
        }
        if (!poi) {
            return false;
        }
        if (keyword != "初始化") {
            $("#longitude2").val(poi.point.lng.toFixed(2));// 更新视图
            $("#latitude2").val(poi.point.lat.toFixed(2));// 更新视图
        } else {
            return;
        }

        map.centerAndZoom(poi.point, 13);// 配置：更新地图位置
        var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 配置：创建标注，为要查询的地方对应的经纬度
        map.addOverlay(marker);// 添加标注
    });
    localSearch.search(keyword);// 启动查询
    return true;
}
// 选择资质事件
function choseTagFactory() {
    var html = '<div class="zz_modal">\
            <p class="zz_title">选择机构资质：（可多选）</p>\
            <div class="zz_main">\
             <div class="zz_xiao_main">\
                <ul id="filedList">\
                </ul>\
            </div>\
            </div>\
            <div class="zz_add">\
            <p class="add">添加资质</p>\
            <div class="ipt">\
            <div style="float: left;">\
            <input id="addFiledIpt" type="text" placeholder="请输入新的资质">\
            </div>\
            <span id="addFiled" class="add_btn" style="float: left">添加</span>\
            </div>\
            </div>\
            <div class="zz_btn">\
            <button id="closeZzModal" type="button"  style="background: #fff;color: #666;border: 1px solid #c1c1c1;">取消</button>\
            <button id="saveZzModal" type="button" style="margin-left: 60px;background: #508df0;color: #fff;">保存</button>\
            </div>\
            </div>';

    //页面层-自定义
    var my_layer = layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shadeClose: false,
        skin: 'my_zz_modal',
        content: html
    });

    $("#closeZzModal").off("click").on("click", function () {
        layer.close(my_layer)
    })

    $("#saveZzModal").off("click").on("click", function () {
        var flag = saveIdentify();// 保存资质
        if (flag) {
            layer.close(my_layer);
        }

    })
    // 初始化时，是从后台拿数据的，拿数据时判断一下是否和这里面的三个值相等，相等的话就渲染为checked 默认选中
    getIdentify(function (data) {
        var fileList = $("#filedList");
        var qftLists = $("#identifyList .img_item");
//            var checkedsIpt = $("#filedList .ckbox  input:checked");
//            var qftList = $("#identifyList");
        for (var i = 0; i < data.length; i++) {
            // 筛选出已选中的资质，标记为选中状态
            var flag = true;// 重置标记
            qftLists.each(function () {
                var this_name, this_load_type, this_origin_src = "";
                this_name = $.trim($(this).children("i").text());
                this_load_type = $(this).find("input").data("loadType");
                console.log(this_load_type);
                if (this_load_type == 2) {
                    this_origin_src = $(this).find("img").attr("src");
                }
                // 判断是否一致
                if (this_name == data[i].orgCertificateName) {
                    fileList.append(
                        '<li>\
                            <label class="ckbox checkbox_checked">\
                              <input data-load-type="' + this_load_type + '" data-origin-src="' + this_origin_src + '" type="checkbox" onclick="changeCheck(this)" checked>\
                                </label>\
                                <span>' + data[i].orgCertificateName + '</span>\
                        </li>'
                    );
                    flag = false;
                    return false;
                }
            });

            // 不在已选择的资质库中
            if (flag) {
                fileList.append(
                    '<li>\
                        <label class="ckbox checkbox_cancel">\
                          <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this)">\
                        </label>\
                        <span>' + data[i].orgCertificateName + '</span>\
                        </li>'
                );
            }

        }
//            var flag = true;// 标记状态，默认为选中
//            if (data.code === 0 && data.payload.length > 0) {
//
//            }

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
        $("#filedList li > span ").each(function (index, val) {
            if (iptVal === $(this).text()) {
                isExisting = true;
                return false;
            }
        })

        if (isExisting) {
            layer.msg("该标签名已存在");
            return false;
        }

        // 发送ajax，成功回调里添加到页面中；
        addIdentify(iptVal, function (data) {
            if (data.code === 0) {
                if ($("#filedList .ckbox  input:checked").length < 8) {

                    $("#filedList").append(
                        '<li>\
                        <label class="ckbox checkbox_checked">\
                          <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this) " checked>\
                        </label>\
                        <span>' + iptVal + '</span>\
                        </li>'
                    )

                } else {

                    $("#filedList").append(
                        '<li>\
                        <label class="ckbox checkbox_cancel">\
                          <input data-load-type="0" data-origin-src="" type="checkbox" onclick="changeCheck(this) ">\
                        </label>\
                        <span>' + iptVal + '</span>\
                        </li>'
                    )
                }

                $("#addFiledIpt").val("");// 情空输入框
            } else {
                layer.msg("添加失败");
            }
        })

    });
}
/*
 ** 勾选资质，并点击保存资质
 */
function saveIdentify() {
    var checkedsIpt = $("#filedList .ckbox  input:checked");
    var qftList = $("#identifyList");

    var html = '';
    if (checkedsIpt.length > 8) {
        layer.msg("最多选择8条资质")
        return false;
    }

    qftList.empty();// 清空列表

    for (var i = 0; i < checkedsIpt.length; i++) {
        var originSrc = $(checkedsIpt[i]).data("originSrc") ? $(checkedsIpt[i]).data("originSrc") : BASE_URL + "/front/imgs/icon/2_2/add_type2.png";
        var loadType = $(checkedsIpt[i]).data("loadType");// 点击选择，初始化列表时，把loadType初始化上去；

        var html =
            '<div class="img_item">\
                 <label class="ipt_lable">\
                       <span></span>\
                       <img  src="' + originSrc + '">\
                         <form method="post" enctype="multipart/form-data">\
                             <input data-load-type="' + loadType + '"  data-spin="' + BASE_URL + '/front/imgs/icon/2_2/add_type2_loading.gif"  type="file" name="file" onchange="uploadLogos(this)" onclick="clearErrorZZ(this)">\
                         </form>\
                     </label>\
                     <i>' + $(checkedsIpt[i]).parent().parent().find("span").text() + '</i>\
               </div>';
        console.log(html);
        qftList.append(html);
    }
    return true;
}
// 获取资质库
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
            if (data.code === 0) {
                success(data.payload);
            } else if (data.code === 1012) {
                layer.msg("账户未登录或登录超时，请重新登录");
            } else {
                layer.msg("网络繁忙，请重新操作");
            }
        },
        error: function () {
            layer.msg("机构获取失败，请刷新页面");
        }
    })
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
$("input").on("focus", function () {
    var errTag = $(this).next("s.error_tip");
    var flag = errTag.length >= 1 ? true : false;
    if (flag) {
        errTag.hide();
    } else if (isLtIE9 && $(this).parent().parent().next("s.error_tip")) {
        errTag = $(this).parent().parent().next("s.error_tip");
        errTag.hide();
    }
})


// 机构座机添加，删除
function addCallRow() {
    var callItem = '<input onclick="clearFixedPhoneTip()" class="ipt_base" type="text" placeholder="请输入机构座机">';
    var itemNum = $(".org_call > input").length;
    if (itemNum <= 4) {
        $("#addCallBtn").before($(callItem));
    } else {
        layer.msg("最多添加5个手机号");
    }
}
function delCallRow() {
    var itemNum = $(".org_call > input").length;
    if (itemNum > 1) {
        $(".org_call input").last().remove();
    }
}
// 联系人添加
function addPersonRow() {

    var personNum = $(".org_person .person_item").length;
    if (personNum >= 5) {
        layer.msg("最多添加5个联系人");
        return false;
    }

    var html =
        '<div class="person_item">\
        <div class="person_name">\
        <input class="ipt_base" type="text" style="float: left;" placeholder="联系人姓名">\
        <s class="error_tip name_error_tip" style="right:-232px;display: none;">请输入姓名</s>\
        </div>\
        <span class="icon_box" style="float: left;">\
           <i class="down_icon lab-del_type1" onclick="delPersonRow(this)" style="width: 45px;"></i>\
        </span>\
        <div class="person_phone">\
        <div>\
        <input class=" ipt_base" type="text" placeholder="联系人号码" style="float: left;">\
        <s class="error_tip phone_error_tip" style="right:-170px;display: none">请输入正确的手机号码</s>\
        </div>\
        <span class="icon_box" style="position: absolute;right: -68px;top: 0">\
            <i class="up_icon lab-add_type1" onclick="addPersonPhone(this)"></i>\
            <i class="down_icon lab-del_type1" onclick="delPersonPhone(this)"></i>\
        </span>\
        </div>\
        </div>';

    $(".org_person").append(html);

}
// 联系人方式添加：
function delPersonRow($_this) {
    $($_this).parent().parent().remove();
}
function addPersonPhone($_this) {
    var dom = $($_this).parent();
    var callItem =
        '<div>\
        <input class=" ipt_base" type="text" placeholder="联系人号码" style="float: left;">\
        <s  class="error_tip phone_error_tip" style="right:-170px;display: none;">请输入正确的手机号码</s>\
        </div>';


    var itemNum = dom.parent().find("input.ipt_base").length;
    console.log(itemNum);
    if (itemNum <= 4) {
        dom.before(callItem);
    } else {
        layer.msg("每个联系人，最多添加5个手机号");
    }
}
function delPersonPhone($_this) {
    var dom = $($_this).parent();

    var itemNum = dom.parent().find("div").length;
    if (itemNum > 1) {
        dom.parent().find("div").last().remove();
    }
}

//  上传
function uploadLogos($_this) {
    var $fileInput = $($_this),// file input dom
        $form = $fileInput.parent(),// form dom
        $img = $form.parent().find("img"),
        $spinSrc = $fileInput.data("spin"),
        $originSrc = $img.attr("src");
    originLoadType = $fileInput.data("loadType");// 上传前状态

    // 状态判断拦截
    if (originLoadType == 1) {
        layer.msg("请勿频繁操作上传！")
        return false;
    }

    // 前端文件内容获取和非法拦截
    var files = $_this.files;
    var fileName, fileSize;
    if (files) {
        var file = files[0];
        fileName = file.name;
        fileSize = file.size;
    } else {
        fileName = $_this.value;
    }

    if (fileSize && fileSize > 1048576 * 5) {
        layer.msg("文件大小不能超过5M");
        return false;
    }


    if (!verifyFileSuffx("jpg|jpeg|png", fileName)) {
        layer.msg("请上传jpg、jpeg或png格式的图片");
        return false;
    }

    // 表单ajax配置对象
    var fileAjaxOption = {
        url: BASE_URL + "/front/file/ie/upload/image",//form 的action
        type: "post",
        resetForm: true,
        contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
        beforeSend: function () {
            $fileInput.data("loadType", 1);// 设置其上传状态为1（上传中）
            $img.attr("src", $spinSrc);// 上传中的菊花转（不同比例，所以传进来）
        },
        success: function (data) {  //表单提交成功后执行的函数
            try {
                data = JSON.parse(data);
            } catch (e) {
                console.log("请求被拦截，返回JSON字符串");
            }
            console.log(data);
            if (data.code == 0) {
                if (data.size > 1048576 * 5) {
                    layer.msg("文件大小不能超过5M");
                    $fileInput.data("loadType", originLoadType);// 文件过大处理失败，回置上传状态；
                    $img.attr("src", $originSrc);// 回置SRC
                } else {
                    // success
                    $fileInput.data("loadType", 2);// 更新上传状态为2（上传成功）；
                    $img.attr("src", data.payload);// 更新src
                }
            } else {
                $fileInput.data("loadType", originLoadType);// 上传处理失败，回置上传状态；
                $img.attr("src", $originSrc);// 回置SRC
            }

//                data = JSON.parse(data);
//                if (data.size > 1048576 * 10) {
//                    progress.remove();
//                    layer.msg("文件大小不能超过10M");
//                    return;
//                }

//                progress.find(".probarbul").animate({"width": "100%"}, 500);
//                progress.data("fileUrl", data.payload);
//                layer.msg("上传成功");
        },
        error: function () {
            $fileInput.data("loadType", originLoadType);// 上传失败，回置上传状态；
            $img.attr("src", $originSrc);// 回置SRC
        }

    }
    $($_this).parent().ajaxSubmit(fileAjaxOption);// 提交表单
    return false;
}

// 检查文件后缀
function verifyFileSuffx(format, fileName) {
    var index = fileName.lastIndexOf("."),
        suffix = fileName.slice(index + 1),
        formatArr = format.split("|"),
        flag = false;

    for (var i = 0; i < formatArr.length; i++) {
        if (formatArr[i] === suffix) {
            flag = true;
            break;
        }
    }

    return flag;
}

// 清除身份证的error提示
function clearErrorTipIdCard($_this) {
    if ($($_this).data("loadType") == 0) {
        $("#idCardTip").hide();
    }
}
function clearFixedPhoneTip() {
    $("#fixedPhoneErrorTip").hide();
}
// 清除机构logo的errortip
function clearLogoTip($_this) {
    $("#logoErrorTip").hide();//  todo
}
// 清除简介
function clearIntroTip() {
    $("#orgIntroTip").hide();
}
// 清除营业执照副本的ErrorTip
function clearId($_this) {
    $("#orgInfoErrorTip").hide();//  todo
}

// 清除机构材料tip
function clearErrorPaper($_this) {
    var flag = $("#szhy").prop("checked");
    if (flag) {
        $("#orgInfoErrorTip").hide();
    } else {
        if ($($_this).data("loadType") == 0) {
            $("#orgInfoErrorTip").hide();
        }
    }

}
// 清除资质tip
function clearErrorZZ($_this) {
    if ($($_this).data("loadType") == 0) {
        $("#zzTip").hide();
    }
}
// 大表单提交
function putFormToService() {
    var REG = {
        phone400: /^400[0-9]{7}/,
        phone800: /^800[0-9]{7}/,
        phone11: /^1(3|4|7|5|8)([0-9]{9})/,
//            fixedPhone: /([0-9]{3,4}-)?[0-9]{7,8}/,
        fixedPhone: /^[0-9]{3,4}-[0-9]{7,8}$/,
    }

    var FLAG = true;
    // 真实姓名*
    var uName = $.trim($("#uName").val());
    var uNameTip = $("#uNameTip");

    // 真实姓名校验:为空
    if (uName === "") {
        uNameTip.text("请输入姓名");
        uNameTip.show();
        FLAG = false;
    }

    // 真实姓名校验:2-10位中文
    if (!/^[\u4e00-\u9fa5]{2,11}$/.test(uName)) {
        uNameTip.text("请输入正确的姓名");
        uNameTip.show();
        FLAG = false;
    }

    // 身份证号码*
    var uIdCard = $("#uIdCard").val();
    var uIdCardTip = $("#uIdCardTip");
    console.log("uIdCard:" + uIdCard);
    if (uIdCard === "") {
        uIdCardTip.text("请输入身份证号");
        uIdCardTip.show();
        FLAG = false;
    }

    if (!/^\d{15}$|^\d{17}(\d|x|X)$/.test(uIdCard)) {
        uIdCardTip.text("您输入的大陆身份证号格式错误");
        uIdCardTip.show();
        FLAG = false;
    }

    // 身份证照片*
    var idCardFrontImgSrc = $("#idCardFront").attr("src");// 正面
    var idCardFrontInput = $("#idCardFrontInput").data("loadType");
    var idCardVersoImgSrc = $("#idCardVerso").attr("src");// 反面
    var idCardVersoInput = $("#idCardVersoInput").data("loadType");
    var idCardTip = $("#idCardTip");
    console.log("身份证照片信息");
    console.log("idCardFrontImgSrc:" + idCardFrontImgSrc);
    console.log("idCardFrontInput:" + idCardFrontInput);
    console.log("idCardVerso:" + idCardVersoImgSrc);
    console.log("idCardVersoInput:" + idCardVersoInput);
    if (idCardFrontInput != 2 || idCardVersoInput != 2) {
        idCardTip.show();
        FLAG = false;
    }
    // 机构logo*
    var logoImg = $("#logoImg").attr("src");
    var logoInput = $("#logoInput").data("loadType");
    var logoErrorTip = $("#logoErrorTip");
    console.log("logoImg:" + logoImg);
    console.log("logoInput:" + logoInput);
    if (logoInput != 2) {
        logoErrorTip.show();
        FLAG = false;
    }
    // 机构材料*
    var szhy = $("#szhy").prop("checked");// 为true为三证合一
    var orgCard1Img = $("#orgCard1Img").attr("src");//1
    var orgCard1Input = $("#orgCard1Input").data("loadType");
    var orgCard2Img = $("#orgCard2Img").attr("src");//2
    var orgCard2Input = $("#orgCard2Input").data("loadType");
    var orgCard3Img = $("#orgCard3Img").attr("src");//3
    var orgCard3Input = $("#orgCard3Input").data("loadType");
    var orgInfoErrorTip = $("#orgInfoErrorTip");
    if (szhy) {
        orgCard2Img = null;
        orgCard3Img = null;
        if (orgCard1Input != 2) {
            orgInfoErrorTip.show();
            FLAG = false;
        }
    } else {
        if (orgCard1Input != 2 || orgCard2Input != 2 || orgCard3Input != 2) {
            orgInfoErrorTip.show();
            FLAG = false;
        }
    }

    // 机构名称*
    var orgName = $("#orgName").val();
    var orgNameTip = $("#orgNameTip");
    if (orgName == "") {
        orgNameTip.text("请输入机构名称");
        orgNameTip.show();
        FLAG = false;
    }

    // 组织机构代码*
    var orgCode = $("#orgCode").val();
    var orgCodeTip = $("#orgCodeTip");
    if (orgCode == "") {
        orgCodeTip.text("组织机构代码最低字符为10位");
        orgCodeTip.show();
        FLAG = false;
    }

    // 组织机构代码校验：
    if (!/^[\d|a-zA-Z|\-|_|—]{10,20}$/.test(orgCode)) {
        orgCodeTip.text("组织机构代码格式不正确");
        orgCodeTip.show();
        FLAG = false;
    }

    // 机构性质*
    var orgNature = $("#orgNature").val();
    var orgNatureTip = $("#orgNatureTip");
    if (orgNature == "") {
        orgNatureTip.show();
        FLAG = false;
    }
    // 机构注册地*;
    var province_1 = $("#province_1").val();
    var city_1 = $("#city_1").val();
    var county_1 = $("#county_1").val();
    var orgAd1Tip = $("#orgAd1Tip");
    if (province_1 == "" || city_1 == "" || county_1 == "") {
        orgAd1Tip.show();
        FLAG = false;
    }
    // 机构注册地详细地址*
    var orgDetail_1 = $("#orgDetail_1").val();
    var orgDetailTip1 = $("#orgDetailTip1");

    if (orgDetail_1.length < 5) {
        orgDetailTip1.text("详细地址最少为5个字符");
        orgDetailTip1.show();
        FLAG = false;
    }

    // 机构所在地*
    var province_2 = $("#province_2").val();
    var city_2 = $("#city_2").val();
    var county_2 = $("#county_2").val();
    var orgAd2Tip = $("#orgAd2Tip");
    if (province_2 == "" || city_2 == "" || county_2 == "") {
        orgAd2Tip.show();
        FLAG = false;
    }
    // 机构所在地详细地址*
    var addressDetail_2 = $("#addressDetail_2").val();
    var orgDetailTip2 = $("#orgDetailTip2");
    if (addressDetail_2.length < 5) {
        orgDetailTip2.text("详细地址最少为5个字符");
        orgDetailTip2.show();
        FLAG = false;
    }

    // 机构所在地经纬度*
    var longitude2 = $("#longitude2").val();// 东经
    var latitude2 = $("#latitude2").val();// 北纬
    var orgJWD2 = $("#orgJWD2");// tip
    if (longitude2 == "" || latitude2 == "") {
        orgJWD2.show();
        FLAG = false;
    }

    // 机构座机
    var addCallList = $("#addCall input");// list
    // 校验固定电话
    var orgCallArr = "";
    var curIndex = 0;
    addCallList.each(function (i) {
        var curFixedPhone = $(this).val();
        if (curFixedPhone == "" || REG.fixedPhone.test(curFixedPhone)) {
            if (i === curIndex) {
                if (curFixedPhone == "") {
                    curIndex++;
                } else {
                    orgCallArr = curFixedPhone;
                }

            } else {
                if (curFixedPhone != "") {
                    orgCallArr += "," + curFixedPhone;
                }
            }

        } else {
            $("#fixedPhoneErrorTip").text("电话格式存在错误");
            $("#fixedPhoneErrorTip").show();
            FLAG = false;
        }

    })

    // 机构邮编
    var orgPostcode = $("#orgPostcode").val();
    console.log("机构邮编：" + orgPostcode);
    if (!/^[0-9]\d{4,5}$/.test(orgPostcode) && orgPostcode != "") {
        $("#orgPostCodeTip").text("邮编格式错误");
        $("#orgPostCodeTip").show();
        FLAG = false;
    }

    // 机构网址
    var orgWeb = $("#orgWeb").val();
    console.log("机构网址：" + orgWeb);
    if (orgWeb.length < 5 && orgWeb != "") {
        $("#orgWebTip").text("请输入正确的机构网址");
        $("#orgWebTip").show();
        FLAG = false;
    }

    // 机构传真
    var orgFax = $("#orgFax").val();
    if (!REG.fixedPhone.test(orgFax) && orgFax != "") {
        $("#orgFaxTip").text("传真号码格式错误");
        $("#orgFaxTip").show();
        FLAG = false;
    }

    // 机构邮箱
    var orgEmail = $("#orgEmail").val();
    console.log("机构邮箱：" + orgEmail);
    if (orgEmail.length < 5 && !/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test(orgEmail) && orgEmail != "") {
        $("#orgEmailTip").text("请输入正确的邮箱地址");
        $("#orgEmailTip").show();
        FLAG = false;
    }

    // 联系人信息*
    var orgPeopleList = $("#orgPeople .person_item");
    var orgPeopleArr = [];// 联系人数据容器
    orgPeopleList.each(function () {
        var item = {
            conName: "",
            conPhone: "",
        }
        // 处理联系人姓名：
        var orgPeopleName = $(this).find(".person_name input");
        var orgPeopleNameTip = $(this).find(".name_error_tip");
        if (orgPeopleName.val() == "") {
            orgPeopleNameTip.text("请输入姓名");
            orgPeopleNameTip.show();
            FLAG = false;
        }

        item.conName = orgPeopleName.val();// 更新name

        var personPhoneList = $(this).find(".person_phone input");
        personPhoneList.each(function (i) {
            var curPhone = $(this).val();
            var curTip = $(this).parent().parent().parent().find(".phone_error_tip").eq(i);
            if (curPhone == "") {
                curTip.text("请输入正确的手机号码");
                curTip.show();
                FLAG = false;
            }

            if (!REG.fixedPhone.test(curPhone) && !REG.phone11.test(curPhone)) {
                curTip.text("手机号格式错误");
                curTip.show();
                FLAG = false;
            }

            if (i === 0) {
                item.conPhone = curPhone;
            } else {
                item.conPhone += ',' + curPhone;
            }
        })

        orgPeopleArr.push(item);// 将该条联系人信息push到数组里
    })

    console.log(orgPeopleArr);
    // 机构来源*
    var orgOrigin = $("#orgOrigin").val();
    var orgOriginTip = $("#orgOriginTip");
    // console.log("机构来源：" + orgOrigin);
    if (orgOrigin == "") {
        orgOriginTip.show();
        FLAG = false;
    }
    // 机构资质
    var zzList = $("#identifyList .img_item");
    //  $("#identifyList .img_item img");
    //  $("#identifyList .img_item input");
    var zzArr = [];
    zzList.each(function () {
        var curImgSrc = $(this).find("img").attr("src");
        var curIptLoadType = $(this).find("input").data("loadType");
        var curZZname = $(this).children("i").text();
        var item = {
            orgCertificateName: curZZname,
            orgCertificatePic: curImgSrc
        };
        zzArr.push(item);
        if (curIptLoadType != 2) {
            $("#zzTip").show();
            FLAG = false;
        }
    });

    // 机构简介
    // todo 机构简介
    var orgDescription = layedit.getContent(ditIndex);
    var orgDescriptionTxt = layedit.getText(ditIndex);
    console.log(1111111111111);
    console.log($.trim(orgDescription).length);
    if ($.trim(orgDescription).length == 0) {
        $("#orgIntroTip").text("机构简介不能为空");
        $("#orgIntroTip").show();
        FLAG = false;
    } else if ($.trim(orgDescriptionTxt).length > 5000) {
        $("#orgIntroTip").text("简介文字不能超过5000字");
        $("#orgIntroTip").show();
        FLAG = false;
    } else {
        clearIntroTip();// 清除机构简介弹窗
    }

//        console.log();
    var formData = {
        orgLicense: {
            orgPerson: uName,
            identificationNumber: uIdCard,
            legalPersonPic1: idCardFrontImgSrc,// 身份证正面
            legalPersonPic2: idCardVersoImgSrc,// 身份证反面
            taxEnrolCertificatePic: orgCard3Img,// 税务登记证书
            orgLicensePic: orgCard1Img,// 营业执照证书
            orgAddrProvince: province_1,
            orgAddrCity: city_1,
            orgAddrDistrict: county_1,
            orgAddress: orgDetail_1
        },
        orgCodeObject: {
            orgCodePic: orgCard2Img,//
            orgCode: orgCode,
        },
        orgName: orgName,// 机构名称
        orgLogo: logoImg,//机构LOGO
        orgCategoryId: orgNature,// 机构性质ID
        orgAddress: {
            orgAddrProvince: province_2,// 省
            orgAddrCity: city_2,// 市
            orgAddrDistrict: county_2,// 县
            orgAddrStreet: addressDetail_2,// 详细地址
            orgAddrLongitude: longitude2,// 经度
            orgAddrLatitude: latitude2,// 维度
            orgZipcode: orgPostcode
        },
        orgContacts: {
            conPhone: orgCallArr,// 机构联系人电话
            conEmail: orgEmail,// 机构联系人邮箱
            conFax: orgFax// 机构联系人传真
        },
        orgContactsList: orgPeopleArr,// 联系人和联系人电话
        orgWeb: orgWeb,// 机构网址
        orgCode: orgCode,// 组织机构代码
        orgSource: orgOrigin,// 机构来源
        orgCertificateList: zzArr,// 机构资质
        orgDescription: orgDescription // 富文本编辑
    }

    if (FLAG) {
        postPutForm(formData, function (data) {
            console.log(data);
            location.href = BASE_URL + "/front/provider/search/" + data.payload.orgOid;
        })
    } else {
        layer.msg("添加失败，请检查表单");
    }

//    /application
}
/*
 ** 发送Ajax获取城市列表
 */
function postPutForm(formData, cb) {

    $.ajax({
        url: BASE_URL + '/front/provider/application',
        type: 'POST',
        data: JSON.stringify(formData),
        dataType: "json",
        contentType: "application/json",
        success: function (data) {
            if (data.code == 0) {
                cb(data);
            } else if (data.code == 1012) {
                layer.msg("登陆超时，即将跳转登录页面");
                setTimeout(function () {
                    logins();
                }, 2000);
            } else if (data.code == 1013) {
                layer.msg("机构已存在");
                $("orgNameTip").text("机构名已存在");
                $("orgNameTip").show();
            }else if(data.code === 1000) {
                layer.msg("用户超时，即将跳转认证申请记录界面");
                setTimeout(function () {
                    location.href =  BASE_URL + "/front/provider/search?pageNo=1&pageSize=49";
                },1000);
            }

        },
        error: function (err) {
            layer.msg("提交失败");
        }

    });

}


//    iframe.onload = function() {
//        iframe.contentDocument.onclick = function () {
//            console.log(999);
//        };
//    }