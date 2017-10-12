<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>

    <%@ include file="../../config/taglibs.jsp" %>

    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <%--jquer相关--%>
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_280x280.jpg")
        }

    </script>
    <%--layer--%>
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20170905">
    <link rel="stylesheet" href="${rlab}/front/css/goods_detail.css?v_=20170905">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>

    <style>
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }
    </style>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--详情模块-->
    <div class="detail">
        <!--商品信息-->
        <div class="goods_info clearfix">
            <!-- 左侧商品图片展示 -->
            <div class="goods_imgs">

                <div class="carousel imgs_box ">
                    <%--图片列表--%>
                    <ul id="imgeList" class="imageslist">

                        <c:choose>

                            <c:when test="${insPicList == null || insPicList.size() == 0}">
                                <li>
                                    <a href="javascript:void (0)"><img onerror="imgOnError(this)"
                                                                       src="${rlab}/common/common_img/default/ins_280x280.jpg"
                                                                       alt="商品图片"></a>
                                </li>
                            </c:when>

                            <c:otherwise>
                                <c:forEach items="${insPicList}" var="item">
                                    <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                        <li>
                                            <a href="${fn:substringBefore(item, "?")}" target="_"><img
                                                    onerror="imgOnError(this)"
                                                    src="${item}500_500" alt="商品图片"></a>
                                        </li>
                                    </c:if>

                                    <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                        <li>
                                            <a href="${item}" target="_"><img
                                                    onerror="imgOnError(this)"
                                                    src="${item}500_500" alt="商品图片"></a>
                                        </li>
                                    </c:if>

                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="num">
                        <c:if test="${insPicList != null && insPicList.size() != 0 && insPicList.size() != 1 }">
                            <c:forEach items="${insPicList}" var="item" varStatus="status">
                                <span class="${status.index == 0?"cur":""}"></span>
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="buttons" style="display: none;height: 0; width: 0;">
                        <a class="leftBtn"></a>
                        <a class="rightBtn"></a>
                    </div>

                    <%--<div class="bg"></div>--%>

                    <div id="magnifying" class="magnifying"></div>
                </div>
                <div id="bigImg" class="big_img">
                    <img src="#" alt="大图片">
                </div>
            </div>
            <!--右侧商品信息-->
            <div class="goods_card">

                <div class="top_info">
                    <h2><c:out
                            value="${detail.insName.length() > 25? detail.insName.substring(0,25).concat('...') :detail.insName}"
                            escapeXml="true"/></h2>

                    <p>
                        仪器编号：<span><c:out value="${detail.mapId}" escapeXml="true"/></span>
                    </p>

                    <p>
                        仪器型号：<span><c:out value="${detail.insMode}" escapeXml="true"/></span>
                    </p>

                    <p>
                        仪器品牌：<span><c:out value="${detail.insBrand}" escapeXml="true"/></span>
                    </p>

                    <p class="clearfix">
                        仪器产地：<span><c:out value="${detail.insOrigin}" escapeXml="true"/></span>
                        <span class="price">参考价格：<strong>
                            <c:choose>
                                <c:when test="${price.flag == 1}">
                                    <c:if test='${"无".equals(price.unit)}'>
                                        ${price.accPrice}元
                                    </c:if>
                                    <c:if test='${!"无".equals(price.unit)}'>
                                        ${price.accPrice}元/${price.unit}
                                    </c:if>
                                </c:when>
                                <c:when test="${price.flag == 2}">
                                    <c:if test='${price.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(price.unit)}'>
                                            ${price.scopeLowPrice}元起
                                        </c:if>
                                        <c:if test='${!"无".equals(price.unit)}'>
                                            ${price.scopeLowPrice}元/${price.unit}起
                                        </c:if>
                                    </c:if>
                                    <c:if test='${!price.scopeHighPrice.equals("0")}'>
                                        <c:if test='${"无".equals(price.unit)}'>
                                            ${price.scopeLowPrice} - ${price.scopeHighPrice}元
                                        </c:if>
                                        <c:if test='${!"无".equals(price.unit)}'>
                                            ${price.scopeLowPrice} - ${price.scopeHighPrice}元/${price.unit}
                                        </c:if>
                                    </c:if>
                                </c:when>
                                <c:when test="${price.flag == 3}">
                                    面议
                                </c:when>
                            </c:choose>
                        </strong></span>
                    </p>
                    <div class="goods_remark">
                        <span><c:out value="${price.remark}" escapeXml="true"/></span>
                    </div>
                </div>

                <div class="btm_btn">
                    <div class="lab-company"></div>
                    <span><c:out
                            value="${detail.orgName.length() > 20 ? detail.orgName.substring(0,20).concat('...') :detail.orgName}"
                            escapeXml="true"/></span>
                    <c:choose>

                        <c:when test="${sessionScope.uid == null}">
                            <button onclick="logins()" type="button">
                                查看联系方式
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button id="getCompanyInfo" type="button"
                                    data-org-name="${detail.orgName}"
                                    data-org-address="${detail.orgProvince }${detail.orgCity}${detail.orgStreet}"
                                    data-org-phone="
                                    ${detail.orgPhone}
                            <%--<c:choose>--%>
                            <%--<c:when test="${orgList.size() == 0}">--%>
                                 <%--暂无--%>
                            <%--</c:when>--%>
                            <%--<c:otherwise>--%>
                                <%--${orgList[0]}--%>
                            <%--</c:otherwise>--%>
                           <%--</c:choose>--%>
                         "
                                    data-user-name="
                                    <c:choose>
                            <c:when test="${orgPerson.size() == 0}">
                                 联系客服咨询详情
                            </c:when>
                            <c:when test="${orgPerson.size() > 1}">
                                 ${orgPerson[0]}，${orgPerson[1]}
                            </c:when>
                            <c:otherwise>
                                ${orgPerson[0]}
                            </c:otherwise>
                           </c:choose>
                         "
                                    data-user-phone="
                                    <%--${detail.orgContacts}--%>
                          <c:choose>
                            <c:when test="${perList.size() == 0}">
                                 联系客服咨询详情
                            </c:when>
                            <c:when test="${perList.size() > 1}">
                                 ${perList[0]}，${perList[1]}
                            </c:when>
                            <c:otherwise>
                                ${perList[0]}
                            </c:otherwise>
                           </c:choose>
                          ">查看机构联系方式
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <!--商品简介-->
        <div class="goods_intro">

            <div class="intro_title">详情简介</div>
            <c:forEach items="${des}" var="item" varStatus="index">
                <div class="item">
                    <h3 class="item_title">${item.title}：</h3>
                    <p class="item_txt">
                        <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                    </p>
                </div>
            </c:forEach>
            <c:forEach items="${coreParamList}" var="item" varStatus="index">
                <div class="item">
                    <h3 class="item_title">${item.title}：</h3>
                    <p class="item_txt">
                        <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                    </p>
                </div>
            </c:forEach>
            <c:forEach items="${mapDesInfo}" var="item" varStatus="index">
                <div class="item <c:if test="${index.last}">last_item</c:if>">
                    <h3 class="item_title">${item.title}：</h3>
                    <p class="item_txt">
                        <c:forEach items="${item.content}" var="con">${con}</c:forEach>
                    </p>
                </div>
            </c:forEach>
            <%--<c:if test="${mapDesInfo.maintenanceCondition != null}">--%>
            <%--<div class="item">--%>
            <%--<h3 class="item_title">保养情况</h3>--%>
            <%--<p class="item_txt">--%>
            <%--${mapDesInfo.maintenanceCondition}--%>
            <%--</p>--%>
            <%--</div>--%>
            <%--</c:if>--%>
            <%--<c:if test="${mapDesInfo.productionDate != null}">--%>
            <%--<div class="item">--%>
            <%--<h3 class="item_title">出厂日期</h3>--%>
            <%--<p class="item_txt">--%>
            <%--${mapDesInfo.productionDate}--%>
            <%--</p>--%>
            <%--</div>--%>
            <%--</c:if>--%>
            <%--<c:if test="${mapDesInfo.purchaseDate != null}">--%>
            <%--<div class="item">--%>
            <%--<h3 class="item_title">购买日期</h3>--%>
            <%--<p class="item_txt">--%>
            <%--${mapDesInfo.purchaseDate}--%>
            <%--</p>--%>
            <%--</div>--%>
            <%--</c:if>--%>
            <%--<c:if test="${mapDesInfo.field != null}">--%>
            <%--<div class="item">--%>
            <%--<h3 class="item_title">领域</h3>--%>
            <%--<p class="item_txt">--%>
            <%--${mapDesInfo.field}--%>
            <%--</p>--%>
            <%--</div>--%>
            <%--</c:if>--%>

            <%--<div class="item last_item">--%>
            <%--<h3 class="item_title">其他说明</h3>--%>
            <%--<p class="item_txt">--%>

            <%--<c:choose>--%>
            <%--<c:when test="${mapDesInfo.otherComments != null}">--%>
            <%--<c:forEach items="${mapDesInfo.otherComments}" var="item" varStatus="index">--%>
            <%--${item}<br>--%>
            <%--</c:forEach>--%>
            <%--</c:when>--%>
            <%--<c:otherwise>--%>
            <%--暂无--%>
            <%--</c:otherwise>--%>
            <%--</c:choose>--%>

            <%--</p>--%>
            <%--</div>--%>
        </div>
    </div>

    <!-- 查看联系方式弹窗模块todo:动态添加 -->
    <!--<div class="company_info">-->
    <!--<div class="title">-->
    <!--<span class="strong">持有机构</span>-->
    <!--<span class="names">北京北大燕园机构分析中心有限公司</span>-->
    <!--<i id="" class="lab-close-1"></i>-->
    <!--</div>-->
    <!--<div class="infos">-->
    <!--<div class="info_card">-->
    <!--<div class="info_address">-->
    <!--<p class="address">-->
    <!--<i class="lab-adress"></i><span>北京昌平区回龙观上北中心</span>-->
    <!--</p>-->
    <!--<p class="phone_400">-->
    <!--<i class="lab-phone"></i><span>010-1256325</span>-->
    <!--</p>-->
    <!--</div>-->
    <!--<div class="principal">-->
    <!--<h4>机构联系人</h4>-->
    <!--<div>-->
    <!--<div class="pc_name"><i class="lab-user"></i><span>王思聪</span></div>-->
    <!--<div class="pc_phone"><i class="lab-phone"></i><span>13261688305</span></div>-->
    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="baidu_map">-->
    <!--<div class="baidumap" id="baidumap">-->

    <!--</div>-->
    <!--</div>-->
    <!--</div>-->
    <!--<div class="compay_infos">-->
    <!--<div class="adress_content">-->
    <!--<div class="txt">-->
    <!--<p>如您有其他需要，您可以关注</p>-->
    <!--<p>人人实验服务号，咨询人工客服</p>-->
    <!--</div>-->

    <!--<div class="about_me">-->
    <!--<img src="imgs/icon/qr_code_wx_renrenlab.jpg" alt="人人实验服务号二维码">-->
    <!--</div>-->

    <!--</div>-->
    <!--</div>-->
    <!--</div>-->

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<!--my common js-->
<script src="${rlab}/front/js/common/main.js??v_=20170905"></script>
<script src="${rlab}/front/js/util/baiduMap.js?v_=20170905"></script>
<script>

    chuantong(300, 4000, 288);
    //    startMagnify();关闭图片放大镜功能

    // 轮播
    function chuantong(speed, intervalTime, width) {

        //全局变量
        var nowimg = 0;		//信号量，当前显示的图片序号
        setBigSrc(nowimg);// 初始化放大镜大图
        //得到图片的总数量
        var imageAmount = $(".imageslist li").length;

        // 克隆第一张图片，然后追加到最后一张去
        if (imageAmount > 1) {
            $(".imageslist li:first").clone().appendTo(".imageslist");
            //得到所有元素，给变量名之前加$，是个约定。一眼就能知道，这个变量存放着jQuery元素。
            var $imagesList = $(".imageslist");
            var $circles = $(".num span");
            //右按钮的事件
            $(".rightBtn").click(rightBtnFunc);	//有名函数，不要加圆括号！！

            //我们把右按钮要做的事情，单独提炼出一个函数。起名字。
            //这么做的原因，是为了定时器的调用。
            function rightBtnFunc() {

                if (!$imagesList.is(":animated")) {
                    //分类讨论，现在到底到没到最后一张
                    if (nowimg < imageAmount - 1) {
                        nowimg++;
                        //普通运动，拉到第nowimg这张图片上
                        normalAnimate();	//调用函数，普通运动
                    } else {
                        nowimg = 0;
                        //往第5张（假0）身上拉，然后瞬间切换到0。
                        $imagesList.animate({"left": imageAmount * -width}, speed, "linear", function () {
                            //回调函数
                            $(this).css("left", 0);	//css是瞬间的
                        });
                    }
                    setBigSrc(nowimg);// 自动轮播时，动态设置放大镜大图
                    changeCircle();	//调用函数，小圆点
                }
            }

            //左按钮
            $(".leftBtn").click(function () {
                if (!$imagesList.is(":animated")) {
                    //分类，判断现在是不是到头了
                    if (nowimg > 0) {
                        nowimg--;
                        normalAnimate();	//调用函数，普通运动
                    } else {
                        nowimg = imageAmount - 1;
                        //到头了，让假0替换真0
                        $imagesList.css("left", imageAmount * -width);
                        normalAnimate();	//调用函数，普通运动
                    }
                    changeCircle();	//调用函数，小圆点
                }
            });

            //小圆点的点击
            $(".num span").click(function () {
                if (!$imagesList.is(":animated")) {
                    nowimg = $(this).index();
                    //  setBigSrc(nowimg);// 更新放大镜大图
                    normalAnimate();//调用函数，普通运动
                    changeCircle();	//调用函数，小圆点
                }
            });

            // 普通运动，让火车往信号上拉
            function normalAnimate() {
                $imagesList.animate({"left": nowimg * -width}, speed, "linear");
            }

            //小圆点函数，让信号量那个小圆点有cur，其余没有cur
            function changeCircle() {
                $circles.eq(nowimg).addClass("cur").siblings().removeClass("cur");
            }

            //定时器的业务
            var timer = setInterval(rightBtnFunc, intervalTime);

            //鼠标进入，停止
            $(".carousel").mouseenter(function () {
                clearInterval(timer);
            });

            //鼠标离开，继续
            $(".carousel").mouseleave(function () {
                clearInterval(timer);
                timer = setInterval(rightBtnFunc, intervalTime);
            });

        }


    }

    // 放大镜
    function startMagnify() {

        $(".imgs_box").mousemove(
            function (e) {

                //计算盒子内的鼠标位置：
                var x = e.pageX - $("div.imgs_box").offset().left;
                var y = e.pageY - $("div.imgs_box").offset().top;

                //验收，保证放大镜，不能移出盒子
                if (x < 60) {
                    x = 60;
                }

                if (y < 60) {
                    y = 60;
                }

                if (x > 288 - 60) {
                    x = 288 - 60;
                }

                if (y > 288 - 60) {
                    y = 288 - 60;
                }

                // 让放大镜跟随鼠标：
                $("#magnifying").css({
                    "left": x - 60,
                    "top": y - 60
                });

                //让大图的background-position，等比例变化
                var beijingx = -(800 / 288) * (x - 60);
                var beijingy = -(800 / 288) * (y - 60);

                $("#bigImg img").css({
                    "left": beijingx + "px ",
                    "top": beijingy + "px"
                });

            }
        );


        $(".imgs_box").mouseenter(function () {
            $("#magnifying").show();
            $("#bigImg").show()
        })

        $(".imgs_box").mouseleave(function () {
            $("#magnifying").hide();
            $("#bigImg").hide()
        })

    }

    // 设置放大镜大图片
    function setBigSrc(index) {
        var img = $("#imgeList > li img").eq(index);
        var src = img.attr("src");

        $("#bigImg").empty();

        $("#bigImg").append('<img src="' + src + '"></img>');

    }

    // 设置百度地图
    function setBaiduMap(adress) {
        loadJScriptMove(adress, 0, 0);
    }

    // 查看机构联系方式
    $("#getCompanyInfo").on("click", function () {

        var $this = $(this);
        var data = $this.data();
//        var phone = data.orgPhone;
        var phone = '';
        phone = phone.replace(/ /g, "");
        phone = phone.replace(/\n/g, "");
        var style = 'style="height: 50px; line-height: 50px;"';

//        var userPhone = data.userPhone;
        var userPhone = data.orgPhone;
        userPhone = userPhone.replace(/ /g, "");
        userPhone = userPhone.replace(/\n/g, "");


        var orgName = data.orgName;
        var orgAddress = data.orgAddress;
        var userName = data.userName.trim();

        var userPhoneStyle = '';

        // 处理电话
        if (phone == "") {
            phone = "联系客服咨询详情";
            style = 'style="color: #b5b5b5; height: 50px; line-height: 50px;"';
        }

        // 处理用户手机
        if (userPhone == "") {
            userPhone = "联系客服咨询详情";
            userPhoneStyle = 'style="color: #b5b5b5"';
        }

        // 处理机构名称
        if (data.orgName.length > 18) {
            orgName = data.orgName.slice(0, 14) + "..." + data.orgName.slice(-5);
        }

        // 处理机构地址

        if (data.orgAddress.length > 16) {
            orgAddress = data.orgAddress.slice(0, 9) + "..." + data.orgAddress.slice(-5);
        }

        if (userName !== "联系客服咨询详情" && userName.length > 4) {
            userName = userName.slice(0, 3) + "...";
        }

        if (userPhone !== "联系客服咨询详情" && userPhone.length > 14) {
            userPhone = userPhone.slice(0, 14) + "...";
        }

//        if (userName.trim() !== "联系客服咨询详情" && userName.trim().length > 4) {
//            userName = data.userName.slice(0,3) +  "..." ;
//        }

        // 处理姓名
//        if (userName.trim() !== "联系客服咨询详情") {
//            var resaultName = [];
//
//            if(userName.indexOf("，") !== -1){
//               userName =  userName.split("，");
//            }
//
//            for(var i = 0 ; i < userName.length ; i ++ ) {
//
//                if ( userName[i].indexOf(",") == -1 ) {
//                    resaultName.push(userName[i]);
//                }else {
//                    resaultName =  resaultName.concat(userName[i].split(","));
//                }
//
//            }
//
//            for (var j = 0 ; j < resaultName.length ; i++) {
//
//            }
//        }


        // 处理模板
        var html =
            '<div class="company_info">\
                <div class="title">\
                    <span class="strong">持有机构</span>\
                    <span class="names" title="' + data.orgName + '"  style="cursor:pointer;">' + orgName + '</span>\
                    <i id="closeLayerInfo" class="lab-close-1"></i>\
                </div>\
                <div class="infos">\
                    <div class="info_card">\
                        <div class="info_address">\
                        <i class="lab-adress" style="float: left; height: 50px;line-height: 50px;"></i>\
                            <p class="address" title="' + data.orgAddress + '" style="cursor:pointer;">\
                                ' + orgAddress + '\
                            </p>\
                        </div>\
                        <div class="info_address">\
                        <i class="lab-phone" style="float: left; margin-top: 16px"></i>\
                            <p class="phone_400" ' + style + '>\
                                ' + phone + '\
                            </p>\
                        </div>\
                        <div class="principal">\
                            <h4>机构联系人</h4>\
                            <div>\
                                <div class="pc_name"><i class="lab-user" ></i><span title="' + data.userName + '" style="cursor:pointer;">' + userName + '</span></div>\
                                <div class="pc_phone"><i class="lab-phone"></i><span ' + userPhoneStyle + ' title="' + data.userPhone + '" style="cursor:pointer;">' + userPhone + '</span></div>\
                            </div>\
                        </div>\
                    </div>\
                    <div class="baidu_map">\
                    <div class="baidumap" id="baidumap"></div>\
                    </div>\
                </div>\
                <div class="compay_infos">\
                    <div class="adress_content">\
                        <div class="txt">\
                            <p>体验更多VIP个性化定制服务和专业化解决方案</p>\
                            <p>敬请拨打客服热线400-102-9559或关注人人实验服务号</p>\
                        </div>\
                        <div class="about_me">\
                            <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="人人实验服务号二维码">\
                        </div>\
                    </div>\
                </div>\
            </div>';

        setBaiduMap(data.orgAddress);
        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        $("#closeLayerInfo").off("click").on("click", function () {
            layer.close(layer_info);
        })

    })


</script>
</body>
</html>
