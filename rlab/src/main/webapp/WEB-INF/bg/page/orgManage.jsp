<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2017/7/21 0021
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人人实验，管理后台</title>
    <%--静态导入配置文件--%>
    <%@include file="../../config/taglibs.jsp"%>

    <link rel="stylesheet" href="../../common/assets/layui/css/layui.css">

    <%--开发环境--%>
    <script src="../../common/assets/jquery-1.12.4/jquery.js"></script>

    <script src="../../common/assets/layui/layui.js"></script>

    <script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.js"></script>

    <link rel="stylesheet" href="../../common/icomoon/style.css">
    <link rel="stylesheet" href="../css/base.css">
    <link rel="stylesheet" href="http://at.alicdn.com/t/font_ac6brlolam26gvi.css">
    <%--开发环境--%>

    <%--生产环境--%>
    <%--<script src="../../common/assets/jquery-1.12.4/jquery.min.js"></script>--%>
    <%--<script src="../../common/assets/jQuery-slimScroll/jquery.slimscroll.min.js"></script>--%>
    <%--部署环境--%>
<style>
    .btn{
        height: 50px;float: right;
    }
    .searchs{
        width: 360px;
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
        margin-bottom: 25px;
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
    .btn{font-size: 16px;float: left;margin: 0 15px;}
</style>
</head>
<body>
<div class="wrapper">
    <div class="hd">
        <%@include file="../common/header.jsp" %>
        <%--<jsp:include page="../common/header.jsp" flush="true"></jsp:include>--%>
    </div>
    <div class="comn">
        <div class="sd" >
            <%--参数注解：1.firstMenu 一级目录 2.secondMenu 二级目录--%>
            <jsp:include page="../common/sideBar.jsp" flush="true">
                <jsp:param name="levelNum" value="2" />
                <jsp:param name="firstMenu" value="4" />
                <jsp:param name="secondMenu" value="1" />
            </jsp:include>
        </div>
        <div class="main" style="overflow-y: auto">
            <div class="hdNav">
                <span class="layui-breadcrumb">
                    <a>机构管理</a>
                </span>
            </div>
            <div class="clearfix">
                <div class="searchs">
                    <div class="lab-search searchLab"></div>
                    <input type="text" class="seachInp" placeholder="机构名称/联系人/电话号码"
                           value="<c:out value="${keyword}" escapeXml="true"/>" maxlength="20">
                </div>
                <div class="listNature orgnat">
                    <form class="layui-form" style="height: 50px;width: 170px; float: left">
                        <select name="city" lay-verify="" lay-filter="orgtype">
                            <option value="0" ${oci == 0 ? "selected" : ""}>全部</option>
                            <option value="1" ${oci == 1 ? "selected" : ""}>科研院所</option>
                            <option value="2" ${oci == 2 ? "selected" : ""}>高等院校</option>
                            <option value="3" ${oci == 3 ? "selected" : ""}>国有企业</option>
                            <option value="4" ${oci == 4 ? "selected" : ""}>民营企业</option>
                            <option value="5" ${oci == 5 ? "selected" : ""}>第三方检测</option>
                            <option value="99" ${oci == 99 ? "selected" : ""}>其他</option>
                        </select>
                    </form>
                </div>
                <div class="listNature orgnat">
                    <form class="layui-form" style="height: 50px;width: 170px; float: left">
                        <select name="city" lay-verify="" lay-filter="keytype">
                            <%--<option value="99" ${wordType == 99 ? "selected" : ""}>查询所有</option>--%>
                            <option value="1" ${wordType == 1 ? "selected" : ""}>搜索机构名称</option>
                            <option value="2" ${wordType == 2 ? "selected" : ""}>搜索联系人</option>
                            <option value="3" ${wordType == 3 ? "selected" : ""}>搜索电话号码</option>
                        </select>
                    </form>
                </div>
                <button class="layui-btn btn" style="background: #49aaff" onclick="gosearch()"><div class="lab-search"></div>检索机构</button>
                <button class="layui-btn btn" style="background: #16b8be" onclick="allorg()"><div class="iconfont icon-caidan1"></div>显示所有</button>

            </div>
            <div class="table">
                <table class="layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="10%">
                        <col width="9%">
                        <col width="10%">
                        <col width="9%">
                        <col width="9%">
                        <col width="15%">
                        <col width="13%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>机构名称</th>
                        <th>机构性质</th>
                        <th>认证状态</th>
                        <th>组织机构代码</th>
                        <th>共享指数</th>
                        <th>持有仪器</th>
                        <th style="cursor: pointer" onclick="listSort(this)" data-sort="${order}" class="sorts">创建时间<i class="${order==null? 'lab-down' : 'lab-top' }"></i></th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${orgBaseInfoList}" var="orgBaseInfo">
                        <tr>
                            <td>${orgBaseInfo.orgName}</td>
                            <td>${orgBaseInfo.orgCategory}</td>
                            <td>${orgBaseInfo.orgIdentification == 0 ? '企业': orgBaseInfo.orgIdentification == 1 ? '服务商': '认证服务商'}</td>
                            <td>${orgBaseInfo.orgCode}</td>
                            <td>${orgBaseInfo.orgShareIndexStr}</td>
                            <td>${orgBaseInfo.insCount}</td>
                            <td>${orgBaseInfo.createTimeStr}</td>
                            <td>
                                <%--查看权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(0,1))}">
                                    <a class="check" style="color: #6693c8;" href="${rlab}/bg/org/search/detail/look?oid=${orgBaseInfo.orgOid}">查看详情</a>
                                </c:if>
                                <%--修改权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(1,2))}">
                                    <a class="forbidden" href="${rlab}/bg/org/search/detail?operator=modify&oid=${orgBaseInfo.orgOid}">修改</a>
                                </c:if>
                                <%--撤销权限--%>
                                <c:if test="${'1'.equals(sessionScope.u_permission.substring(3,4))}">
                                    <a class="remove" onclick="closeOrg(this)" data-org-id="${orgBaseInfo.orgOid}" data-org-state="${orgBaseInfo.orgState}">${orgBaseInfo.orgState == 0? '关闭': '开启'}</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="pages clearfix" style="display: ${total > 10 ? 'block' : 'none'}">
                <div class="textinfo">
                    <p>显示第${(pageNo - 1) * pageSize+1}-${pageNo * pageSize}条/共${total}条</p>
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
    <%--弹窗--%>
    <div class="shade" id="close">
        <div class="tit" style="height: 275px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认关闭此机构</p>
            <p style="font-size: 16px;color: #909090">关闭机构后，该机构用户不可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="closee()">确认</button>
        </div>
    </div>

    <%--弹窗--%>
    <div class="shade" id="open">
        <div class="tit" style="height: 275px;">
            <span class="iconfont icon-xiaoxilingdang"></span>
            <p>你是否确认重新开启此机构</p>
            <p style="font-size: 16px;color: #909090">开启机构后，该机构用户可看到</p>
            <p style="font-size: 16px;color: #fa3a43">请慎重操作</p>
            <button class="layui-btn" style="background: white;color: #707070" onclick="hide()">取消</button>
            <button class="layui-btn" onclick="openn()">确认</button>
        </div>
    </div>
</div>
</body>
<script src="../js/main.js"></script>
<script>
    var order='${order==null? "":"&order=1"}';
    function allorg() {
        window.location.href='${rlab}/bg/org/search?pageNo=1&pageSize=10';
    }

    function hide() {
        $("#open").hide();
        $("#close").hide();
    }

    function listSort($this) {
        $this = $($this);

        if (!$this.data("sort")){
            order="&order=1";
        }else {
            order="";
        }

        window.location.href ='${rlab}/bg/org/search?keyword=' + keyword + '&oci=' + orgtypeValue + '&pageNo=1&pageSize=' + pageSize+order+'&wordType='+keytype;
    }

    function closee() {

        var oid = $("#close").data("orgId");
        $.ajax({
            url: '${rlab}/bg/org/close?oid=' + oid + '&os=' + 1,
            type: 'PUT',
            dataType: "json",
            contentType: "application/json"
        })
        .done(function (data) {
            window.location.reload(true);
        })
        .fail(function (data) {
            alert("修改失败");
        });
    }

    function openn() {
        var oid = $("#open").data("orgId");
        $.ajax({
            url: '${rlab}/bg/org/close?oid=' + oid + '&os=' + 0,
            type: 'PUT',
            dataType: "json",
            contentType: "application/json"
        })
            .done(function (data) {
                window.location.reload(true);
            })
            .fail(function (data) {
                alert("修改失败");
            });
    }

    function closeOrg($this) {
//        console.log('-----');
        $this = $($this);
        var state = $this.data("orgState");
        var id = $this.data("orgId");
        if (state == 0){
            $("#close").show();
            $("#close").data("orgId", id);
        }else {
            $("#open").show();
            $("#open").data("orgId", id);
        }
    }

    var orgtypeValue = ${oci};
    var keytype = ${wordType};
    var pageSize = ${pageSize};
    var keyword = $.trim($(".seachInp").val());
    keyword=keyencode(keyword);
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form();

        form.on('select(orgtype)', function (data) {
            orgtypeValue = data.value;
        });

        form.on('select(keytype)', function (data) {
            keytype = data.value;
            console.log(keytype);
        });

        form.on('select(pageSize)', function (data) {
            pageSize = data.value;
            gosearch();
        });

    });

    layui.use(['laypage', 'layer'], function() {
        var laypage = layui.laypage
            , layer = layui.layer;
        laypage({
            cont: 'pagesControl'
            , pages: ${pages}
            ,skip: true
            ,skin: '#2fcba8'
            , curr: ${pageNo}
            ,prev: '<em><</em>'
            ,next: '<em>></em>'
            , first: 1
            , last: ${pages}
            ,jump: function(obj, first){
                if(!first){
                    window.location.href = '${rlab}/bg/org/search?keyword=' + keyword +'&oci=' + orgtypeValue + '&pageNo=' + obj.curr + '&pageSize=' + pageSize+order+'&wordType='+keytype;
                }
            }
        });
    });

    function gosearch() {

//        var orgnat=$(".orgnat input").val();
//        console.log(search+state+source)
        /*var url = '';
         window.location.href= url;*/
        keyword = $.trim($(".seachInp").val());
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
//        console.log(keyword);


        var url = '${rlab}/bg/org/search?keyword=' + keyword + '&oci=' + orgtypeValue + '&pageNo=1&pageSize=' + pageSize+order+'&wordType='+keytype;
//        console.log(url);
        window.location.href = url;
    }


</script>
</html>
