<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp" %>


    <link rel="stylesheet" href="${rlab}/common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="${rlab}/common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="${rlab}/common/assets/layui/layui.js"></script>


    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css">
    <link rel="stylesheet" href="${rlab}/bg/css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_hlsvbarxhuk81tt9.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
    <style>
        .guide_tip {
            background-color: #e3e9f0;
            font-size: 14px;
            color: #a3b6c9;
            height: 26px;
            line-height: 26px;
            padding-left: 10px;
            border-bottom-left-radius: 6px;
            border-bottom-right-radius: 6px;
        }

        /*START 基本信息组件*/
        .lab_info_base {
            width: 100%;
            min-height: 50px;
            padding-left: 120px;
            position: relative;
        }

        .lab_info_base > .lft {
            width: 120px;
            height: 50px;
            position: absolute;
            left: 0;
            top: 0;
            line-height: 50px;
            font-size: 18px;
            color: #7b8da0;
        }

        .lab_info_base > .rt {
            width: 100%;
            min-height: 50px;

        }

        .lab_info_base > .rt > span {
            padding: 10px;
            display: block;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            background-color: #fff;

        }

        .lab_info_base > .rt > a {
            padding: 16px 0;
            display: block;
            color: #16b8be;
            font-size: 16px;
        }

        .lab_info_base > .rt > a:link {
            text-decoration: underline;
        }

        .lab_info_base .lab_search_type1 {
            width: 100%;
        }

        .lab_info_base .lab_search_type1 input {
            width: 250px;
        }

        /*END 基本信息组件*/

        .check_branch {
        }

        .check_branch a {
            display: inline-block;
            height: 30px;
            line-height: 30px;
            background: #fff;
            color: #000;
            padding: 0 15px;
            float: left;
        }

        .check_branch a.cur {
            color: #fff;
            background: #9ea0a2;
        }

        .batch_upload {
            position: relative;

        }

        .batch_upload .layui-upload-button {
            height: 240px;
            width: 494px;
            border: 0 none;

        }

        .batch_upload .layui-upload-icon {
            display: none;
        }

        .batch_upload .load_icon {
            width: 100%;
            text-align: center;
            position: absolute;
            left: 0;
            top: 53px;
        }

        .batch_upload .load_icon i {
            font-size: 60px;
            color: #49aaff;
        }

        .batch_upload .load_icon {

        }

        .upload_main {
            width: 494px;
            margin-left: 120px;
        }

        .batch_result {
            margin-top: 15px;
            margin-bottom: 35px;
        }

        .batch_result .file_info {

        }

        .file_info .file_name {
            font-size: 12px;
            color: #4c5e70;
        }

        .file_info .file_name i {
            color: #16b8be;
        }

        .file_info .cancel_upload {
            margin-left: 5px;
            cursor: pointer;
        }

        .file_info .cancel_upload:active i {
            color: #0e676a;
            font-weight: 700;
        }

        .file_info .cancel_upload i {
            font-size: 18px;
        }

        .batch_result .file_rate {
            margin-top: 10px;
        }

        .load_btn {

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
                <jsp:param name="secondMenu" value="3"/>
            </jsp:include>
        </div>

        <div class="main" style="overflow-y: auto">
            <%--①头部面包屑--%>
            <div class="tp_guide">
                  <span class="layui-breadcrumb">
                  <a href="">仪器管理</a>
                  <a href="">共享信息管理</a>
                  <a href="${rlab}/bg/instrument/upload/history?pageNo=1&pageSize=10">历史记录</a>
                </span>
            </div>
            <%-- 头部tip --%>
            <%--tab切换--%>
            <div class="check_branch clearfix">
                <a href="${rlab}/bg/instrument/upload/uploadInstruments">批量上传</a>
                <a class="cur" href="${rlab}/bg/instrument/upload/history?pageNo=1&pageSize=10">历史记录</a>
            </div>
            <%--tab切换--%>

            <%--历史列表--%>
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
                        <th>上传时间</th>
                        <th>上传者账号</th>
                        <th>上传者昵称</th>
                        <th>机构名称</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${history != null && fn:length(history)>0}">
                        <c:forEach items="${history}" var="hist">
                            <tr>
                                <td>
                                    <fmt:formatDate value="${hist.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                                </td>
                                <td>${hist.uMobile}</td>
                                <td>${hist.uNickName}</td>
                                <td>${hist.orgName}</td>
                            </tr>
                        </c:forEach>
                    </c:if>


                    <%--</tr><tr>--%>
                    <%--<td>--%>
                    <%--2017-07-03 16:23:22--%>
                    <%--</td>--%>
                    <%--<td>189454556454</td>--%>
                    <%--<td>细胞生物学</td>--%>
                    <%--<td>美国发的是开发及的快速减肥的公司</td>--%>

                    </tbody>
                </table>
            </div>
            <%--历史列表--%>
            <%--分页 --%>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>显示第${(pageNo-1)*pageSize+1}-${(pageNo-1)*pageSize+fn:length(history)}条/共${total}条</p>
                </div>
                <div id="pagesControl" style="margin: 0 auto; float: right">
                </div>
                <div class="pageSize">
                    <form class="layui-form" style="height: 20px;width: 68px;">
                        <select name="pageSize" lay-verify="" lay-filter="pageSize">
                            <option value="10" ${pageSize !=null && pageSize== 10?'selected':''}>10页/条</option>
                            <option value="25" ${pageSize !=null && pageSize== 25?'selected':''}>25页/条</option>
                            <option value="50" ${pageSize !=null && pageSize== 50?'selected':''}>50页/条</option>
                            <option value="100" ${pageSize !=null && pageSize== 100?'selected':''}>100页/条</option>
                        </select>
                    </form>
                </div>
            </div>
            <%--分页--%>
        </div>
    </div>
</div>
</body>
<script src="${rlab}/bg/js/main.js"></script>
<script>
    var PAGE_SIZE = ${pageSize};// 页面条数显示
    var PAGE_NO = 1;// 页码显示
    var TOTAL = ${total};
    var form, laypage;

    layui.use(['form', 'laypage'], function () {
        laypage = layui.laypage;
        form = layui.form();
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
                PAGE_NO = obj.curr;
                if (!first) {
                    toLoadHistoryPage();
                }
            }
        }

        form.on('select(pageSize)', function (data) {
            PAGE_SIZE = data.value;// 更新参数
            PAGE_NO = 1;// 更新参数
            toLoadHistoryPage();
        });

        if (PAGE_SIZE < TOTAL) {
            // 挂载分页
            laypage(pagesOption);
        }


    });

    function toLoadHistoryPage() {
        <%--${rlab}/bg/instrument/upload/history--%>
        location.href = BASE_URL + '/bg/instrument/upload/history?pageSize=' + PAGE_SIZE + '&pageNo=' + PAGE_NO;
    }

    //    layui.upload({
    //        url: ''
    //        ,before: function(input){
    //            //返回的参数item，即为当前的input DOM对象
    //            console.log('文件上传中');
    //        }
    //        ,success: function(res){
    //            console.log('上传完毕');
    //        }
    //    });
</script>
</html>
