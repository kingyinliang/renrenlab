<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%@ include file="../../config/taglibs.jsp" %>
    <link rel="stylesheet" href="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/need/layer.css">

    <!--my CSS start-->
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css">

    <style>
        body, html {
            height: 100%;
            background: #f5f6fa;
        }

        .header {
            background: #fff;
        }

        /*头部搜索*/
        .sc_main .header .search {
            height: 1.175rem;
            width: 100%;
            padding-left: 0.266rem;
            padding-right: 1.39rem;
        }

        .sc_main  .header .search > div {
            /*float: left;*/
        }

        .sc_main  .header .search {
            position: relative;
        }

        .sc_main  .header .search .rt {
            position: absolute;
            right: 0;
            top: 0;
            width: 1.38rem;
            height: 1.175rem;
            text-align: center;
            line-height: 1.1rem;
            font-size: 0.38rem;
            font-size: 0.35rem;
            color: #4e4e4e;
        }

        .sc_main  .header .search .ipt {
            height: 100%;
            width: 100%;
            position: relative;
        }

        .sc_main  .header .search .ipt_center {
            height: 0.8rem;
            width: 100%;
            position: absolute;
            top: 50%;
            margin-top: -0.4rem;
            padding-left: 1.1rem;
            background: #f5f6fa;
            -webkit-border-radius: 0.15rem;
            -moz-border-radius: 0.15rem;
            border-radius: 0.15rem;
            overflow: hidden;
        }

        .sc_main  .header .search .ipt input {
            height: 0.8rem;
            width: 100%;
            outline: 0 none;
            border: 0 none;
            background: #f5f6fa;
            box-sizing: border-box;
        }

        .sc_main  .header .search .ipt i {
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            width: 1rem;
            height: 0.8rem;
            line-height: 0.8rem;
            float: right;
            text-align: center;
            font-size: 0.4rem;
            color: #4e4e4e;
        }

        .sc_main  .header .address {
            height: 0.8rem;
        }

        /*列表*/
        .sc_main  .list {
            padding: 0 0.266rem;
            /*height: 20rem;*/
            background: #f5f6fa;
            color: #4e4e4e;
        }

        /*搜索列表公用*/
        .sc_main  .list > div {

        }

        .sc_main  .list > div > p {
            height: 1.1rem;
            line-height: 1.1rem;
            font-size: 0.32rem;
        }

        .sc_main  .list > div > ul {

        }

        .sc_main  .list > div > ul > li {
            float: left;
            display: block;
            max-width: 9rem;
            height: 0.75rem;
            line-height: 0.75rem;
            padding: 0 0.3rem;
            -webkit-border-radius: 0.1rem;
            -moz-border-radius: 0.1rem;
            border-radius: 0.1rem;
            background: #fff;
            /*background: pink;*/
            margin-right: 0.188rem;
            margin-bottom: 0.16rem;
            overflow: hidden;
        }

        /*历史搜索*/
        .sc_main  .list > div.history_sch {

        }

        .sc_main  .list > div.history_sch i {
            float: right;
            height: 1.1rem;
            line-height: 1.1rem;
            opacity: 0.7;
            color: #e7522f;
        }

        /*热门搜索*/
        .sc_main  .list > div.hot_sch {

        }

        /*覆盖msg弹窗*/
        body .layui-m-layer .clear_modal {
            border-top: 3.5rem !important;
            font-size: 0.38rem !important;
        }

        body .clear_modal .layui-m-layercont {
            padding: 0.2rem 0.3rem;
        }

    </style>
    <!--my CSS end-->

</head>
<body>
<div class="wrapper">
    <div class="sc_main" id="sc_main" style="display: block">
        <!--头部-->
        <div class="header">
            <div class="search">
                <%--<div class="lft" onclick="selectAddress()">--%>
                <%--<span id="curAddressOrigin"></span>--%>
                <%--<i class="lab-arrow-down" onclick="clearHistory()"></i>--%>
                <%--</div>--%>
                <div class="ipt">

                    <div class="ipt_center">
                        <input id="searchInput" type="text" maxlength="30">
                        <i class="lab-search" onclick="toSearch()"></i>
                    </div>

                </div>
                <div class="rt" onclick="goBack()">
                    <i>取消</i>
                </div>
            </div>
        </div>
        <%--历史，热门搜索列表--%>
        <div class="list">
            <!--历史搜索-->
            <div id='historySearch' class="history_sch" style="display: none">
                <p>历史记录 <i onclick="clearHistory()" class="lab-del"></i></p>
                <ul id="historyUl" class="clearfix">
                    <%--<li onclick="toSearch(this)"></li>--%>
                </ul>
            </div>

            <!--热门搜索-->
            <div class="hot_sch">
                <p>热门搜索</p>
                <ul class="clearfix">
                    <li onclick="toSearch(this)">蛋白质</li>
                    <li onclick="toSearch(this)">基因</li>
                    <li onclick="toSearch(this)">PCR</li>
                    <li onclick="toSearch(this)">液相色谱仪</li>
                    <li onclick="toSearch(this)">质谱仪</li>
                    <li onclick="toSearch(this)">核磁共振</li>
                    <li onclick="toSearch(this)">EMC</li>
                    <li onclick="toSearch(this)">纳米材料</li>
                    <li onclick="toSearch(this)">扫描电镜</li>
                    <li onclick="toSearch(this)">力学性能</li>
                </ul>
            </div>

        </div>
    </div>
</div>


</body>
<script src="${rlab}/mobile/assets/zepto/zepto.js"></script>
<script src="${rlab}/mobile/assets/flexible/flexible.js"></script>
<script src="${rlab}/mobile/assets/flexible/flexible_css.js"></script>
<script src="${rlab}/mobile/js/main.js"></script>
<%--layer--%>
<script src="${rlab}/mobile/assets/layer.mobile-v2.0/layer_mobile/layer.js"></script>

<%--layer--%>
<script>
    /**
     * 返回历史上一页
     */
    var HISTORY_URL = null;
    var HAS_PARAMS = null;
    <c:if test="${sessionScope.urlHistory.size() > 1}">
    HISTORY_URL = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).url}";
    HAS_PARAMS = "${sessionScope.urlHistory.get(sessionScope.urlHistory.size() - 2).params}";
    </c:if>

    function goBack() {
        IS_BACK = 1;
        if(HISTORY_URL != null) {
            if(HAS_PARAMS == null || HAS_PARAMS == ""){
                window.location.href = HISTORY_URL+ "?isback=" + IS_BACK;
            }else{
                window.location.href = HISTORY_URL+ "&isback=" + IS_BACK;
            }
        }else {
            window.location.href = BASE_URL + "/page/home";
        }
    }


    (function () {
        setCallbackUrl();// 设置登录时回跳路径

//        var curAd = localStorage.getItem("labCurAddress");


        // 初始化历史搜索
        var histroy = localStorage.getItem("histAddress");
        if (histroy) {
            $("#historySearch").show();
            histroy = JSON.parse(histroy);
            var historyUl = $("#historyUl");
            for (var i = histroy.length - 1; i >= 0; i--) {
                historyUl.append('<li onclick="toSearch(this)">' + histroy[i] + '</li>');
            }

        }

    })();

//    //  搜索相关参数
//    var KEY_WORD = "",// 关键字
//        PAGE_NO = 1,// 起始页数
//        PAGE_SIZE = 15,// 每页条数
//        CUR_PROVINCE = null,// 当前省份
//        CUR_CITY = null;// 当前城市

    // 搜索键盘触发事件
    $("#searchInput").on('keypress', function (e) {
        var keycode = e.keyCode;
        if (keycode == '13') {
            toSearch();
        }
    });

    /**
     * 搜索事件
     */
    function toSearch($_this) {

        // 判断搜索来源
        if ($_this != undefined) {

            KEY_WORD = $($_this).text();
            $("#searchInput").val(KEY_WORD);

        } else {

            KEY_WORD = $("#searchInput").val().trim();

        }
        dealWithHistory();// 控制历史
        var address = "全国";// 移动端默认搜索全国
        toGoodsList();// 处理参数跳转搜索页面
    }
        
    /**
     * 处理历史搜索记录
     */
    function dealWithHistory() {
        if (KEY_WORD.trim() === "") {
            return false;
        }

        var historyAddress = localStorage.getItem("histAddress");
        var key_word = KEY_WORD.length > 10 ? KEY_WORD.slice(0, 5) + "..." + KEY_WORD.slice(-5, -1) : KEY_WORD;

        if (historyAddress == null || historyAddress === undefined || historyAddress === "") {
            localStorage.setItem("histAddress", JSON.stringify([key_word]));
        } else {

            historyAddress = JSON.parse(historyAddress);
            var flag = true;// 标记历史记录不存在KEY_WORD新记录

            for (var i = 0; i < historyAddress.length; i++) {

                if (key_word === historyAddress[i]) {
                    flag = false;
                    historyAddress.splice(i, 1);
                    historyAddress.push(key_word);
                }

            }

            // 添加新历史
            if (flag === true) {
                historyAddress.push(key_word);// 添加新记录
            }

            // 清除旧历史
            if (historyAddress.length > 10) {
                historyAddress.shift();
            }

            localStorage.setItem("histAddress", JSON.stringify(historyAddress));

        }
    }

    /**
     * 清除历史记录
     */
    function clearHistory() {
        localStorage.removeItem("histAddress");
        $("#historySearch").hide();
        //提示
//        layer.open({
//            content: '清除成功',
//            skin: 'msg',
//            time: 1, //2秒后自动关闭
//            className: 'clear_modal'
//        });

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

//        alert("4")
        location.href = URL;
    }


</script>
</html>