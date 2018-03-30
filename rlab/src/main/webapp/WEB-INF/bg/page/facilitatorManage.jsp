<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理系统，服务商管理</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.js"></script>--%>

    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">


    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.min.js"></script>

    <%--<script src="../../common/assets/bootstrap-3.3.7-dist/js/bootstrap.js"></script>--%>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/common/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${rlab}/common/assets/datepicker/css/daterangepicker.css">
    <script src="${rlab}/common/assets/datepicker/js/moment.js"></script>
    <script src="${rlab}/common/assets/datepicker/js/daterangepicker.js"></script>
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <style>

        /* START 控制台功能区开始*/
        .faci_sc {
            float: left;
        }

        /*时间*/
        .tp_panel .panel_time {
            float: left;
            min-width: 214px;
            height: 50px;
            margin-top: 14px;
            margin-right: 24px;
        }

        .tp_panel .panel_time .tm_txt {
            text-align: center;
            line-height: 50px;
            width: 100px;
            float: left;
            color: #7b8da0;
        }

        .tp_panel .panel_time .layui-form-item {

        }

        /*按钮*/
        .tp_panel .panel_btn {
            float: left;
            margin-top: 14px;

        }

        .tp_panel .panel_btn > div {
            height: 50px;
            width: 140px;
            line-height: 50px;
            text-align: center;
            color: #fff;
            float: left;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            cursor: pointer;
        }

        /* END 控制台功能区开始*/

        .lab_date {
            float: left;
        }

        .scInpt {
            font-size: 14px;
            color: #a3b6c9;
        }

        .check:hover {
            color: #49aaff !important;
        }

        .remove:hover {
            color: #ff441f;
        }

        .orgDetail {
            display: none;

        }

        .detailName {
            height: 50px;
            color: #49aaff;
            padding: 10px 20px 20px;
            font-size: 20px;
        }

        .detailContent {
            color: #999999;
            font-size: 16px;
            padding: 20px;
            width: 525px;
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

        .btn:hover {
            color: white !important;
        }
    </style>
</head>
<body>

<div class="wrapper">
    <div class="hd">
        <jsp:include page="../common/header.jsp" flush="true"></jsp:include>
    </div>
    <div class="comn">
        <div class="sd">
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="1"/>
                <jsp:param name="firstMenu" value="6"/>
                <jsp:param name="secondMenu" value="0"/>
            </jsp:include>
        </div>
        <div class="main">

            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                      <a><cite>服务商管理</cite></a>
                </span>
            </div>

            <%--②功能区--%>
            <div class="tp_panel clearfix">
                <%-- START搜索框组件 --%>
                <div class="lab_search_type1 faci_sc" style="margin-top: 20px">
                    <%--<i class="lab-search"></i>--%>
                    <label for="phone" class="lab-search"></label>
                    <input id="phone" type="text" maxlength="20" class="scInpt" placeholder="机构名称/手机号" value="<c:out value="${keyword}" escapeXml="true"/>">
                </div>

                <%-- END搜索框组件 --%>
                <div class="panel_time" style="margin-top: 20px">
                    <div class="tm_txt" style="font-size:14px">请选择时间</div>

                    <%--START 公用时间组件 --%>
                    <div class="lab_date clearfix">
                        <button type="button" class="" id="daterange-btn">
                            <span style="font-size: 14px;color: #a3b6c9">
                            </span>
                            <%--<i class="fa fa-caret-down"></i>--%>
                            <i class="layui-icon date_icon">&#xe637;</i>
                        </button>

                    </div>
                    <%--END 公用时间组件--%>

                </div>

                <div class="panel_btn clearfix" style="margin-top: 20px">
                    <%--按钮组件--%>
                    <button class="lab_btn_base lab_btn_type1" type="button" onclick="gosearch()"><i
                            class="lab-search"></i>检索机构
                    </button>
                    <button class="lab_btn_base lab_btn_type2" type="button" onclick="showAll()"><i
                            class="lab-qr-code-1"></i>显示所有
                    </button>
                    <%--按钮组件--%>
                </div>

            </div>

            <%--③列表区--%>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="10%">
                        <col width="25%">
                        <col width="25%">
                        <col width="10%">
                        <col width="15%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">上传时间 <i
                                class="${order=='DESC'? 'lab-down' : 'lab-top' }"></i></th>
                        <th>用户手机号</th>
                        <th>机构名称</th>
                        <th>文件下载地址</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="info">
                        <tr>
                            <td class="tmp_createtime">${info.createTimeStr}</td>
                            <td class="org_mobile">${info.uMobile}</td>
                            <td class="org_name">${info.orgName}</td>
                            <td class="dld_url">
                                <a onclick="uploadState(this)" style="color: #49aaff" data-details-id="${info.uploadId}"
                                   href="${info.fileUrl}" download="download" target="_blank">${info.fileUrl}</a>
                            </td>
                            <td class="dld_state">${info.state == '0'? '未下载': '已下载'}</td>
                            <td>
                                <a class="check" style="color: #6693c8" onclick="openDetail(this)">查看</a>
                                <a class="remove" onclick="deleteshade(this)" data-details-id="${info.uploadId}">删除</a>
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
                <div id="pagesControl" style="margin: 0 auto; float: right">
                </div>
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
    <%--详情页弹窗内容--%>
    <%--<div id="orgDetail" class="orgDetail">--%>
    <%--<div class="detailName">--%>
    <%--<p>服务商上传管理</p>--%>
    <%--</div>--%>
    <%--<div class="detailContent">--%>
    <%--<p>--%>
    <%--上传时间：--%>
    <%--<span id="details_createTime" style="color: #4c5e70;font-size: 16px"></span>--%>
    <%--</p>--%>
    <%--<br>--%>
    <%--<p>--%>
    <%--用户手机号：--%>
    <%--<span id="details_mobile" style="color: #333333;font-size: 16px"></span>--%>
    <%--</p>--%>
    <%--<br>--%>
    <%--<p class="clearfix">--%>
    <%--<span style="float: left">机构名称：</span>--%>
    <%--<span id="details_orgName" style="color: #333333;font-size: 16px;float: left;width: 373px"></span>--%>
    <%--</p>--%>
    <%--<br>--%>
    <%--<p class="clearfix">--%>
    <%--<span style="float: left">文件下载地址：</span>--%>
    <%--<span style="font-size: 16px;word-wrap:break-word;float: left;width: 320px">--%>
    <%--<a id="details_url" href=""  download target="_blank" style="color:#49aaff"></a>--%>
    <%--</span>--%>
    <%--</p>--%>
    <%--<br>--%>
    <%--<p>--%>
    <%--状态：--%>
    <%--<span id="details_state" style="color: #333333;font-size: 16px"></span>--%>
    <%--</p>--%>
    <%--</div>--%>
    <%--</div>--%>
    <div id="delete" class="shade">
        <div class="tit">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认删除此数据</p>
            <p style="font-size: 16px;color: #909090">删除后不可恢复</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="closethis()">取消</button>
            <button class="layui-btn" onclick="deleteCommit(this)" id="deleteCommit">确认</button>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/common/assets/layui/layui.js"></script>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var pageSize = ${pageSize};
    var keyword = $.trim($(".scInpt").val());
    var startDate = '${requestScope.get("beginTime")}';
    var endDate = '${requestScope.get("endTime")}';
    var order = '${order=="DESC"? "":"&order=asc"}';
    keyword = keyencode(keyword);

    layui.use(['laypage', 'layer', 'form'], function () {
        var laypage = layui.laypage,
            layer = layui.layer,
            form = form = layui.form();

        laypage({
            cont: 'pagesControl'
            , pages: ${pages}
            , skip: true
            , skin: '#2fcba8'
            , curr: ${pageNo}
            , prev: '<em><</em>'
            , next: '<em>></em>'
            , jump: function (obj, first) {
                if (!first) {
                    window.location.href = '${rlab}/bg/uploadTmp/search?keyword=' + keyword + '&pageNo=' + obj.curr + '&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;
                }
                //console.log(obj);
                //console.log(first);
            }
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            window.location.href = '${rlab}/bg/uploadTmp/search?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;
        });



    });

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
//            alert(start.format('YYYY-MM-DD') + " " + end.format('YYYY-MM-DD'));
//            console.log(startDate);
//            console.log(endDate);
        }
    );
    $('#daterange-btn span').html('${requestScope.get("beginTime")}' + ' - ' + '${requestScope.get("endTime")}');

    function deleteshade($this) {
        $this = $($this);
        var id = $this.data("detailsId");
        $("#delete").show();
        $("#delete #deleteCommit").data("detailsId", id);
    }

    function closethis() {
        $(".shade").hide();
    }

    function deleteCommit($this) {
        $this = $($this);
        var id = $this.data('detailsId');
        $.ajax({
            url: '${rlab}/bg/uploadTmp/modify',
            type: 'PUT',
            dataType: "json",
            data: JSON.stringify({
                "uploadId": id,
                "state": "2"
            }),
            contentType: "application/json"
        })
            .done(function (data) {
                if (data.code == 0) {
                    window.location.reload(true);
                } else {
                    alert(data.description);
                }
                <%--//$(this).text("${state==1 ? "关闭" : "开启"}");--%>
            })
            .fail(function (data) {
                alert("失败");
            });
    }


    function uploadState($this) {

        $this = $($this);
        var sateTag = $this.parent().next("td.dld_state");
        var sate_txt = $.trim(sateTag.text());
        if (sate_txt == "已下载") {
            return;
        }

        var uploadId = $this.data('detailsId');
        $.ajax({
            url: '${rlab}/bg/uploadTmp/modify',
            type: 'PUT',
            dataType: "json",
            data: JSON.stringify({
                "uploadId": uploadId,
                "state": "1"
            }),
            contentType: "application/json",
            success: function (data) {
                if (data.code === 0) {
                    sateTag.text('已下载');
                }
            }
        })
    }

    function uploadDetailState($this, detailId, cb) {
        $this = $($this);
        console.log(detailId)
        var sateTag = $this.parent().parent().find("p span#details_state");
        var sate_txt = $.trim(sateTag.text());
        if (sate_txt == "已下载") {
            return;
        }

        $.ajax({
            url: '${rlab}/bg/uploadTmp/modify',
            type: 'PUT',
            dataType: "json",
            data: JSON.stringify({
                "uploadId": detailId,
                "state": "1"
            }),
            contentType: "application/json",
            success: function (data) {
                if (data.code === 0) {
                    sateTag.text('已下载');
                    if (typeof cb == 'function') {
                        cb();
                    }
                }
            }
        })
    }

    function showAll() {
        window.location.href = '${rlab}/bg/uploadTmp/search';
    }

    function listSort($this) {
        $this = $($this);
        if ($this.data("sort") == "DESC") {
            order = "&order=asc";
        } else {
            order = "";
        }
        var url = '${rlab}/bg/uploadTmp/search?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;
        window.location.href = url;
    }

    function openDetail($this) {
        $this = $($this);
        var ob_tmp = $this.parent().parent()

        var html =
            '<div id="orgDetail" class="orgDetail" style="display: block;">\
                    <div class="detailName">\
                    <p>服务商上传管理</p>\
                    </div>\
                    <div class="detailContent">\
                    <p>\
                    上传时间：\
            <span id="details_createTime" style="color: #4c5e70;font-size: 16px">' + ob_tmp.find(".tmp_createtime").html() + '</span>\
            </p>\
            <br>\
            <p>\
            用户手机号：\
    <span id="details_mobile" style="color: #333333;font-size: 16px">' + +'</span>\
            </p>\
            <br>\
            <p class="clearfix">\
            <span style="float: left">机构名称：</span>\
        <span id="details_orgName" style="color: #333333;font-size: 16px;float: left;width: 373px">' + ob_tmp.find(".org_name").html() + '</span>\
            </p>\
            <br>\
            <p class="clearfix">\
            <span style="float: left">文件下载地址：</span>\
        <span style="font-size: 16px;word-wrap:break-word;float: left;width: 320px">\
            <a id="details_url" href="' + ob_tmp.find(".dld_url a").html() + '"  download target="_blank" style="color:#49aaff">' + ob_tmp.find(".dld_url a").html() + '</a>\
            </span>\
            </p>\
            <br>\
            <p>\
            状态：\
    <span id="details_state" style="color: #333333;font-size: 16px">' + ob_tmp.find(".dld_state").html() + '</span>\
            </p>\
            </div>\
            </div>';

//        $("#details_createTime").text(ob_tmp.find(".tmp_createtime").html());
//        $("#details_mobile").text(ob_tmp.find(".org_mobile").html());
//        $("#details_orgName").text(ob_tmp.find(".org_name").html());
//        $("#details_url").text(ob_tmp.find(".dld_url a").html());
//        $("#details_url").attr('href', ob_tmp.find(".dld_url a").html());
//        $("#details_state").text(ob_tmp.find(".dld_state").html());

//        $str = $("#orgDetail").html();//加载弹窗内容

        layer.open({
            type: 1,                //弹窗类型
            title: false,     //显示标题
            closeBtn: 1,         //是否显示关闭按钮
            shadeClose: true, //显示模态窗口
            skin: false, //加上边框
            area: ['600px', '400px'], //宽高
            content: html  //弹窗内容
        });

        $("#details_url").off("click").on("click", function () {

            if ($("#details_state").html() === '未下载') {

                uploadDetailState(this, ob_tmp.find(".dld_url a").data("detailsId"), function () {
                    $("#details_state").html("已下载");
                    ob_tmp.find(".dld_state").html("已下载");
                });


            }

        })

    }


    function gosearch() {
        keyword = $.trim($("#phone").val());
        /*keyword = encodeURI(keyword);

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
         keyword = keyword.replace(/'/g, "%27");*/
        keyword = keyencode(keyword)


        var url = '${rlab}/bg/uploadTmp/search?keyword=' + keyword + '&pageNo=1&pageSize=' + pageSize + '&beginTime=' + startDate + '&endTime=' + endDate + order;
//        console.log(url);
        window.location.href = url;
    }
</script>
</html>


