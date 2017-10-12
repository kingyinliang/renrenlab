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
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20170905">
    <%--<link rel="stylesheet" href="${rlab}/front/css/goods_detail.css?v_=20170622">--%>
    <link rel="stylesheet" href="${rlab}/front/css/ins_detail.css?v_=20170905">

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
    <div class="ins_detail">
        <%--仪器和机构信息--%>
        <div class="info clearfix">
            <div class="ins_info br_4">
                <p>
                    <span class="ins_num left"><i class="lab-dian_small"
                                                  style="position: absolute;left: -10px;top: 0;font-size: 28px;"></i>编号：<c:out
                            value="${detail.mapId}"
                            escapeXml="true"/></span>
                    <span class="ins_service right" style="padding-left: 20px;"><i
                            class="lab-biaoqian_1"></i>${detail.insServiceName}</span>
                    <%--仪器租赁--%>
                </p>
                <div class="clearfix">
                    <div class="ins_img">
                        <ul id="imgeList">
                            <c:choose>
                                <c:when test="${detail.insPic == null || detail.insPic.size() == 0}">
                                    <li>
                                        <img onerror="imgOnError(this)"
                                             src="${rlab}/common/common_img/default/ins_280x280.jpg" alt="商品默认图片">
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach items="${detail.insPic }" var="item">
                                        <c:if test="${fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${fn:substringBefore(item, "?")}" target="_blank">
                                                    <img onerror="imgOnError(this)" src="${item}500_500" alt="商品图片1">
                                                </a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!fn:contains(item, 'http://renrenlab.oss')}">
                                            <li>
                                                <a href="${item}" target="_blank">
                                                    <img onerror="imgOnError(this)" src="${item}500_500" alt="商品图片2">
                                                </a>
                                            </li>
                                        </c:if>

                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                        <div class="num">
                            <c:if test="${detail.insPic != null && detail.insPic.size() > 1}">
                                <c:forEach items="${detail.insPic}" var="item" varStatus="status">
                                    <span class='${status.index == 0?"cur":""}'></span>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <div class="ins_txt">
                        <h4>${detail.insName.length() > 25? detail.insName.substring(0,25).concat('...') :detail.insName}</h4>
                        <div class="p">
                            <span>仪器型号：</span>
                            <div>
                                <c:out value="${detail.insMode}" escapeXml="true"/>
                            </div>
                        </div>
                        <div class="p">
                            <span>仪器品牌：</span>
                            <div>
                                <c:out value="${detail.insBrand}" escapeXml="true"/>
                            </div>
                        </div>
                        <div class="p">
                            <span>仪器产地：</span>
                            <div>
                                <c:out value="${detail.insOrigin}" escapeXml="true"/>
                            </div>
                        </div>
                        <div class="p">
                            <span>仪器分类：</span>
                            <div>
                                ${detail.insCategory[0].length() > 25 ? detail.insCategory[0].substring(0,20).concat('...') :detail.insCategory[0]}
                                >
                                ${detail.insCategory[1].length() > 25 ? detail.insCategory[1].substring(0,20).concat('...') :detail.insCategory[1]}
                                >
                                ${detail.insCategory[2].length() > 25 ? detail.insCategory[2].substring(0,20).concat('...') :detail.insCategory[2]}
                            </div>
                        </div>
                        <div class="p">
                            <span>应用领域：</span>
                            <div>
                                <c:forEach items="${detail.insScope}" var="scope" varStatus="status">
                                    <c:if test="${status.first}">
                                        ${scope}
                                    </c:if>
                                    <c:if test="${!status.first}">
                                        ,${scope}
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="p">
                            <span>仪器特点：</span>
                            <div class="ins_feature">
                                <c:choose>
                                    <c:when test="${detail.insFeature != null && detail.insFeature != ''}">
                                        <c:forEach items="${detail.insFeature}" var="scope">
                                            <c:choose>
                                                <c:when test="${'读取快'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:when test="${'精度高'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:when test="${'灵敏度高'.equals(scope)}">
                                                    <i class="tp_8">${scope}</i>
                                                </c:when>
                                                <c:when test="${'抗干扰强'.equals(scope)}">
                                                    <i class="tp_8">${scope}</i>
                                                </c:when>
                                                <c:when test="${'操作简便'.equals(scope)}">
                                                    <i class="tp_8">${scope}</i>
                                                </c:when>
                                                <c:when test="${'性能稳定'.equals(scope)}">
                                                    <i class="tp_8">${scope}</i>
                                                </c:when>
                                                <c:when test="${'定期校准'.equals(scope)}">
                                                    <i class="tp_8">${scope}</i>
                                                </c:when>
                                                <c:when test="${'效率高'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:when test="${'服务好'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:when test="${'周期短'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:when test="${'价格低'.equals(scope)}">
                                                    <i class="tp_7">${scope}</i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="tp_7">${scope}</i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        不详
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div class="refer">
                            参考价格：
                            <span>
                                   <c:choose>
                                       <c:when test="${detail.price.flag == 1}">
                                           <c:if test='${"无".equals(detail.price.unit)}'>
                                               ￥${detail.price.accPrice}
                                           </c:if>
                                           <c:if test='${!"无".equals(detail.price.unit)}'>
                                               ￥${detail.price.accPrice}/${detail.price.unit}
                                           </c:if>
                                       </c:when>
                                       <c:when test="${detail.price.flag  == 2}">
                                           <c:if test='${detail.price.scopeHighPrice.equals("0")}'>
                                               <c:if test='${"无".equals(detail.price.unit)}'>
                                                   ￥${detail.price.scopeLowPrice}起
                                               </c:if>
                                               <c:if test='${!"无".equals(detail.price.unit)}'>
                                                   ￥${detail.price.scopeLowPrice}/${detail.price.unit}起
                                               </c:if>
                                           </c:if>
                                           <c:if test='${!detail.price.scopeHighPrice.equals("0")}'>
                                               <c:if test='${"无".equals(detail.price.unit)}'>
                                                   ￥${detail.price.scopeLowPrice} ~ ${detail.price.scopeHighPrice}
                                               </c:if>
                                               <c:if test='${!"无".equals(detail.price.unit)}'>
                                                   ￥${detail.price.scopeLowPrice} ~ ${detail.price.scopeHighPrice}/${detail.price.unit}
                                               </c:if>
                                           </c:if>
                                       </c:when>
                                       <c:when test="${detail.price.flag  == 3}">
                                           面议
                                       </c:when>
                                   </c:choose>
                            </span>
                            <p>${detail.price.remark}</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="org_info br_4" style="position: relative">
                <div class="clearfix">
                    <c:if test="${orgInfo.orgRank != null}">
                        <div class="exponent" style="background: #f5a761;">
                            <p class="num">${orgInfo.orgRank}</p>
                            <p class="txt">排名</p>
                            <img src="${rlab}/front/imgs/icon/share_num_bg_yl.jpg" alt="">
                        </div>
                    </c:if>
                    <c:if test="${orgInfo.orgShareIndex != null}">
                        <div class="exponent">
                            <p class="num">${orgInfo.orgShareIndexStr}</p>
                            <p class="txt">共享指数</p>
                            <img src="${rlab}/front/imgs/icon/share_num_bg.jpg" alt="">
                        </div>
                    </c:if>
                </div>
                <p class="img" style="position: relative;">
                    <c:choose>
                        <c:when test="${orgInfo.orgLogo != null && orgInfo.orgLogo.trim()  != ''}">
                            <c:if test="${orgInfo.orgPositionList !=null && orgInfo.orgPositionList.size() > 0}">
                                <img src='${orgInfo.orgLogo}?x-oss-process=image/crop,x_${orgInfo.orgPositionList.get(0)},y_${orgInfo.orgPositionList.get(1)},w_${orgInfo.orgPositionList.get(2)},h_${orgInfo.orgPositionList.get(3)}'>
                            </c:if>
                            <c:if test="${orgInfo.orgPositionList.size() <= 0 || orgInfo.orgPositionList == null}">
                                <img src="${orgInfo.orgLogo}">
                            </c:if>
                        </c:when>
                        <c:otherwise>
                            <img src="${rlab}/front/imgs/icon/org_logo_default.png">
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${orgInfo.orgIdentification == 1}">
                        <i class="lab-renzheng_1"
                           style="color: #f4af71;font-size: 12px;position: absolute;top: 0;font-size: 20px;top: -5px;left: 180px;background: white;border-radius: 10px;"></i>
                    </c:if>

                </p>
                <p class="org_name">
                    <a href="${rlab}/front/org/${orgInfo.orgOid}" target="_blank">
                        ${orgInfo.orgName.length() > 20? orgInfo.orgName.substring(0,18).concat('...') :orgInfo.orgName}
                    </a>
                </p>
                <p style="position: absolute;bottom: 40px;width: 100%">
                    <%--${detail.conId.conPhone}--%>
                    <c:choose>
                        <c:when test="${sessionScope.uid != null}">
                            <button onclick="showOrgInfoModal(this)"
                                    class="init-btn bg-blue"
                                    type="button"
                                    data-org-name="${orgInfo.orgName}"
                                    data-org-province="${orgInfo.orgAddress.orgAddrProvince}"
                                    data-org-city="${orgInfo.orgAddress.orgAddrCity}"
                                    data-org-district="${orgInfo.orgAddress.orgAddrDistrict}"
                                    data-org-street="${orgInfo.orgAddress.orgAddrStreet}"
                                    data-org-phone="${orgInfo.orgContacts.conPhone}"
                                    data-org-ins-phone='[
                                    <c:forEach items="${detail.conId}" var="item" varStatus="status">
                                        <c:choose>
                                            <c:when test="${!status.last}">
                                                {"phone":"${item.conPhone}","name":"${item.conName}"},
                                            </c:when>
                                            <c:otherwise>
                                                {"phone":"${item.conPhone}","name":"${item.conName}"}
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    ]'
                            >查看机构联系方式
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button onclick="logins()" class="init-btn bg-blue" type="button">查看机构联系方式</button>
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="tip" style="position: absolute;bottom: 10px;width: 100%">
                    机构的联系方式登录后可以查看
                </p>
            </div>
        </div>
        <%--核心参数--%>
        <c:if test="${detail.insCoreParam != null &&  detail.insCoreParam.size() > 0}">
            <div class="ins_core br_4">
                <h4>核心参数</h4>
                <div class="tb left br_6">
                    <c:forEach items="${detail.insCoreParam}" var="coreParam" varStatus="status">
                        <c:if test="${status.index <= detail.insCoreParam.size()/2 || detail.insCoreParam.size() == 1}">
                            <p class="tr">

                                <span title="${coreParam.title}">${coreParam.title}</span>
                                <a href="javascript:void(0);"
                                   title="${coreParam.content}">${coreParam.content.length() > 16? coreParam.content.substring(0,16).concat('...') :coreParam.content}</a>
                            </p>
                        </c:if>
                    </c:forEach>
                </div>

                <div class="tb right br_6">
                    <c:forEach items="${detail.insCoreParam}" var="coreParam" varStatus="status">
                        <c:if test="${status.index > detail.insCoreParam.size()/2 &&  detail.insCoreParam.size() > 1}">
                            <p class="tr">
                                <span title="${coreParam.title}">${coreParam.title}</span>
                                <a href="javascript:void(0);" title="实验室">${coreParam.content}</a>
                            </p>
                        </c:if>
                    </c:forEach>
                        <%--<p class="tr">--%>
                        <%--<span title="仪器种类">仪器种类</span>--%>
                        <%--<a href="javascript:void(0);" title="实验室">实验室</a>--%>
                        <%--</p>--%>
                </div>
            </div>
        </c:if>
        <%--简介--%>
        <div class="goods_intro" style="margin-bottom: 100px;">
            <div class="intro_title">
                详情简介
                <c:if test="${detail.linkPage != null && detail.linkPage != ''}">
                    <a href="${detail.linkPage}" target="_blank" style="display: none">点击查看此仪器更详细的信息</a>
                </c:if>
            </div>
            <c:forEach items="${detail.insDescription}" var="des">
                <div class="item">
                    <h3 class="item_title">${des.title}：</h3>
                    <p class="item_txt">
                            ${des.content}
                    </p>
                </div>
            </c:forEach>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>

<!--my common js-->
<script src="${rlab}/front/js/common/main.js??v_=20170905"></script>
<script src="${rlab}/front/js/util/baiduMap.js?v_=20170905"></script>
<%--<script src="http://api.map.baidu.com/api?v=2.0&ak=A4nolGZjoPlGYMl42qD6csYeDHKRdG8h" type="text/javascript"></script>--%>
<script>

    chuantong(300, 4000, 324);
    // 轮播
    function chuantong(speed, intervalTime, width) {

        //全局变量
        var nowimg = 0;		//信号量，当前显示的图片序号
        //得到图片的总数量
        var imageAmount = $("#imgeList li").length;

        // 克隆第一张图片，然后追加到最后一张去
        if (imageAmount > 1) {

            $("#imgeList li:first").clone().appendTo("#imgeList");
            //得到所有元素，给变量名之前加$，是个约定。一眼就能知道，这个变量存放着jQuery元素。
            var $imagesList = $("#imgeList");
            var $circles = $(".num span");
            console.log($circles);
            //右按钮的事件
            $(".rightBtn").click(rightBtnFunc);	//有名函数，不要加圆括号！！

            // 我们把右按钮要做的事情，单独提炼出一个函数。起名字。
            // 这么做的原因，是为了定时器的调用。
            function rightBtnFunc() {

                if (!$imagesList.is(":animated")) {
                    // 分类讨论，现在到底到没到最后一张
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
    // 设置百度地图
    function setBaiduMap(adress) {
        loadJScriptMove(adress, 0, 0);
    }


    //    if (MAP_CONFIG.ADDRESS != undefined && MAP_CONFIG.ADDRESS !== "" && MAP_CONFIG.ADDRESS != null) {
    //        try {
    //            searchByStationName(map, MAP_CONFIG.ADDRESS);
    //        } catch (e) {
    //            searchByStationName(map, '中国');
    //        }
    //    } else {
    //        searchByStationName(map, '中国');
    //    }

    /**
     * 查看机构信息
     */
    function showOrgInfoModal($_this) {
        var $_this = $($_this);
        var data = $_this.data();

        var html =
            '<div class="company_info">\
                <div style="padding: 0 50px;">\
                    <div class="title">\
                        <div>\
                            <h6>持有机构</h6>\
                            <span>联系我时请说明是从人人实验看到的信息呦！</span>\
                        </div>\
                        <p>' + data.orgName + '</p>\
                          <i id="closeLayerInfo" class="lab-close-1"></i>\
                    </div>\
                    <div class="org_infos">\
                        <p class="org_add">\
                        <i class="lab-adress"></i><span>' + data.orgProvince + data.orgCity + data.orgCity + data.orgDistrict + data.orgStreet + '</span>\
                        </p>\
                        <div class="org_phone">\
                        <i class="lab-phone"></i>\
                        <span >\
                        <s>办公电话</s>' + data.orgPhone + '\
                        </span>\
                        <p id="userPhone" style="overflow: hidden;">\
                        </p>\
                    </div>\
                    </div>\
                    <div class="baidu_map">\
                    <div class="baidumap" id="baidumap" style="height: 187px;">\
                    </div>\
                    </div>\
                    </div>\
                    <div class="compay_infos bg-blue">\
                    <div class="about_me">\
                    <img src="http://www.renrenlab.com/rlab/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="人人实验服务号二维码">\
                    </div>\
                    <div class="txt">\
                    <p>如您有其他需要，您可以关注</p>\
                <p>人人实验服务号，咨询人工客服</p>\
                </div>\
                </div>\
                </div>';

        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        try {
            setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}${orgInfo.orgAddress.orgAddrStreet}');
        } catch (e) {
            setBaiduMap('${orgInfo.orgAddress.orgAddrProvince}${orgInfo.orgAddress.orgAddrCity}${orgInfo.orgAddress.orgAddrDistrict}');
        }

//        var map = initMap();
//        searchByStationName(map, data.orgStreet);

        for (var i = 0; i < data.orgInsPhone.length; i++) {
            $("#userPhone").append('<span style="float: left;">\
                                <s>' + data.orgInsPhone[i].name + '</s>\
                                <em>' + data.orgInsPhone[i].phone + '</em>\
                            </span>');
        }

        $("#closeLayerInfo").off("click").on("click", function () {
            layer.close(layer_info);
        })

    }


</script>
</body>
</html>
