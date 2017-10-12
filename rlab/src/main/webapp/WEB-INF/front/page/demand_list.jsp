<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/front/assets/md5/jquery.md5.js"></script>

    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170622">

    <%--导入字体样式--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>

    <!--[if lt IE 10]>
    <script>
        isLtIE9 = true;
    </script>
    <![endif]-->

    <style>

        body, .wrapper {
            background-color: #f3f6f9 !important;
        }

        /*banner */
        .main .banner {
            width: 1120px;
            height: 166px;
            margin: 0 auto;
            /*background: darkred;*/
            margin-top: 15px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            overflow: hidden;
        }

        .main .banner > ul {
            width: 400%;
            position: absolute;
            left: 0;
            top: 0;
            list-style: none;
            /*background: pink;*/
        }

        .main .banner > ul li {
            width: 25%;
            float: left;
        }

        .main .banner > ul > img {
            width: 100%;
        }

        /*banner */
        .main .banner {
            width: 1120px;
            height: 166px;
            margin: 0 auto;
            margin-top: 15px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            position: relative;
        }

        /*msg*/
        .main .msg {
            width: 1120px;
            line-height: 34px;
            height: 36px;
            overflow: hidden;
            border: 1px solid #a6c5f5;
            background: #e7effc;
            margin: 0 auto;
            margin-top: 15px;
            text-align: center;
            font-size: 12px;
            color: #508df0;
            position: relative;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
        }

        .main .msg ul {
            list-style: none;
            position: absolute;
            width: 100%;
            text-align: center;
            top: 0;
            left: 0;
        }

        /*list*/
        .list {
            width: 1120px;
            margin: 0 auto;
            overflow: hidden;
            margin-top: 15px;
        }

        .list ul.col {
            float: left;
            list-style: none;
            width: 362px;
            margin-right: 16px;
            cursor: pointer;
        }

        /*cart样式 START*/
        .list ul.col > li {
            margin-bottom: 12px;
            padding: 0 38px;
            background: #fff;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            position: relative;
            border-bottom: 2px solid #508DF0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            overflow: hidden;
        }

        /*日期*/
        .list ul.col > li p.tip {
            font-size: 12px;
            line-height: 70px;
            margin-top: 14px;
        }

        .list p.tip span.date {
            color: #999;
        }

        .list p.tip span.status {
            margin-left: 6px;
            color: #508DF0;
        }

        /*文本*/
        .list ul.col > li p.txt {
            font-size: 14px;
            color: #4e4e4e;
            line-height: 24px;
        }

        /*数量*/
        .list ul.col > li p.num {
            line-height: 70px;
            text-align: right;
            font-size: 12px;
            color: #999;
        }

        .list ul.col > li p.num span {
            color: #508DF0;
        }

        .list ul.col > li button {
            position: absolute;
            left: 0;
            bottom: -3px;
            width: 100%;
            height: 60px;
            border: 0 none;
            outline: 0 none;
            background: #508DF0;
            color: #fff;
            font-size: 19px;
            cursor: pointer;
        }

        .list ul.col > li button.actived {
            background: #4f5c71;
        }

        .list ul.col > li button span {
            position: relative;
        }

        .list ul.col > li button i {
            color: #fff;
            font-size: 20px;
            position: absolute;
            left: -29px;
            top: 3px;
        }

        /*cart样式 END*/

        /*START发布需求*/
        .fb_dmd {
            width: 1120px;
            margin: 0 auto;
            margin-top: 10px;
            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            padding: 20px 25px;

        }

        .fb_dmd > p.title {
            font-size: 22px;
            color: #3d8cf8;
            line-height: 62px;
            font-weight: 600;
        }

        .fb_dmd > div.txt_box {
            /*width: 1070px;*/
            width: 100%;
            height: 130px;
            background: pink;
            overflow: hidden;
            position: relative;
            border: 1px solid #d0d0d0;
            color: #4e4e4e;
        }

        .fb_dmd > div.txt_box a {
            color: #3d8cf8;
            font-size: 12px;
            position: absolute;
            z-index: 2;
            left: 50%;
            top: 50%;
            margin-top: -9px;
            margin-left: -30px;
        }

        .fb_dmd > div.txt_box a:hover {
            text-decoration: underline;
        }

        .fb_dmd > div.txt_box textarea {
            width: 1040px;
            height: 140px;
            position: absolute;
            left: -5px;
            top: -5px;
            padding: 20px;
            font-size: 12px;
        }

        .fb_dmd > div.txt_box .count {
            font-size: 12px;
            color: #999;
            position: absolute;
            ght: 45px;
            position: absolute;
            right: 10px;
            bottom: 6px;
            z-index: 2;
        }

        .fb_dmd > div.fb_ct {
            text-align: right;
        }

        .fb_dmd > div.fb_ct button {
            width: 100px;
            height: 42px;
            line-height: 42px;
            background: #3d8cf8;
            font-size: 18px;
            color: #fff;
            outline: 0 none;
            border: 0 none;
            margin-right: 28px;
            margin-bottom: 20px;
            margin-top: 20px;
            cursor: pointer;
        }

        .fb_dmd > div.fb_ct button:active {
            background: #3e72c0;
        }

        .button {
            border-top-style: none;
            border-right-style: none;
            border-bottom-style: none;
            border-left-style: none;
            width: 110px;
            height: 40px;
            margin-top: 30px;
        }

        .banner_don {
            text-align: center;
            height: 36px;
            line-height: 36px;
        }

        .banner_don span {
            display: inline-block;
            width: 10px;
            height: 10px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            background: #d8d8d8;
            margin-right: 29px;
        }

        .banner_don span.cur {
            background: #3d8cf8;
        }

        /*ENd发布需求*/

    </style>
</head>
<body>
<div class="wrapper" style="background-color: white">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <%--首页、仪器共享、微需求切换tab--%>
    <div class="ins_tab">
        <ul class="bar">
            <li><a href="${rlab}/page/home">首页</a></li>
            <li><a onclick="toSearch()" href="javascript:void (0)">仪器共享</a></li>
            <li class="actived"><a href="${rlab}/page/req/listpage">微需求</a></li>
        </ul>
    </div>
    <!--模块-->
    <div class="main" style="margin-bottom: 100px">
        <div class="banner">
            <ul id="bannerUl">
                <li>
                    <img src="${rlab}/front/imgs/demand_create.jpg" alt="">
                </li>
                <li>
                    <img src="${rlab}/front/imgs/demand_banner_1.jpg" alt="">
                </li>
                <li>
                    <img src="${rlab}/front/imgs/demand_create.jpg" alt="">
                </li>
            </ul>
        </div>
        <div class="banner_don" id="bannerDon">
            <span class="cur" data-index="0"></span>
            <span data-index="1"></span>
        </div>

        <%--发布需求--%>
        <div class="fb_dmd">
            <p class="title">有什么需求告诉大家</p>
            <div class="txt_box">
                <textarea name="" style="background: #fff;" ${sessionScope.uid == null ? 'readonly':''} id="textarea"
                          maxlength="140" cols="30" rows="10"
                          placeholder="${sessionScope.uid != null ? '为了保证您获得质量更佳的服务，请具体描述该实验项目的可公开信息，包括但不限于研究目的/背景介绍、实验样品（名称、数量、状态、处理方式等）、实验方法（标准、技术规范等）、实验仪器设备（名称、品牌、型号等）以及服务方资质要求等。':''} "
                ></textarea>
                <p id="count" class="count" style="">0/140字</p>
                <c:if test="${sessionScope.uid == null}">
                    <a href="javascript:void(0);" onclick="logins()">登录/注册</a>
                </c:if>
            </div>
            <div class="fb_ct">
                <button id="publish" style="${sessionScope.uid == null?'opacity:0.5;':''}"
                        type="button"  ${sessionScope.uid == null ? 'disabled':''} >我要发布
                </button>
            </div>
        </div>
        <%--tip需求轮博栏--%>
        <div class="msg">
            <ul id="tipBtn">
                <%--<li data-index="0">用户132****88305 0分钟前解决了需求</li>--%>
            </ul>
        </div>
        <div id="container" class="list">
            <ul class="col">
                <%--<li>--%>
                <%--<p class="tip">--%>
                <%--<span class="date">2017 06 22 15:25</span>--%>
                <%--<span class="status">3天后需求过期</span>--%>
                <%--</p>--%>
                <%--<p class="txt">--%>
                <%--项目描述描述描述样品名称：煤灰样品数量：4个 测试项目：煤灰的穆斯堡尔谱 期望周期：两周之内 备注：可寄样长期合作 。 拷贝--%>
                <%--</p>--%>
                <%--<p class="num">--%>
                <%--已有<span>56</span>人看过此需求联系方式--%>
                <%--</p>--%>
                <%--<button style="display: none;" type="button"><span><i class="lab-phone-2"></i>联系需求人</span></button>--%>
                <%--</li>--%>
            </ul>
            <ul class="col">

            </ul>
            <ul class="col" style="float: right;margin-right: 0;">

            </ul>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <div id="modify" style="width: 400px; height: 170px; background-color: #cccccc; display: none">
        <p style="font-size: 16px; text-align: center; margin-top: 20px">确认发布此需求？</p>
        <button style="cursor:pointer;margin-left: 70px; float: left; background-color: white; border: 1px solid #ccc; color: #999"
                class="dismiss button">取消
        </button>
        <button style="cursor:pointer;margin-right: 70px; float: right; background-color: #508df0; color: white"
                class="commit button">
            确定
        </button>
    </div>
</div>
<script src="${rlab}/front/js/common/main.js?v_="></script>
<script type="text/javascript">
    var uId = '${sessionScope.uid}';
    var pageNumber = 1;
    var GET_AJAX_FLAG = false;// 防止重复进行ajax请求,第一次初始化会解开这个限制
    // 初始化10条数据
    $(function () {
        $.ajax({
            url: BASE_URL + '/page/req/listinfo?pageSize=10&pageNo=' + pageNumber,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            success: function (data) {
                GET_AJAX_FLAG = true;
                if (data.code === 0) {
                    pageNumber += 1;
                    var datas = data.payload.list;
                    loadMeinv(datas);
                    if (data.payload.length <= 0) {
                        GET_AJAX_FLAG = false;
                    }
                }
            },
            error: function () {
                GET_AJAX_FLAG = true;
            }
        })
    });

    /**
     *  创建所有的item ，分别加入到ul列表里
     * @param itemList ajax获取到的后台数据，数组对象
     */
    function loadMeinv(itemList) {

        for (var i = 0; i < itemList.length; i++) {//每次加载时模拟随机加载图片
            var item = createItem(itemList[i]);
            $minUl = getMinUl();
            $minUl.append(item);
            item = null;
        }

    }

    // 监听SCROLL
    $(window).on("scroll", function () {

        $minUl = getMinUl();
        // 当最短的ul的高度比窗口滚出去的高度+浏览器高度大时加载新图片
        if ($minUl.height() <= $(window).scrollTop() + $(window).height()) {

            if (GET_AJAX_FLAG) {
                $.ajax({
                    url: BASE_URL + '/page/req/listinfo?pageSize=10&pageNo=' + pageNumber,
                    type: 'GET',
                    dataType: "json",
                    contentType: "application/json",
                    async: true,
                    beforeSend: function () {
                        GET_AJAX_FLAG = false;
                    },
                    success: function (data) {
                        GET_AJAX_FLAG = true;
                        if (data.code === 0) {
                            pageNumber += 1;
                            var datas = data.payload.list;
                            loadMeinv(datas);
                            if (data.payload.length <= 0) {
                                GET_AJAX_FLAG = false;
                            }
                        }
                    },
                    error: function () {
                        GET_AJAX_FLAG = true;
                    }
                })

            }

        }

    });
    /**
     * 初始化轮播
     */
    (function initBanner() {
        var CurIndex = 0, imgWidth = 1120, liLen = $("#bannerUl li").length;
        setTimeout(initBannerPlay, 4000);
        function initBannerPlay() {
            CurIndex = CurIndex + 1;
            var flag = false;
            if (CurIndex == 2) {
                flag = true;
            }

            $("#bannerUl").stop().animate({"left": CurIndex * -imgWidth}, 1500, "linear", function () {
                if (flag) {
                    $("#bannerUl").css("left", 0);
                }
            });

            if (CurIndex == 2) {
                CurIndex = 0;
            }

            setDon();


            setTimeout(initBannerPlay, 4000);
        }
        function setDon() {
            $("#bannerDon span").each(function () {
                $(this).removeClass("cur");
            });
            $("#bannerDon span").eq(CurIndex).addClass("cur");
        }

        $("#bannerDon span").on("click", function () {
            CurIndex = $(this).data("index");
            var flag = false;
            $("#bannerUl").stop().animate({"left": CurIndex * -imgWidth}, 1500, "linear", function () {

            });
            setDon();

        })
    })();




    /**
     * 获取当前最短的URL
     */
    function getMinUl() {//每次获取最短的ul,将图片放到其后

        var $arrUl = $("#container .col");

        var $minUl = $arrUl.eq(0);

        $arrUl.each(function (index, elem) {

            if ($(elem).height() < $minUl.height()) {
                $minUl = $(elem);
            }

        });

        return $minUl;

    }

    /**
     * 生成单个Item卡片
     * @param data 传入单个卡片的数据
     */
    function createItem(data) {

        var html =
            '<li   onmouseover="showPhoneBtn(this)" onmouseleave="hidePhoneBtn(this)">\
                <p class="tip">\
                    <span class="date">' + data.beginTime + '</span>\
                <span class="status">' + data.remainTime + '天后需求过期' + '</span>\
                </p>\
                <p class="txt">'
            + data.uReqDescription +
            '</p>\
            <p class="num">\
            已有<span>' + data.uChkCount + '</span>人看过此需求联系方式\
                </p>\
                <button data-phone=' + data.uMobile + ' data-ureqid="' + data.uReqId + '"onclick="showPhone(this)"  onmouseleave="hidePhone(event, this)" class="call" style="display: none;" type="button"><span><i class="lab-phone-2"></i>联系需求人</span></button>\
            </li>';

        return $(html);
    }

    /**
     * 显示查看联系方式
     * @param $_this
     */
    function showPhoneBtn($_this) {
        $_btn = $($_this).find("button.call");
        $_btn.stop().slideDown(200);
    }

    /**
     * 隐藏查看联系方式
     * @param $_this
     */
    function hidePhoneBtn($_this) {

        $_btn = $($_this).find("button.call");
        $_btn.stop().slideUp(200);
    }

    /**
     * 点击查看联系方式，显示手机
     */
    function showPhone($_this) {
        if (uId) {
            $_this = $($_this);
            var phone = $_this.data('phone');
            var ureqid = $_this.data('ureqid');
            $_this.html('<span><i class="lab-phone-2"></i>' + phone + '</span>')
            $_this.addClass("actived");
            $_this.parent().css("border-bottom", '2px solid #4f5c71');

            $.ajax({
                url: '${rlab}/page/req/addcount?uReqId=' + ureqid,
                type: 'GET',
                dataType: "json",
                contentType: "application/json"
            }).done(function (data) {
                if (data.code == 0) {
                    $_this.parent().find(".num span").html($_this.parent().find(".num span").html() * 1 + 1);
                }
            }).fail(function (data) {
                console.log("增加人数失败");
            });
        } else {
            logins();
        }
    }

    /**
     * 移除隐藏手机号
     */
    function hidePhone(event, $_this) {
        event = event || window.event;
        var curTag = event.srcElement.nodeName.toUpperCase();
        if (curTag === 'BUTTON') {
            $_this = $($_this);
            $_this.html('<span><i class="lab-phone-2"></i>联系需求人</span>')
            $_this.removeClass("actived");
            $_this.parent().css("border-bottom", '2px solid #508DF0');
        }

    }

    /**
     * 控制提示层轮播
     * @param
     * @param
     */
    function TipControl() {
        // 初始化
        var tipArr = [];
        var tipBtn = $("#tipBtn");// 获取DOM
        getArrData(function (newArr, code) {
            if (newArr != null) {
                tipArr = newArr;
            } else {
                console.log(code);
            }
            // 初始化添加一个
            if (tipArr.length > 1) {
                credNewTipLi(tipBtn, tipArr);
            }
            // 启动定时器轮询tipArr
            setMyInterval();
        });

        this.setTipArr = setArr;// 设置轮询数组
        this.getArrData = getArrData;// 从后台获取最新数据
        this.getTipArr = getTipArr;// 获取当前轮询数组
        this.setMyInterval = setMyInterval;// 启动轮询
        this.credNewTipLi = credNewTipLi;// 创建提示栏

        function getArrData(cb) {
            $.ajax({
                url: '${rlab}/page/req/top',
                type: 'GET',
                dataType: "json",
                contentType: "application/json",
                beforeSend: function () {

                },
                success: function (data) {
                    if (data.code === 0 && data.payload.length > 0) {
                        var newArr = [];
                        for (var i = 0; i < data.payload.length; i++) {
//                            var time = Math.floor((((new Date()).getTime() - data.payload[i].modifyTime) / 1000) / 60);
                            // if (data.payload[i].uReqState === 3) {
                                newArr.push('用户' + data.payload[i].uName + '在  ' + data.payload[i].modifyTimeStr + ' 发布了需求');
                            // }
                            // else if (data.payload[i].uReqState === 0) {
                            //     newArr.push('用户' + data.payload[i].uName + '在  ' + data.payload[i].modifyTimeStr + ' 发布了需求');
                            // }
                        }
                        cb(newArr);
                    } else {
                        cb(null, data.code);
                    }
                },
                error: function () {
                    cb(null, 404);
                    console.log("${rlab}/page/req/top 请求失败");
                }
            })
        }

        function setArr(newArr) {
            tipArr = newArr;
        }

        function getTipArr() {
            return tipArr;
        }

        function setMyInterval() {
            setInterval(function () {
                // 数据量小于等于1直接跳出轮播
                if (tipArr.length <= 1) {
                    return false;
                }

                // 移除已经播放完的li标签(移除时如何确保他已经播放完)
                if (tipBtn.find("li").length > 1 && tipBtn.position().top < 0) {
                    tipBtn.find("li").eq(0).remove();// 已经上移，直接移除
                } else if (tipBtn.find("li").length > 1) {
                    // 先上移，再移除
                    tipBtn.animate({"top": -34}, function () {
                        tipBtn.find("li").eq(0).remove();// 已经上移，直接移除
                        tipBtn.css("top", 0);
                        credNewTipLi(tipBtn, tipArr);
                    });
                } else {
                    credNewTipLi(tipBtn, tipArr);//直接添加一个
                }

            }, 3000);
        }

        /**
         * 创建提示栏，tipitem
         * @param tipBtn
         * @param tipArr
         */
        function credNewTipLi(tipBtn, tipArr) {
            // 获取当前光标位置索引（此时tipBtn里面只有一个li）
            var index = tipBtn.find("li").eq(0).data("index") - 0;
            var cuIndex;
            // 下边界初始处理
            if (index || index == 0) {
                curIndex = index + 1;
            } else {
                curIndex = 0;
            }

            // 上边界处理
            if (index >= tipArr.length - 1) {
                getArrData(function (newArr, code) {
                    if (newArr != null) {
                        setArr(newArr);
                    }
                    curIndex = 0;// 循环到初始位置
                    var newLiData = tipArr[curIndex];// 获取到新标签内容
                    var newLi = $('<li>' + newLiData + '</li>');// 生成新标签
                    newLi.data("index", curIndex);// 添加标识位置
                    tipBtn.append(newLi);// 添加新元素到最新的

                })
            } else {

                var newLiData = tipArr[curIndex];// 获取到新标签内容
                var newLi = $('<li>' + newLiData + '</li>');// 生成新标签
                newLi.data("index", curIndex);// 添加标识位置
                tipBtn.append(newLi);// 添加新元素到最新的

            }


        }

    }
    var tip = new TipControl();

    $("#textarea").on("input", function () {
        var text = $(this).val();
        $("#count").text(text.length + '/140字');
    });
    var FLAG = true;
    $("#publish").on("click", function () {

        if (!FLAG) {
            layer.msg("不要频繁操作哟!");
            return false;
        }

        var text = $("#textarea").val();
        if (text.length == 0) {
            layer.msg("需求描述不能为空");
            return;
        }

        var html = $("#modify").html();
        var laryer = layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 0,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['400px', '150px'], //宽高
            content: html  //弹窗内容
        });


        $(".dismiss").off("click").on("click", function () {
            layer.close(laryer);
        });

        $(".commit").off("click").on("click", function () {

            var text = $("#textarea").val();
            var data = {
                'uReqDescription': text
            };

            $.ajax({
                url: '${rlab}/front/user/req/pub',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success: function (data) {
                    if (data.code === 0) {
                        layer.msg("需求发布成功，即将跳转");
                        setTimeout(function () {
                            window.location.href = '${rlab}/front/user/req/tinylist?pageNo=1&pageSize=10&state=0';
                        }, 1000)
                    }
                },
                error: function () {
                    layer.msg('发布失败，请重新操作！')
                },
                complete: function () {
                    FLAG = true;
                    layer.close(laryer);
                }
            })

        });
    })
</script>
<script>

</script>
</body>
</html>
