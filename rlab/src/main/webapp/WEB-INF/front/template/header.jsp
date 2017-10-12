<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../config/taglibs.jsp" %>

<!--头部公用模块-->
<div class="header">
    <div class="heder_tab">
        <div class="heder_tab_content">
            <div class="users clearfix">
                <span>欢迎来到人人实验，</span>
                <c:choose>
                    <%--登录--%>
                    <c:when test="${sessionScope.uid != null}">
                        <%--<span class="userName">${sessionScope.nickname.length() > 4 ? sessionScope.nickname.substring(0,4).concat("..."):sessionScope.nickname}<label class="lab-arrow-down"></label></span>--%>
                        <span class="userName"><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/><label class="lab-arrow-down"></label></span>
                    </c:when>
                    <%--未登录--%>
                    <c:otherwise>
                        <span>请<a href="javascript:void(0);" onclick="logins();return false;">登录</a></span>
                    </c:otherwise>
                </c:choose>

                <ul class="userUl">
                    <li onclick="toCenter()">个人中心</li>
                    <li onclick="logouts()">退出登录</li>
                </ul>
            </div>
            <div class="headertext">
                <span>服务热线：400-102-9559</span>
                <span><a href="${rlab}/page/req/listpage" target="_self">发布需求</a></span>
                <span><a href="${rlab}/front/org/upload">我是服务机构</a></span>
                <p class="goold"><a href="http://www.renrenlab.com/pages/home.html" target="_blank">切换人人实验旧版</a></p>
            </div>
        </div>
    </div>
    <div class="header_content">
        <div class="logo" onclick="toHomePage()">
            <img src="${rlab}/front/imgs/icon/logo-header.png" alt="人人实验">
            <h1>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</h1>
        </div>
        <%-- 城市下拉 --%>
        <div class="city_btn">
            <div id="dorpBox" class="cur" style="display: none;">
                <span id="adCurrent" style="float: left;margin-left: 6px;"></span>
                <i class="lab-arrow-down" style="font-size: 12px;margin-left: 8px;line-height: 100px;display: block;float: left"></i>
            </div>
            <!--style="display: block!important;"-->
            <div id="dorpDown" class="dn dorpdown" >
            <%--<div id="dorpDown" class="dorpdown" >--%>

                <div id="dorpUl">

                    <%--全国--%>
                    <div class="title">
                        <ul>
                            <li onclick="choseAddress(this)"><a href="javascript:void (0)">全国</a></li>
                        </ul>
                    </div>

                    <%--热门城市--%>
                    <div class="district">
                        <p class="hot">热门</p>
                        <ul>
                            <li onclick="choseAddress(this)" ><a href="javascript:void (0)">北京</a></li>
                            <li onclick="choseAddress(this)"><a href="javascript:void (0)">上海</a></li>
                            <li onclick="choseAddress(this)"><a href="javascript:void (0)">深圳</a></li>
                            <li onclick="choseAddress(this)"><a href="javascript:void (0)">武汉</a></li>
                            <li onclick="choseAddress(this)"><a href="javascript:void (0)">太原</a></li>
                        </ul>
                    </div>
                        <!--A-->
                        <div class="district">
                            <p>A</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">安庆</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">安顺</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">安阳</a></li>
                            </ul>
                        </div>

                        <!--B-->
                        <div class="district">
                            <p>B</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">北京</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">保定</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">蚌埠</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">白银</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">百色</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">北海</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">毕节</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">包头</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">保山</a></li>
                            </ul>
                        </div>

                        <!--C-->
                        <div class="district">
                            <p>C</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">重庆</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">成都</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">长沙</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">长春</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">滁州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">承德</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">郴州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">长治</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">楚雄</a></li>

                            </ul>
                        </div>

                        <!--D-->
                        <div class="district">
                            <p>D</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">大连</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">大理</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">定西</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">东莞</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">儋州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">大庆</a></li>
                            </ul>
                        </div>

                        <!--F-->
                        <div class="district">
                            <p>F</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">佛山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">凤阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">福州</a></li>
                            </ul>
                        </div>

                        <!--G-->
                        <div class="district">
                            <p>G</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">广州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">桂林</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">贵阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">赣州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">格尔木</a></li>
                            </ul>
                        </div>

                        <!--H-->
                        <div class="district">
                            <p>H</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">杭州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">哈尔滨</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">淮南</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">黄山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">合肥</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">惠州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">海口</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">邯郸</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">黑河</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">鹤岗</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">怀化</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">衡阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">葫芦岛</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">呼和浩特</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">红河</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">湖州</a></li>

                            </ul>
                        </div>

                        <!--J-->
                        <div class="district">
                            <p>J</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">济南</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">金昌</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">酒泉</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">揭阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">江门</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">鸡西</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">佳木斯</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">荆州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">吉首</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">吉林</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">九江</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">吉安</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">晋中</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">嘉兴</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">金华</a></li>
                            </ul>
                        </div>

                        <!--K-->
                        <div class="district">
                            <p>K</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">昆明</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">凯里</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">开封</a></li>
                            </ul>
                        </div>


                        <!--L-->
                        <div class="district">
                            <p>L</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">丽江</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">龙岩</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">兰州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">来宾</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">柳州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">六盘水</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">廊坊</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">洛阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">娄底</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">临汾</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">临沧</a></li>
                            </ul>
                        </div>

                        <!--M-->
                        <div class="district">
                            <p>M</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">马鞍山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">牡丹江</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">绵阳</a></li>
                            </ul>
                        </div>

                        <!--N-->
                        <div class="district">
                            <p>N</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">南京</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">南通</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">南昌</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">南宁</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">宁波</a></li>

                            </ul>
                        </div>

                        <!--P-->
                        <div class="district">
                            <p>P</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">莆田</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">普洱</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">平凉</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">攀枝花</a></li>
                            </ul>
                        </div>

                        <!--Q-->
                        <div class="district">
                            <p>Q</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">青岛</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">泉州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">钦州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">衢州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">秦皇岛</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">齐齐哈尔</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">曲靖</a></li>
                            </ul>
                        </div>

                        <!--S-->
                        <div class="district">
                            <p>S</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">深圳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">石家庄</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">韶关</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">汕尾</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">汕头</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">双鸭山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">绥化</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">邵阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">四平</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">苏州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">沈阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">商洛</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">上海</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">石河子</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">绍兴</a></li>
                            </ul>
                        </div>

                        <!--T-->
                        <div class="district">
                            <p>T</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">天津</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">天水</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">唐山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">通化</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">太原</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">台州</a></li>
                            </ul>
                        </div>

                        <!--W-->
                        <div class="district">
                            <p>W</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">温州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">芜湖</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">武威</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">万宁</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">文昌</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">武汉</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">无锡</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">乌鲁木齐</a></li>
                            </ul>
                        </div>

                        <!--X-->
                        <div class="district">
                            <p>X</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">厦门</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">邢台</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">许昌</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">湘潭</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">徐州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">西宁</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">忻州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">咸阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">西安</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">西双版纳</a></li>
                            </ul>
                        </div>

                        <!--Y-->
                        <div class="district">
                            <p>Y</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">阳江</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">岳阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">永州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">益阳</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">延吉</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">宜春</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">银川</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">运城</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">阳泉</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">延安</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">玉溪</a></li>
                            </ul>
                        </div>

                        <!--Z-->
                        <div class="district">
                            <p>Z</p>
                            <ul class="clearfix">
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">郑州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">漳州</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">张掖</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">肇庆</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">湛江</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">珠海</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">中山</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">遵义</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">株洲</a></li>
                                <li onclick="choseAddress(this)"><a href="javascript:void (0)">舟山</a></li>
                            </ul>
                        </div>

                </div>

                <%--<div id="dorpUl">--%>

                    <%--&lt;%&ndash;全国&ndash;%&gt;--%>
                    <%--<div class="title">--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">全国</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;热门城市&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>热门城市</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)" ><a href="javascript:void (0)">北京</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">上海</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">深圳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">武汉</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">太原</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;直辖市&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>直辖市</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)" ><a href="javascript:void (0)">北京</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">上海</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">天津</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">重庆</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;河北省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>河北省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">秦皇岛</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">石家庄</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">廊坊</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">唐山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">邯郸</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">保定</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">邢台</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">承德</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;山西省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>山西省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">运城</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">晋中</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">忻州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">太原</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">长治</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">临汾</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">阳泉</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;内蒙古自治区&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>内蒙古自治区</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">呼和浩特</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">包头</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;辽宁省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>辽宁省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">大连</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">葫芦岛</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">沈阳</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;吉林省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>吉林省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">延吉</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">长春</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">吉林</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">通化</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">四平</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;黑龙江省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>黑龙江省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">牡丹江</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">鸡西</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">佳木斯</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">哈尔滨</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">双鸭山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">大庆</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">齐齐哈尔</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">黑河</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">绥化</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">鹤岗</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;江苏省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>江苏省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">苏州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">无锡</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">南京</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">南通</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">徐州</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;浙江省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>浙江省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">嘉兴</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">金华</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">湖州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">舟山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">台州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">温州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">宁波</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">杭州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">绍兴</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">衢州</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;安徽省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>安徽省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">淮南</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">凤阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">安庆</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">马鞍山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">黄山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">芜湖</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">合肥</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">蚌埠</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">滁州</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;福建省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>福建省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">泉州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">莆田</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">漳州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">福州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">厦门</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">龙岩</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;江西省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>江西省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">南昌</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">赣州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">宜春</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">九江</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">吉安</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;山东省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>山东省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">青岛</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">济南</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;河南省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>河南省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">开封</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">郑州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">许昌</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">洛阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">安阳</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;湖北省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>湖北省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">荆州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">武汉</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;湖南省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>湖南省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">郴州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">岳阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">永州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">长沙</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">株洲</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">吉首</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">娄底</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">益阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">怀化</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">常德</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">湘潭</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">邵阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">衡阳</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;广东省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>广东省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">揭阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">广州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">东莞</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">肇庆</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">江门</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">深圳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">韶关</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">惠州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">湛江</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">阳江</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">珠海</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">汕尾</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">中山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">佛山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">汕头</a></li>--%>

                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;广西壮族自治区&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>广西壮族自治区</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">钦州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">来宾</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">百色</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">柳州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">桂林</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">南宁</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">北海</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;四川省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>四川省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">攀枝花市</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">成都市</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">绵阳市</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;贵州市&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>贵州市</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">贵阳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">凯里</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">安顺</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">遵义</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">毕节</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">六盘水</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;云南省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>云南省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">普洱</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">临沧</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">西双版纳</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">大理</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">昆明</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">曲靖</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">保山</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">楚雄</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">丽江</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">玉溪</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">红河</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;&lt;%&ndash;西藏自治区&ndash;%&gt;&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<div class="district">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<p>西藏自治区</p>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;<li onclick="choseAddress(this)"><a href="javascript:void (0)">漳州</a></li>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

                    <%--&lt;%&ndash;陕西省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>陕西省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">运城</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">晋中</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">忻州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">太原</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">长治</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">临汾</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">阳泉</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;甘肃省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>甘肃省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">平凉</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">定西</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">金昌</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">兰州</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">酒泉</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">张掖</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">武威</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">白银</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">天水</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;青海省&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>青海省</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">西宁</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">格尔木</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;宁夏回族自治区&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>宁夏回族自治区</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">银川</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                    <%--&lt;%&ndash;新疆维吾尔族自治区&ndash;%&gt;--%>
                    <%--<div class="district">--%>
                        <%--<p>新疆维吾尔族自治区</p>--%>
                        <%--<ul>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">石河子</a></li>--%>
                            <%--<li onclick="choseAddress(this)"><a href="javascript:void (0)">乌鲁木齐</a></li>--%>
                        <%--</ul>--%>
                    <%--</div>--%>

                <%--</div>--%>

            </div>
        </div>

        <%--搜索框--%>
        <div class="search_box">
            <div class="search_main">
                <label id="serachBtn" for="serach"><span class="lab-search"></span></label>
                <input id="serach"type="text" maxlength="50" placeholder="共享仪器/服务机构" value="<c:out value="${keyword}" escapeXml="true"/>">
            </div>
        </div>
        <%-- 登录状态 --%>

        <%--&lt;%&ndash; 未登录状态 &ndash;%&gt;
        <c:choose>
            <c:when test="${sessionScope.uid != null}">

                <div class="user_info" style="display: block">
                    <div id="unickName" class="unick_name">
                        <span>${sessionScope.nickname.length() > 4 ? sessionScope.nickname.substring(0,4).concat("..."):sessionScope.nickname}</span>
                        <i class="lab-arrow-down"></i>
                        <ul class="user_down dn">
                            <li>
                                <a href="javascript:void (0);" onclick="toCenter()">个人中心</a>
                            </li>
                            <li id="logout">
                                <a href="javascript:void (0);" onclick="logouts()">退出登录</a>

                            </li>
                        </ul>
                    </div>
                    <div class="avatar">
                        <c:choose>
                            <c:when test="${sessionScope.avatar != null}">
                                <img src="${sessionScope.avatar}" alt="用户头像">
                            </c:when>
                            <c:otherwise>
                                <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

            </c:when>

            <c:otherwise>
                <div class="header_btn" style="display: block">
                    <a id="loginBtn" onclick="logins()" href="javascript:void (0)">登录</a>
                    <div class="division">
                        <i>|</i>
                    </div>
                    <a id="moveToTop"  onclick="registers()" href="javascript:void (0)">注册</a>
                </div>
            </c:otherwise>

        </c:choose>--%>

        <%--<div class="cb_old_web">
            <a href="http://www.renrenlab.com/pages/home.html" target="_blank">返回旧版</a>
        </div>--%>


    </div>
</div>
