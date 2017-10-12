/*layui 导航*/
initSideBar();

/**
 *初始化侧边栏
 */
function initSideBar() {
    layui.use('element', function () {
        var element = layui.element(); //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
}


/**
 * 校验文件后缀名
 * format:"xml|img"
 */
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

function verifyFileSize(fileSize, maxSize) {
    var size = (fileSize / 1024)/1024;

    if (size > maxSize) {
        return false;
    }

    return true;
}
function keyencode(key) {
    var keyword_input=key
    keyword_input = encodeURI(keyword_input);
    keyword_input = keyword_input.replace(/\\$/g, "%24");
    keyword_input = keyword_input.replace(/\+/g, "%2B");
    keyword_input = keyword_input.replace(/#/g, "%23");
    keyword_input = keyword_input.replace(/&/g, "%26");
    keyword_input = keyword_input.replace(/@/g, "%40");
    keyword_input = keyword_input.replace(/\//g, "%2f");
    keyword_input = keyword_input.replace(/;/g, "%3b");
    keyword_input = keyword_input.replace(/\?/g, "%3f");
    keyword_input = keyword_input.replace(/'/g, "%27");
    return keyword_input;
}
function logouts() {
    window.location.href = BASE_URL + "/front/user/logout";
}

/**
 * 填写拒绝原因
 * @param title 标题
 * @param callback 回调，传回输入文字
 */
function showRjectModal(title, callback) {
    var html =
        '<div style="width: 525px;height: 366px;padding:0 25px;background: #fff;">' +
        '<p style="position: relative">' +
        '<h3 style="font-size: 18px;color: #333;line-height: 64px;">' +
        title +
        '<i style="position: absolute;right: 25px;font-size: 26px;top: 4px;cursor: pointer" class="layui-icon">&#x1006;</i>' +
        '</h3>' +
        '</p>' +
        '<div style="height: 220px;overflow: hidden;border: 1px solid #eee;">' +
        '<textarea id="txt" placeholder="请输入'+ title +'原因" style="height: 220px;width: 103%;border: 0 none;background: #f2f5f8;padding: 20px;"></textarea>' +
        '</div>' +
        '<div style="text-align: center;margin-top: 20px;">' +
        '<button id="cancel" class="layui-btn layui-btn-primary"  type="button">取消</button>' +
        '<button id="cfm" style="margin-left: 40px;" class="layui-btn layui-btn-normal" type="button">确认</button>' +
        '</div>'
    '</div>'

    //页面层-自定义
    var layer_1 = layer.open({
        type: 1,
        title: false,
        closeBtn: 0,
        shadeClose: true,
        skin: 'modal_class',
        content: html
    });
    $(".modal_class").css({
        width: 525
    })

    $("#cancel").off("click").on("click", function () {
        layer.close(layer_1);
    })

    $("#cfm").off("click").on("click", function () {
        if(callback && typeof callback == "function" ) {
            callback($("#txt").val());
        }
        layer.close(layer_1);
    })
}