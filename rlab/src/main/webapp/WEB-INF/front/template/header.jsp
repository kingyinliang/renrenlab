<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../config/taglibs.jsp" %>

<!--头部公用模块-->
<div id="head">
    <div id="headTop">
        <div id="headTabmain" class="clearfix">
            <div class="code">
                <p>关注公众号</p>
                <div class="codeimg">
                    <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="" width="100%" height="100%">
                </div>
            </div>
            <p style="float: left"><span style="margin-right: 26px">联系我们</span><label class="lab-dianhua_1"></label><span>400-102-9559</span></p>
            <div class="user">
                <a href="${token1}/provider/search?pageNo=1&pageSize=49">成为服务商</a>
                <c:choose>
                    <c:when test="${sessionScope.uid != null}">
                        <div id="userMain">
                            <c:choose>
                                <c:when test="${sessionScope.avatar != null}">
                                    <img src="${sessionScope.avatar}" alt="用户头像">
                                </c:when>
                                <c:otherwise>
                                    <img src="http://renrenlab.oss-cn-shanghai.aliyuncs.com/avatar/person_default.jpg" alt="用户头像">
                                </c:otherwise>
                            </c:choose>
                            <span><c:out value="${sessionScope.simpleNickName}" escapeXml="true"/></span>
                            <label class="lab-down"></label>
                            <ul class="usersele" style="z-index: 999;">
                                <li><a onclick="toCenter();return false;" href="javascript:void (0);">个人中心</a></li>
                                <li style="border-top: 1px solid #ebebeb;"><a onclick="logouts();return false;" href="javascript:void (0);">退出</a></li>
                            </ul>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <a onclick="registers();" href="javascript:void(0);">免费注册</a>
                        <a onclick="logins();" href="javascript:void(0);">
                            <label class="lab-user"></label>
                            <span>我要登录</span>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <div id="heads" class="clearfix">
        <a onclick="gohome()" style="cursor: pointer"><img src="${rlab}/front/imgs/2.3/logo.png"/></a>
        <%-- 城市下拉 --%>
        <div class="city_btn">
            <div id="dorpBox" class="cur" style="display: none;">
                <span id="adCurrent" style="float: left;margin-left: 6px;"></span>
                <i class="lab-arrow-down" style="font-size: 12px;margin-left: 8px;line-height: 45px;display: block;float: left"></i>
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
        <div class="search">
            <div class="searchTab">
                <a href="javascript:void (0);" class="${param.selected != 2 && param.selected != 3?'pitchTab':''}" data-search-type="1">仪器</a>
                <a href="javascript:void (0);" class="${param.selected == 3?'pitchTab':''}" data-search-type="2">服务</a>
            </div>
            <div class="searchInp">
                <label class="lab-search searchBut" for="search"></label>
                <div>
                    <input type="text" id="search" value="<c:out value="${keyword}" escapeXml="true"/>" placeholder="${param.selected == 3?'请输入服务名称':param.selected == 2?"请输入机构名称":"请输入仪器名称"}" style="box-sizing: border-box;"/></div>
                <input type="button" id="gosearch" value="搜索" />
            </div>
        </div>
        <a id="godemand" href="${token1}/page/req/listpage">发布需求</a>
    </div>
    <div id="headTab">
        <div class="headTab clearfix">
            <div class="tab ${param.selected==1?'selectedTab':''}" onclick="gohome()">
                <div class="tabStrip"></div>
                <span>首页</span>
            </div>
            <div class="tab ${param.selected==4?'selectedTab':''}" onclick="goinshome()">
                <div class="tabStrip"></div>
                <span>仪器共享</span>
                <div class="reclassify">
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=实验室常用设备&code=03&slideFlag=1">实验室常用设备</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=光学仪器及设备&code=03&slideFlag=1">光学仪器及设备</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=工业在线及控制仪器&code=03&slideFlag=1">工业在线及控制仪器</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=行业专用仪器&code=03&slideFlag=1">行业专用仪器</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=测量/计量仪器&code=03&slideFlag=1">测量/计量仪器</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=实验室服务&code=03&slideFlag=1">实验室服务</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=相关仪表&code=03&slideFlag=1">相关仪表</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=化学分析仪器&code=03&slideFlag=1">化学分析仪器</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=生命科学仪器及设备&code=03&slideFlag=1">生命科学仪器及设备</a>
                    <a href="${rlab}/instrument/search?keyword=&pageNo=1&pageSize=10&category1=物性测试仪器及设备&code=03&slideFlag=1">物性测试仪器及设备</a>
                </div>
            </div>
            <div class="tab ${param.selected==3?'selectedTab':''}" onclick="goserverhome()">
                <div class="tabStrip"></div>
                <span>科研服务</span>
                <div class="reclassify server">
                    <a href="${rlab}/service/keyan?classify=19&name=生物" style="line-height: 40px;font-size: 13px">生物</a>
                    <a href="${rlab}/service/keyan?classify=20&name=医药" style="line-height: 40px;font-size: 13px">医药</a>
                    <a href="${rlab}/service/keyan?classify=21&name=医疗器械" style="line-height: 40px;font-size: 13px">医疗器械</a>
                    <hr style="width: 400px;height: 1px;background: #F3F3F3;color: #F3F3F3;border: #F3F3F3;margin-left: -25px;">
                    <a href="${rlab}/service/keyan?classify=22&name=动物">动物</a>
                    <a href="${rlab}/service/keyan?classify=27&name=生物药">生物药</a>
                    <a href="${rlab}/service/keyan?classify=62&name=一类器械">一类器械</a>
                    <a href="${rlab}/service/keyan?classify=23&name=植物">植物</a>
                    <a href="${rlab}/service/keyan?classify=28&name=化学药">化学药</a>
                    <a href="${rlab}/service/keyan?classify=63&name=二类器械">二类器械</a>
                    <a href="${rlab}/service/keyan?classify=24&name=微生物">微生物</a>
                    <a href="${rlab}/service/keyan?classify=29&name=中药">中药</a>
                    <a href="${rlab}/service/keyan?classify=65&name=三类器械">三类器械</a>
                    <a href="${rlab}/service/keyan?classify=25&name=组织/细胞" style="width: 100%">组织/细胞</a>
                    <a href="${rlab}/service/keyan?classify=26&name=分子">分子</a>
                </div>
            </div>

            <div class="tab ${param.selected==6?'selectedTab':''}" onclick="goQuality()">
                <div class="tabStrip"></div>
                <span>质量服务</span>
                <div class="reclassify quality">
                    <a href="${rlab}/service/zhiliang?classify=102&name=计量校准">计量校准</a>
                    <a style="color: #9a9a9a;cursor:default ">标准化<span style="font-size: 9px;cursor:default">（更新中）</span></a>
                    <a href="${rlab}/service/zhiliang?classify=101&name=检验检测">检验检测</a>
                    <a style="color: #9a9a9a;cursor: default">认证<span style="font-size: 9px;cursor:default">（更新中）</span></a>
                    <%--<a href="">产品认证</a>--%>


                </div>
            </div>

            <div class="tab ${param.selected==5?'selectedTab':''}" onclick="goreqhome()" >
                <div class="tabStrip"></div>
                <span>微需求</span>
            </div>
            <div class="tab ${param.selected==7?'selectedTab':''}" onclick="gomessagehome()">
                <div class="tabStrip"></div>
                <span>科创头条</span>
            </div>
            <%--<div class="tab ${param.selected==8?'selectedTab':''}" onclick="golablogin()">--%>
                <%--<div class="tabStrip"></div>--%>
                <%--<span>实验室服务</span>--%>
            <%--</div>--%>
            <%--<div class="tab" onclick="gocasehome()">--%>
            <%--<div class="tabStrip"></div>--%>
            <%--<span>应用案例</span>--%>
            <%--</div>--%>
        </div>
    </div>
</div>
<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https'){
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else{
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>
