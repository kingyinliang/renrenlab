<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
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
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170622">
    <%--<link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170622">--%>
    <link rel="stylesheet" href="${rlab}/front/css/demand_manage.css">

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
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->

    <style type="text/css">
        .user_content {
            height: auto !important;
        }

        /* START 侧边栏公用样式*/
        .side_dn {
            display: block !important;
        }

        .user_side {
            float: left;
            width: 153px;
            min-height: 800px;
            background: #fff;
        }

        .user_side .avatar {
            padding: 0 20px;
            text-align: center;
        }

        .user_side img {
            width: 100px;
            margin-top: 26px;
        }

        .user_side p {
            height: 50px;
            line-height: 50px;
            color: #4e4e4e;
            font-size: 16px;
            border-bottom: 1px dashed #dde3ea;
        }

        /*侧边栏bar*/
        ul.u_sd_ul a {
            color: #4e4e4e;
        }

        ul.u_sd_ul {
            list-style: none;
        }

        ul.u_sd_ul > li {
            line-height: 46px;
            margin-top: 20px;
        }

        ul.u_sd_ul > li > a {
            font-size: 16px;
            padding-left: 26px;
            line-height: 46px;
            display: block;
        }

        ul.u_sd_ul > li.actived > a {
            color: #508df0;
        }

        ul.u_sd_ul > li dl {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        ul.u_sd_ul > li dl dd {
            text-align: left;
            margin: 0;
            padding: 0;
            background: #f9fbfc;
        }

        ul.u_sd_ul > li dd a {
            padding-left: 26px;
            font-size: 14px;
            display: block;
        }

        ul.u_sd_ul > li.actived dd.actived a {
            color: #508df0;
        }

        ul.u_sd_ul > li dd i {
            font-size: 1px;
            display: inline-block;
            -webkit-transform: scale(0.8, 0.8);
            -moz-transform: scale(0.8, 0.8);
            -ms-transform: scale(0.8, 0.8);
            -o-transform: scale(0.8, 0.8);
            transform: scale(0.8, 0.8);
        }

        /*END 侧边栏公用样式*/

        /*START 内容部分公用样式*/
        .user_main {
            margin-left: 10px;
            min-height: 800px;
            float: left;
            width: 957px;
            background: #fff;
            margin-bottom: 62px;
        }

        /*END 内容部分公用样式*/
        /*START  分页样式 */

        /*分页样式*/
        .paging {
            height: 50px;
        }

        .paging .page_list {
            float: right;
        }

        .paging .page_list > li {
            float: left;
            list-style: none;
            text-indent: 0;
            /*width: 26px;*/
            min-width: 26px;
            max-width: 50px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            cursor: pointer;
            margin-left: 5px;
            margin-right: 5px;
        }

        .paging .page_list > li a {
            color: #7a7a7a;
        }

        .paging .page_list > li.active a {
            color: #508df0;
        }

        .paging .page_list > li:active a {
            color: #508df0;
        }

        .paging .page_list > button {
            float: left;
            outline: 0 none;
            border: 0 none;
            width: 30px;
            height: 30px;
            font-size: 10px;
            color: #508df0;
            text-align: center;
            line-height: 30px;
            background: #f9fbfc;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            cursor: pointer;
        }

        .paging .page_list > button:active {
            background: #508DF0;
            color: #fff;
        }

        .paging .page_list > button.disabled:active {
            background: #fff;
            color: #b5b5b5;
        }

        .paging .page_list > button.disabled {
            color: #b5b5b5;

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

        /*.page_list {*/
        /*float: right;*/
        /*}*/
        /*.page_list > button {*/
        /*float: left;*/
        /*}*/
        /*.page_list > li {*/
        /*float: left;*/
        /*list-style: none;*/
        /*min-width:32px;*/
        /*background: pink;*/
        /*text-align: center;*/
        /*margin-right: 6px;*/
        /*}*/

        /*.page_seach {*/
        /*display: block!important;*/

        /*}*/

        /*END 分页样式*/

        /*缺省页图片*/
        .demand_default > p {
            text-align: center;
        }

        .demand_default img {
            width: 103px;
        }

        .demand_default .tips {
            font-size: 16px;
            color: #767676;
        }
        .demand_default button{
            width: 100%;
            height: 100%;
            width: 92px;
            height: 34px;
            line-height: 34px;

        }

    </style>
</head>
<body>

<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp"></jsp:include>
    <!--用户中心模块-->
    <div class="user_center user_content clearfix">
        <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
        <jsp:include page="../template/user_side.jsp" flush="true">
            <jsp:param name="levelNum" value="1"/>
            <jsp:param name="firstMenu" value="2"/>
        </jsp:include>
        <%--有结果--%>
        <div class="user_main demand" style="display: ${map.get("count") == 0?'none':'block'};">
            <h2>我的微需求</h2>
            <%--筛选--%>
            <ul class="filter_tab">
                <li data-index="99" ${state == 99?'class="cur"':''} onclick="stateFilter('99')">
                    全部<span>(${map.get("count") != null?map.get("count"):0})</span>
                </li>
                <li data-index="0" ${state == 0?'class="cur"':''} onclick="stateFilter('0')">
                    待审核<span>(${map.get("0") != null? map.get('0'):0})</span>
                </li>
                <li data-index="4" ${state == 4?'class="cur"':''} onclick="stateFilter('4')">
                    未解决<span>(${map.get("4") != null?map.get("4"):0})</span>
                </li>
                <li data-index="2" ${state == 2?'class="cur"':''} onclick="stateFilter('2')">
                    已过期<span>(${map.get("2") != null ? map.get("2"):0})</span>
                </li>
            </ul>
            <%--需求列表--%>
            <div class="demand_list">
                <c:forEach items="${infos}" var="info">
                    <div class="demand_item">
                        <div class="title ">
                            <p class="lft">发布时间：<span>${info.beginTime}</span></p>
                            <c:if test="${info.uReqState > 1}">
                                <p class="lft">截止时间：<span>${info.endTime}</span></p>
                                <p class="rt">已经有<s>${info.uChkCount}人</s>看过此需求联系方式</p>
                            </c:if>
                        </div>
                        <p class="desc">
                                ${info.uReqDescription}
                        </p>
                        <c:if test="${info.uReqState == 4}">
                            <p class="status">${info.remainTime}天后需求过期</p>
                        </c:if>
                        <div style="">
                            <c:if test="${info.uReqState == 0}">
                                <p class="status" style="color: #ff9e47;">待审核</p>
                            </c:if>
                            <c:if test="${info.uReqState == 1}">
                                <p class="status" style="color:#e8442e;">审核拒绝</p>
                                <c:if test="${info.uReqReason != null && info.uReqReason != ''}">
                                    <p class="status_desc" style="font-size: 14px;color:#e8442e;">
                                        <span>拒绝原因：</span>${info.uReqReason}
                                    </p>
                                </c:if>
                            </c:if>
                                <%--<c:if test="${info.uReqState == 4}">--%>
                                <%--<p class="status">未解决</p>--%>
                                <%--</c:if>--%>
                            <c:if test="${info.uReqState == 2}">
                                <p style="color:#508df0;" class="status">需求已过期</p>
                            </c:if>
                            <c:if test="${info.uReqState == 3}">
                                <p style="color:#7acbcf;" class="status">需求已解决</p>
                            </c:if>

                        </div>
                        <div class="btns">
                            <c:if test="${info.uReqState == 0}">
                                <button class="whites" type="button" data-req-id="${info.uReqId}"
                                        onclick="modify(this)">修改
                                </button>
                            </c:if>
                                <%--审核拒绝--%>
                            <c:if test="${info.uReqState == 1}">
                                <button class="whites" type="button" data-req-id="${info.uReqId}"
                                        onclick="modify(this)">修改
                                </button>
                            </c:if>
                                <%--需求已过期--%>
                            <c:if test="${info.uReqState == 2}">
                                <button class="blues" type="button" data-req-id="${info.uReqId}" onclick="modify(this)">
                                    重新发布
                                </button>
                            </c:if>
                                <%--需求已解决--%>
                            <c:if test="${info.uReqState == 3}">

                            </c:if>
                                <%--未解决--%>
                            <c:if test="${info.uReqState == 4}">
                                <c:if test="${info.uHasDelay == 0}">
                                    <button class="whites" type="button" data-req-id="${info.uReqId}"
                                            onclick="modify(this)">修改
                                    </button>
                                    <c:if test="${info.remainTime != null && info.remainTime <= 3}">
                                        <button class="lightGreens" type="button" data-req-id="${info.uReqId}"
                                                onclick="addTime(this)">延长有效期
                                        </button>
                                    </c:if>
                                    <button class="blues" type="button" data-req-id="${info.uReqId}"
                                            onclick="finish(this)">已解决
                                    </button>
                                </c:if>
                                <c:if test="${info.uHasDelay == 1}">
                                    <button class="whites" type="button" data-req-id="${info.uReqId}"
                                            onclick="modify(this)">修改
                                    </button>
                                    <button class="blues" type="button" data-req-id="${info.uReqId}"
                                            onclick="finish(this)">已解决
                                    </button>
                                </c:if>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <%--分頁--%>
            <div class="paging" style="display: ${total > 10?'block':'none'}">
                <div id="page_container" class="page_list"></div>
            </div>
        </div>
        <%--没有结果--%>
        <div class="user_main demand_default demand" style="display:${map.get("count") == 0?'block':'none'}">
            <p style="margin-top: 166px;"><img src="${rlab}/front/imgs/demand_default.jpg" alt=""></p>
            <p style="margin-top: 22px;" class="tips">哎呦，您还没有发布过需求，快去发布一个吧</p>
            <p style="margin-top: 45px;text-align: center;margin-left: 10px;" >
                <button onclick="toCreateDemandPage()" class="bg-blue init-btn" type="button">发布需求</button>
            </p>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
    <div id="addTime" style="width: 400px; height: 170px; background-color: #cccccc; display: none">
        <p style="font-size: 16px; text-align: center; margin-top: 20px">你是否确认延长该需求有效期？</p>
        <p style="font-size: 12px; color: #999; text-align: center; margin-top: 10px">仅可延长一次需求的有效期</p>
        <button style="cursor:pointer;margin-left: 70px; float: left; background-color: white; border: 1px solid #ccc; color: #999"
                class="dismiss button">取消
        </button>
        <button style="cursor:pointer;margin-right: 70px; float: right; background-color: #2fcba8; color: white" class="commit button">
            确定
        </button>
    </div>
    <div id="finish" style="width: 400px; height: 170px; background-color: #cccccc; display: none">
        <p style="font-size: 16px; text-align: center; margin-top: 20px">你是否确认该需求已解决？</p>
        <button style="cursor:pointer;margin-left: 70px; float: left; background-color: white; border: 1px solid #ccc; color: #999"
                class="dismiss button">取消
        </button>
        <button style="cursor:pointer;margin-right: 70px; float: right; background-color: #2fcba8; color: white"
                class="commit button">
            确定
        </button>
    </div>
</div>
<!--my common js-->
<script src="${rlab}/front/js/util/pagination.js?v_=20170622"></script>
<script src="${rlab}/front/js/common/main.js?v_=20170706"></script>
<script type="text/javascript">

    var PAGE_NO = '${pageNo}';// 起始页参数
    var PAGE_SIZE = 10; // 每页条数参数
    var STATE = '${state == null || ''.equals(state)? 99:state}'; // 状态筛选参数


    // 初始化页面分页
    showPages(${total}, (${pageNo} -1) * 10, ${pageSize}, function (from, max) {
        PAGE_NO = from / 10 + 1;
        toDemandList();
    }, "page_container");

    function toCreateDemandPage() {
        window.location.href = BASE_URL + '/page/req/pubpage';
    }
    /**
     * 跳转仪器需求管理列表页
     */
    function toDemandList() {
        window.location.href = BASE_URL + '/front/user/req/tinylist?pageNo=' + PAGE_NO + '&pageSize=' + PAGE_SIZE + '&state=' + STATE;
    }
    /**
     *
     * @param $
     */
    function stateFilter(state) {
        PAGE_NO = 1;
        STATE = state;
        toDemandList();
    }

    function addTime($this) {
        $this = $($this);
        var id = $this.data('reqId');
        //        console.log(id);
        var html = $("#addTime").html();
        var laryer = layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 0,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['400px', '170px'], //宽高
            content: html  //弹窗内容
        });

        $(".dismiss").off("click").on("click", function () {
            layer.close(laryer);
        });
        $(".commit").off("click").on("click", function () {
            console.log('commit' + id);
            $.ajax({
                url: '${rlab}/bg/req/delay?uReqId=' + id,
                type: 'GET',
                dataType: "json",
                contentType: "application/json"
            })
                .done(function (data) {
                    window.location.reload(true);
                    <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
                })
                .fail(function (data) {
                    alert("失败");
                });
        });
    }

    function finish($this) {
        $this = $($this);
        var id = $this.data('reqId');
//        console.log(id);
        var html = $("#finish").html();
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
            console.log('commit' + id);
            var data = {
                uReqIds: [id],
                uReqState: 3
            }
            console.log(data);
            $.ajax({
                url: '${rlab}/front/user/req/auditing',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json"
            })
                .done(function (data) {
                    window.location.reload(true);
                    <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
                })
                .fail(function (data) {
                    alert("失败");
                });
        });
    }


    function modify($this) {
        $this = $($this);
        var id = $this.data('reqId');
        window.location.href = '${rlab}/front/user/req/modifypage?uReqId=' + id;
    }
</script>
</body>
</html>