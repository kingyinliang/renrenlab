<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_=20170608">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/home.css?v_=20170608">
    <style>
        .item2mobile-item{
            overflow: hidden;
        }
        .item2mobile-item a{
            width: 1.573rem;
            height: 0.52rem;
            margin: auto;
            margin-top: 0.29rem;
            display: inline-block;
            line-height: 0.5rem;
            border: 0.03rem solid #c5d6f3!important;
            border-radius: 0.26rem;
            font-size: 0.27rem;
        }
        .search{
            font-size: 0.32rem;
            color: #bfbfbf;
            line-height: 0.96rem;
        }
        .lab-yanjing{
            margin-right: 0.1rem;
        }
    </style>
</head>

<body>
<div id="main" class="main">
    <div class="headers">
        <p class="homelogo"><a href="javascript:void(0)" onclick="showCodes()"><%--<img src="${rlab}/mobile/imgs/home_logo.png"/>--%><i class="lab-erweima weixin"></i>关注服务号</a></p>
        <c:choose>
            <%--登录--%>
            <c:when test="${sessionScope.uid != null}">
                <p class="user-img" onclick="toCenter()">
                    <i>
                        <c:choose>
                            <c:when test="${sessionScope.avatar != null}">
                                <img src="${sessionScope.avatar}" alt="用户头像">
                            </c:when>
                            <c:otherwise>
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                            </c:otherwise>
                        </c:choose>
                    </i>
                </p>
            </c:when>
            <%--未登录--%>
            <c:otherwise>
                <a class="users lab-user" id="gouser" href="javascript:void (0)" onclick="toCenter()"></a>
            </c:otherwise>
        </c:choose>


    </div>
    <div id="slider" class="mui-slider">
       <%-- <div class="mui-slider-group mui-slider-loop">

            <div class="mui-slider-item mui-slider-item-duplicate">
                <a>
                    <img src="${rlab}/mobile/imgs/m-banner3.png">
                </a>
            </div>

            <div class="mui-slider-item">
                <a>
                    <img src="${rlab}/mobile/imgs/m-banner1.png">
                </a>
            </div>

            <div class="mui-slider-item">
                <a>
                    <img src="${rlab}/mobile/imgs/m-banner2.png">
                </a>
            </div>

            <div class="mui-slider-item">
                <a>
                    <img src="${rlab}/mobile/imgs/m-banner3.png">
                </a>
            </div>


            <div class="mui-slider-item mui-slider-item-duplicate">
                <a>
                    <img src="${rlab}/mobile/imgs/m-banner1.png">
                </a>
            </div>
        </div>
        <div class="mui-slider-indicator">
            <div class="mui-indicator mui-active"></div>
            <div class="mui-indicator"></div>
            <div class="mui-indicator"></div>
        </div>--%>
        <img src="${rlab}/mobile/imgs/banner.png" style="width: 100%;height: auto">
        <div class="searchBox">
            <%--<h1>让仪器共享起来</h1>--%>
            <a class="search" href="javascript:void (0)" onclick="showSearchModal(this)" data-main-id="main" style="margin-top: 1.1467rem">&nbsp;&nbsp;&nbsp;&nbsp;仪器/服务机构<span class="lab-search"></span></a>
        </div>

    </div>
    <div class="mui-slider" id="tab">
        <div class="mui-slider-indicator mui-segmented-control mui-segmented-control-inverted" id="tabHeard">
            <a class="mui-control-item" href="#item1mobile">服务机构</a>
            <a class="mui-control-item boder mui-active" href="#item3mobile">微需求</a>
            <a class="mui-control-item" href="#item2mobile">热门仪器</a>
        </div>
        <div id="sliderProgressBar" class="mui-slider-progress-bar mui-col-xs-4"></div>
        <div class="mui-slider-group" id="tabBox">
            <div id="item1mobile" class="mui-slider-item mui-control-content tabLi">
                <ul class="mui-table-view">
                    <c:forEach items="${orgInfoList}" var="info">
                        <li class="mui-table-view-cell">
                            <a data-goods-id="${info.orgOid}" onclick="toOrgDetail(this)">
                                <c:choose>
                                    <c:when test="${info.orgLogo != null && info.orgLogo.trim()  != ''}">
                                        <img class="liImg" src="${info.orgLogo}"/>
                                    </c:when>
                                    <c:otherwise>
                                        <img class="liImg" src="${rlab}/front/imgs/icon/org_logo_default.png">
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${info.orgIdentification==1}">
                                    <i class="lab-renzheng_1" style="color: #f4af71;font-size: 0.4rem;position: absolute;top: -0.2rem;left: 1.9rem"></i>
                                </c:if>
                                <div class="tit">
                                    <h2>${info.orgName}</h2>
                                    <p><img src="${rlab}/mobile/imgs/m2.1/num.png" alt=""><span>No.${info.orgRank}</span></p>
                                    <h3>共享指数 ${info.orgShareIndexStr}</h3>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                    <%--<li class="mui-table-view-cell">
                        <a data-goods-id="820915" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/77ed033e-5e56-488b-82e0-1efcca4498c6.jpg?x-oss-process=style/renrenlab500_500"/>
                            <i class="lab-renzheng_1" style="color: #f4af71;font-size: 0.4rem;position: absolute;top: -0.2rem;left: 1.9rem"></i>
                            <div class="tit">
                                <h2>北京市园林科学研究院</h2>
                                <p><img src="${rlab}/mobile/imgs/m2.1/num.png" alt=""><span>No.1</span></p>
                                <h3>共享指数 2200</h3>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="827467" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/0071bf77-c149-40d8-b7f6-6153cda3c791.jpg?x-oss-process=style/renrenlab500_500"/>
                            <i class="lab-renzheng_1" style="color: #f4af71;font-size: 0.4rem;position: absolute;top: -0.2rem;left: 1.9rem"></i>
                            <div class="tit">
                                <h2>北京市园林科学研究院</h2>
                                <p><img src="${rlab}/mobile/imgs/m2.1/num.png" alt=""><span>No.9181</span></p>
                                <h3>共享指数 2200</h3>
                            </div>
                        </a>

                    </li>--%>
                    <%--<li class="mui-table-view-cell">
                        <a data-goods-id="827756" onclick="toGoodsDetail(this)">
                            <img src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/869d2871-fd67-4f2b-b2fe-119fd8e9b104.JPG?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>气质联用仪</h2>
                                <h3>型号：GCMS-QP2010</h3>
                                <p><span class="tit_address">北京市海淀区</span><span class="tit_unit">元/样</span><span
                                        class="tit_money">200</span></p>
                            </div>
                        </a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="820915" onclick="toGoodsDetail(this)">
                            <img src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/77ed033e-5e56-488b-82e0-1efcca4498c6.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>电子舌</h2>
                                <h3>型号：Astree</h3>
                                <p><span class="tit_address">北京市海淀区</span><span class="tit_unit">元/次</span><span
                                        class="tit_money">100</span></p>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="827467" onclick="toGoodsDetail(this)">
                            <img src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/0071bf77-c149-40d8-b7f6-6153cda3c791.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>高效液相色谱仪</h2>
                                <h3>型号：LC-20A</h3>
                                <p><span class="tit_address">北京市海淀区</span><span class="tit_unit">元/样</span><span
                                        class="tit_money">300</span></p>
                            </div>
                        </a>

                    </li>--%>
                </ul>
            </div>
            <div id="item3mobile" class="mui-slider-item mui-control-content tabLi mui-active">
                <p class="clearfix"><a style="color: #4e4e4e;float: right;font-size: 0.32rem" onclick="godemandmanage()">更多 ></a></p>
                <ul class="mui-table-view" id="demand">
                    <%--<li class="mui-table-view-cell">
                        <a data-goods-id="855" onclick="toDemandDetail(this)">
                            <p><span style="color: #4f8df0;">匿名</span></p>
                            <p>邹玄快给我通过这个需求，我去测试，速度的，麻溜的，！！！！！！！！！！啊啊啊！！！！！！啊！！！！！啊！！！！！啊！！！！啊！！！！啊！！！！！！啊！！！！</p>
                            <p><i class="lab-checked-3"></i><s>56</s>人<span style="float: right">8天后过期</span></p>
                        </a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="855" onclick="toDemandDetail(this)">
                            <p><span style="color: #4f8df0;">匿名</span></p>
                            <p>邹玄快给我通过这个需求，我去测试，速度的，麻溜的，！！！！！！！！！！啊啊啊！！！！！！啊！！！！！啊！！！！！啊！！！！啊！！！！啊！！！！！！啊！！！！</p>
                            <p><i class="lab-checked-3"></i><s>56</s>人<span style="float: right">8天后过期</span></p>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="856" onclick="toDemandDetail(this)">
                            <p><span style="color: #4f8df0;">匿名</span></p>
                            <p>邹玄快给我通过这个需求，我去测试，速度的，麻溜的，！！！！！！！！！！啊啊啊！！！！！！啊！！！！！啊！！！！！啊！！！！啊！！！！啊！！！！！！啊！！！！</p>
                            <p><i class="lab-checked-3"></i><s>56</s>人<span style="float: right">8天后过期</span></p>
                        </a>

                    </li>--%>
                </ul>
                <%--<ul class="mui-table-view">
                    <li class="mui-table-view-cell">
                        <a data-goods-id="786430" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/9dee0787-733b-4dc2-82b1-603d9fd27592.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>高内涵药物筛选系统</h2>
                                <h3>型号：Operetta</h3>
                                <p><span class="tit_address">上海市浦东新区</span><span class="tit_unit">元/次</span><span
                                        class="tit_money">1000</span></p>
                            </div>
                        </a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="795679" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/b78354df-e385-4397-a280-95cd1daff0d6.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>流池法自动溶出度仪</h2>
                                <h3>型号：DFZ 720</h3>
                                <p><span class="tit_address">北京市海淀区</span><span class="tit_unit"></span><span
                                        class="tit_money">面议</span></p>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="782593" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/21b119b6-05d8-4458-8679-e5200d59daf6.png?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>流式细胞仪</h2>
                                <h3>型号：EPICS XL</h3>
                                <p><span class="tit_address">北京市东城区</span><span class="tit_unit">元/小时</span><span
                                        class="tit_money">300</span></p>
                            </div>
                        </a>

                    </li>
                </ul>--%>
            </div>
            <div id="item2mobile" class="mui-slider-item mui-control-content tabLi">
                <div class="item2mobile">
                    <div id="segmentedControl" class="item2mobile-tab" style="position: relative;z-index: 998">
                        <div class="item2mobile-item" onclick="toSearch(this)"><a>食品安全</a></div>
                        <div class="item2mobile-item"  onclick="toSearch(this)"><a>物性检测</a></div>
                        <div class="item2mobile-item"  onclick="toSearch(this)"><a>药物研发</a></div>
                    </div>
                </div>
                <ul class="mui-table-view" style="padding-left: 0.5rem;padding-right: 0.5rem;">
                    <li class="mui-table-view-cell">
                        <a data-goods-id="827467" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/0071bf77-c149-40d8-b7f6-6153cda3c791.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>高效液相色谱仪</h2>
                                <h3>北京市海淀区</h3>
                                <p><span class="tit_address">食品安全</span><span class="tit_unit">元/样</span><span
                                        class="tit_money">300</span></p>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="798538" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/image/2016/07/21/d6495298-c8e2-41ba-84b0-93358fb50b52.png?x-oss-process=style/renrenlabpic500_500"/>
                            <div class="tit">
                                <h2>超声波探伤仪</h2>
                                <h3>北京市朱辛庄</h3>
                                <p><span class="tit_address">物性测试</span><span class="tit_unit"></span><span
                                        class="tit_money">面议</span></p>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="786430" onclick="toGoodsDetail(this)">
                            <img class="liImg" src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/9dee0787-733b-4dc2-82b1-603d9fd27592.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>高内涵药物筛选系统</h2>
                                <h3>上海市浦东新区</h3>
                                <p><span class="tit_address">药物研发</span><span class="tit_unit">元/次</span><span
                                        class="tit_money">1000</span></p>
                            </div>
                        </a>
                    </li>
                </ul>
                <%--<ul class="mui-table-view" style="padding-left: 0.5rem;padding-right: 0.5rem;">
                    <li class="mui-table-view-cell">
                        <a data-goods-id="785492" onclick="toGoodsDetail(this)">
                            <img src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/02acc8f9-7820-4b1b-b1e9-6eea3b36d1f5.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>Zetasizer电位及纳米粒度分析仪</h2>
                                <h3>型号：Nano ZS</h3>
                                <p><span class="tit_address">北京市丰台区</span><span class="tit_unit">元/样</span><span
                                        class="tit_money">600</span></p>
                            </div>
                        </a>
                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="826505" onclick="toGoodsDetail(this)">
                            <img src="http://congye-spider.oss-cn-shenzhen.aliyuncs.com/2017-06-01/e7dd90b3-af01-4f7d-836a-6d2bf8a35e3b.jpg?x-oss-process=style/renrenlab500_500"/>
                            <div class="tit">
                                <h2>热分析联用系统</h2>
                                <h3>型号：X70</h3>
                                <p><span class="tit_address">北京市海淀区</span><span class="tit_unit">元/样</span><span
                                        class="tit_money">150</span></p>
                            </div>
                        </a>

                    </li>
                    <li class="mui-table-view-cell">
                        <a data-goods-id="798538" onclick="toGoodsDetail(this)">
                            <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/image/2016/07/21/d6495298-c8e2-41ba-84b0-93358fb50b52.png?x-oss-process=style/renrenlabpic500_500"/>
                            <div class="tit">
                                <h2>超声波探伤仪</h2>
                                <h3>型号：1090DAL</h3>
                                <p><span class="tit_address">北京市朱辛庄</span><span class="tit_unit"></span><span
                                        class="tit_money">面议</span></p>
                            </div>
                        </a>

                    </li>
                </ul>--%>
            </div>

        </div>
    </div>
    <%--<div id="org">
        <h1>合作机构</h1>
        <div id="orglist" class="mui-slider">
            <div class="mui-slider-group mui-slider-loop">
                <div class="mui-slider-item mui-slider-item-duplicate">
                    <a><img src="${rlab}/mobile/imgs/21.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/22.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/23.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/24.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/25.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/1.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/2.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/3.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/4.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/5.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/6.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/7.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/8.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/9.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/10.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/11.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/12.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/13.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/14.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/15.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/16.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/17.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/18.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/19.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/20.jpg"/></a>
                </div>
                <div class="mui-slider-item">
                    <a><img src="${rlab}/mobile/imgs/21.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/22.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/23.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/24.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/25.jpg"/></a>
                </div>
                <div class="mui-slider-item mui-slider-item-duplicate">
                    <a><img src="${rlab}/mobile/imgs/1.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/2.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/3.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/4.jpg"/></a>
                    <a><img src="${rlab}/mobile/imgs/5.jpg"/></a>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <img src="${rlab}/mobile/imgs/home_logo.png"/>
        <p>关注“人人实验”服务号，体验VIP专业定制服务</p>
        <p>长按识别二维码，或保存图片后用微信扫一扫打开</p>
        <p><img src="${rlab}/mobile/imgs/two.jpg"></p>
    </div>--%>
    <div id="codes">
        <i class="lab-close-1" onclick="closeCode()"></i>
        <p style="margin-top: 0.67rem"><img src="${rlab}/mobile/imgs/m2.1/homecode.jpg" alt=""></p>
        <p style="width: 4.27rem;margin: auto">保存二维码后可关注“人人实验”服务号</p>

    </div>
</div>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js"></script>
<script type="text/javascript">
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


    demand('904');
    demand('906');
    demand('907');
    function demand(str) {
        $.ajax({
            url:BASE_URL + '/page/req/detail/ajax?uReqId='+str,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                if (data.code === 0) {
                    var html='<li class="mui-table-view-cell">\
                                <a data-goods-id="'+data.payload.uReqId+'" onclick="toDemandDetail(this)">\
                                     <p><span style="color: #4f8df0;">'+data.payload.uName+'</span></p>\
                                     <p>'+data.payload.uReqDescription+'</p>\
                                     <p><i class="lab-yanjing"></i><s>'+data.payload.uChkCount+'</s>人<span style="float: right">'+data.payload.remainTime+'天后过期</span></p>\
                                </a>\
                            </li>';
                    $("#demand").append(html);
                }
            },
            error: function () {
            }

        })
    }
    function godemandmanage() {
        window.location.href = BASE_URL +"/page/req/listpage";
    }
    function showCodes() {
        mask.show();
        $("#codes").show();
    }
    function closeCode() {
        mask.close();
        $("#codes").hide();
    }
    setCallbackUrl();// 设置登录时回跳路径
    function toDemandDetail($this) {
        $this=$($this);
        window.location.href=BASE_URL+'/page/req/detail?uReqId='+$this.data("goodsId");
    }
    function toOrgDetail($this) {
        $this=$($this);
        window.location.href=BASE_URL+'/front/org/'+$this.data("goodsId");
    }
    mui.init({
        swipeBack: false //启用右滑关闭功能
    });

    mui('.mui-scroll-wrapper').scroll();
    $('.mui-scroll-wrapper').scroll({
        indicators: true //是否显示滚动条
    });

    var slider = mui("#slider");
    var mask = mui.createMask(function(){
        $("#codes").hide();
    });
    slider.slider({
        interval: 2000
    });

    var orglist = mui("#orglist");
    orglist.slider({
        interval: 1000
    });

</script>
</html>