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
    <%--<script src="${rlab}/front/assets/md5/jquery.md5.js"></script>--%>
    <script src="${rlab}/front/js/view/jq.form.js"></script>


    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/front/css/user_center.css?v_=20170622">
    <link rel="stylesheet" href="${rlab}/front/css/form_common.css?v_=20170622">

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


    <script src="${rlab}/front/js/view/jq.form.js"></script>
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
            width: 113px;
            overflow:hidden;
            text-overflow:ellipsis;
            -o-text-overflow:ellipsis;
            white-space:nowrap;
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
        }
        /*END 内容部分公用样式*/

    </style>
    <link rel="stylesheet" href="${rlab}/front/css/rrcxj_style.css?v_=20170622">
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
            <jsp:param name="levelNum" value="2"/>
            <jsp:param name="firstMenu" value="3"/>
            <jsp:param name="secondMenu" value="1"/>
        </jsp:include>
        <div class="user_main">
            <div class="rrcxj_notJuan">

                <%--首次进入--%>
                <div class="first" style="display: ${flag eq 3?'block':'none'}">
                    <img src="${rlab}/front/imgs/icon/qr_code_wx_renrenlab_300_300.jpg" alt="" class="rrcxj_notImg" style="height: 169px">
                    <p class="rrcxj_notTit">2018年创新券正在路上，快去报名吧！<br></p>
                    <p class="rrcxj_notTit" style="font-weight: bold;">关注人人实验公众号，报名申领2018年人人创新券，详情请咨询010-81708556</p>
                    <%--<img src="${rlab}/front/imgs/rrcxj/not-img.png" alt="" class="rrcxj_notImg">--%>
                    <%--<p class="rrcxj_notTit">哎呦，您还没有领创新券，快去领取吧！</p>--%>
                    <%--<a href="${rlab}/coupon/toApplyCertify?source=${source}&operate=apply" class="goapply">申请认证</a>--%>
                </div>
                <%--首次进入--%>

                <%--审核中--%>
                <div class="in" style="display: ${flag eq 0?'block':'none'}">
                    <img src="${rlab}/front/imgs/rrcxj/audit.png" alt="" class="rrcxj_notImg" style="width: 99.5px;height: 74.5px;margin-top: 158px;">
                    <p class="rrcxj_Tit">
                        工作人员将在24h内审核完成</br>请耐心等待工作人员审核认证材料
                    </p>
                </div>
                <%--审核中--%>

                <%--审核失败--%>
                <div class="defeated" style="display: ${flag eq 2?'block':'none'}">
                    <img src="${rlab}/front/imgs/rrcxj/not-img.png" alt="" class="rrcxj_notImg">
                    <p class="redtext" style="margin-top: 20px">拒绝理由：${reason}</p>
                    <p class="rrcxj_Tit">
                        您有任何疑问可联系客服人员</br>或提交材料重新认证
                    </p>
                    <a href="${rlab}/coupon/toApplyCertify?source=0&operate=modify" class="goapply">重新认证</a>
                </div>
                <%--审核失败--%>

                <%--审核成功--%>
                <div class="win" style="display: ${flag eq 1?'block':'none'}">
                    <p class="winimg" style="margin-top: 135px"><label class="lab-stick"></label><span>已通过认证资格</span></p>
                    <p style="font-size: 16px; color: #767676; text-align: center; margin-top: 20px">提交项目申请即可获得创新券</p>
                    <a href="${rlab}/coupon/toProject/${cerId}" class="goapply" style=" margin-top: 20px">申请创新券</a>
                </div>
                <%--审核成功--%>

                <%--流程--%>
                <c:choose>
                    <c:when test="${proList == null || proList.size() == 0}">
                        <div class="flow">
                            <p class="flow_tit">如何领用创新券？</p>
                            <div class="flowMain clearfix">
                                <div>
                                    <img src="${rlab}/front/imgs/rrcxj/qualification.png" alt="">
                                    <p class="flow_text" style="margin-top: 20px">用户发起申请</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                                    <p class="flow_text">提交认证材料</p>
                                    <p class="flow_text2">（基本信息表、营业执照、近两年财务报表等）</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                                    <p class="flow_text">平台审核</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                                    <p class="flow_text">审核通过，获得资格</p>
                                </div>
                                <div>
                                    <img src="${rlab}/front/imgs/rrcxj/apply.png" alt="">
                                    <p class="flow_text" style="margin-top: 20px">用户发起申请</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                                    <p class="flow_text">提交项目申请表</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                                    <p class="flow_text">平台审核</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm" style="margin: 3px 0">
                                    <p class="flow_text">审核通过，该次交易享受补贴</p>
                                </div>
                                <div>
                                    <img src="${rlab}/front/imgs/rrcxj/conversion.png" alt="">
                                    <p class="flow_text" style="margin-top: 20px">用户提交材料</p>
                                    <p class="flow_text2" style="margin-bottom: 12px">（交易合同、发票、项目成果证明及其他证明材料）</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                                    <p class="flow_text" style="line-height: 38px">平台审核</p>
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjdown.png" alt="" class="dowm">
                                    <p class="flow_text" style="margin-top: 6px">审核通过，兑现补贴</p>
                                    <p class="flow_text2">（补贴款项汇入账号或直接交易中减免）</p>
                                </div>
                                <div class="goright">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                </div>
                                <div class="goright" style="left: 491px">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                    <img src="${rlab}/front/imgs/rrcxj/rrcxjright1.png" alt="">
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="winlist">
                            <p style="margin-top: 100px; color: #333; font-size: 14px;padding-left: 50px"><span style="color: #508df0; font-size: 20px">创新券项目申请记录</span>&nbsp;&nbsp;已通过审核的项目，请尽快上传改项目的合同、发票及成果证明材料至平台进行备案</p>
                            <div style="margin-top: 23px; height: 60px; line-height: 60px; background-color: #f9fbfc">
                                <p style="margin-left: 100px; font-size: 16px; color: #999; float: left">申请时间</p>
                                <p style="margin-left: 230px; font-size: 16px; color: #999; float: left">申请项目</p>
                                <p style="margin-left: 190px; font-size: 16px; color: #999; float: left">申请状态</p>
                            </div>
                            <div  class="list">
                                <c:forEach items="${proList}" var="proList">
                                <div class="clearfix listli">
                                    <p class="times"><fmt:formatDate value="${proList.modifyTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                                    <p class="projectName">${proList.orgProName}</p>
                                    <c:if test="${proList.orgProState eq 0}">
                                        <p class="result"  style="color: #ffa524">
                                        <label class="lab-search"></label>
                                        <span>
                                        项目审核中
                                    </c:if>
                                    <c:if test="${proList.orgProState eq 1}">
                                        <p class="result"  >
                                        <label class="lab-search"></label>
                                        <span>
                                        审核通过
                                    </c:if>
                                    <c:if test="${proList.orgProState eq 2}">
                                        <p class="result notgo"  >
                                        <label class="lab-search"></label>
                                        <span>
                                        审核失败
                                    </c:if>
                                    <c:if test="${proList.orgProState eq 3}">
                                        <p class="result win"  >
                                        <label class="lab-search"></label>
                                        <span>
                                        备案完成<br>款项发放中
                                    </c:if>
                                    <c:if test="${proList.orgProState eq 4}">
                                        <p class="result"  style="color: #666666;">
                                        <label class="lab-search"></label>
                                        <span>
                                        项目已完成
                                    </c:if>
                                        </span>
                                    </p>
                                    <c:if test="${proList.orgProState eq 1}">
                                        <p class="resultBtn">
                                            <c:choose>
                                                <c:when test="${empty proList.orgProContract || proList.orgProContract eq null}">
                                                    <button class="button" onclick="examine(this)" data-pro-id="${proList.orgProId}"><label class="lab-search"></label>上传材料</button>
                                                </c:when>
                                                <c:otherwise>
                                                    <button class="button" onclick="examine(this)" data-pro-id="${proList.orgProId}"><label class="lab-search"></label>重新上传</button>
                                                </c:otherwise>
                                            </c:choose>
                                        </p>
                                    </c:if>
                                    <c:if test="${proList.orgProState eq 2}">
                                        <p class="resultBtn">
                                            <button class="button" onclick="cause(this)" data-show-causes="${proList.orgProRemark}"><label class="lab-search"></label>查看原因</button>
                                        </p>
                                    </c:if>
                                    <c:if test="${proList.orgProState ne 2}">
                                    <div class="pop" >
                                        <p class="popTit">详细进度</p>
                                        <div class="popflowdiv clearfix">
                                            <p class="popflow ${proList.orgProState ge 0?'selects':''}">
                                                <span class="num">1</span>
                                                <span>项目审核中</span>
                                                <span class="imIne"></span>
                                            </p>
                                            <p class="popflow ${proList.orgProState ge 1?'selects':''}">
                                                <span class="num">2</span>
                                                <span>审核通过</span>
                                                <span class="imIne"></span>
                                            </p>
                                            <p class="popflow ${proList.orgProState ge 3?'selects':''}">
                                                <span class="num">3</span>
                                                <span>备案完成,款项发放中</span>
                                                <span class="imIne"></span>
                                            </p>
                                            <p class="popflow ${proList.orgProState ge 4?'selects':''}">
                                                <span class="num">4</span>
                                                <span>项目已完成</span>
                                            </p>
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                                </c:forEach>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
                <div class="shade">
                    <div class="uploading">
                        <p class="shadetit">上传备案材料</p>
                        <p class="tt"><span class="titname">项目名称 <b>*</b> ：</span><span class="titnames" style="margin-left: 30px;">asdasdasdasdasdasd</span></p>
                        <form  id="contract" method="post" enctype="multipart/form-data">
                            <p class="put clearfix">
                                <span class="titname">项目合同 <b>*</b> ：</span>
                                <label class="filebut" for="contracts"><i class="lab-search"></i>上传文件</label>
                                <input type="file" id="contracts" name="file">
                            </p>
                        </form>
                        <p style="margin: 10px 0 0 127px;font-size: 12px;color: #999999;line-height: 16px"  class="tt">支持文件格式：PDF（单个文件限制在10M以内）</p>
                        <div class="contract">
                            <div class="course" data-file-url="">
                                <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closebar(this)"></label></p>
                                <div class="probar">
                                    <p class="probarbul"></p>
                                </div>
                            </div>
                        </div>
                        <form  id="invoice" method="post" enctype="multipart/form-data">
                            <p class="put clearfix">
                                <span class="titname">财务资料<b>*</b> ：</span>
                                <label class="filebut" for="invoices" ><i class="lab-search"></i>上传文件</label>
                                <input type="file" id="invoices" name="file">
                            </p>
                        </form>
                        <p style="margin: 10px 0 0 127px;font-size: 12px;color: #999999;line-height: 16px"  class="tt">包括发票、银行回单、记账凭证（银行付款+费用成本类）<br><br>支持文件格式：PDF（单个文件限制在10M以内）</p>
                        <div class="invoice">
                            <div class="course" data-file-url="">
                                <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closebar(this)"></label></p>
                                <div class="probar">
                                    <p class="probarbul"></p>
                                </div>
                            </div>
                        </div>
                        <form  id="achievement" method="post" enctype="multipart/form-data">
                            <p class="put clearfix">
                                <span class="titname">成果证明材料 <b>*</b> ：</span>
                                <label class="filebut" for="achievements" style="margin-left: 0"><i class="lab-search"></i>上传文件</label>
                                <input type="file" id="achievements" name="file">
                            </p>
                        </form>
                        <p style="margin: 10px 0 0 127px;font-size: 12px;color: #999999;line-height: 16px" class="tt">支持文件格式：PDF（单个文件限制在10M以内）</p>
                        <div class="achievement">
                            <div class="course" data-file-url="">
                                <p><label class="lab-adress icon"></label><span>asdasd.pdf</span><label class="lab-close-1 close" onclick="closebar(this)"></label></p>
                                <div class="probar">
                                    <p class="probarbul"></p>
                                </div>
                            </div>
                        </div>
                        <p style="text-align: center"><a class="closeshade" onclick="closeshade()">取消</a><a class="sub" onclick="uploading(this)">提交</a></p>
                    </div>
                </div>
                <div class="shade2">
                    <div class="cause">
                        <p class="causetext">您可以发起其他项目申请</p>
                        <p class="causetit">审核不通过</p>
                        <p class="causemain" style="width: 430px;margin: auto;line-height: 20px;">不通过原因：<span class="causes">项目不符合创新券补贴条件</span></p>
                        <p class="closecause"><a onclick="closecause()">我知道了</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
<!--my common js-->
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">

    //检查文件后缀
    function verifyFileSuffx(format, fileName) {
        var index = fileName.lastIndexOf("."),
            suffix = fileName.slice(index + 1),
            formatArr = format.split("|"),
            flag = false;

        for (var i = 0; i < formatArr.length; i++) {
            if (formatArr[i] === suffix) {
                flag = true;
                break;
            }
        }

        return flag;
    }
    function closecause() {
        $(".shade2").hide();
    }
    function cause($this) {
        $this=$($this);
        $(".shade2").show();
        $(".shade2 .causes").html($this.data("showCauses"));
    }
    $(".result").hover(function () {
        $(this).parent().find(".pop").show();
    },function () {
        $(this).parent().find(".pop").hide();
    })
    function examine($this) {
        $this=$($this);
        var orgProId=$this.data("proId");
        $(".shade .sub").data("proId",orgProId);
        $(".shade").show();
        $(".shade .titnames").html($this.parent().parent().find(".projectName").html());
    }
    function closeshade() {
        $(".shade").hide();
    }
    var LOGIN_AJAX_FLAG = true;
    function uploading($this) {
        if(!LOGIN_AJAX_FLAG){
            layer.msg('不要频繁点击');
            return false;
        }
        $this=$($this);
        var orgProId=$this.data("proId");
        var orgProContract=$(".contract .course").data("fileUrl");
        var orgProInvoice=$(".invoice .course").data("fileUrl");
        var orgProAchievement=$(".achievement .course").data("fileUrl");
        if(!orgProContract){
            layer.msg("请上传项目合同");
            return;
        }
        if(!orgProInvoice){
            layer.msg("请上传项目发票");
            return;
        }
        if(!orgProAchievement){
            layer.msg("请上传成果证明材料");
            return;
        }
        var data={
            "orgProContract":orgProContract,
            "orgProInvoice":orgProInvoice,
            "orgProAchievement":orgProAchievement,
            "orgProId":orgProId
        }
        console.log(data);
        $.ajax({
            url: '${rlab}/coupon/applyProject?operate=modify',
            type: 'POST',
            data: JSON.stringify(data),
            dataType: "json",
            contentType: "application/json",
            beforeSend:function () {
                LOGIN_AJAX_FLAG = false;
            },
            complete:function () {
                LOGIN_AJAX_FLAG = true;
            }
        }).done(function (data) {
            if(data.code==200){
                layer.msg("提交成功");
                setTimeout(function () {
                    window.location.href = "${rlab}/coupon/page"
                },800)
            }else{
                layer.msg(data.payload);
            }
        })
            .fail(function (data) {
                layer.msg("fail");
            });
    }


    function closebar($this) {
        $this=$($this);
        $this.parent().parent().hide();
        $this.parent().parent().data("fileUrl","");
    }

    //上传
    $("#contracts").change(function(){
        filess(".contract","contracts","#contract");
    });

    $("#invoices").change(function(){
        filess(".invoice","invoices","#invoice");
    });

    $("#achievements").change(function(e){
        filess(".achievement","achievements","#achievement");
    })



    //上传文件

    var xhr=new XMLHttpRequest();/* xhr.upload.onprogress=function(e){};*/
    var xhrOnProgress=function(fun) {
        xhrOnProgress.onprogress = fun; //绑定监听
        //使用闭包实现监听绑
        return function() {
            //通过$.ajaxSettings.xhr();获得XMLHttpRequest对象
            var xhr = $.ajaxSettings.xhr();
            //判断监听函数是否为函数
            if (typeof xhrOnProgress.onprogress !== 'function')
                return xhr;
            //如果有监听函数并且xhr对象支持绑定时就把监听函数绑定上去
            if (xhrOnProgress.onprogress && xhr.upload) {
                xhr.upload.onprogress = xhrOnProgress.onprogress;
            }
            return xhr;
        }
    }



    function filess (str,str1,str2) {

        //文件限制兼容ie
        if(!document.getElementById(str1).files){
            var filenames=document.getElementById(str1).value;
            var filename=filenames.substring( filenames.lastIndexOf('\\')+1 );
            if (!verifyFileSuffx("pdf",filename.toLowerCase())){
                layer.msg("文件格式不正确");
                return;
            }
            $(str).find(".course span").html(filename);
        }else {
            var file = document.getElementById(str1).files[0];
            if (!verifyFileSuffx("pdf",file.name.toLowerCase())){
                layer.msg("文件格式不正确");
                return;
            }
            if (file.size > 1048576 * 10) {
                layer.msg("文件大小不能超过10M");
                return;
            }
            $(str).find(".course span").html(file.name);
        }
        $(str).find(".course .probarbul").css("width","0");
        $(str).find(".course").show();
        //进度条兼容xhr.upload.onprogress
        /*xhrOnProgress.onprogress = function () {};
         if (typeof xhrOnProgress.onprogress !== 'function') {
         console.log("+++");
         $(str).find(".course .probarbul").animate({"width":"40%"},1500);
         }*/
        var ajax_option={
            url:"${rlab}/front/file/ie/upload/image",//form 的action
            type:"post",
            resetForm: true,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",   //设置编码集
            xhr:xhrOnProgress(function(e){
                var percent=e.loaded*100/e.total-5+"%";
                $(str).find(".probarbul").css("width",percent);
            }),
            success : function(data){  //表单提交成功后执行的函数
                data=JSON.parse(data);
                if (data.size > 1048576 * 10){
                    $(str).find(".course").hide();
                    $(str).find(".course").data("fileUrl","");
                    layer.msg("文件大小不能超过10M");
                    return;
                }
                $(str).find(".course .probarbul").animate({"width":"100%"},500);
                $(str).find(".course").data("fileUrl",data.payload);
                layer.msg("上传成功");
            },
            error: function () {
                $(str).find(".course").hide();
                $(str).find(".course").data("fileUrl","");
                layer.msg("上传出错");
            }
        }
        $(str2).ajaxSubmit(ajax_option);
        return false;
    }
</script>
</body>
</html>