<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="dropdwon" id="dropdown" style="display: none;position: relative;z-index: 100;">
    <div class="ad_header" >
        <i class="lab-back_1" onclick="cancelSelect()"></i>
        选择城市
        <div class="hm" onclick="toHome()">
            <i class="lab-home"></i>
        </div>
    </div>

    <%--城市列表--%>
    <div class="ad_list">
        <%--当前定位城市--%>
        <div class="ls_t">
            <p>当前定位城市</p>
        </div>
        <div class="cur_city">
           <span id="curAddress">北京</span>
        </div>
        <%--热门城市--%>
        <div class="ls_t">
            <p>热门城市</p>
        </div>
        <div class="hot_city">
            <ul class="clearfix">
                <li onclick="choseAddress(this)">全国</li>
                <li onclick="choseAddress(this)">北京</li>
                <li onclick="choseAddress(this)">上海</li>
                <li onclick="choseAddress(this)">太原</li>
                <li onclick="choseAddress(this)">武汉</li>
                <li onclick="choseAddress(this)">深圳</li>
            </ul>
        </div>
        <%--按字母排序--%>
        <div class="ls_t">
            <p>按字母排序</p>
        </div>
        <div class="city_nav">
            <ul class="clearfix">
                <li>
                    <a href="#A">A</a>
                </li>
                <li>
                    <a href="#B">B</a>
                </li>
                <li>
                    <a href="#C">C</a>
                </li>
                <li>
                    <a href="#D">D</a>
                </li>
                <li>
                    <a href="#F">F</a>
                </li>
                <li>
                    <a href="#G">G</a>
                </li>
                <li>
                    <a href="#H">H</a>
                </li>
                <li>
                    <a href="#J">J</a>
                </li>
                <li>
                    <a href="#K">K</a>
                </li>
                <li>
                    <a href="#L">L</a>
                </li>
                <li>
                    <a href="#M">M</a>
                </li>
                <li>
                    <a href="#N">N</a>
                </li>
                <li>
                    <a href="#P">P</a>
                </li>
                <li>
                    <a href="#Q">Q</a>
                </li>
                <li>
                    <a href="#S">S</a>
                </li>
                <li>
                    <a href="#T">T</a>
                </li>
                <li>
                    <a href="#W">W</a>
                </li>
                <li>
                    <a href="#X">X</a>
                </li>
                <li>
                    <a href="#Y">Y</a>
                </li>
                <li>
                    <a href="#Z">Z</a>
                </li>
            </ul>
        </div>
        <%--A--%>
        <div id="A" class="ls_t">
            <p>A</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">安庆</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">安顺</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">安阳</a></li>
            </ul>
        </div>
        <%--B--%>
        <div id="B" class="ls_t">
            <p>B</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">北京</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">蚌埠</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">白银</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">百色</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">北海</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">毕节</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">保定</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">包头</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">保山</a></li>
            </ul>
        </div>
        <!--C-->
        <div id="C" class="ls_t">
            <p>C</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">滁州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">承德</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">郴州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">长沙</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">长春</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">长治</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">成都</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">楚雄</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">重庆</a></li>
            </ul>
        </div>
        <!--D-->
        <div id="D" class="ls_t">
            <p>D</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">定西</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">东莞</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">儋州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">大庆</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">大连</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">大理</a></li>
            </ul>
        </div>
        <!--F-->
        <div id="F" class="ls_t">
            <p>F</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">凤阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">福州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">佛山</a></li>
            </ul>
        </div>

        <!--G-->
        <div id="G" class="ls_t">
            <p>G</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">广州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">桂林</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">贵阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">赣州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">格尔木</a></li>
            </ul>
        </div>

        <!--H-->
        <div id="H" class="ls_t">
            <p>H</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">淮南</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">黄山</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">合肥</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">惠州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">海口</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">邯郸</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">哈尔滨</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">黑河</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">鹤岗</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">怀化</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">衡阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">葫芦岛</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">呼和浩特</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">红河</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">湖州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">杭州</a></li>
            </ul>
        </div>
        <!--J-->
        <div id="J" class="ls_t">
            <p>J</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">济南</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">金昌</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">酒泉</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">揭阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">江门</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">鸡西</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">佳木斯</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">荆州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">吉首</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">吉林</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">九江</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">吉安</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">晋中</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">嘉兴</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">金华</a></li>
            </ul>
        </div>
        <!--K-->
        <div id="K" class="ls_t">
            <p>K</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">凯里</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">开封</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">昆明</a></li>
            </ul>
        </div>
        <!--L-->
        <div id="L" class="ls_t">
            <p>L</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">龙岩</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">兰州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">来宾</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">柳州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">六盘水</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">廊坊</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">洛阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">娄底</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">临汾</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">临沧</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">丽江</a></li>
            </ul>
        </div>
        <!--M-->
        <div id="M" class="ls_t">
            <p>M</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li onclick="choseAddress(this)"><a href="javascript:void (0)">马鞍山</a></li>
                <li onclick="choseAddress(this)"><a href="javascript:void (0)">牡丹江</a></li>
                <li onclick="choseAddress(this)"><a href="javascript:void (0)">绵阳</a></li>
            </ul>
        </div>

        <!--N-->
        <div id="N" class="ls_t">
            <p>N</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">南宁</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">南京</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">南通</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">南昌</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">宁波</a></li>
            </ul>
        </div>

        <!--P-->
        <div id="P" class="ls_t">
            <p>P</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">莆田</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">平凉</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">攀枝花</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">普洱</a></li>
            </ul>
        </div>

        <!--Q-->
        <div id="Q" class="ls_t">
            <p>Q</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">泉州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">钦州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">秦皇岛</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">齐齐哈尔</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">青岛</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">曲靖</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">衢州</a></li>
            </ul>
        </div>

        <!--S-->
        <div id="S" class="ls_t">
            <p>S</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">深圳</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">韶关</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">汕尾</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">汕头</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">绍兴</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">绥化</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">邵阳</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">四平</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">苏州</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">沈阳</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">商洛</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">上海</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">石河子</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">石家庄</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">双鸭山</a></li>

            </ul>
        </div>

        <!--T-->
        <div id="T" class="ls_t">
            <p>T</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">天水</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">唐山</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">通化</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">太原</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">天津</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">台州</a></li>
            </ul>
        </div>

        <!--W-->
        <div id="W" class="ls_t">
            <p>W</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">芜湖</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">武威</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">万宁</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">文昌</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">武汉</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">无锡</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">温州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">乌鲁木齐</a></li>
            </ul>
        </div>

        <!--X-->
        <div id="X" class="ls_t">
            <p>X</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">厦门</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">邢台</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">许昌</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">湘潭</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">徐州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">西宁</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">忻州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">咸阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">西安</a></li>
                <li><a  onclick="choseAddress(this)" href="javascript:void (0)">西双版纳</a></li>
            </ul>
        </div>

        <!--Y-->
        <div id="Y" class="ls_t">
            <p>Y</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">阳江</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">岳阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">永州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">益阳</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">延吉</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">宜春</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">银川</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">运城</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">阳泉</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">延安</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">玉溪</a></li>
            </ul>
        </div>
        <!--Z-->
        <div id="Z" class="ls_t">
            <p>Z</p>
        </div>
        <div class="city_type">
            <ul class="clearfix">
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">漳州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">张掖</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">肇庆</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">湛江</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">珠海</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">中山</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">遵义</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">郑州</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">株洲</a></li>
                <li><a onclick="choseAddress(this)" href="javascript:void (0)">舟山</a></li>
            </ul>
        </div>

    </div>
</div>