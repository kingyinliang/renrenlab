var PAGE_NO = 1;// 页码
var PAGE_SIZE = 10;// 每页数量
var CUR_PROVINCE = null;// province 省
var CUR_CITY = null;// city 市
var CUR_DISTRICT = null;// district 区
var IS_COUNTRY = null;// 是否是全国
var KEY_WORD = "";// 关键字
var SERVICE_TYPE = null;
var SCOPEL_LOW_PRICE = null;
var SCOPEL_HIGHT_PRICE = null;
var CATEGORY_1 = null;
var CATEGORY_2 = null;
var PRICE_FLAG = false;
var SLIDE_FLAG = false;
var CODE = null;// 仪器大类ID
var SERCH_TYPE=$(".pitchTab").data("searchType");//搜索类型；1为仪器，2为服务，3为机构
var SORT_TYPE=null;
var classify='',name='';
var instag=false;//仪器预约
var flags='';


// if (!BASE_URL) {
//     BASE_URL = "http://www.renrenlab.com/rlab";
// }

// -------数极客埋点START-----------
var _dgt = _dgt || [];
window._dgt = _dgt;
(function () {
    _dgt.push(['setSiteId', '05a36522bc9dd9cd']);
    var d = document, g = d.createElement('script'),
        s = d.getElementsByTagName('script')[0];
    g.type = 'text/javascript';
    g.async = true;
    g.defer = true;
    g.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'shujike.cn/dgt.js';
    s.parentNode.insertBefore(g, s);
})();

// -------数极客埋点END-----------
(function () {

    dropDownFn({"box": $('#unickName'), "target": $('#unickName i'), "list": $('#unickName ul')});
    if (getCurremtAdress() == -1) {
        initLocation();
    }
})();

/**
 * 初始化定位
 */
function initLocation() {

    $.ajax({
        url: BASE_URL + "/instrument/location",
        type: 'GET',
        async:false,
        dataType: 'json',
        contentType: 'application/json',
    })
        .done(function (data) {
            if (data.code === 0) {
                if (data.payload.ccity === "" && data.payload.cprovince) {
                    setCurrentAdress(dealAddress(data.payload.cprovince))
                } else if (data.payload.cprovince === "" && data.payload.ccity) {
                    setCurrentAdress(dealAddress(data.payload.ccity))
                }
            }
        })
        .fail(function (err) {
            // console.error(err);
            console.error("location请求失败");
        });
}

/**
 * 处理城市
 */
function dealAddress(address) {

    if (address.slice(-1) === "市") {
        return address.slice(0, -1);
    } else {
        return address;
    }

}

/**
 * 设置登录后回跳路径
 */
function setCallbackUrl() {
    sessionStorage.setItem('labcallBackURL', window.location.href);
}
/**
 * 获取回跳路径
 */
function getCallbackURL() {

    var callbackURL = sessionStorage.getItem("labcallBackURL");
    if (!callbackURL) {

    }
    return callbackURL;

}
// /**
//  * 设置缓存当前地理位置
//  * @param value string类型，传入的地理位置
//  */
function setCurrentAdress(value) {
    localStorage.setItem("curAdress", value);
}

/**
 * 获取当前地理位置
 * @returns {number}
 */
function getCurremtAdress() {
    var curAdress = localStorage.getItem("curAdress");
    return curAdress ? curAdress : -1;
}

/**
 * 退出登录
 */
function logouts() {
    setCallbackUrl();
    window.location.href = TOKEN1 + "/user/logout";
}
/**
 * 点击登录
 */
function logins() {
    setCallbackUrl();
    toLoginPage();
}
/**
 * 点击注册
 */
function registers() {
    setCallbackUrl();
    toRegisterPage();
}
/**
 * 返回顶层
 */
function moveToTop() {

    $('body,html').animate({scrollTop: 0}, 500);

}
/**
 * 跳转登录页面
 */
function toLoginPage() {
    window.location.href = TOKEN1 + "/user/login";
    // return false;
    if (window.event) {
        window.event.returnValue = false;
    } else {
        return false;
    }
}
/**
 * 跳转注册页面
 */
function toRegisterPage() {
    window.location.href = TOKEN1 + "/user/register";
}

/**
 * 跳转用户中心页面
 */
function toCenter() {
    window.location.href = TOKEN1 + "/user/center";
}

/**
 * 跳转主页
 */
function toHomePage() {
    window.location.href = TOKEN1;
}

//  搜索事件触发
$("#search").on("keyup", function (e) {

    var searchText = $("#search").val();
    if (e.keyCode !== 13) {
        return false;
    }

    toSearch(e);

});


$("#gosearch").on("click", function (e) {
    toSearch(e);
});

// 检索功能
function toSearch(e) {
    flags='';
    // var address = $("#adCurrent").text();
    // 处理参数
    PAGE_NO = 1;
    KEY_WORD = $("#search").val() === undefined ? '' : $("#search").val();
    var address = getCurremtAdress();
    if (address === -1) {
        toGoodsList();
    } else {
        dealCity(address);// 处理直辖市
    }
    toGoodsList();
}


/**
 * 处理直辖市
 * @param address  城市名称
 */
function dealCity(address) {
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
        } else {
            IS_COUNTRY = "1";
        }
    }
}

var a, b;
// 跳转搜索结果页面
function toGoodsList() {
    // 数极客埋点，关键词搜索
    _dgt.push(['trackAttr',['keywords'], [KEY_WORD]]);

    var keyword = encodeURI(KEY_WORD);
    keyword = keyword.replace(/\+/g, "%2B");
    keyword = keyword.replace(/#/g, "%23");
    keyword = keyword.replace(/&/g, "%26");
    keyword = keyword.replace(/</g, "%3c");
    keyword = keyword.replace(/>/g, "%3e");

    // 1，处理基础参数
    var formData = {
        // keyword: CUR_CITY + KEY_WORD,
        keyword: keyword,
        pageNo: PAGE_NO,
        pageSize: PAGE_SIZE
    }
    if (SERCH_TYPE==1) {
        if(instag){
            var URL = BASE_URL + "/instrument/search?isSubscribe=仪器预约&keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
        }else {
            var URL = BASE_URL + "/instrument/search?keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
        }
    }else if (SERCH_TYPE==2){
        if(flags=='zhiliang'){
            var URL = BASE_URL + fenyes +"&keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
        }else if(flags=='keyan') {
            var URL = BASE_URL + fenyes +"&keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
        }else {
            var URL = BASE_URL + "/service/search?keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
        }
    }else if (SERCH_TYPE==3){
        var URL = BASE_URL + "/front/org/query?keyword=" + formData.keyword + "&pageNo=" + formData.pageNo + "&pageSize=" + formData.pageSize;
    }
    // 2，添加地址参数
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
    //if(keyword==null){
        if (SORT_TYPE !== null) {
            URL = URL + "&order=" + SORT_TYPE
        }
    //}


    // 定位地址
    if (CUR_PROVINCE == null && CUR_CITY == null && IS_COUNTRY != "1") {
        $.ajax({
            url: BASE_URL + "/instrument/location",
            type: "GET",
            async: false,
            cache: true,
            success: function (data, status) {
                if (status == "success" && data.code == 0) {
                    a = data.payload.province;
                    b = data.payload.city;
                    if (data.payload.isMunicipality == 1) {
                        a = "";
                    }
                }
            }
        });
        if (a) {
            URL = URL + "&province=" + a
        }
        if (b) {
            URL = URL + "&city=" + b
        }
        CUR_DISTRICT = null;// 区默认为不限
    }

    // 如果区不为空，则添加一个区参数
    if (CUR_DISTRICT != null) {
        URL = URL + "&district=" + CUR_DISTRICT;
    }

    // 添加服务方式参数
    if (SERVICE_TYPE != null) {
        URL = URL + "&insServiceType=" + SERVICE_TYPE;
    }

    // 添加价格范围
    if (SCOPEL_LOW_PRICE != null) {
        URL = URL + "&scopeLowPrice=" + SCOPEL_LOW_PRICE;
    }
    if (SCOPEL_HIGHT_PRICE != null) {
        URL = URL + "&scopeHighPrice=" + SCOPEL_HIGHT_PRICE;
    }
    // 添加仪器大类
    if (CATEGORY_1 != null) {
        URL = URL + "&category1=" + CATEGORY_1;
    }
    if (CODE != null) {
        URL = URL + "&code=" + CODE;
    }

    // 添加仪器子类
    if (CATEGORY_2 != null) {
        URL = URL + "&category2=" + CATEGORY_2;
    }

    if (PRICE_FLAG) {
        URL = URL + "&priceFlag=1";
    }

    if ($("#slidePrice").text() == '收起筛选') {
        URL = URL + "&slideFlag=1";
    }

    // 添加筛选参数
    location.href = URL;
}

/**
 *  跳转仪器详情页
 */
function toGoodsDetail($this) {

    $this = $($this);
    var goodsInfo = $this.data("goodsId");
    // location.href = BASE_URL + "/instrument/search/" + goodsInfo;
    window.open(BASE_URL + "/instrument/search/" + goodsInfo)
}

/**
 * 获取字符串长度（包含中英文，中文长度为2，英文为1）
 * @param str 字符串
 * @returns {number} 字节长度
 */
function strlen(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        var c = str.charCodeAt(i);
        //单字节加1
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            len++;
        }
        else {
            len += 2;
        }
    }
    return len;
}

/**
 * 图片加载失败修复
 * @param $_this 当前的$_this
 */
// function imgOnError($_this) {
//     $($_this).attr("src","/front/imgs/icon/default-goods-1.jpg")
//     // $($_this).attr("src","/front/imgs/icon/default-.jpg")
// }

/**
 * 下拉
 * @domBox
 */

function dropDownFn(domBox) {
    domBox.box.stop().on('mouseover', function () {
        domBox.list.removeClass('dn');
        domBox.box.find("i").removeClass("lab-arrow-down").addClass("lab-arrow-up");
    });

    domBox.box.stop().on('mouseout', function (event) {
        domBox.list.addClass('dn');
        domBox.box.find("i").removeClass("lab-arrow-up").addClass("lab-arrow-down");

    });

    domBox.list.stop().on('mouseover', function () {
        domBox.list.removeClass('dn');
        domBox.box.find("i").removeClass("lab-arrow-down").addClass("lab-arrow-up");

    }).stop().on('mouseout', function () {
        domBox.list.addClass('dn');
        domBox.box.find("i").removeClass("lab-arrow-up").addClass("lab-arrow-down");
    });
}

var JPlaceHolder = {
    //检测
    _check: function () {
        return 'placeholder' in document.createElement('input');
    },

    //初始化
    init: function () {
        if (!this._check()) {
            this.fix();
        }
    },
    //修复
    fix: function () {
        jQuery(':input[placeholder]').each(function (index, element) {

            if ($(this).attr("id") !== "search" && $(this).attr("type") != "file" && $(this).data("addPlace") != "no") {

                var self = $(this), txt = self.attr('placeholder');
                self.wrap($('<div></div>').css({
                    position: 'relative',
                    zoom: '1',
                    border: 'none',
                    background: 'none',
                    padding: 'none',
                    margin: 'none'
                }));
                var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
                var holder = $('<span class="placehodle"></span>').text(txt).css({
                    position: 'absolute',
                    left: pos.left,
                    top: 0,
                    height: h,
                    lienHeight: h,
                    paddingLeft: paddingleft,
                    color: '#aaa'
                }).appendTo(self.parent());

                self.on("change",function () {
                    console.log($(this).val());
                })

                self.focusin(function (e) {
                    holder.hide();
                }).focusout(function (e) {
                    if (!self.val()) {
                        holder.show();
                    }
                });

                holder.click(function (e) {
                    holder.hide();
                    self.focus();
                });

            }
        });
    }
};



var searchHolder = {
    //检测
    _check: function () {
        return 'placeholder' in document.createElement('input');
    },

    //初始化
    init: function () {
        if (!this._check()) {
            this.fix();
        }
    },

    //修复
    fix: function () {

        $(':input[placeholder]').each(function (index, element) {

            if ($(this).attr("id") == "search") {

                var self = $(this),
                    txt = self.attr('placeholder');

                var $item = $('<s>'+ txt +'</s>');
                $item.css({
                    position:"absolute",
                    zoom:1,
                    border:"none",
                    background:"none",
                    padding:0,
                    margin:0,
                    top: -24,
                    paddingLeft:10,
                    fontSize:16
                })
                self.parent().append($item);
                // self.wrap($('<div></div>').css({
                //     position: 'relative',
                //     zoom: '1',
                //     border: 'none',
                //     background: 'none',
                //     padding: 'none',
                //     margin: 'none'
                // }));
                //
                // var pos = self.position(), h = self.outerHeight(true), paddingleft = self.css('padding-left');
                // var holder = $('<span>请输入检索内容</span>').text(txt).css({
                //     position: 'absolute',
                //     left: pos.left,
                //     top: -27,
                //     height: h,
                //     lienHeight: h,
                //     paddingLeft: paddingleft,
                //     color: '#aaa'
                // }).appendTo(self.parent());

                self.focusin(function (e) {
                    $item.hide();
                }).focusout(function (e) {
                    if (!self.val()) {
                        $item.show();
                    }
                });

                $item.click(function (e) {
                    $item.hide();
                    self.focus();
                });

            }
        });
    }
};
if(isLtIE9){
    searchHolder.init();
    JPlaceHolder.init();

}


/**
 *  管理中心，侧边栏点击控制
 * @param $_this
 */
function userSideClick(event, $_this) {
    var sonTag = $($_this).find("dl");
    var hasSonTag = sonTag.length > 0 ? true : false;
    if (hasSonTag) {
        var isSideDn = sonTag.hasClass("side_dn");
        if (isSideDn) {
            sonTag.hide();
            sonTag.removeClass("side_dn");
        } else {
            sonTag.show();
            sonTag.addClass("side_dn");
        }
    }
}

$("#userMain").hover(function () {
    $(this).find("label").attr("class","lab-top");
    $(this).find(".usersele").show();
},function () {
    $(this).find("label").attr("class","lab-down");
    $(this).find(".usersele").hide();
})
$(".code").hover(function () {
    $(".codeimg").show();
},function () {
    $(".codeimg").hide();
})

$(".userUl").hover(function () {
    $(".userUl").show();
}, function () {
    $(".userUl").hide();
})

//导航栏吸顶
var a = $('#headTab'),
    b =a.offset();
$(window).on('scroll',function(){
    var c = $(document).scrollTop();
    if(b.top<=c){
        a.css({'position':'fixed','top':'0px'})
    }else{
        a.css({'position':'absolute','top':'153px'})
    }
    if(c>500){
        $("#rightBar").show();
    }else {
        $("#rightBar").hide();
    }
})
//导航动画
// $(".tab").hover(function () {
//     if (!/selectedTab/.test($(this).attr("class"))){
//         $(this).find(".tabStrip").stop();
//         $(this).find(".tabStrip").animate({width:'113px'},200);
//     }
// },function () {
//     if (!/selectedTab/.test($(this).attr("class"))){
//         $(this).find(".tabStrip").stop();
//         $(this).find(".tabStrip").animate({width:'0px'},200);
//     }
// })
$(".tab").hover(function () {
    $(this).find(".reclassify").show();
},function () {
    $(this).find(".reclassify").hide();
})
//tab搜索
$(".searchTab a").on("click",function () {
    $(".searchTab a").attr("class","")
    $(this).attr("class","pitchTab");
    SERCH_TYPE=$(this).data("searchType")-0;
    if(SERCH_TYPE==2){
        $("#search").attr("placeholder","请输入服务名称");
    }else if(SERCH_TYPE==3){
        $("#search").attr("placeholder","请输入机构名称");
    }else {
        $("#search").attr("placeholder","请输入仪器名称");
    }
})
//导航下拉
$(".tabSelect").hover(function () {
    $(this).find("label").attr("class","lab-top");
    $(this).find(".reel").show();
},function () {
    $(this).find("label").attr("class","lab-down");
    $(this).find(".reel").hide();
})
$(".userMain").hover(function () {
    $(this).find("label").attr("class","lab-top");
    $(this).find(".usersele").show();
},function () {
    $(this).find("label").attr("class","lab-down");
    $(this).find(".usersele").hide();
})
//返回顶部
$(".gotop").on("click",function () {
    $('body,html').animate({scrollTop:0},1000);
})
//call
$(".gocall").on("click",function () {
    $(".call").show();
    $(".erweima").hide();
})
$(".callHead label").on("click",function () {
    $(".call").hide();
})
$(".goerweima").on("click",function () {
    $(".erweima").show();
})
$(document).bind('click', function(e) {
    var e = e || window.event;
    var elem = e.target || e.srcElement;
    while (elem) {
        if (elem.id && elem.id == 'rightBar') {
            return;
        }
        elem = elem.parentNode;
    }
    $('#rightBar .call').hide();
    $('#rightBar .erweima').hide();
});
function gohome() {
    window.location.href=TOKEN1;
}
function goorghome() {
    if(getCurremtAdress()==-1){
        initLocation()
    }
    window.location.href=BASE_URL+"/front/org/query?order=2&province="+getCurremtAdress();
}
function goserverhome() {

    if(getCurremtAdress()==-1){
        initLocation()
    }
    window.location.href = TOKEN2 + "/service/keyan?classify=18&name=科研服务"+"&province=" + getCurremtAdress();;
}
function goQuality() {
    if(getCurremtAdress()==-1){
        initLocation()
    }
    window.location.href = TOKEN3 + "/service/zhiliang?classify=99&name=质量服务"+"&province=" + getCurremtAdress();
}
function goinshome() {
    if(getCurremtAdress()==-1){
        initLocation()
    }
    window.location.href = BASE_URL + "/instrument/search?province=" + getCurremtAdress();
}
function goreqhome() {
    window.location.href=TOKEN1+"/page/req/listpage";
}
function goorg($this) {
    $this=$($this);
    window.location.href=BASE_URL+"/front/org/"+$this.data("mapId");
}
function gorenrenlab($this) {
    $this=$($this);
    window.location.href=TOKEN1+"/front/search/renrenlab_page?name="+$this.data("mapId");
}
function goins($this) {
    $this=$($this);
    window.location.href = BASE_URL + "/instrument/search/" + $this.data("mapId");
}
function goserver($this) {
    $this=$($this);
    window.location.href = TOKEN2 + "/service/detail/" + $this.data("mapId");
}
function gomessagehome($this) {
    $this=$($this);
    window.location.href = TOKEN1 + "/news/get_articles_page";
}
function golablogin() {
    // $this=$($this);
    window.location.href = BASE_URL + "/page/lablogin";
}
function gocasehome($this) {
    $this=$($this);
    window.location.href=BASE_URL+"/page/case/home";
}