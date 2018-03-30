<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description"
          content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <script>
        /**
         * 图片加载失败
         * @param $_this
         */
        function imgOnError($_this) {
            $($_this).attr("src", "${rlab}/common/common_img/default/ins_640X424.jpg")
        }

    </script>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/search_result.css">

    <style>

        #listmain {
            margin-top: 0.2rem;
        }

        .fixedTab {
            position: inherit;
            height: 1.07rem;
            line-height: 1.065rem;
            font-size: 0.32rem;
            letter-spacing: 0.011rem;
            color: #000000;
            padding: 0 0.347rem;
        }

        .superSearch p {
            padding-top: 0.2rem;
            font-size: 0.267rem;
            letter-spacing: 0.009rem;
            color: #4d4d4d;
        }

        .superSearch {
            padding: 0 0.347rem;
        }

        .superSearch div {
            margin-top: 0.347rem;
            width: 7rem;
            float: left;
        }

        .superSearch a {
            background-color: #9ab8ec;
            border-radius: 0.24rem;
            color: #ffffff;
            letter-spacing: 0.009rem;
            font-size: 0.267rem;
            height: 0.48rem;
            line-height: 0.48rem;
            display: inline-block;
            padding: 0 0.16rem;
            margin: 0 0.293rem 0.213rem 0;
        }

        .gosuper {
            margin-top: 0.45rem;
            float: right;
            display: block;
            color: white;
            letter-spacing: 0.011rem;
            height: 0.827rem;
            line-height: 0.827rem;
            padding: 0 0.427rem;
            background-image: linear-gradient(90deg,
            #a3ceff 0%,
            #6aa0ff 100%);
            border-radius: 0.507rem;
        }

        #listmain h3 {
            float: left;
            font-size: 0.427rem;
            line-height: 0.7rem;
            letter-spacing: 0.014rem;
            color: #505050;
        }

        #listmain .more {
            float: right;
            line-height: 0.7rem;
            font-size: 0.32rem;
            letter-spacing: 0.011rem;
            color: #505050;
        }

        .message .itemtit {
            height: 1.5rem;
        }

        .message div {
            line-height: 0.5rem;
        }

        .message span {
            color: #7f7f7f;
        }

        .godemand {
            margin: auto;
            display: inline-block;
            color: white;
            padding: 0 0.48rem;
            height: 0.827rem;
            line-height: 0.827rem;
            background-image: linear-gradient(90deg,
            #a3ceff 0%,
            #6aa0ff 100%);
            border-radius: 0.507rem;
        }

        .qrCode {
            font-size: 0.293rem;
            letter-spacing: 0.01rem;
            color: #322d2d;
            line-height: 0.32rem;
            padding: 0 0.9rem;
            margin-bottom: 1.0rem;
        }

        .qrCode img {
            margin: auto;
            display: block;
            width: auto;
            height: 2.72rem;
        }

        .records {
            width: 100%;
            height: 2.507rem;
            text-align: center;
            background-color: #e6e6e6;
            color: #939393;
            font-size: 0.267rem;
            line-height: 0.5rem;
            padding-top: 0.5rem;
        }

        .copyright p {
            line-height: 0.5rem;
            font-size: 0.4rem;
            color: #333333;
        }

        .noresult {
            margin: 0.5rem 0;
        }

        .noresult img {
            width: 1.76rem;
            height: 1.333rem;
            display: block;
            margin: auto;
        }

        .noresult p {
            text-align: center;
            font-size: 0.347rem;
            letter-spacing: 0.011rem;
            line-height: 0.8rem;
            color: #555f69;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;margin-top: 1.175rem">
    <header>
        <%@ include file="../template/header_one.jsp" %>
    </header>
    <div class="superSearch clearfix">
        <p>可能感兴趣内容的内容：</p>
        <div>
            <c:forEach items="${interestArr}" var="interest" varStatus="ind">
                <c:if test='${ind.index<6}'>
                    <a data-origin-keyword="${interest}" onclick="toSearch(this)">${interest}</a>
                </c:if>
            </c:forEach>
        </div>
        <span class="gosuper" onclick="gosuper()">智能搜索</span>
    </div>
    <div class="fixedTab">
        <a class="seledTab">综合</a>
        <a href="${rlab}/front/search/p1?searchKey=${keyword}">科创头条</a>
        <a href="${rlab}/front/search/p2?searchKey=${keyword}">科研众包</a>
        <a href="${rlab}/front/search/p3?searchKey=${keyword}">第三方检测</a>
        <a style="margin-right: 0" href="${rlab}/front/search/p4?searchKey=${keyword}">仪器共享</a>
    </div>
    <div id="listmain" class="mui-content">
        <div class="mui-scroll">
            <c:if test='${result.get("shareIns").list.size()!=0}'>
                <div class="clearfix" style="padding: 0 0.347rem;margin-top: 0.25rem">
                    <h3>仪器共享</h3>
                    <a href="${rlab}/front/search/p4?searchKey=${keyword}" class="more">更多</a>
                </div>
                <ul class="mui-table-view-chevron">
                    <c:if test='${result.get("shareIns").list.size()==0}'>
                        <div class="noresult">
                            <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="">
                            <p>暂未搜索到仪器</p>
                        </div>
                    </c:if>
                    <c:forEach items='${result.get("shareIns").list}' var="item" varStatus="ind">
                        <c:if test='${ind.index<2}'>
                            <li class="clearfix" onclick="goinsDetail(this)" data-li-id="${item.mapId}">
                                <c:if test="${item.insPic == null}">
                                    <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                                </c:if>
                                <c:if test="${item.insPic != null}">
                                    <img src="${item.insPic}300_300" alt="商品图片" onerror="imgOnError(this)">
                                </c:if>
                                <div class="itemlitxt">
                                    <p class="itemtit">${item.insName}</p>
                                    <div>
                                        <span style="margin-right: 0.347rem"><c:out value="${item.orgAddrCity}"
                                                                                    escapeXml="true"/></span>
                                        <span><c:out value="${item.orgAddrDistrict}" escapeXml="true"/></span>
                                        <c:choose>
                                            <c:when test="${item.price.flag == 1}">
                                                <c:if test='${"无".equals(item.price.unit)}'>
                                                    <p><span>¥<i>${item.price.accPrice}</i></span></p>
                                                </c:if>
                                                <c:if test='${!"无".equals(item.price.unit)}'>
                                                    <p><span>¥<i>${item.price.accPrice}</i></span>/${item.price.unit}
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.price.flag == 2}">
                                                <c:if test='${"无".equals(item.price.unit)}'>
                                                    <p><span>¥<i>${item.price.scopeLowPrice}</i></span>起</p>
                                                    ￥${item.price.scopeLowPrice}起
                                                </c:if>
                                                <c:if test='${!"无".equals(item.price.unit)}'>
                                                    <p>
                                                        <span>¥<i>${item.price.scopeLowPrice}</i></span>/${item.price.unit}起
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.price.flag == 3}">
                                                <p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>
                                            </c:when>
                                        </c:choose>

                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test='${result.get("serviceIndexJianCe").list.size()!=0}'>
                <div class="clearfix" style="padding: 0 0.347rem;margin-top: 0.25rem">
                    <h3>第三方检测</h3>
                    <a href="${rlab}/front/search/p3?searchKey=${keyword}" class="more">更多</a>
                </div>
                <ul class="mui-table-view-chevron">
                    <c:if test='${result.get("serviceIndexJianCe").list.size()==0}'>
                        <div class="noresult">
                            <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="">
                            <p>暂未搜索到第三方检测</p>
                        </div>
                    </c:if>
                    <c:forEach items='${result.get("serviceIndexJianCe").list}' var="item" varStatus="ind">
                        <c:if test='${ind.index<2}'>
                            <li class="clearfix" onclick="goService(this)" data-li-id="${item.serviceId}">
                                <c:if test="${item.servicePic == null}">
                                    <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                                </c:if>
                                <c:if test="${item.servicePic != null}">
                                    <img src="${item.servicePic}300_300" alt="商品图片" onerror="imgOnError(this)">
                                </c:if>
                                <div class="itemlitxt">
                                    <p class="itemtit">${item.serviceName}</p>
                                    <div>
                                        <span style="margin-right: 0.347rem"><c:out value="${item.serviceCity}"
                                                                                    escapeXml="true"/></span>
                                        <span><c:out value="${item.serviceDistrict}" escapeXml="true"/></span>
                                        <c:choose>
                                            <c:when test="${item.servicePrice.flag == 1}">
                                                <c:if test='${"无".equals(item.servicePrice.unit)}'>
                                                    <p><span>¥<i>${item.servicePrice.accPrice}</i></span></p>
                                                </c:if>
                                                <c:if test='${!"无".equals(item.servicePrice.unit)}'>
                                                    <p>
                                                        <span>¥<i>${item.servicePrice.accPrice}</i></span>/${item.servicePrice.unit}
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.servicePrice.flag == 2}">
                                                <c:if test='${"无".equals(item.servicePrice.unit)}'>
                                                    <p><span>¥<i>${item.servicePrice.scopeLowPrice}</i></span>起</p>
                                                    ￥${item.servicePrice.scopeLowPrice}起
                                                </c:if>
                                                <c:if test='${!"无".equals(item.servicePrice.unit)}'>
                                                    <p>
                                                        <span>¥<i>${item.servicePrice.scopeLowPrice}</i></span>/${item.servicePrice.unit}起
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.servicePrice.flag == 3}">
                                                <p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test='${result.get("serviceIndexsKeyan").list.size()!=0}'>
                <div class="clearfix" style="padding: 0 0.347rem;margin-top: 0.25rem">
                    <h3>科研众包</h3>
                    <a href="${rlab}/front/search/p2?searchKey=${keyword}" class="more">更多</a>
                </div>
                <ul class="mui-table-view-chevron">
                    <c:if test='${result.get("serviceIndexsKeyan").list.size()==0}'>
                        <div class="noresult">
                            <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="">
                            <p>暂未搜索到科研众包</p>
                        </div>
                    </c:if>
                    <c:forEach items='${result.get("serviceIndexsKeyan").list}' var="item" varStatus="ind">
                        <c:if test='${ind.index<2}'>
                            <li class="clearfix" onclick="goService(this)" data-li-id="${item.serviceId}">
                                <c:if test="${item.servicePic == null}">
                                    <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                                </c:if>
                                <c:if test="${item.servicePic != null}">
                                    <img src="${item.servicePic}300_300" alt="商品图片" onerror="imgOnError(this)">
                                </c:if>
                                <div class="itemlitxt">
                                    <p class="itemtit">${item.serviceName}</p>
                                    <div>
                                        <span style="margin-right: 0.347rem"><c:out value="${item.serviceCity}"
                                                                                    escapeXml="true"/></span>
                                        <span><c:out value="${item.serviceDistrict}" escapeXml="true"/></span>
                                        <c:choose>
                                            <c:when test="${item.servicePrice.flag == 1}">
                                                <c:if test='${"无".equals(item.servicePrice.unit)}'>
                                                    <p><span>¥<i>${item.servicePrice.accPrice}</i></span></p>
                                                </c:if>
                                                <c:if test='${!"无".equals(item.servicePrice.unit)}'>
                                                    <p>
                                                        <span>¥<i>${item.servicePrice.accPrice}</i></span>/${item.servicePrice.unit}
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.servicePrice.flag == 2}">
                                                <c:if test='${"无".equals(item.servicePrice.unit)}'>
                                                    <p><span>¥<i>${item.servicePrice.scopeLowPrice}</i></span>起</p>
                                                    ￥${item.servicePrice.scopeLowPrice}起
                                                </c:if>
                                                <c:if test='${!"无".equals(item.servicePrice.unit)}'>
                                                    <p>
                                                        <span>¥<i>${item.servicePrice.scopeLowPrice}</i></span>/${item.servicePrice.unit}起
                                                    </p>
                                                </c:if>
                                            </c:when>
                                            <c:when test="${item.servicePrice.flag == 3}">
                                                <p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test='${result.get("infos").list.size()!=0}'>
                <div class="clearfix" style="padding: 0 0.347rem;margin-top: 0.25rem">
                    <h3>科创头条</h3>
                    <a href="${rlab}/front/search/p1?searchKey=${keyword}" class="more">更多</a>
                </div>
                <ul class="mui-table-view-chevron message">
                    <c:if test='${result.get("infos").list.size()==0}'>
                        <div class="noresult">
                            <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="">
                            <p>暂未搜索到科创头条</p>
                        </div>
                    </c:if>
                    <c:forEach items='${result.get("infos").list}' var="item" varStatus="ind">
                        <c:if test='${ind.index<2}'>
                            <li class="clearfix" onclick="gomeDetail(this)" data-li-id="${item.tInfoId}">
                                <c:if test="${item.tInfoImage == null}">
                                    <img src="${rlab}/common/common_img/default/ins_300X300.jpg" alt="商品图片">
                                </c:if>
                                <c:if test="${item.tInfoImage != null}">
                                    <img src="${item.tInfoImage}" alt="商品图片" onerror="imgOnError(this)">
                                </c:if>
                                <div class="itemlitxt">
                                    <p class="itemtit">${item.tInfoTitle}</p>
                                    <div>
                                        <span style="margin-right: 0.347rem" class="lab-history"></span>
                                        <span>
                                        <c:choose>
                                            <c:when test="${item.hours >= 24 }">
                                                ${item.createTime.toLocalDate()}  ${item.createTime.toLocalTime().withNano(0)}
                                            </c:when>
                                            <c:when test="${item.hours == 0}">
                                                刚刚
                                            </c:when>
                                            <c:otherwise>
                                                ${item.hours}小时前
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test='${result.get("infos").list.size()==0 && result.get("shareIns").list.size()==0 && result.get("serviceIndexJianCe").list.size()==0 && result.get("serviceIndexsKeyan").list.size()==0}'>
                <div class="noresult">
                    <img src="${rlab}/mobile/imgs/fillup_img/no-result@2x.png" alt="">
                    <p>暂未搜索到相关内容</p>
                </div>
            </c:if>
            <div class="qrCode">
                <p style="text-align: center;color: #505050;font-size: 0.32rem;letter-spacing: 0.011rem;margin: 0.5rem 0">
                    搜索结果不满意？去发布需求让我们帮您解决吧！</p>
                <div style="text-align: center;margin-bottom: 0.8rem"><a href="${rlab}/page/req/pubpage"
                                                                         class="godemand">发布需求</a></div>
                <img src="${rlab}/mobile/imgs/m2.4/qrcode.png" alt="">
                <p>
                    温馨提示：长按二维码关注人人实验公众微信号，或保存二维码至手机使用微信扫一扫关注人人实验公众微信号，客服小花为您答疑解惑。使用电脑登录主站www.renrenlab.com了解更多优质服务和仪器。
                </p>
            </div>
            <div class="records">
                <p>Copyright 2015-2017 人人实验（北京）科技有限公司</p>
                <p>All Rights Reserved 京ICP备15058824</p>
            </div>
        </div>
    </div>
</div>
<%--城市下拉列表--%>
<div class="moveTotop" id="div_moveToTop" style="display: none">
    <a href="#dropdown" class="mtop">
        <i class="lab-back_top"></i>
    </a>
</div>
<%@ include file="../template/city.jsp" %>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script src="${rlab}/mobile/js/mui.pullToRefresh.js"></script>
<script src="${rlab}/mobile/js/mui.pullToRefresh.material.js"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */

    function goBack() {
        history.go(-1);
    }

    function goService($this) {
        window.location.href = BASE_URL + '/service/detail/' + $($this).data("liId");
    }

    function goinsDetail($this) {
        window.location.href = BASE_URL + '/instrument/search/' + $($this).data("liId");
    }

    function gomeDetail() {
        window.location.href = BASE_URL + '/news/get_article_detail?id=' + $($this).data("liId");
    }

    function gosuper() {
        window.location.href = BASE_URL + '/front/superSearch/search?flag=0&query=${keyword}';
    }
</script>
</html>