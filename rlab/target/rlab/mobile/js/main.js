(function () {
    extendCookie(Zepto);// 扩展zeptocookie插件
    extendParams(Zepto);// 扩展zepto,获取参数的插件
})();
// 回跳参数
var IS_BACK = 0;
// 搜索相关参数
var KEY_WORD = "",// 关键字
    PAGE_NO = 1,// 起始页数
    PAGE_SIZE = 10,// 每页条数
    CUR_PROVINCE = null,// 当前省份
    CUR_CITY = null;// 当前城市
var URL_CUR_CITY = $.getUrlParam("curURI") ? $.getUrlParam("curURI") : "";// 当前城市参数
var isStorage = isLocalStorageSupported();

// -------数极客埋点START-----------
var _dgt = _dgt || [];
window._dgt = _dgt;
(function () {
    _dgt.push(['enableh5tag']);
    _dgt.push(['setSiteId', '05a36522bc9dd9cd']);
    var d = document, g = d.createElement('script'),
        s = d.getElementsByTagName('script')[0];
    g.type = 'text/javascript'; g.async = true;
    g.defer = true;
    g.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'shujike.cn/dgt.js';
    s.parentNode.insertBefore(g, s);
})();
// -------数极客埋点END-----------

// 初始化搜索框的历史搜索记录

if (isStorage && $("#scMain").length > 0) {
    initSearchHistory();
}

/**
 * 判断是否支持localStorage(Safari浏览器有无痕模式)
 */
function isLocalStorageSupported() {

    var testKey = 'test',
        storage = window.sessionStorage;

    try {
        storage.setItem(testKey, 'testValue');
        storage.removeItem(testKey);
        return true;
    } catch (error) {
        return false;
    }
}

/**
 * 设置地址缓存
 */
function setAddressCookie(ad) {
    $.fn.cookie("lab_m_address", ad, {expires: 6, path: "/"});
}

/**
 * 获取地址缓存
 */
function getAddressCookie() {
    return $.fn.cookie("lab_m_address") ? $.fn.cookie("lab_m_address") : -1;
}

/**
 * 跳转搜索页面
 */
function toSearch($_this, text) {

    // 传0个参数的情况（一般为直接搜索）
    if (arguments.length == 0 || (!$_this && !text)) {
        KEY_WORD = $.trim($("#searchInput").val());
        if (isStorage) {
            addSearchToHistory();
        }
    }

    // 传了1个参数的情况
    if (arguments.length == 1 || (!!$_this && !text)) {
        KEY_WORD = $($_this).text();
        $("#searchInput").val(KEY_WORD);
        if (isStorage) {
            addSearchToHistory();
        }
    }

    // 传了2个参数的情况
    if (arguments.length == 2 || (!$_this && !!text) || (!$_this && text == "")) {
        KEY_WORD = text;
    }

    // event = event ? event : window.event;
    // // 处理关键字参数
    // if(text || ($_this == null && event == null)){
    //     KEY_WORD = text;
    // } else {
    //     if ($_this != undefined) {
    //         KEY_WORD = $($_this).text();
    //         $("#searchInput").val(KEY_WORD);
    //     } else {
    //         KEY_WORD = $.trim($("#searchInput").val());
    //     }
    // }
    // 地址更新为URL参数地址
    var address = URL_CUR_CITY;

    // 参数地址为空时优先获取定位
    if (address == "") {
        CUR_PROVINCE = null,
            CUR_CITY = null;
        address = getAddressByLocation();
        dealAddress(address);

    } else if (address == "全国") {

        CUR_PROVINCE = null,
            CUR_CITY = null;

    } else {
        //　为正常地址时，直接处理参数
        dealAddress(address);
    }
    URL_CUR_CITY = address;
    // 处理页码相关参数（默认从第一页开始搜索）
    PAGE_NO = 1;
    // 跳转搜索结果页面
    toGoodsList();
}

/**
 * 通过定位获取地址
 */
function getAddressByLocation(address) {
    $.ajax({
        url: BASE_URL + "/front/instrument/location",
        type: 'GET',
        async: false,
        dataType: 'json',
        contentType: 'application/json',
        success: function (data) {
            if (data.code === 0) {
                if (data.payload.ccity === "" && data.payload.cprovince) {
                    // CUR_PROVINCE =  parserAddress(data.payload.cprovince);
                    address = parserAddress(data.payload.cprovince);
                } else if (data.payload.cprovince === "" && data.payload.ccity) {
                    // CUR_CITY = parserAddress(data.payload.ccity);
                    address = parserAddress(data.payload.ccity);
                }

            } else {
                address = "全国";
            }
        },
        error: function () {
            address = "全国";
        }
    })
    return address;
}
/**
 * 解析定位获取到的城市名
 */
function parserAddress(address) {

    if (address.slice(-1) === "市") {
        return address.slice(0, -1);
    } else {
        return address;
    }

}
/**
 * 处理参数
 * @param address
 */

function dealAddress(address) {

    if (address === "北京") {
        CUR_PROVINCE = "北京市";
    } else if (address === "上海") {
        CUR_PROVINCE = "上海";
    } else if (address === "重庆") {
        CUR_PROVINCE = "重庆";
    } else if (address === "天津") {
        CUR_PROVINCE = "天津";
    } else {
        if (address !== "全国") {
            CUR_CITY = address;
        }
    }
}

/**
 * 跳转至搜索结果页面
 */
function toGoodsList() {

    var keyword = encodeURI(KEY_WORD);
    keyword = keyword.replace(/\+/g, "%2B");
    keyword = keyword.replace(/#/g, "%23");
    keyword = keyword.replace(/&/g, "%26");
    keyword = keyword.replace(/</g, "%3c");
    keyword = keyword.replace(/>/g, "%3e");

    var formData = {
        // keyword: CUR_CITY + KEY_WORD,
        keyword: keyword,
        pageNo: PAGE_NO,
        pageSize: PAGE_SIZE
    }

    var URL = BASE_URL + "/front/instrument/search?keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;

    if (CUR_PROVINCE !== null) {
        // province
        // formData.province = CUR_PROVINCE;
        URL = URL + "&province=" + CUR_PROVINCE
    }

    if (CUR_CITY !== null) {
        // city
        // formData.city = CUR_CITY;
        URL = URL + "&city=" + CUR_CITY
    }


    URL = URL + "&curURI=" + encodeURI(URL_CUR_CITY);

    location.href = URL;

}


/**
 *  显示搜索弹窗（切换）
 * @param $this
 */
function showSearchModal($this) {
    var $_mian = $("#" + $($this).data("mainId"));
    $_mian.hide();
    $("#scMain").show();
}

/**
 *  隐藏搜索弹窗（切换）
 * @param $this
 */
function hideSearchModal($this) {
    var $_mian = $("#" + $($this).data("mainId"));
    $_mian.show();
    $("#scMain").hide();
}

/**
 *  隐藏搜索窗口
 * @param $main
 */
function rouseSearchModal($main) {
    $main.hide();
    $("#scMain").show();
}

/**
 * 初始化历史搜索记录
 */
function initSearchHistory() {
    var histroy = JSON.parse(localStorage.getItem("histAddress"));
    if (histroy) {
        $("#historySearch").show();
        var historyUl = $("#historyUl");
        for (var i = histroy.length - 1; i >= 0; i--) {
            historyUl.append('<li onclick="toSearch(this)">' + histroy[i] + '</li>');
        }
    }

}
/**
 * 添加历史搜索记录
 */
function addSearchToHistory() {

    if (KEY_WORD.trim() === "") {
        return false;
    }

    var historyAddress = localStorage.getItem("histAddress");
    var key_word = KEY_WORD.length > 10 ? KEY_WORD.slice(0, 5) + "..." + KEY_WORD.slice(-5, -1) : KEY_WORD;

    if (historyAddress == null || historyAddress === undefined || historyAddress === "") {
        localStorage.setItem("histAddress", JSON.stringify([htmlEscape(key_word)]));
    } else {

        historyAddress = JSON.parse(historyAddress);
        var flag = true;// 标记历史记录不存在KEY_WORD新记录

        for (var i = 0; i < historyAddress.length; i++) {

            if (key_word === historyAddress[i]) {
                flag = false;
                historyAddress.splice(i, 1);
                historyAddress.push(htmlEscape(key_word));
            }

        }

        // 添加新历史
        if (flag === true) {
            historyAddress.push(htmlEscape(key_word));// 添加新记录
        }

        // 清除旧历史
        if (historyAddress.length > 10) {
            historyAddress.shift();
        }

        localStorage.setItem("histAddress", JSON.stringify(historyAddress));

    }
}

/**
 * 清除历史搜索记录
 */
function clearSearchHistory() {
    localStorage.removeItem("histAddress");
    $("#historySearch").hide();
    //提示
    layer.open({
        content: '清除成功',
        skin: 'msg',
        time: 1, //2秒后自动关闭
        className: 'clear_modal'
    });

}

// /**
//  * 返回历史上一页
//  */
// function goBack() {
//     window.history.back();
// }

/**
 * 跳转登录页面（目前用不着，因为是后台控制跳转）
 */
function toLogin() {
    setCallbackUrl();
    var URL = BASE_URL + "/front/user/login";
    URL = URL + '?curURI=' + URL_CUR_CITY;
    location.href = URL;
}

/**
 * 设置登录后回跳路径
 */
function setCallbackUrl() {
    if (isStorage) {
        sessionStorage.setItem('labcallBackURL', window.location.href);
    }
}
/**
 * 设置登录后回跳路径
 */
function getCallbackURL() {
    var result = null;
    if (isStorage) {
        sessionStorage.getItem("labcallBackURL") ? result = sessionStorage.getItem("labcallBackURL") : "";
    }
    return result;
}

// /**
//  * 跳转至搜索页面
//  */
// function toSearch() {
//     var URL = BASE_URL + "/page/search";
//     location.href = URL;
// }

/**
 * 跳转至Home页面
 */
function toHome() {
    var URL = BASE_URL + "/page/home";
    URL = URL + "?curURI=" + encodeURI(URL_CUR_CITY);
    location.href = URL;
}

/**
 * 跳转至用户中心页面
 */
function toCenter() {
    var URL = BASE_URL + "/front/user/center";
    URL = URL + "?curURI=" + encodeURI(URL_CUR_CITY);
    location.href = URL;
}

/**
 * 跳转高级搜索页面
 */
function toSuperSearch() {

    var keyword = $("#searchIpt").val();
    if (keyword === "") {
        keyword = "仪器"
    }

    keyword = encodeURI(keyword);
    keyword = keyword.replace(/\+/g, "%2B");
    keyword = keyword.replace(/#/g, "%23");
    keyword = keyword.replace(/&/g, "%26");
    keyword = keyword.replace(/</g, "%3c");
    keyword = keyword.replace(/>/g, "%3e");

    var URL = BASE_URL + '/front/superSearch/search?query=' + keyword;
    URL = URL + "&curURI=" + encodeURI(URL_CUR_CITY);
    window.location.href = URL;
}

/**
 * 跳转搜索页面
 */
// function toSearchPage() {
//     location.href = BASE_URL + "/page/search";
// }

/**
 * 跳转仪器详情页面
 */
function toGoodsDetail($this) {

    var goodsInfo = $($this).data("goodsId");
    var URL = BASE_URL + "/front/instrument/search/" + goodsInfo;
    URL = URL + "?curURI=" + encodeURI(URL_CUR_CITY);
    location.href = URL;

}

/**
 * 扩展cookie
 */
function extendCookie($) {

    $.extend($.fn, {
        cookie: function (key, value, options) {
            var days, time, result, decode
            // A key and value were given. Set cookie.
            if (arguments.length > 1 && String(value) !== "[object Object]") {
                // Enforce object
                options = $.extend({}, options)

                if (value === null || value === undefined) options.expires = -1

                if (typeof options.expires === 'number') {
                    days = (options.expires * 24 * 60 * 60 * 1000)
                    time = options.expires = new Date()

                    time.setTime(time.getTime() + days)
                }

                value = String(value)

                return (document.cookie = [
                    encodeURIComponent(key), '=',
                    options.raw ? value : encodeURIComponent(value),
                    options.expires ? '; expires=' + options.expires.toUTCString() : '',
                    options.path ? '; path=' + options.path : '',
                    options.domain ? '; domain=' + options.domain : '',
                    options.secure ? '; secure' : ''
                ].join(''))
            }

            // Key and possibly options given, get cookie
            options = value || {}

            decode = options.raw ? function (s) {
                return s
            } : decodeURIComponent

            return (result = new RegExp('(?:^|; )' + encodeURIComponent(key) + '=([^;]*)').exec(document.cookie)) ? decode(result[1]) : null
        }

    })

}

/**
 * 扩展url
 */
function extendParams($) {

    $.getUrlParam = function (name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
        var r = window.location.search.substr(1).match(reg);
        if (r != null) return decodeURI(r[2]);
        return null;
    }

}

/**
 * 转义字符处理方式二（转义特殊字符）
 */
function htmlEscape(sHtml) {

    return sHtml.replace(/[<>&"]/g, function (match, pos, originalText) {
        switch (match) {
            case "<":
                return "&lt;";
            case ">":
                return "&gt;";
            case "&":
                return "&amp;";
            case "\"":
                return "&quot;";
        }
    });

}


/**
 * 转义字符处理方式一（删除所有标签字符）
 */
function removeHtmlTab(tab) {
    return tab.replace(/<[^<>]+?>/g, '');//删除所有HTML标签
}