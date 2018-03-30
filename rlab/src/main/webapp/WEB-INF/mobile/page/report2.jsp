<%--
  Created by IntelliJ IDEA.
  User: kingyinliang
  Date: 2018/3/1
  Time: 10:36
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
        #qrCode img{
            margin: auto;
        }
        .baogao{
            position: absolute;
            top:0.5rem;
            right: 0;
            width: 6rem;
        }
        .shuju{
            position: absolute;
            top:-0.3rem;
            right: -1rem;
            width: 6rem;
        }
    </style>
</head>
<body>
<div class="page page3" style="position: relative;overflow: hidden">
    <img src="${rlab}/mobile/imgs/shuju.png" alt="" class="shuju">
    <div class="clearfix" style="margin-top: 0.8rem;">
        <p style="font-weight: bold;float: left;">编号：W2018SZ0896</p>
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

</body>
</html>
