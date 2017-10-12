var Jcrop;
var ORIGIN_WIDTH,
    ORIGIN_HEIGHT,
    SCALE;

/**
 * 显示头像裁剪弹窗
 */
function showOrgLogoModal() {
    var logSrc = $("#logImg").attr("src");
    var originSrc;
    if (logSrc.lastIndexOf("?") != -1) {
        originSrc = logSrc.slice(0, logSrc.lastIndexOf("?"));
    } else {
        originSrc = logSrc;
    }

    var ModalHTML =
        '<div style="display: block;background:#fff;width: 450px;"id="imgPrune">\
        <div class="clearfix" style="overflow: hidden">\
        <p style="height: 30px;line-height: 30px;margin-top:10px;">\
            <input id="orgLogoIpt"  accept="image/jpg,image/jpeg,image/png,image/bmp"  data-origin-img-id="originIMG" data-up-type="orgimage" data-img-id="dropImg" type="file" onchange="uploadLogo(this)" style="margin-left:20px;">\
            <span id="closeBtn" class="close lab-close-1"style="float: right;display: block;height:30px;line-height:30px;margin-right: 8px;cursor: pointer;font-size: 20px;"></span>\
        </p>\
        <p style="color: #a3b6c9;margin-left: 20px">您可以选择JPG或PNG格式，小于5M的图片</p>\
        <div class="imgs" style="padding: 0 20px;margin-top: 10px;">\
        <img id="dropImg" src="' + originSrc + '" onload="initJcrop(this)" alt="默认图片" style="width: 100%;background:#f2f2f2;">\
        </div>\
        <div style="text-align: center;margin-top: 20px;margin-bottom:20px;">\
        <button id="saveCutLogo" class="layui-btn seave" >保存</button>\
        </div>\
        </div>\
        <div style="width: 1px;height:1px;overflow: hidden">\
        <img id="originIMG" style="display: block;position: relative;left: -100px;" onload="initImgOriginSize(this)" src="' + originSrc + '" alt="图片" >\
        </div>\
        </div>'


    //页面层-自定义
    var logoLayer = layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shadeClose: true,
        skin: 'logoModal',
        content: ModalHTML
    });

    // 关闭按钮
    $("#closeBtn").off().on("click", function () {
        layer.close(logoLayer);
    })

    // 保存按钮
    $("#saveCutLogo").off().on("click", function () {
        var cutOption = Jcrop.tellScaled();
        JcropResult = {
            x: Math.round(cutOption.x / SCALE),
            y: Math.round(cutOption.y / SCALE),
            w: Math.round(cutOption.w / SCALE),
            h: Math.round(cutOption.h / SCALE),
            src: $("#originIMG").attr("src")
        }
        if (JcropResult.w > JcropResult.h) {
            JcropResult.w = JcropResult.h;
        } else {
            JcropResult.h = JcropResult.w;
        }

        Jcrop = null;
        $("#logImg").attr("src", $("#originIMG").attr("src") + '?x-oss-process=image/crop,x_' + JcropResult.x + ',y_' + JcropResult.y + ',w_' + JcropResult.w + ',h_' + JcropResult.h)
        layer.close(logoLayer);
    });

}

// 初始化裁剪器
function initJcrop($this) {
    Jcrop = $.Jcrop($($this), {
        bgOpacity: 0.5,
        bgColor: 'white',
        addClass: 'jcrop-light',
        boxWidth: 410,
        dragEdges: true,
        sideHandles: true,
        cornerHandles: true
    });
}

// 获取新上传图片的大小
function initImgOriginSize($this) {
    ORIGIN_WIDTH = $($this).width();
    ORIGIN_HEIGHT = $($this).height();
    SCALE = 414 / ORIGIN_WIDTH;
}

// 上传logo图片
function uploadLogo($this) {
    var files = $this.files;

    // 兼容触发change事件，却没有选择文件的情况
    if (files.length <= 0) {
        return false;
    }

    var file = files[0],// file文件
        fileName = file.name,// fileName
        fileSize = file.size,
        $this = $($this),
        $originImgId = $this.data("originImgId"),
        $originDom = $("#" + $originImgId),
        $imgId = $this.data("imgId"),
        $img = $('#' + $imgId);// 显示图片的img

    if ($originImgId) {
        var $originImg = $("#" + $originImgId);
    }

    if (!verifyFileSuffx("png|jpg|jpeg|bmp", fileName)) {
        layer.msg("只能上传图片格式");
        return false;
    }

    if (!verifyFileSize(fileSize, 5)) {
        layer.msg("文件大小不能超过5M");
        return false;
    }

    // file文件配置项
    var fileOption = {
        file: file,
        name: "file",
        type: "orgimage",

    }

    // 开始上传时的回调
    var beforeSend = function () {
        // $img.attr("src", BASE_URL + "/common/common_img/icon/loading_200_200.gif");
        // 如果jcrop存在则写在Jcrop

        if (Jcrop) {
            var rootTag = $img.parent().parent();
            Jcrop.destroy();
            $("#orgLogoIpt").attr("disabled", true);
            $img = $('<img id="dropImg" src="' + BASE_URL + '/common/common_img/icon/loading_200_200.gif"   style="width: 100%;background:#f2f2f2;">');
            rootTag.html($img);
        }

    }

    // 上传完毕的回调
    var success = function (data) {
        $('#orgLogoIpt').removeAttr("disabled");

        if (data.code === 0) {
            // 上传头像
            var parentDom = $img.parent();
            $img.remove();
            var newImg = $('<img id="dropImg" src="' + data.payload + '"  onload="initJcrop(this)" style="width: 100%;background:#f2f2f2;">');
            parentDom.html(newImg);
            $originDom.attr('src', data.payload);
        } else {

        }

    }

    var error = function () {
        $('#orgLogoIpt').removeAttr("disabled");
    }

    postUploadImg(fileOption, beforeSend, success, error);
}


/*
 ** 发送图片字节流到后台
 */
function postUploadImg(fileOption, beforeSend, success, error) {
    var formdata = new FormData();
    formdata.append(fileOption.name, fileOption.file);
    $.ajax({
        url: '/bg/file/upload/' + fileOption.type,
        type: 'POST',
        data: formdata,
        contentType: false,
        processData: false,
        beforeSend: function () {
            beforeSend();
        },
        success: function (data) {
            success(data);
        },
        error: function () {
            error();
        }

    })
}

// 裁切图片
function cutLogoBtn() {

}
