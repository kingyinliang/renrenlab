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
            margin-bottom: 15px;
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
        tr th{
            text-align: center!important;
        }
        tr td{
            text-align: center;
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
                <jsp:param name="firstMenu" value="7"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="${rlab}/bg/coupon/search?flag=1">创新券管理</a>
                  <a href="${rlab}/bg/coupon/search?flag=1">认证审核</a>
                </span>
            </div>

            <div class="panel_section">
                <div class="clearfix">
                    <%-- START搜索框组件 --%>
                    <div class="lab_search_type1 faci_sc">
                        <%--<i class="lab-search"></i>--%>
                        <label for="shareInsKeyword" class="lab-search"></label>
                        <input id="shareInsKeyword" type="text" class="scInpt" placeholder="手机号/机构名称"
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
                                        <option value="">审核状态</option>
                                        <option value="">全部</option>
                                        <option value="0" ${state eq "0"?"selected":""}>待审核</option>
                                        <option value="1" ${state eq "1"?"selected":""}>审核通过</option>
                                        <option value="2" ${state eq "2"?"selected":""}>审核拒绝</option>
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
                        <button class="lab_btn_base lab_btn_type1" type="button" onclick="doSearchSharew()"><i
                                class="lab-search"></i>检索用户
                        </button>
                        <button class="lab_btn_base lab_btn_type2" type="button" onclick="doSearchSharew('all')"><i
                                class="iconfont icon-caidan1"></i>显示所有
                        </button>

                    </div>
                </div>
            </div>

            <%--③列表区--%>
            <div class="lab_list_type1">
                <table class="layui-table">
                    <colgroup>
                        <col width="12%">
                        <col width="27%">
                        <col width="10%">
                        <col width="18%">
                        <col width="15%">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th>申请人账号</th>
                        <th>机构名称</th>
                        <th>来源</th>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">申请时间<i class="${order==null? 'lab-down' : 'lab-top' }"></i></th>
                        <th>审核状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="info">
                        <tr>
                            <td>
                                ${info.uMobile}
                            </td>
                            <td>
                                    ${info.orgName}
                            </td>
                            <td>
                                    ${info.orgCerSource eq 0? "人人实验":"天使助"}
                            </td>
                            <td>
                                <fmt:formatDate value="${info.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td>
                                <c:if test="${info.orgCerState eq 0}">
                                    待审核
                                </c:if>
                                <c:if test="${info.orgCerState eq 1}">
                                    审核通过
                                </c:if>
                                <c:if test="${info.orgCerState eq 2}">
                                    审核拒绝
                                </c:if>
                            </td>
                            <td>
                                <%--查看权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                    <a href="${rlab}/bg/coupon/detail?id=${info.orgCerId}">查看详情</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <%--④分页区--%>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
            <div class="pages clearfix">
                <div class="textinfo">
                    <p>
                        显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize > total? total : pageNo * pageSize}条/共${total}条
                        <%--显示第10条/共1000条--%>
                    </p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right"></div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select id="pageSize" name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${pageSize == 10 ? 'selected': ''}>10条/页</option>
                            <option value="25" ${pageSize == 25 ? 'selected': ''}>25条/页</option>
                            <option value="50" ${pageSize == 50 ? 'selected': ''}>50条/页</option>
                            <option value="100" ${pageSize == 100 ? 'selected': ''}>100条/页</option>
                            <%--<option value="10" }>10页/条</option>--%>
                            <%--<option value="25" }>25页/条</option>--%>
                            <%--<option value="50" }>50页/条</option>--%>
                            <%--<option value="100" }>100页/条</option>--%>
                        </select>
                    </form>
                </div>
            </div>

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
    var mapState = "${state}";
    var startDate = '${requestScope.get("startTime")}';
    var endDate = '${requestScope.get("endTime")}';
    /*var startDate = moment().format();
    var endDate = moment().day(-3).format();*/
    var order='${order==null? "":"&order=1"}';
    var keyword = $("#shareInsKeyword").val();
    keyword=keyencode(keyword);
    initLayui();
    initDateForm();
    /**
     * 切换页码
     */
    function swiftPageSize() {
//        console.log(1)
    }

    $("#pageSize").on("change", function () {
        console.log(2222222222)
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

                console.log(data.elem); //得到select原始DOM对象
                console.log(data.value); //得到被选中的值
                console.log(data.othis); //得到美化后的DOM对象
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
                window.location.href = '${rlab}/bg/coupon/search?flag=1&keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&state=' + mapState + '&startTime=' + startDate + '&endTime=' + endDate+order;
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
                        window.location.href = '${rlab}/bg/coupon/search?flag=1&keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&state=' + mapState + '&startTime=' + startDate + '&endTime=' + endDate+order;
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
                startDate: startDate,
                endDate: endDate,
                minDate: '2016-01-01',
                maxDate: new Date(),
                opens: "left"

            },
            function (start, end) {
                $('#daterange-btn span').html(start.format('YYYY年M月D日') + ' - ' + end.format('YYYY年M月D日'));
                startDate = start.format('YYYY-MM-DD');
                endDate = end.format('YYYY-MM-DD');
            }
        );

        $('#daterange-btn span').html(startDate + ' - ' + endDate);
    }

    /**
     * 检索机构
     */
    function doSearchSharew(scRange) {

        keyword = $.trim($("#shareInsKeyword").val());
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
            window.location.href ='${rlab}/bg/coupon/search?flag=1&startTime=2016-01-01';
            return;
        }
        var url = '${rlab}/bg/coupon/search?flag=1&keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&state=' + mapState + '&startTime=' + startDate + '&endTime=' + endDate+order;
        window.location.href = url;
    }
    function listSort($this) {
        $this = $($this);
        if (!$this.data("sort")){
            order="&order=1";
        }else {
            order="";
        }
        window.location.href ='${rlab}/bg/coupon/search?flag=1&keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&state=' + mapState + '&startTime=' + startDate + '&endTime=' + endDate+order;
    }

</script>
</html>
