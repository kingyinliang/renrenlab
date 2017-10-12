<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>
    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">

    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style type="text/css">
        .faci_sc {
            float: left;
            margin-top: 14px;
        }

        .slct_type {
            width: 170px;
            height: 50px;
            float: left;
            margin-top: 14px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .lab_date {
            margin-top: 14px;
            float: left;
            margin-right: 20px;
        }

        .panel_btn {
            float: left;
            margin-top: 14px;
        }

        .panel_btn button {
            margin-right: 10px;
        }

        .panel_section {
            margin-bottom: 17px;
        }

        .panel_section .audit {
            margin-top: 50px;
        }

        .panel_section .audit button {
            margin-right: 18px;
        }

        .pages {
            margin-top: 30px;
        }

        .td_ins_number {
            position: relative;
            padding-left: 20px;
        }

        .td_ins_number input {
            float: left;
            position: absolute;
            left: 0;
        }

        .td_ins_number span {
            float: left;
            line-height: 20px;
        }

        .shade .tit {
            padding: 26px 0 0 0;
            overflow: hidden;
        }

        .shade .tit span {
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 25px;
        }

        .shade .tit p {
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }

        .shade .tit button {
            width: 50%;
            box-sizing: content-box;
            margin: 0;
            float: left;
            height: 60px;
            margin-bottom: 0;
            margin-top: 0;
            border-radius: 0;
            border-top: 1px solid #7b8da0;
            background: #78b3e7;
        }

        tr td a {
            cursor: pointer;
        }

        .rejectModal {
            height:420px!important;
            width: 380px!important;
        }
    </style>
</head>
<body>

<%--审核拒绝弹窗--%>
<%--<div style="padding: 0 30px;background-color: pink;width: 380px;overflow: hidden;">--%>
    <%--<p style="font-size: 18px;color: #707070;height: 64px;line-height:64px;">审核不通过原因</p>--%>
    <%--<div style="width: 314px;overflow: hidden;border: 1px solid #ccc;">--%>
        <%--<textarea style="width: 330px;border: 0 none;padding: 20px 30px 20px 20px;" name="" id="" maxlength="50" cols="30" rows="10">--%>

        <%--</textarea>--%>
    <%--</div>--%>
    <%--<p style="margin-top: 20px;margin-bottom: 28px;">--%>
        <%--<button type="button" style="background-color: #fff;color:#cecece;border: 1px solid #ccc;width: 156px;height: 44px;">取消</button>--%>
        <%--<button type="button" style="background-color: #15b8bd;color:#fff;border:0 none;width: 156px;height: 44px;">确定</button>--%>
    <%--</p>--%>
<%--</div>--%>

<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="1"/>
                <jsp:param name="firstMenu" value="6"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="javascript:void(0)">需求管理</a>
                  <%--<a href="">认证审核</a>--%>
                </span>
            </div>

            <div class="panel_section">
                <div class="clearfix">
                    <%-- START搜索框组件 --%>
                    <div class="lab_search_type1 faci_sc">
                        <%--<i class="lab-search"></i>--%>
                        <label for="shareInsKeyword" class="lab-search"></label>
                        <input id="shareInsKeyword" type="text" class="scInpt" placeholder="需求人手机号/需求人"
                               value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                    </div>
                    <%-- END搜索框组件 --%>

                    <div class="slct_type">
                        <%--STAR搜索下拉--%>
                        <form class="layui-form lab_sc_slect" action="javascript:void(0)">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="shareInsStatus" lay-filter="shareInsStatus" name="modules"
                                            lay-verify="required">
                                        <option value="99" ${mapState == 99?'selected':''}>请选择需求状态</option>
                                        <option value="0" ${mapState == 0?'selected':''}>待审核</option>
                                        <option value="1" ${mapState == 1?'selected':''}>审核拒绝</option>
                                        <option value="2" ${mapState == 2?'selected':''}>已过期</option>
                                        <option value="3" ${mapState == 3?'selected':''}>已解决</option>
                                        <option value="4" ${mapState == 4?'selected':''}>未解决</option>
                                    </select>
                                </div>
                            </div>

                        </form>
                        <%--END搜索下拉--%>
                    </div>
                    <%--START 公用时间组件 --%>
                    <div class="lab_date clearfix">
                        <button type="button" class="" id="daterange-btn">
                        <span>
                          近一周
                        </span>
                            <%--<i class="fa fa-caret-down"></i>--%>
                            <i class="layui-icon date_icon">&#xe637;</i>
                        </button>

                    </div>
                    <%--END 公用时间组件--%>
                    <div class="panel_btn clearfix">
                        <%--按钮组件--%>
                        <button class="lab_btn_base lab_btn_type1" type="button" onclick="doSearchShareq()"><i
                                class="lab-search"></i>检索需求
                        </button>
                        <button class="lab_btn_base lab_btn_type2" type="button" onclick="All()"><i
                                class="iconfont icon-caidan1"></i>显示所有
                        </button>
                    </div>
                </div>


                <%--审核权限--%>
                <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                    <div class="audit">
                        <button class="lab_btn_base lab_btn_base_2 bd_light_grn cl_light_grn" type="button" onclick="acceptDemand()">审核通过
                        </button>
                        <button class="lab_btn_base lab_btn_base_2 bd_leaf_yl cl_leaf_yl" type="button" onclick="rejectDemand()">审核拒绝
                        </button>
                            <%--<button class="lab_btn_base lab_btn_base_2 bd_light_bl cl_light_bl" type="button"
                                    onclick="signDemand()">已解决需求
                            </button>--%>
                    </div>
                </c:if>

            </div>

            <%--③列表区--%>
            <div class="lab_list_type1">
                <table class="layui-table">
                    <colgroup>
                        <col width="20%">
                        <col width="10%">
                        <col width="20%">
                        <col width="15%">
                        <col width="15%">
                        <col width="20%">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>需求人</th>
                        <th>手机号</th>
                        <th>需求标题</th>
                        <th id="orderByBar" style="cursor: pointer" onclick="listSort(this)" data-sort="${order}"
                            class="sorts">发布时间<i class="${order=='DESC'? 'lab-down' : 'lab-top' }"></i></th>
                        <th>需求状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${infos}" var="info">
                        <c:if test="${info.uReqState == 4}">
                            <tr>
                                <td>
                                    <%--审核权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                                        <input name="reqNumber" class="checks" type="checkbox" disabled
                                               data-req-id="${info.uReqId}"
                                               data-req-state="${info.uReqState}">
                                    </c:if>
                                    ${info.uName}
                                </td>
                                <td>
                                        ${info.uMobile}
                                </td>
                                <td>
                                        ${info.uReqDescription}
                                </td>
                                <td>
                                        ${info.beginTime}
                                </td>
                                <td>
                                    未解决
                                </td>

                                <td>
                                    <%--查看权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                        <a href="${rlab}/bg/req/detail?uReqId=${info.uReqId}">查看详情</a>
                                    </c:if>
                                    <%--审核权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                                        <a href="javascript:void(0)" onclick="complet(this)" data-req-id="${info.uReqId}">已解决</a>
                                    </c:if>
                                    <%--审核权限--%>
                                    <c:if test="${info.uHasDelay==0 && info.remainTime<=3 && '1'.equals(sessionScope.u_permission.substring(2,3))}">
                                        <a href="javascript:void(0)" onclick="addTime(this)" data-req-id="${info.uReqId}">延长有效期</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${info.uReqState != 4}">
                            <tr>
                                <td>
                                  <%--审核权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                                        <input name="reqNumber" class="checks"
                                               type="checkbox" ${info.uReqState != 0? 'disabled': ''}
                                               data-req-id="${info.uReqId}" data-req-state="${info.uReqState}">
                                    </c:if>
                                    ${info.uName}
                                </td>
                                <td>
                                        ${info.uMobile}
                                </td>
                                <td>
                                        ${info.uReqDescription}
                                </td>
                                <td>
                                        ${info.beginTime}
                                </td>
                                <td>
                                    <c:if test="${info.uReqState == 0}">
                                        待审核
                                    </c:if>
                                    <c:if test="${info.uReqState == 1}">
                                        审核拒绝
                                    </c:if>
                                    <c:if test="${info.uReqState == 2}">
                                        已过期
                                    </c:if>
                                    <c:if test="${info.uReqState == 3}">
                                        已解决
                                    </c:if>
                                </td>

                                <td>
                                  <%--查看权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                        <a href="${rlab}/bg/req/detail?uReqId=${info.uReqId}">查看详情</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <%--④分页区--%>
            <%--<div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">--%>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>
                        显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize > total? total : pageNo * pageSize}条/共${total}条</p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right"></div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${pageSize == 10 ? "selected": ""}>10条/页</option>
                            <option value="25" ${pageSize == 25 ? "selected": ""}>25条/页</option>
                            <option value="50" ${pageSize == 50 ? "selected": ""}>50条/页</option>
                            <option value="100" ${pageSize == 100 ? "selected": ""}>100条/页</option>
                        </select>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="complete" class="shade">
        <div class="tit" style="height: 265px">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认完成需求</p>
            <p style="font-size: 16px;color: #909090">确认后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closeComplete()">取消</button>
            <button class="layui-btn" onclick="completeCommit(this)" id="completeCommit">确认</button>
        </div>
    </div>
    <div id="addTime" class="shade">
        <div class="tit" style="height: 265px">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认延长时间</p>
            <p style="font-size: 16px;color: #909090">确认后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closeAddTime()">取消</button>
            <button class="layui-btn" onclick="addTimeCommit(this)" id="addTimeCommit">确认</button>
        </div>
    </div>
</div>
</body>
<%--开发环境--%>
<script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>
<script src="${rlab}/common/assets/layui/layui.js" charset="utf-8"></script>
<script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
<script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
<script src="${rlab}/bg/js/main.js"></script>

<script>
    var keyword = $("#shareInsKeyword").val();
    var pageSize = ${pageSize};
    var mapState = ${mapState};
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var order = '${order=="DESC"? "":"&order=asc"}';
    keyword = keyencode(keyword)
    //    var startDate = moment().format();
    //    var endDate = moment().day(-3).format();
    initLayui();

    //    initDateForm();
    /**
     * 切换页码
     */
    function swiftPageSize() {
//        console.log(1)
    }

    $("#pageSize").on("change", function () {
        // console.log(2222222222)

    })

    /**
     * 初始化layui
     */
    function initLayui() {
        layui.use(['form', 'laypage'], function () {

            var form = layui.form(),
                laypage = layui.laypage;

            // pageSize change事件监听
            form.on('select(swiftPageSize)', function (data) {

                PAGE_SIZE = data.value;
                PAGE_NO = 1;
                doSearchSharew();// 跳转搜索页面

            });

            // pageSize切换下拉
            form.on('select(shareInsStatus)', function (data) {
//                console.log(data.elem); //得到select原始DOM对象
//                console.log(data.value); //得到被选中的值
//                console.log(data.othis); //得到美化后的DOM对象
//                SHARE_INS_STATUS = data.value;
                mapState = data.value;
            });

            form.on('select(pageSize)', function (data) {
                pageSize = data.value;
                window.location.href = '${rlab}/bg/req/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + '&mapState=' + mapState + order;
            });

            // 分页配置参数
            var pagesOption = {
                cont: 'pagesControl'
                , pages: ${pages}
                , skip: true
                , skin: '#2fcba8'
                , curr: ${pageNo}
                , prev: '<em><</em>'
                , next: '<em>></em>'
                , first: 1
                , last: ${pages}
                , jump: function (obj, first) {
                    // todo:更新跳转的PageSize和PageNo
                    if (!first) {
                        window.location.href = '${rlab}/bg/req/list?keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + '&mapState=' + mapState + order;
                    }
                }
            };
            // 挂载分页组件
            laypage(pagesOption);

        });
    }

    /**
     * 初始化日期表单
     */
    $('#daterange-btn').daterangepicker({
            startDate: '${requestScope.get("beginTime")}',
            endDate: '${requestScope.get("endTime")}',
            minDate: '2016-01-01',
            maxDate: new Date()
//            setStartDate:
        },
        function (start, end) {
            $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年M月D日'));
            startDate = start.format('YYYY-MM-DD');
            endDate = end.format('YYYY-MM-DD');
        }
    );
    $('#daterange-btn span').html('${requestScope.get("beginTime")}' + ' - ' + '${requestScope.get("endTime")}');


    function doSearchShareq() {
        keyword = $.trim($("#shareInsKeyword").val());
        keyword = keyencode(keyword)
        var url = '${rlab}/bg/req/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + '&mapState=' + mapState;
        window.location.href = url;
    }

    function listSort($this) {
        $this = $($this);
        if ($this.data("sort") == "DESC") {
            order = "&order=asc";
        } else {
            order = "";
        }
        var url = '${rlab}/bg/req/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;
        console.log(url);
        window.location.href = url;
    }

    function complet($this) {
        $this = $($this);
        var id = $this.data("reqId");
        $("#complete").show();
        $("#complete #completeCommit").data("reqId", id);
    }

    function closeComplete() {
        $("#complete").hide();
    }

    function completeCommit($this) {
        $this = $($this);
        var id = $this.data('reqId');
        console.log(id);
        var data = {
            uReqIds: [id],
            uReqState: 3
        }
        $.ajax({
            url: '${rlab}/bg/req/auditing',
            type: 'POST',
            dataType: "json",
            data: JSON.stringify(data),
            contentType: "application/json"
        }).done(function (data) {
            window.location.reload(true);
            <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
        }).fail(function (data) {
            alert("失败");
        });
    }

    function addTime($this) {
        $this = $($this);
        var id = $this.data("reqId");
        $("#addTime").show();
        $("#addTime #addTimeCommit").data("reqId", id);
    }

    function closeAddTime() {
        $("#addTime").hide();
    }

    function addTimeCommit($this) {
        $this = $($this);
        var id = $this.data('reqId');
        console.log(id);
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
    }

    function acceptDemand() {
        // 没有勾选选项
        if($("input[name=reqNumber]:checked").length <= 0){
            layer.msg("请先勾选要通过审核的需求");
            return false;
        }

        var html =
            '<div style="padding: 0 30px;background-color: #fff;width: 380px;overflow: hidden;border-bottom: 2px solid #16b8bd;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;">\
                    <p style="text-align:center;font-size: 18px;color: #666;height: 120px;line-height:120px;">您是否确认通过审核</p>\
                    <p style="margin-top: 20px;margin-bottom: 28px;">\
                    <button id="cancelReject" type="button" style="background-color: #fff;color:#cecece;border: 1px solid #ccc;width: 156px;height: 44px;">取消</button>\
                    <button id="cfmReject" type="button" style="background-color: #15b8bd;color:#fff;border:0 none;width: 156px;height: 44px;">确定</button>\
                    </p>\
                    </div>';

        //页面层-自定义
        var layer2 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'acceptModal',
            content: html
        });

        $(".acceptModal").css("height","100px!important");
        $(".acceptModal").css("width","auto");

        $("#cancelReject").off("click").on("click", function () {
            layer.close(layer2);
        })

        $("#cfmReject").off("click").on("click", function () {
            var arr = [];
            for (var i = 0; i < $("input[name=reqNumber]:checked").length; i++) {
                if ($("input[name=reqNumber]:checked").eq(i).data("reqState") != 0) {
                    alert("只能选择待审核状态的需求");
                    return;
                }
                arr.push($("input[name=reqNumber]:checked").eq(i).data("reqId"))
            }

            var data = {
                uReqIds: arr,
                uReqState: 4
            }

            $.ajax({
                url: '${rlab}/bg/req/auditing',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:function (data) {
                    if(data.code === 0) {
                        window.location.reload(true);
                    }
                },
                error:function () {
                    console.log('操作失败');
                },
                complete:function () {
                    layer.close(layer2);
                }
            })
        })
    }

    function rejectDemand() {

        // 没有勾选选项
        if($("input[name=reqNumber]:checked").length <= 0){
            layer.msg("请先勾选要拒绝的需求");
            return false;
        }

        var html =
    '<div style="padding: 0 30px;background-color: #fff;width: 380px;overflow: hidden;">\
            <p style="font-size: 18px;color: #707070;height: 64px;line-height:64px;">审核不通过原因</p>\
            <div style="width: 314px;overflow: hidden;border: 1px solid #ccc;">\
            <textarea id="rejectTxt" style="width: 330px;border: 0 none;padding: 20px 30px 20px 20px;"  maxlength="50" cols="30" rows="10"></textarea>\
            </div>\
            <p style="margin-top: 20px;margin-bottom: 28px;">\
            <button id="cancelReject" type="button" style="background-color: #fff;color:#cecece;border: 1px solid #ccc;width: 156px;height: 44px;">取消</button>\
            <button id="cfmReject" type="button" style="background-color: #15b8bd;color:#fff;border:0 none;width: 156px;height: 44px;">确定</button>\
            </p>\
            </div>';

        //页面层-自定义
       var layer1 = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'rejectModal',
            content: html
        });


        $("#cancelReject").off("click").on("click",function () {
            layer.close(layer1);
        })

        $("#cfmReject").off("click").on("click",function () {

            var arr = [];
            for (var i = 0; i < $("input[name=reqNumber]:checked").length; i++) {
                if ($("input[name=reqNumber]:checked").eq(i).data("reqState") != 0) {
                    alert("只能选择待审核状态的需求");
                    return;
                }
                arr.push($("input[name=reqNumber]:checked").eq(i).data("reqId"))
            }

            var data = {
                uReqIds: arr,
                uReqState: 1,
                uReqReason:$("#rejectTxt").val()
            }

            $.ajax({
                url: BASE_URL + '/bg/req/auditing',
                type: 'POST',
                dataType: "json",
                data: JSON.stringify(data),
                contentType: "application/json",
                success:function () {
                    window.location.reload(true);
                },
                error:function () {
                    console.error(BASE_URL + '/bg/req/auditing' + '请求失败');
                },
                complete:function () {
                    layer.close(layer1);
                }
            })


        })


    }

    function signDemand() {
        var arr = [];
        for (var i = 0; i < $("input[name=reqNumber]:checked").length; i++) {
            if ($("input[name=reqNumber]:checked").eq(i).data("reqState") != 4) {
                alert("只能选择待解决状态的需求");
                return;
            }
            arr.push($("input[name=reqNumber]:checked").eq(i).data("reqId"))
        }
        var data = {
            uReqIds: arr,
            uReqState: 3
        }
        console.log(data);
        $.ajax({
            url: '${rlab}/bg/req/auditing',
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
    }

    function All() {
        window.location.href = '${rlab}/bg/req/list'
    }
</script>
</html>
