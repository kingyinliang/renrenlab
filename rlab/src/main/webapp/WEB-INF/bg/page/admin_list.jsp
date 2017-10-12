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

        tr td {
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
                <jsp:param name="firstMenu" value="8"/>
                <jsp:param name="secondMenu" value="1"/>
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">角色权限管理</a>
                  <a href="">管理员列表</a>
                </span>
            </div>

            <div class="panel_section">
                <div class="clearfix">
                    <%-- START搜索框组件 --%>
                    <div class="lab_search_type1 faci_sc">
                        <%--<i class="lab-search"></i>--%>
                        <label for="shareInsKeyword" class="lab-search"></label>
                        <input id="shareInsKeyword" type="text" class="scInpt" placeholder="工号\员工姓名\账号"
                               value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                    </div>
                    <%-- END搜索框组件 --%>

                    <div class="slct_type">
                        <%--STAR搜索下拉--%>
                        <form class="layui-form lab_sc_slect" action="javascript:void(0)">
                            <div class="layui-inline">
                                <div class="layui-input-inline">
                                    <select id="shareInsStatus" lay-filter="rName" name="modules" lay-verify="required">
                                        <option value="全部" ${rName == '全部' ? "selected": ""}>全部</option>
                                        <option value="初级管理员" ${rName == '初级管理员' ? "selected": ""}>初级管理员</option>
                                        <option value="中级管理员" ${rName == '中级管理员' ? "selected": ""}>中级管理员</option>
                                        <option value="高级管理员" ${rName == '高级管理员' ? "selected": ""}>高级管理员</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                        <%--END搜索下拉--%>
                    </div>
                    <%--START 公用时间组件 --%>
                    <%--<div class="lab_date clearfix">--%>
                    <%--<button type="button" class="" id="daterange-btn">--%>
                    <%--<span>--%>
                    <%--近一周--%>
                    <%--</span>--%>
                    <%--&lt;%&ndash;<i class="fa fa-caret-down"></i>&ndash;%&gt;--%>
                    <%--<i class="layui-icon date_icon">&#xe637;</i>--%>
                    <%--</button>--%>
                    <%--</div>--%>
                    <%--END 公用时间组件--%>
                    <div class="panel_btn clearfix">
                        <%--按钮组件--%>
                        <button class="lab_btn_base lab_btn_type1" type="button" onclick="doSearchSharew()"><i
                                class="lab-search"></i>检索管理员
                        </button>
                        <button class="lab_btn_base lab_btn_type2" type="button" onclick="showAll()"><i
                                class="iconfont icon-caidan1"></i>显示所有
                        </button>
                        <%--按钮组件--%>
                    </div>
                </div>
                <div class="audit">
                    <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_blue" type="button"
                            onclick="selectAll()">全部选择
                    </button>
                    <button class="lab_btn_base lab_btn_base_2 lab_btn_base_2_red" type="button"
                            onclick="disableAll()">撤销权限
                    </button>
                </div>
            </div>

            <%--③列表区--%>
            <div class="lab_list_type1">
                <table class="layui-table">
                    <colgroup>
                        <col width="6%">
                        <col width="10%">
                        <col width="10%">
                        <col width="9%">
                        <col width="15%">
                        <col width="15%">
                        <col width="9%">
                        <col width="9%">
                        <col>
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="text-align: center">工号</th>
                        <th style="text-align: center">姓名</th>
                        <th style="text-align: center">邮箱</th>
                        <th style="text-align: center">权限所属</th>
                        <th style="text-align: center">联系方式</th>
                        <th style="text-align: center">所属部门</th>
                        <th style="text-align: center">设置管理员权限</th>
                        <th style="text-align: center">管理员撤销</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users.list}" var="item">
                        <tr>
                            <td>
                                <div class="td_ins_number clearfix">
                                    <input name="insNumber" type="checkbox" ${item.state == 1?'disabled':''}
                                           data-uid="${item.uUid}"/>
                                    <span>${item.uJobNumber}</span>
                                </div>
                            </td>
                            <td>${item.uNickname}</td>
                            <td>${item.uEmail}</td>
                            <td>${item.rName}${item.state == 1?'（停用）':''}</td>
                            <td>${item.uMobile} </td>
                            <td>${item.uDepartment}</td>
                            <td>
                                 <%--撤销权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                                    <a href="${rlab}/bg/user/role_detail?uUid=${item.uUid}">设置权限</a>
                                    <br>
                                    <c:if test="${item.state == 0}">
                                        <a href="#" onclick="disableManager(this)" data-uid=${item.uUid}>取消权限</a>
                                    </c:if>
                                </c:if>

                            </td>

                            <td width="">
                                    <%--撤销权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                                    <a href="#" onclick="removeManager(this)" data-uid="${item.uUid}">移除管理员</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <%--④分页区--%>
            <div class="pages clearfix" style="display: ${users.total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>
                        显示第${(users.pageNum - 1) * users.pageSize+1}-${users.pageNum * users.pageSize > users.total? users.total : users.pageNum * users.pageSize}条/共${users.total}条</p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right"></div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select id="pageSize" name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${users.pageSize == 10 ? "selected": ""}>10页/条</option>
                            <option value="25" ${users.pageSize == 25 ? "selected": ""}>25页/条</option>
                            <option value="50" ${users.pageSize == 50 ? "selected": ""}>50页/条</option>
                            <option value="100" ${users.pageSize == 100 ? "selected": ""}>100页/条</option>
                        </select>
                    </form>
                </div>
            </div>

        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="disable">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认取消权限</p>
            <p style="font-size: 16px;color: #909090">取消权限后，可在设置权限页面恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button id="disableCommit" class="layui-btn" onclick="disable(this)">确认</button>
        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="remove">
        <div class="tit" style="height: 265px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认删除管理员</p>
            <p style="font-size: 16px;color: #909090">删除管理员后，不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button id="removeCommit" class="layui-btn" onclick="remove(this)">确认</button>
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
    var pageSize = ${users.pageSize};
    var keyword = $.trim($("#shareInsKeyword").val());
    var rName = '全部';
    keyword = keyencode(keyword);


    function hide() {
        $("#disable").hide();
        $("#remove").hide();
    }

    function dropAlert($this) {
        $this = $($this);
        $("#close").data("mapId", $this.data("mapId"));
        $("#close").show();
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
                mapState = data.value;
            });

            form.on('select(rName)', function (data) {
                rName = data.value;
            });


            form.on('select(pageSize)', function (data) {
                pageSize = data.value;
                window.location.href = '${rlab}/bg/user/role_manage?keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&rName=' + rName;
            });

            // 分页配置参数
            var pagesOption = {
                cont: 'pagesControl'
                , pages: ${users.pages}
                , skip: true
                , skin: '#2fcba8'
                , curr: ${users.pageNum}
                , prev: '<em><</em>'
                , next: '<em>></em>'
//                , first: 1
//                , last: 100
                , jump: function (obj, first) {
                    // todo:更新跳转的PageSize和PageNo
                    if (!first) {
                        window.location.href = '${rlab}/bg/user/role_manage?keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&rName=' + rName;
                    }
                }
            };

            // 挂载分页组件
            laypage(pagesOption);

        });
    }

    // --------------ajax相关---------------------
    /**
     * 更新共享仪器状态
     */
    function updateShareStatus() {

    }

    function showAll() {
        window.location.href = '${rlab}/bg/user/role_manage';
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

        var url = '${rlab}/bg/user/role_manage?keyword=' + keyword + '&pageNo=1' + '&pageSize=' + pageSize + '&rName=' + rName;
        window.location.href = url;
    }

    function selectAll() {
        for (var i = 0; i < $("input[name=insNumber]").length; i++) {
//            console.log($("input[name=insNumber]").eq(i));
            if ($("input[name=insNumber]").eq(i).prop("disabled") == true){
                continue;
            }
            $("input[name=insNumber]").eq(i).prop("checked", true);
        }
    }

    function disableAll() {
        var data = [];
        var url = '';
        for (var i = 0; i < $("input[name=insNumber]:checked").length; i++) {
            data.push($("input[name=insNumber]:checked").eq(i).data("uid"));
            var id = $("input[name=insNumber]:checked").eq(i).data("uid");
            if (i == 0) {
                url = 'uUid=' + id;
            } else {
                url = url + '&uUid=' + id;
            }
        }
        if (data.length == 0) {
            return;
        }

        $.ajax({
            url: '${rlab}/bg/user/disable_manager?' + url,
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("失败");
            });
    }

    function removeManager($this) {
        $this = $($this);
        var id = $this.data("uid");

        $("#remove").show();
        $("#remove #removeCommit").data("uid", id);
    }

    function remove($this) {
        $this = $($this);
        var id = $this.data("uid");

        $.ajax({
            url: '${rlab}/bg/user/remove_manager?uUid=' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("失败");
            });

    }

    function disableManager($this) {
        $this = $($this);
        var id = $this.data("uid");

        $("#disable").show();
        $("#disable #disableCommit").data("uid", id);
    }

    function disable($this) {
        $this = $($this);
        var id = $this.data("uid");

        $.ajax({
            url: '${rlab}/bg/user/disable_manager?uUid=' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("失败");
            });
    }

</script>
</html>
