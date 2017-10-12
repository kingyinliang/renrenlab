<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--搜索内容区域--%>
<div id="scMain" class="sc_ctnt"   style="display: none">
    <div  class="sc_main">
        <!--头部-->
        <div class="header"  style="background: #fff;">
            <div class="searchs" >
                <div class="ipt">
                    <div class="ipt_center">
                        <form action="javascript:void(0)">
                            <input id="searchInput" onsearch="toSearch()" type="search" maxlength="30" >
                            <i class="lab-search" onclick="toSearch()"></i>
                        </form>
                    </div>

                </div>
                <div class="rt" onclick="hideSearchModal(this)" data-main-id="main">
                    <i>取消</i>
                </div>

            </div>
        </div>
        <%--历史，热门搜索列表--%>
        <div class="list">
            <!--历史搜索-->
            <div id='historySearch' class="history_sch" style="display: none">
                <p>历史记录 <i onclick="clearSearchHistory()" class="lab-del"></i></p>
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
