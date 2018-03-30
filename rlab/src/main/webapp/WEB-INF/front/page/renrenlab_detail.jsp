<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2018/3/21
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>科研领域最新资讯-科技头条-人人实验</title>
    <meta name="Keywords" content="人人实验,仪器共享,科技头条,科研前沿,政策速报,行业动态,最新活动,职来职往"/>
    <meta name="Description" content="科学研究领域最及时，最全面的资讯内容。涵盖相关政策法规，最新行业动态，世界范围内的前瞻研究成果，科技科研圈领域的最新会议、培训、活动等。为广大科研工作者或科技爱好者提供一手资讯，一站式内容聚合平台"/>
    <%--<jsp:include page="../template/shujike.jsp" flush="true"/>--%>
    <%@ include file="../../config/taglibs.jsp" %>

    <!--bootstrapValidator-->
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <link rel="shortcut icon" href="${rlab}/front/imgs/favicon.png" type="image/x-icon">
    <!--layer-->
    <link rel="stylesheet" href="${rlab}/front/assets/layer-v3.0.3/layer/skin/default/layer.css">
    <script src="${rlab}/front/assets/layer-v3.0.3/layer/layer.js"></script>

    <%--     <script src="${rlab}/front/assets/echarts/echarts.min.js" type="text/javascript" charset="utf-8"></script> --%>
    <!--my css-->
    <link rel="stylesheet" href="${rlab}/front/css/base.css?v_=20180330">
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_=20171108">

    <!--[if lt IE 8]>
    <link rel="stylesheet" href="${rlab}/front/fonts/ie7/ie7.css">
    <!--<![endif]-->

    <!--[if lt IE 9]>
    <script src="${rlab}/front/assets/html5shiv/html5shiv.min.js"></script>
    <script src="${rlab}/front/assets/respond/respond.min.js"></script>
    <style>
        /*兼容右侧悬浮窗*/
        .rt_bar {
            right: 20px;
        }
    </style>
    <![endif]-->

    <script type="text/javascript">
        var isLtIE9 = false;
    </script>
    <!--[if lt IE 10]>
    <script type="text/javascript">
        isLtIE9 = true;
    </script>
    <![endif]-->
    <link rel="stylesheet" href="${rlab}/front/css/ins_list.css?v_=20180330">
    <style type="text/css">
        .item {
            width: 1120px;
            margin: auto;
            height: 225px;
            padding: 24px;
            background: white;
            margin-bottom: 10px;
            border: 1px solid #e6e6e6;
        }

        .item:hover {
            -webkit-box-shadow: 0 6px 16px 0 #d6e0e8;
            -moz-box-shadow: 0 6px 16px 0 #d6e0e8;
            box-shadow: 0 6px 16px 0 #d6e0e8;
            border: 1px solid #fff;
        }

        .itemimg {
            width: 170px;
            height: 170px;
            float: left;
            cursor: pointer;
        }

        .itemText span {
            margin-left: 15px;
        }

        .itemText {
            max-width: 650px;
            margin-left: 15px;
            font-size: 14px;
            color: #5e5e5e;
            line-height: 35px;
            float: left;
        }

        .itemTit {
            font-size: 18px;
            color: #4d4d4d;
            cursor: pointer;
        }

        .aptitude span {
            color: white;
            padding: 2px 12px;
            background: red;
            border-radius: 2px;
        }

        .itemNum {
            width: 161px;
            float: right;
            margin-right: 33px;
        }

        .godetail {
            width: 100%;
            height: 45px;
            background: #588eff;
            color: white;
            line-height: 45px;
            text-align: center;
            display: block;
            margin-top: 30px;
            cursor: pointer;
        }

        .money {
            font-size: 14px;
            color: #f04062;
            text-align: center;
            margin-top: 26px;
        }
        .servertit{
            font-size: 14px;
            color: #b2b2b2;
            width: 1120px;
            margin: auto;
            margin-bottom: 15px;
        }
        .aptitude .tp2{
            background: #0cbcef;
        }
        .aptitude .tp1 {
            background: #8cc932;
        }
        .imgs img{
            width: 1120px;
            margin: auto;
            display: block;
        }
        .imgs{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div>
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp"></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" flush="true">
        <jsp:param name="selected" value="0"/>
    </jsp:include>
    <div class="imgs">
        <img src="" alt="">
    </div>
    <div id="ins" class="org_list">
        <div class="servertit">相关仪器</div>
    </div>
    <div id="server">
        <div class="servertit"> 相关服务</div>
    </div>
    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp"></jsp:include>
</div>
</body>
<script src="${rlab}/front/js/common/main.js?v_=20180330"></script>
<script type="text/javascript">
    var payload={
        list:[
            {
                labName:"理化测试中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E7%90%86%E5%8C%96%E6%B5%8B%E8%AF%95%E4%B8%AD%E5%BF%83pc.png",
                ins:["836446","814571","814532","836443","836448"],
                service:[],
            },
            {
                labName:"动物实验中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%8A%A8%E7%89%A9%E5%AE%9E%E9%AA%8C%E4%B8%AD%E5%BF%83pc.png",
                ins:[],
                service:['4324','4337','4263','4252','4262','4251','4294'],
            },
            {
                labName:"分子生物学中心",
                description:"作为“互联网+科技服务”全新模式的领导者，人人实验运用大数据+人工智能算法等技术手段，倾力打造科研领域互联网云端实验室——“人人实验室”。“人人实验室”<br>通过严谨规范的标准评价体系，联合国内200余家的优质服务机构，筛选服务质量优，响应速度快，用户评价好的优质服务资源向全社会开放。目前已经初步完成动物实验中心、理化测试中心、分子生物学中心三大中心的建设。",
                labPic:"http://renrenlab.oss-cn-shanghai.aliyuncs.com/other/%E5%88%86%E5%AD%90%E7%94%9F%E7%89%A9%E4%B8%AD%E5%BF%83pc.png",
                ins:[],
                service:['4303','4342','4213','4278','4301','4334','4238','4315','4239','4276','4200','4240','4260','4212','4210','4287'],
            }
        ],
    }
    for (var i=0;i<payload.list.length;i++){
        if(payload.list[i].labName=='${name}'){
            $(".renrenlabtit").html(payload.list[i].labName);
            $(".description").html(payload.list[i].description);
            $(".imgs img").attr("src",payload.list[i].labPic);
            if(payload.list[i].ins.length==0){
                $("#ins").hide();
            }else {
                for(var j=0;j<payload.list[i].ins.length;j++){
                    getIns(payload.list[i].ins[j]);
                }
            }
            if(payload.list[i].service.length==0){
                $("#server").hide();
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
                var item=data.payload;
                var price=''
                if (item.price.flag==3){
                    price='面议';
                }else if(item.price.flag==1){
                    (item.price.unit == '无') ? price=item.price.accPrice+'元' : price=item.price.accPrice+'/'+item.price.unit;
                }else if(item.price.flag==2){
                    if(item.price.scopeHighPrice=="0"){
                        (item.price.unit == '无') ? price=item.price.scopeLowPrice+'元起' : price=item.price.scopeLowPrice+'元/'+item.price.unit+'起';
                    }else{
                        (item.price.unit == '无') ? price=item.price.scopeLowPrice+'-'+item.price.scopeHighPrice+'元' : price=item.price.scopeLowPrice+'-'+item.price.scopeHighPrice+'元/'+item.price.unit+'起';
                    }
                }
                if(data.payload.insPic==''||data.payload.insPic==null){
                    data.payload.insPic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    data.payload.insPic=data.payload.insPic+'264_158';
                }
                var citys='';
                console.log();
                (item.orgAddrDistrict!=null) ? citys=item.orgAddrDistrict:citys=" ";
                var dates=new  Date();
                var dateshtml='';
                for (var i=0;i<7;i++){
                    var month=dates.getMonth()+1;
                    var day=dates.getDate()+i;
                    dateshtml+='<i>'+month+'.'+day+'</i>';
                }
                var insFeatureName=JSON.parse(item.insFeatureName.value);
                var insFeatureNameHtml='';
                for(var i=0;i<insFeatureName.length;i++){
                    if(insFeatureName[i]){
                        if(insFeatureName[i].length==4){
                            insFeatureNameHtml+='<span class="tp2">'+insFeatureName[i]+'</span>';
                        }else if(insFeatureName[i].length==3){
                            insFeatureNameHtml+='<span class="tp1">'+insFeatureName[i]+'</span>';
                        }else {
                            insFeatureNameHtml+='<span class="tp1">'+insFeatureName[i]+'</span>';
                        }
                    }
                }
                item.insMode.length>6?item.insMode=item.insMode.substring(0,6).concat("..."):item.insMode=item.insMode;
                item.insBrand.length>6?item.insBrand=item.insBrand.substring(0,6).concat("..."):item.insBrand=item.insBrand;
                JSON.parse(item.insCategory.value)[0].length>9?JSON.parse(item.insCategory.value)[0]=JSON.parse(item.insCategory.value)[0].substring(0,9).concat("..."):JSON.parse(item.insCategory.value)[0]=JSON.parse(item.insCategory.value)[0];
                JSON.parse(item.insCategory.value)[1].length>7?JSON.parse(item.insCategory.value)[1]=JSON.parse(item.insCategory.value)[1].substring(0,7).concat("..."):JSON.parse(item.insCategory.value)[1]=JSON.parse(item.insCategory.value)[1];
                var html='<div class="item">\
                                <div class="ins_img">\
                                    <img data-goods-id="'+item.mapId+'" onerror="imgOnError(this)" onclick="toGoodsDetail(this)"src="'+data.payload.insPic+'" alt="商品图片">\
                                </div>\
                                <div class="ins_info">\
                                    <div class="title">\
                                        <a onclick="toGoodsDetail(this)" href="javascript:void (0);" data-goods-id="'+item.mapId+'">'+data.payload.insName+'</a>\
                                    </div>\
                                    <div class="info">\
                                        <span title="'+item.insMode+'"><i>型号：</i>'+item.insMode+'</span>\
                                        <span title="'+item.insBrand+'"><i>品牌：</i>'+item.insBrand+'</span>\
                                        <span><i>分类：</i>'+JSON.parse(item.insCategory.value)[0]+'>'+JSON.parse(item.insCategory.value)[1]+'</span>\
                                        <span><i>领域：</i>'+item.insScopeName+'</span>\
                                    </div>\
                                    <div class="label">\
                                        <label>预约日期：</label><p>'+dateshtml+'</p>'+insFeatureNameHtml+'\
                                    </div>\
                                    <div class="intro">\
                                        <span><i class="lab-adress"></i><s>'+item.orgAddrStreet.substring(0,18)+'</s></span><span><i class="lab-company"></i><s>'+item.orgName.substring(0,18)+'</s></span><span><i class="lab-biaoqian_1" style="font-size: 14px;"></i><s>'+item.insServiceType+'</s></span>\
                                    </div>\
                                </div>\
                                <div class="ins_btn">\
                                    <div class="price">'+price+'</div>\
                                    <button class="to_deatil_btn" data-goods-id="'+item.mapId+'"onclick="toGoodsDetail(this)" type="button">查看详情</button>\
                                </div>\
                            </div>'
                $("#ins").append(html);
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
                var item = data.payload;
                var price = ''
                if (item.servicePrice.flag == 3) {
                    price = '<p class="money"><span style="font-size: 26px">面议</span></p>';
                } else if (item.servicePrice.flag == 1) {
                    (item.servicePrice.unit == '无') ? price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.accPrice + '</span></p>' : price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.accPrice + '</span>/' + item.servicePrice.unit + '</p>';
                } else if (item.servicePrice.flag == 2) {
                    if (item.servicePrice.scopeHighPrice == "0") {
                        (item.servicePrice.unit == '无') ? price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.scopeLowPrice + '</span>起</p>' : price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.scopeLowPrice + '</span>/' + item.servicePrice.unit + '起</p>';
                    } else {
                        (item.servicePrice.unit == '无') ? price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.scopeLowPrice + '</span>-¥<span style="font-size: 26px">'+item.servicePrice.scopeHighPrice+'</span></p>' : price = '<p class="money">¥<span style="font-size: 26px">' + item.servicePrice.scopeLowPrice + '</span>-¥<span style="font-size: 26px">'+item.servicePrice.scopeHighPrice+'</span><br>/' + item.servicePrice.unit + '</p>';
                    }
                }
                var citys = '';
                if(item.servicePic==''||item.servicePic==null){
                    item.servicePic='${rlab}/common/common_img/default/ins_300X300.jpg';
                }else{
                    item.servicePic=item.servicePic+'264_158';
                }
                (item.serviceDistrict != null) ? citys = item.serviceDistrict : citys = " ";
                var diqu='';
                if(!item.serviceProvince||item.serviceProvince=='未知') {
                    diqu='未知';
                }else {
                    diqu=item.serviceCity+item.serviceDistrict;
                }
                var zizhi='';

                if(item.serviceAptitude){
                    for(var i=0;i<JSON.parse(item.serviceAptitude.value).length;i++){
                        if(JSON.parse(item.serviceAptitude.value)[i].length==4){
                            zizhi+='<span class="tp2">'+JSON.parse(item.serviceAptitude.value)[i]+'</span>';
                        }else{
                            zizhi+='<span class="tp1">'+JSON.parse(item.serviceAptitude.value)[i]+'</span>';
                        }

                    }
                }

                var html='<div class="item clearfix">\
                                <img onclick="goserver(this)" data-map-id="'+item.serviceId+'" src="'+item.servicePic+'" class="itemimg">\
                                <div class="itemText">\
                                    <p class="itemTit" onclick="goserver(this)" data-map-id="'+item.serviceId+'"><a title="'+item.serviceName+'">'+item.serviceName.substring(0,29)+'</a></p>\
                                    <p>所属机构<span>'+item.orgName+'</span></p>\
                                    <p>所在地区<span>'+diqu+'</span></p>\
                                    <p class="aptitude">服务资质'+zizhi+'</p>\
                                </div>\
                                <div class="itemNum">'+price+'\
                                    <a class="godetail" onclick="goserver(this)" data-map-id="'+item.serviceId+'">查看详情</a>\
                                </div>\
                          </div>';
//                var html='<li class="clearfix" onclick="goserverde(this)" data-ins-id="'+item.serviceId+'">\
//                            <img src="' + item.servicePic + '" alt="">\
//                            <div class="itemlitxt">\
//                                <p class="itemtit">' + item.serviceName.substring(0,21) + '</p>\
//                                <div><span style="margin-right: 0.347rem">' + item.serviceCity + '</span><span>' + citys + '</span>' + price + '</div>\
//                            </div>\
//                        </li>';
                $("#server").append(html);
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
