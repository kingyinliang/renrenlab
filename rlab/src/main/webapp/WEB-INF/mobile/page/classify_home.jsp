<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验 让科技创新更简单 找仪器 做检测 科研众包</title>
    <meta name="Keywords" content="生物医药,医疗器械,材料学,能源环保,智能制造,电子信息"/>
    <meta name="Description"
          content="人人实验是一家专业的仪器共享与科研服务平台，整合各行业低频使用的仪器设备、实验场地、服务项目等科技资源，涵盖生物医药，医疗器械，智能制造，能源环保，电子信息，材料学等十几个领域，为企业在科技创新活动中提供高效便捷的资源信息和解决方案"/>
    <link rel="stylesheet" href="${rlab}/common/icomoon/style.css?v_20180202">
    <link rel="stylesheet" href="${rlab}/mobile/css/base.css?v_20180202">
    <script src="${rlab}/mobile/js/zeptojs.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>

    <style>
        .main{
            width: 100%;
            height: 100%;
        }
        .leftlist{
            position: relative;
            z-index: 999;
            float: left;
            width: 2.24rem;
            height: 100%;
            background: white;
            box-shadow: 0rem 0rem 0.267rem 0rem
            rgba(0, 0, 0, 0.05);
        }
        .leftlist .sleedp{
            background-color: #f2f2f2;
            color: #3e97fc;
        }
        .leftlist p{
            font-size: 0.373rem;
            text-align: center;
            letter-spacing: 0.013rem;
            line-height: 1.813rem;
        }
        .rightlist{
            overflow: scroll;
            position: relative;
            z-index: 99;
            width: 7.76rem;
            height: 100%;
            background-color: #f2f2f2;
            float: right;
            padding: 0.347rem 0.347rem 0 0.347rem;
        }
        .secondtit{
            line-height: 0.4rem;
            margin-top: 0.347rem;
        }
        .secondtit h3{
            float: left;
            letter-spacing: 0.011rem;
            color: #322d2d;
            font-size: 0.347rem;
        }
        .secondtit a{
            float: right;
            font-size: 0.293rem;
            letter-spacing: 0.003rem;
            color: #322d2d;
        }
        .threebox{
            margin-top: 0.2rem;
            padding: 0.1rem 0.1rem;
            background: white;
        }
        .threebox .threeItem{
            float: left;
            text-align: center;
            width: 1.85rem;
            height: 1.8rem;
            margin:0.2rem;
        }
        .threeItem img{
            width: 1.2rem;
            height: 1.2rem;
            background-color: #ffb199;
            border-radius: 50%;
            display: block;
            margin: auto;
        }
        .threeItem p{
            text-align: center;
            font-size: 0.293rem;
            color: #262222;
            width: 100%;
            overflow: hidden;
            text-overflow:ellipsis;
            white-space: nowrap;
        }
    </style>
</head>

<body style="background: white">
<div id="main" class="main" style="background: white;padding-top: 1.175rem;padding-bottom: 1.2rem;">
    <header>
        <%@ include file="../template/header_three.jsp" %>
    </header>
    <div class="main clearfix">
        <div class="leftlist">
            <p class="sleedp" data-one-str="1">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;物</p>
            <p data-one-str="26">医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;药</p>
            <p style="letter-spacing: 0.01rem" data-one-str="61">医疗器械</p>
        </div>
        <div class="rightlist">
        </div>
    </div>
    <footer>
        <jsp:include page="../template/footer.jsp" flush="true">
            <jsp:param name="active" value="2"/>
        </jsp:include>
    </footer>
</div>
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
    getrightlist(1);
    function getrightlist(id) {
        $.ajax({
            url: BASE_URL + '/service/product_classify?id=' + id,
            type: 'GET',
            dataType: "json",
            contentType: "application/json",
            async: false,
            success: function (data) {
                var it=''
                for (var i=0;i<data.payload.length;i++){
                    var item=data.payload[i];
                    for (var p1 in item) {
                        if (item.hasOwnProperty(p1))
                        var thr='';
                        var parentId='';
                        for(var j=0;j<item[p1].length;j++){
                            thr+='<div class="threeItem" onclick="goSearch(this)" data-class-id="'+item[p1][j].id+'">\
                                        <img src="'+item[p1][j].classifyPic+'" alt="">\
                                        <p title="'+item[p1][j].classifyName+'">'+item[p1][j].classifyName+'</p>\
                                     </div>'
                            parentId=item[p1][j].parentId;
                        }
                        var se='<div class="secondtit clearfix">\
                                    <h3>'+p1+'</h3>\
                                    <a onclick="goSearchs(this)" data-class-id="'+parentId+'" data-class-name="'+p1+'">查看详情</a>\
                                </div>';

                        it+=se+'<div class="threebox clearfix">'+thr+'</div>';
                    }
                }
                $(".rightlist").html(it);
            },
            error: function () {

            }
        })
    }
    $(".leftlist p").on("click",function () {
        $(".leftlist p").attr("class","");
        $(this).attr("class","sleedp");
        var id=$(this).data("oneStr");
        getrightlist(id);
    })
    function goSearch($this) {
        window.location.href = BASE_URL + '/service/classify_list?classify=' + $($this).data("classId") + '&name=' + $($this).find("p").text();
//                ?searchKey='+$($this).find("p").text();
    }
    function goSearchs($this) {
        window.location.href = BASE_URL + '/service/classify_list?classify=' + $($this).data("classId") + '&name=' + $($this).data("className");

    }
</script>
</html>