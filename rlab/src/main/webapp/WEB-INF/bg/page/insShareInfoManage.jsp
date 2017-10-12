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
    <style>
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
        .shade .tit{
            padding: 26px 0 0 0;
            overflow: hidden;
        }
        .shade .tit span{
            margin: auto;
            font-size: 90px;
            color: #ff783d;
            display: block;
            width: 90px;
            height: 90px;
            margin-bottom: 15px;
        }
        .shade .tit p{
            font-size: 22px;
            color: #333333;
            line-height: 25px;
            text-align: center;
        }
        .shade .tit button{
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
        tr td a{
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2"/>
                <jsp:param name="firstMenu" value="3"/>
                <jsp:param name="secondMenu" value="2"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">仪器管理</a>
                  <a href="">共享信息管理</a>
                </span>
            </div>

            <div class="panel_section">
                <div class="clearfix">
                    <%-- START搜索框组件 --%>
                    <div class="lab_search_type1 faci_sc">
                        <%--<i class="lab-search"></i>--%>
                        <label for="shareInsKeyword" class="lab-search"></label>
                        <input id="shareInsKeyword" type="text" class="scInpt" placeholder="仪器编号/仪器名称/仪器型号/持有机构"
                               value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                    </div>
                    <%-- END搜索框组件 --%>

                    <div class="slct_type">
                        <%--STAR搜索下拉--%>
                        <form class="layui-form lab_sc_slect" action="javascript:void(0)">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="shareInsStatus" lay-filter="shareInsStatus" name="modules" lay-verify="required" >
                                        <option value="99" ${mapState == 99?'selected': ''}>请选择仪器状态</option>
                                        <option value="1" ${mapState == 1?'selected': ''}>待审核</option>
                                        <option value="0" ${mapState == 0?'selected': ''}>审核通过</option>
                                        <option value="2"${mapState == 2?'selected': ''}>审核拒绝</option>
                                        <option value="3" ${mapState == 3?'selected': ''}>已下架</option>
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
                        <button class="lab_btn_base lab_btn_type1" type="button" onclick="doSearchSharew()"><i class="lab-search"></i>检索仪器</button>
                        <button class="lab_btn_base lab_btn_type2" type="button" onclick="doSearchSharew('all')"><i class="iconfont icon-caidan1"></i>显示所有
                        </button>
                        <%--<button onclick="" class="lab_btn_base lab_btn_type2" type="button">--%>
                            <%--<i class="lab-share-1"></i><a style="color: #fff;" href="${rlab}/bg/instrument/upload/uploadInstruments">批量上传</a>--%>
                        <%--</button>--%>
                        <%--按钮组件--%>
                    </div>
                </div>
                <%--审核权限--%>
                <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                    <div class="audit">
                        <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_blue" type="button"
                                onclick="acceptShareInfo()">审核通过
                        </button>
                        <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_red" type="button"
                                onclick="rejectShareInfo()">审核拒绝
                        </button>
                    </div>
                </c:if>

            </div>

            <%--③列表区--%>
            <div class="lab_list_type1">
                <table class="layui-table">
                    <colgroup>
                        <col width="6%">
                        <col width="20%">
                        <col width="9%">
                        <col width="9%">
                        <col width="9%">
                        <col width="18%">
                        <col width="9%">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>商品编号</th>
                        <th>仪器名称</th>
                        <th>适用领域</th>
                        <th>参考价格</th>
                        <th>持有机构</th>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">更新时间<i class="${order==null? 'lab-down' : 'lab-top' }"></i></th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${shareList}" var="item">
                        <tr>
                            <td>
                                <div class="td_ins_number clearfix">
                                    <%--审核权限--%>
                                    <c:if test="${'1'.equals(sessionScope.u_permission.substring(2,3))}">
                                        <input name="insNumber" type="checkbox" data-map-id="${item.mapId}"
                                               value="" ${item.mapState[2] == 1? '': 'disabled'}/>
                                    </c:if>
                                    <span>${item.mapId}</span>
                                </div>
                            </td>
                            <td width="">${item.insName}</td>
                            <td width="">${item.insScopeList[0].insScopeName}</td>
                            <td width="">
                                <c:if test="${item.insOrgPriceList.flag == 1}">
                                    ￥${item.insOrgPriceList.accPrice} / ${item.insOrgPriceList.unit}
                                </c:if>
                                <c:if test="${item.insOrgPriceList.flag == 2}">
                                    <c:choose>
                                        <c:when test='${item.insOrgPriceList.scopeHighPrice.equals("0")}'>
                                            ￥${item.insOrgPriceList.scopeLowPrice}/${item.insOrgPriceList.unit}起
                                        </c:when>
                                        <c:otherwise>
                                            ￥${item.insOrgPriceList.scopeLowPrice} - ￥${item.insOrgPriceList.scopeHighPrice} / ${instrumentInfo.insOrgPriceList.unit}
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:if test="${item.insOrgPriceList.flag == 3}">
                                    面议
                                </c:if>
                            </td>
                            <td width="">${item.orgName}</td>
                            <td width="">
                                    ${item.time}
                            </td>
                            <td width="">
                                    ${item.mapState[2] == 0? '审核通过': item.mapState[2] == 1? '待审核': item.mapState[2] == 2? '审核拒绝': '已下架'}
                            </td>
                            <td width="">
                                <%--查看权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                    <a href="${rlab}/bg/share/detail?mapId=${item.mapId}">查看详情</a>
                                </c:if>
                                    <%--修改权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                                    <a href="${rlab}/bg/share/modify?mapId=${item.mapId}">修改</a>
                                </c:if>
                                <%--撤销权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                                    <a onclick="dropAlert(this)" data-map-id="${item.mapId}" data-tr-fal="${item.mapState[2] == 3? '2':"1" }">${item.mapState[2] == 3? '开启':"下架" }</a>
                                </c:if>
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <%--④分页区--%>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>
                        显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize > total? total : pageNo * pageSize}条/共${total}条</p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right"></div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select id="pageSize" name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${pageSize == 10 ? 'selected': ''}>10页/条</option>
                            <option value="25" ${pageSize == 25 ? 'selected': ''}>25页/条</option>
                            <option value="50" ${pageSize == 50 ? 'selected': ''}>50页/条</option>
                            <option value="100" ${pageSize == 100 ? 'selected': ''}>100页/条</option>
                        </select>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="close">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认下架此仪器</p>
            <p style="font-size: 16px;color: #909090">下架仪器后，该仪器用户不可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="drop()">确认</button>
        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="open">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认重新开启此仪器</p>
            <p style="font-size: 16px;color: #909090">开启仪器后，该仪器用户可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="agree()">确认</button>
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
    var pageSize = ${pageSize};
    var mapState = ${mapState};
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var order='${order==null? "":"&order=1"}';
    var keyword = $.trim($("#shareInsKeyword").val());
    keyword=keyencode(keyword);
    function listSort($this) {
        $this = $($this);
        if (!$this.data("sort")){
            order="&order=1";
        }else {
            order="";
        }
        window.location.href ='${rlab}/bg/share/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&mapState=' + mapState + '&beginTime=' + startDate + '&endTime=' + endDate+order;
    }
    function hide() {
        $("#close").hide();
        $("#open").hide();
    }

    function dropAlert($this) {
        $this = $($this);
        if($this.data("trFal")==1){
            $("#close").data("mapId", $this.data("mapId"));
            $("#close").show();
        }else {
            $("#open").data("mapId", $this.data("mapId"));
            $("#open").show();
        }
    }

    function drop() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + $("#close").data("mapId") + '&state=' + '3',
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("下架失败");
            });
    }

    function agreeAlert($this) {
        $this = $($this);
        $("#open").data("mapId", $this.data("mapId"));
        $("#open").show();
    }

    function agree() {
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + $("#open").data("mapId") + '&state=' + '0',
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("开启失败");
            });
    }

    (function () {
        initLayui();
        initDateForm();
    })();
    var KEY_WORD = null,
        SHARE_INS_STATUS = null,
        DATE_SCOPE = {
            START: moment().day(-3),
            END: moment()
        },
        PAGE_SIZE = $("#pageSize").val(),
        PAGE_NO = null;

    /**
     * 审核通过
     */
    function acceptShareInfo() {
        var data = [];
        for (var i = 0; i < $("input[name=insNumber]:checked").length; i++) {
            data.push($("input[name=insNumber]:checked").eq(i).data("mapId"))
        }

        if (data.length == 0) {
            return;
        }

        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + data + '&state=' + '0',
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

    /**
     * 审核拒绝
     */
    function rejectShareInfo() {
        var data = [];
        for (var i = 0; i < $("input[name=insNumber]:checked").length; i++) {
            data.push($("input[name=insNumber]:checked").eq(i).data("mapId"))
        }

        if (data.length == 0) {
            return;
        }
        $.ajax({
            url: '${rlab}/bg/share/turn?mapIds=' + data + '&state=' + '2',
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

    /**
     * 切换页码
     */
    function swiftPageSize() {
//        console.log(1)
    }

    /**
     * 初始化layui
     */
    function initLayui() {
        layui.use(['form', 'layedit', 'laydate', 'laypage'], function () {
            var form = layui.form(),
                laypage = layui.laypage;

            // pageSize change事件监听
            form.on('select(swiftPageSize)', function(data){

                console.log(data.elem); //得到select原始DOM对象
                console.log(data.value); //得到被选中的值
                console.log(data.othis); //得到美化后的DOM对象
                PAGE_SIZE = data.value;
                PAGE_NO = 1;
                doSearchSharew();// 跳转搜索页面

            });

            // pageSize切换下拉
            form.on('select(shareInsStatus)', function(data){
//                console.log(data.elem); //得到select原始DOM对象
//                console.log(data.value); //得到被选中的值
//                console.log(data.othis); //得到美化后的DOM对象
//                SHARE_INS_STATUS = data.value;
                mapState = data.value;
            });


            form.on('select(pageSize)', function (data) {
                pageSize = data.value;
                window.location.href ='${rlab}/bg/share/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&mapState=' + mapState + '&beginTime=' + startDate + '&endTime=' + endDate+order;
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
                        window.location.href = '${rlab}/bg/share/list?keyword='+keyword+'&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&mapState=' + mapState + '&beginTime=' + startDate + '&endTime=' + endDate+order;
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
    function initDateForm() {

        $('#daterange-btn').daterangepicker({
                startDate: '${requestScope.get("beginTime")}',
                endDate: '${requestScope.get("endTime")}',
                minDate:'2016-01-01',
                maxDate:new Date()
//                opens: "left"

            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年M月D日'));
                startDate = start.format('YYYY-MM-DD');
                endDate = end.format('YYYY-MM-DD');
            }
        );
        $('#daterange-btn span').html('${requestScope.get("beginTime")}' + ' - ' + '${requestScope.get("endTime")}');
    }

    // --------------ajax相关---------------------
    /**
     * 更新共享仪器状态
     */
    function updateShareStatus() {

    }

    /**
     * 检索机构
     */
    function doSearchSharew(scRange) {
        if (scRange == "all"){
            var url = '${rlab}/bg/share/list?pageNo=1&pageSize=10';
            window.location.href = url;
            return;
        }
        keyword = $.trim($("#shareInsKeyword").val());
//        if (scRange == "all") {
//            KEY_WORD = null;
//            SHARE_INS_STATUS = null,
//            DATE_SCOPE.START = null;
//            DATE_SCOPE.END = null;
//
//        }else{
//            KEY_WORD = $("#shareInsKeyword").val();
//            SHARE_INS_STATUS = $("#shareInsStatus").val();
//
//
//        }
//
//        console.log("KEY_WORD=" + KEY_WORD);
//        console.log("SHARE_INS_STATUS=" + SHARE_INS_STATUS );
//        console.log("DATE_SCOPE.START=" + DATE_SCOPE.START );
//        console.log("DATE_SCOPE.END=" + DATE_SCOPE.END);
//
//        console.log("PAGE_SIZE=" + PAGE_SIZE)
//        console.log("PAGE_NO=" + PAGE_NO)
//        console.log("KEY_WORD=" + KEY_WORD)
        // window.location.href = "insShareInfoManage";


        keyword = encodeURI(keyword);

        keyword = keyword.replace(/\\$/g, "%24");
        keyword = keyword.replace(/\+/g, "%2B");
        keyword = keyword.replace(/#/g, "%23");
        keyword = keyword.replace(/&/g, "%26");
        keyword = keyword.replace(/@/g, "%40");
        keyword = keyword.replace(/=/g, "%3d");
        keyword = keyword.replace(/:/g, "%3a");
        keyword = keyword.replace(/\//g, "%2f");
        keyword = keyword.replace(/;/g, "%3b");
        keyword = keyword.replace(/\?/g, "%3f");
        keyword = keyword.replace(/'/g, "%27");
        if(scRange=='all'){
            window.location.href ='${rlab}/bg/share/list';
            return;
        }
        var url = '${rlab}/bg/share/list?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&mapState=' + mapState + '&beginTime=' + startDate + '&endTime=' + endDate+order;
        window.location.href = url;
    }

</script>
</html>
