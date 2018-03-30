<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description" content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <%--mui--%>
    <link rel="stylesheet" type="text/css" href="${rlab}/mobile/assets/mui/css/mui.min.css"/>
    <script src="${rlab}/mobile/assets/mui/js/mui.min.js" type="text/javascript" charset="utf-8"></script>

    <link rel="stylesheet" href="${rlab}/mobile/css/search_result.css">

    <style>
        .renrenlabImg img{
            width: 100%;
        }
        .renrenlabImg{
            width: 100%;
            margin-top: 1.175rem;
        }
        .synopsis,.description{
            color: #322d2d;
            font-size: 0.373rem;
            letter-spacing: 0.013rem;
            line-height: 0.6rem;
            padding: 0 0.347rem;
        }
        .renrenlabtit{
            font-size: 0.48rem;
            letter-spacing: 0.016rem;
            color: #322d2d;
            margin-top: 0.58rem;
            margin-bottom: 0.373rem;
            padding: 0 0.347rem;
        }
        #listmain h3{
            font-size: 0.373rem;
            margin-bottom: 0.693rem;
            color: #352c2c;
        }
        .qrCode {
            font-size: 0.293rem;
            letter-spacing: 0.01rem;
            color: #322d2d;
            line-height: 0.32rem;
            padding: 0 0.9rem;
            margin-bottom: 1.0rem;
        }

        .qrCode img {
            margin: auto;
            display: block;
            width: auto;
            height: 2.72rem;
        }

        .records {
            width: 100%;
            height: 2.507rem;
            text-align: center;
            background-color: #e6e6e6;
            color: #939393;
            font-size: 0.267rem;
            line-height: 0.5rem;
            padding-top: 0.5rem;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;">
    <header>
        <%@ include file="../template/header_four.jsp" %>
    </header>
    <div class="renrenlabImg">
        <img src="" alt="">
    </div>
    <h3 class="renrenlabtit"></h3>
    <p class="synopsis">
        详细介绍 ：
    </p>
    <p class="description" style=" margin-bottom: 0.7rem;"></p>

    <div id="listmain" style="margin-top: 0.9rem " class="ins">
        <ul class=""  data-page-no="2" data-type-str="" data-city-str="">
            <h3>相关仪器</h3>
        </ul>
    </div>
    <div id="listmain" style="margin-top: 0.9rem" class="service">
        <ul class=""  data-page-no="2" data-type-str="" data-city-str="">
            <h3>相关服务</h3>
        </ul>
    </div>
    <div class="qrCode" style="margin-top: 0.9rem">
        <img src="${rlab}/mobile/imgs/m2.4/qrcode.png" alt="">
        <p>
            温馨提示：长按二维码关注人人实验公众微信号，或保存二维码至手机使用微信扫一扫关注人人实验公众微信号，客服小花为您答疑解惑。使用电脑登录主站www.renrenlab.com了解更多优质服务和仪器。
        </p>
    </div>
    <div class="records">
        <p>Copyright 2015-2017 人人实验（北京）科技有限公司</p>
        <p>All Rights Reserved 京ICP备15058824</p>
    </div>
</div>
<%--城市下拉列表--%>
<div class="moveTotop" id="div_moveToTop" style="display: none">
    <a href="#dropdown" class="mtop">
        <i class="lab-back_top"></i>
    </a>
</div>
<%@ include file="../template/city.jsp" %>
<%--公用搜索部分--%>
<%@ include file="../template/search.jsp" %>
</body>
<script src="${rlab}/mobile/js/main.js?v_=20180207"></script>
<script type="text/javascript">
    setCallbackUrl();// 设置登录时回跳路径

    /**
     * 返回历史上一页
     */

    function goBack() {
        history.go(-1);
    }
    var payload={
        list:[
            {
                labName:"理化测试中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E7%90%86%E5%8C%96%E6%B5%8B%E8%AF%95%E4%B8%AD%E5%BF%83.png",
                ins:["836446","814571","814532","836443","836448"],
                service:[],
            },
            {
                labName:"动物实验中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%8A%A8%E7%89%A9%E5%AE%9E%E9%AA%8C%E4%B8%AD%E5%BF%83.png",
                ins:[],
                service:['4324','4337','4263','4252','4262','4251','4294'],
            },
            {
                labName:"分子生物学中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%88%86%E5%AD%90%E7%94%9F%E7%89%A9%E4%B8%AD%E5%BF%83.png",
                ins:[],
                service:['4303','4342','4213','4278','4301','4334','4238','4315','4239','4276','4200','4240','4260','4212','4210','4287'],
            }
        ],
    }

    for (var i=0;i<payload.list.length;i++){
        if(payload.list[i].labName=='${name}'){
            $(".renrenlabtit").html(payload.list[i].labName);
            $(".description").html(payload.list[i].description);
            $(".renrenlabImg img").attr("src",payload.list[i].labPic);
            if(payload.list[i].ins.length==0){
                $(".ins").hide();
            }else {
                for(var j=0;j<payload.list[i].ins.length;j++){
                    getIns(payload.list[i].ins[j]);
                }
            }
            if(payload.list[i].service.length==0){
                $(".service").hide();
            }else {
                for(var j=0;j<payload.list[i].service.length;j++){
                    getService(payload.list[i].service[j]);
                }
            }

        }
    }
//    获取仪器
    function getIns(id) {
        $.ajax({
            url: BASE_URL + '/instrument/msearch/' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                console.log(data);
                var item=data.payload;
                var price=''
                if (item.price.flag==3){
                    price='<p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>';
                }else if(item.price.flag==1){
                    (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.accPrice+'</i></span></p>' : price='<p><span>¥<i>'+item.price.accPrice+'</i></span>/'+item.price.unit+'</p>';
                }else if(item.price.flag==2){
                    if(item.price.scopeHighPrice=="0"){
                        (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>/'+item.price.unit+'起</p>';
                    }else{
                        (item.price.unit == '无') ? price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>起</p>' : price='<p><span>¥<i>'+item.price.scopeLowPrice+'</i></span>/'+item.price.unit+'起</p>';
                    }
                }
                if(data.payload.insPic==''||data.payload.insPic==null){
                    data.payload.insPic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    data.payload.insPic=data.payload.insPic+'264_158';
                }
                var citys='';
                (item.orgAddrDistrict!=null) ? citys=item.orgAddrDistrict:citys=" ";
                var html='<li class="clearfix" onclick="goinsde(this)" data-ins-id="'+item.mapId+'">\
                                    <img src="'+data.payload.insPic+'" alt="">\
                                    <div class="itemlitxt">\
                                        <p class="itemtit">'+data.payload.insName.substring(0,21)+'</p>\
                                        <div><span style="margin-right: 0.347rem">'+item.orgAddrCity+'</span><span>'+citys+'</span>'+price+'</div>\
                                    </div>\
                                </li>';
                $(".ins ul").append(html);
            }
        })
    }
//    获取服务
    function getService(id) {
        $.ajax({
            url: BASE_URL + '/service/mdetail/' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                console.log(data);
                var item = data.payload;
                var price = ''
                if (item.servicePrice.flag == 3) {
                    price = '<p><span><i style="font-size: 0.34rem;color: #FAD291;letter-spacing: 0.1rem">面议</i></span></p>';
                } else if (item.servicePrice.flag == 1) {
                    (item.servicePrice.unit == '无') ? price = '<p><span>¥<i>' + item.servicePrice.accPrice + '</i></span></p>' : price = '<p><span>¥<i>' + item.servicePrice.accPrice + '</i></span>/' + item.servicePrice.unit + '</p>';
                } else if (item.servicePrice.flag == 2) {
                    if (item.servicePrice.scopeHighPrice == "0") {
                        (item.servicePrice.unit == '无') ? price = '<p><span>¥<i>' + item.servicePrice.scopeLowPrice + '</i></span>起</p>' : price = '<p><span>¥<i>' + item.servicePrice.scopeLowPrice + '</i></span>/' + item.servicePrice.unit + '起</p>';
                    } else {
                        (item.servicePrice.unit == '无') ? price = '<p><span>¥<i>' + item.servicePrice.scopeLowPrice + '</i></span>起</p>' : price = '<p><span>¥<i>' + item.servicePrice.scopeLowPrice + '</i></span>/' + item.servicePrice.unit + '起</p>';
                    }
                }
                var citys = '';
                if(item.servicePic==''||item.servicePic==null){
                    item.servicePic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    item.servicePic=item.servicePic+'264_158';
                }
                (item.serviceDistrict != null) ? citys = item.serviceDistrict : citys = " ";
                var html='<li class="clearfix" onclick="goserverde(this)" data-ins-id="'+item.serviceId+'">\
                            <img src="' + item.servicePic + '" alt="">\
                            <div class="itemlitxt">\
                                <p class="itemtit">' + item.serviceName.substring(0,21) + '</p>\
                                <div><span style="margin-right: 0.347rem">' + item.serviceCity + '</span><span>' + citys + '</span>' + price + '</div>\
                            </div>\
                        </li>';
                $(".service ul").append(html);
            },
            error: function () {

            }
        })
    }

    function goinsde($this) {
        window.location.href = BASE_URL + "/instrument/search/" + $($this).data("insId");
    }
    function goserverde($this) {
        window.location.href = BASE_URL + "/service/detail/" + $($this).data("insId");
    }
</script>
</html>