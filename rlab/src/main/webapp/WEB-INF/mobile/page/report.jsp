<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2018/2/28
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../../config/taglibs.jsp" %>
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
    <script src="${rlab}/front/assets/jquery-1.12.4/jquery.js"></script>
    <script src="${rlab}/mobile/js/flexible_css.js" type="text/javascript" charset="utf-8"></script>
    <script src="${rlab}/mobile/js/flexible.js" type="text/javascript" charset="utf-8"></script>
    <style type="text/css">
        *{margin: 0;padding: 0;}
        .clearfix:after {
            content: "";
            height: 0;
            line-height: 0;
            clear: both;
            display: block;
            visibility: hidden
        }

        .clearfix {
            zoom: 1; /*IE/7/6*/
        }
        body{
            padding: 0.2rem;
            background: #f5f6fa;
        }
        .page{
            background: white;
            padding: 0.2rem;
            margin-bottom: 0.4rem;
        }
        .page1{
            padding-bottom: 1.5rem;
        }
        .page1 table{
            float: right;
            margin-top: 1rem;
        }
        .page1 table td{
            padding: 0.2rem;
            text-align: center;
        }
        .page1 h3{
            margin:1.7rem 0;
            text-align: center;
            font-size: 0.7rem;
            font-weight: bold;
            letter-spacing:0.6rem;
        }
        .name{
            width: 3.6rem;
            float: left;
        }
        .text{
            width: 5.6rem;
            float: right;
        }
        .text p{
            font-size: 0.32rem;
            width: 4.5rem;
            border-bottom: 0.01rem solid black;
            text-align: center;
            line-height: 0.6rem;
        }
        .name p{
            font-size: 0.32rem;
            text-align: right;
            line-height: 0.6rem;
        }
        .bot{
            text-align: center;
            font-size: 0.28rem;
            margin: 0.2rem 0;
        }
        .page2 h3{
            font-size: 0.38rem;
            font-weight: bold;
            text-align: center;
            letter-spacing: 0.05rem;
        }
        .table table{
            text-align: center;
            border: 0.02rem solid black;
        }
        .table table td{
            padding: 0.2rem;
        }
        .onRow{
            width: 2rem;
        }
        .twoRow{
            width: 4rem;
        }
        .row5{
            height: 2rem;
        }
        .table2 table{
            text-align: center;
            border: 0.02rem solid black;
        }
        .table2 tr td:nth-child(2){
            text-align: left;
        }
        .page4 table{
            text-align: center;
            border: 0.02rem solid black;
        }
        .page4 td{
            padding: 0.2rem;
        }
        .page4 td input{
            width: 0.2rem;
            height: 0.2rem;
        }
        #qrCode img,#qrcode2 img{
            margin: auto;
            width: 2.2rem;
        }
        .baogao{
            position: absolute;
            top:4.5rem;
            right: 0;
            width: 6rem;
        }
        .shuju{
            position: absolute;
            top:0rem;
            right: 0;
            width: 6rem;
        }
    </style>
</head>
<body>
<div class="page page1" style="position: relative">
    <div class="clearfix">
        <img src="${rlab}/mobile/imgs/timg.jpg" style="width: 3.5rem;"/>
        <table border="#f5f6fa">
            <tr>
                <td>编号</td>
                <td>W2018SZ0896</td>
            </tr>
            <tr>
                <td>总页数</td>
                <td>共2页</td>
            </tr>
        </table>
    </div>
    <div id="qrCode" style="margin: auto"></div>
    <img src="${rlab}/mobile/imgs/baogao.png" alt="" class="baogao">
    <h3>检验报告</h3>
    <div class="clearfix" style="margin-bottom: 1.5rem;">
        <div class="name">
            <p style="margin-right: 0.22rem;">样（产）品名称：</p>
            <p style="letter-spacing: 0.22rem;">检验类别：</p>
            <p style="letter-spacing: 0.22rem;">受检单位：</p>
            <p style="letter-spacing: 0.22rem;">委托单位：</p>
        </div>
        <div class="text">
            <p>二次供水</p>
            <p>委托检验</p>
            <p>XXX公司</p>
            <p>XXX物业管理有限公司</p>
        </div>
    </div>
    <p class="bot" style="font-size: 0.38rem;">检验单位：XX市XX检测中心</p>
    <p class="bot">报告签发日期：2018年02月03日</p>
</div>
<div class="page page2 clearfix">
    <h3 style="margin-top: 0.2rem;">XX市XX检测中心</h3>
    <h3 style="letter-spacing: 0.3rem;margin-bottom: 0.5rem;">检验报告</h3>
    <div class="clearfix">
        <p style="font-weight: bold;float: left;">编号：W2018SZ0896</p>
        <p style="float: right;">第1页 共2页</p>
    </div>
    <div class="table">
        <table border="" cellspacing="" cellpadding="">
            <tr>
                <td class="onRow">样品名称</td>
                <td class="twoRow">二次供水</td>
                <td class="onRow">样品种类</td>
                <td class="twoRow">生活饮用水</td>
            </tr>
            <tr>
                <td >委托单位名称</td>
                <td >XXX物业管理有限公司</td>
                <td >检验类别</td>
                <td >委托检验</td>
            </tr>
            <tr>
                <td >委托单位地址</td>
                <td >长沙市开福区芙蓉北路206号</td>
                <td >样品数量</td>
                <td >1.5L</td>
            </tr>
            <tr>
                <td >样品生产单位</td>
                <td >顺天·北国风光</td>
                <td >样品编号</td>
                <td >W2018SZ0896</td>
            </tr>
            <tr>
                <td >样品生产单位地址</td>
                <td >长沙市开福区芙蓉北路206号</td>
                <td >取样地点</td>
                <td >顺天·北国风光内蓄水池</td>
            </tr>
            <tr>
                <td >取样时间</td>
                <td >2018年12月28日</td>
                <td >取样者</td>
                <td >彭泓波、谭诚</td>
            </tr>
            <tr>
                <td >检验日期</td>
                <td >2018年12月28日</td>
                <td >检验项目</td>
                <td >（见后表）</td>
            </tr>
            <tr>
                <td >样品状态</td>
                <td colspan="3">清澈</td>
            </tr>
            <tr>
                <td >检验依据</td>
                <td colspan="3">GB 17051-1997</td>
            </tr>
            <tr>
                <td class="row5">检验结论</td>
                <td class="clearfix" colspan="3">
                    <p style="text-align: left;">该样品经检验，所检项目均符合《二次供水设施卫生规范》（GB 17051-1997）中的标准要求。<br>(以下空白)<br><br><br><br></p>
                    <p style="float: right;">签发日期（盖章）<br>2018年12月31日</p>
                </td>
            </tr>
            <tr>
                <td class="row5">备注</td>
                <td colspan="3">1、环境温度：24℃</td>
            </tr>
        </table>
    </div>
</div>
<div class="page page3" style="position: relative">
    <div id="qrcode2" style="margin-top: 0.5rem"></div>
    <div class="clearfix" style="margin-top: 0.8rem;">
        <p style="font-weight: bold;float: left;">编号：W2018SZ0896</p>
        <p style="float: right;">第2页 共2页</p>
    </div>
    <div class="table2">
        <table border="">
            <tr>
                <td>序号</td>
                <td style="text-align: center;">检测项目（单位）</td>
                <td>检测方法</td>
                <td>限值</td>
                <td>检测结果</td>
                <td>单项评定</td>
            </tr>
            <tr>
                <td>1</td>
                <td>色度（铂钴色度单位）</td>
                <td>GB/T5750.4-2006中1.1</td>
                <td>15</td>
                <td>0.2</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>2</td>
                <td>浑浊度（散射浑浊度单位）/NTU</td>
                <td>GB/T5750.4-2006中2.1</td>
                <td>1</td>
                <td>0.12</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>3</td>
                <td>臭和味</td>
                <td>GB/T5750.4-2006中3.1</td>
                <td>无异臭、异味</td>
                <td>无</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>4</td>
                <td>肉眼可见物</td>
                <td>GB/T5750.4-2006中4.1</td>
                <td>无</td>
                <td>无</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>5</td>
                <td>pH</td>
                <td>GB/T5750.4-2006中5.1</td>
                <td>6.5~8.5</td>
                <td>7.64</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>6</td>
                <td>总大肠菌群（CFU/100ml）</td>
                <td>GB/T5750.12-2006中2.2</td>
                <td>不得检出</td>
                <td>未检出</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>7</td>
                <td>菌群总数（CFU/ml）</td>
                <td>GB/T5750.12-2006中1.1</td>
                <td>100</td>
                <td>未检出</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>8</td>
                <td>游离余氯（mg/L）</td>
                <td>GB/T5750.11-2006中1.2</td>
                <td>≥0.05</td>
                <td>0.05</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>9</td>
                <td>总硬度（mg/L）</td>
                <td>GB/T5750.4-2006中7.1</td>
                <td>450</td>
                <td>37.7</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>10</td>
                <td>氯化物（mg/L）</td>
                <td>GB/T5750.5-2006中2.1</td>
                <td>250</td>
                <td>4.2</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>11</td>
                <td>硝酸盐氮（以N计）（mg/L）</td>
                <td>GB/T5750.5-2006中5.2</td>
                <td>10</td>
                <td>0.35</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>12</td>
                <td>挥发酚类（mg/L）</td>
                <td>GB/T5750.4-2006中9.1</td>
                <td>0.002</td>
                <td><0.002</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>13</td>
                <td>氰化物（mg/L）</td>
                <td>GB/T5750.5-2006中4.1</td>
                <td>0.05</td>
                <td><0.0020</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>14</td>
                <td>氨氮（mg/L）</td>
                <td>GB/T5750.5-2006中9.1</td>
                <td>0.6</td>
                <td>0.02</td>
                <td>合格</td>
            </tr>
            <tr>
                <td>15</td>
                <td>耗氧量（mg/L）</td>
                <td>GB/T5750.7-2006中1.1</td>
                <td>4</td>
                <td>0.96</td>
                <td>合格</td>
            </tr>
            <tr style="text-align: left;">
                <td colspan="6" style="padding-left: 0.2rem;line-height: 0.5rem;">
                    <p>
                        主要仪器设备：<br />
                        <a href="${rlab}/instrument/search/858283">pH510型台式pH计</a><br/>
                        <a href="${rlab}/instrument/search/858284">UV-2600型紫外可见分光光度计</a><br/>
                        WGZ-2型反射光浊度仪<br />
                        TU-1901双光束紫外可见分光光度计<br />
                        SHP-250型生化培养箱<br /><br />
                    </p>
                </td>
            </tr>
        </table>
    </div>
</div>
<div class="page page4">
    <table border="">
        <tr>
            <td style="width: 2rem;">检测</td>
            <td style="width: 10rem;">李世佳</td>
        </tr>
        <tr>
            <td>审核</td>
            <td>周满</td>
        </tr>
        <tr>
            <td>签发</td>
            <td>王佳宇</td>
        </tr>
        <tr>
            <td>签发人职务</td>
            <td>
                <label for="duty1">
                    <input type="radio" name="duty" id="duty1" value="" disabled/>
                    中心主任
                </label>
                <label for="duty2">
                    <input type="radio" name="duty" id="duty2" value="" checked=""/>
                    中心副主任
                </label>
                <label for="duty3">
                    <input type="radio" name="duty" id="duty3" value="" disabled/>
                    中心主管
                </label>
            </td>
        </tr>
    </table>
</div>
</body>
<script src="${rlab}/front/js/view/qrcode.min.js" type="text/javascript"></script>
<script type="text/javascript">
    (function(){
            var urls=BASE_URL+'/page/table';
            new QRCode($("#qrCode").get(0), urls);
            var urla=BASE_URL+'/page/table/table2';
            new QRCode($("#qrcode2").get(0), urla);
        }
    )();
</script>
</html>
