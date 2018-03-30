<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>人人实验（renrenlab.com）官方网站-互联网+科技服务平台</title>
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
    <link rel="stylesheet" href="${rlab}/front/css/goods_list.css?v_=20170905">
    <link rel="stylesheet" type="text/css" href="${rlab}/front/css/scientific_search.css?v_=20170905"/>

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

    <style type="text/css">
        .company_info_layer {
            width: auto!important;
        }
        #qrCode{
            width: 585px;
            height: 438px;
            background: white;
            margin: auto;
            text-align: center;
            border-radius: 4px;
            overflow: hidden;
        }
        #qrCode p{
            margin-top: 54px;
            line-height: 35px;
            font-size: 18px;
            color: #666666;
        }
        #qrCode img{
            margin-top: 53px;
            width: 143px;
            height: 143px;
        }
        #close{
            color: white;
            font-size: 16px;
            display: block;
            width: 260px;
            height: 38px;
            background: #508DF0;
            line-height: 38px;
            margin: auto;
            margin-top: 50px;
        }

    </style>
</head>
<body>
<div class="wrapper">
    <!--右侧公用模块-->
    <jsp:include page="../template/right_bar.jsp" ></jsp:include>
    <!--头部公用模块-->
    <jsp:include page="../template/header.jsp" ></jsp:include>
    <!--内容部分-->
    <div class="scientificSearch">
        <div class="mainLeft">
        	<c:if test="${result.relatedFields_word2vec!=null && fn:length(result.relatedFields_word2vec)>0}">
            <div id="Interest">
                <div class="tit">
                    <p>您可能感兴趣的内容</p>
                </div>
                <div id="correlation">
                	<c:forEach items="${result.relatedFields_word2vec}" var="word"  varStatus="st">
                        <%--<a onclick="toSearchFromSuper(${word })" href="JavaScript:location.href='${rlab}/instrument/search?pageNo=1&pageSize=10&keyword='+encodeURI('${word }');" target="_blank">${word }</a>--%>
                        <a onclick="toSearchFromSuper('${word }')" href="javascript:void (0)" >${word}</a>
                        <%-- <a href="${rlab}/instrument/search?pageNo=1&pageSize=10&keyword=${word}" target="_blank">${word }</a> --%>
                    </c:forEach>
                </div>
            </div>
            </c:if>
            <c:if test="${result.similarFields!=null}">
            <div id="echarts">
            
                <div class="tit">
                    <p>相关领域</p>
                </div>
                <div id="echartsView">

                </div>
            </div>
            </c:if>
            <c:if test="${result.relatedInfo!=null && fn:length(result.relatedInfo)>0}">
              <div id="message">
                <div class="tit">
                    <p>相关资讯</p>
                    <%--<a href="JavaScript:location.href='/front/kejso/moreRelatedInfo?pageNo=0&pageSize=10&query='+encodeURI('${keyword}');" target="_blank"><span class="lab-more"></span></a>--%>
                    <a onclick="toInformation()" href="javascript:void (0)" ><span class="lab-more"></span></a>

                </div>
                <div id="correlationMessage">
                    <ul>
                    	<c:forEach items="${result.relatedInfo}" var="relatedInfo" begin="0" end="1" varStatus="st">
	                        <li style="overflow: hidden">
	                            <a href="${relatedInfo.url }" class="messageTit" target="_blank">${relatedInfo.title }</a>
	                            <p>${relatedInfo.content }</p>
	                            <a href="${relatedInfo.url }">${relatedInfo.url }</a>
	                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div> 
            </c:if> 
        </div>
        <div class="mainRight">
        	<c:if test="${result.paperlist!=null && fn:length(result.paperlist)>0}">
            <div id="thesis">
                <div class="tit">
                    <p>相关论文</p>
                    <%--<a href="JavaScript:location.href='/front/kejso/morePaper?pageNo=0&pageSize=10&query='+encodeURI('${keyword}');" target="_blank"><span class="lab-more"></span></a>--%>
                    <%--<a href="${rlab}/front/kejso/morePaper?pageNo=0&pageSize=10&query=${keyword}" target="_blank"><span class="lab-more"></span></a>--%>
                    <a onclick="toThesis()" href="javascript:void (0)"><span class="lab-more"></span></a>
                </div>
                <div id="list">
                    <ul>
                    <c:forEach items="${result.paperlist}" var="paperlist" begin="0" end="1" varStatus="st">
                    	 <li>
                            <a href="${paperlist.url_s }" class="messageTit" target="_blank">${paperlist.title_cn_s }</a>
                            <c:set var="keywords" value="${paperlist.keywords }"/>
                            <c:if test="${ fn:length(keywords)>0}">
                            	<p class="thesisText" title="${keywords }"><c:out value="${keywords }"/></p>
                            </c:if>
                            <p class="writer"><span>${paperlist.authors_ims eq null?"不祥":paperlist.authors_ims}</span> <span class="line">|</span> <span>${paperlist.year_if }</span> <span class="line">|</span> <span class="thOrg" title="${paperlist.workplace_ais }">${paperlist.workplace_ais }</span></p>
                            <a href="${paperlist.url_s }" style="word-wrap:break-word;" target="_blank">${paperlist.url_s }</a>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
             </c:if>
             <c:if test="${result.prolist!=null && fn:length(result.prolist)>0}">
            <div id="project">
                <div class="tit">
                    <p>相关项目</p>
                    <a  onclick="toProject()" href="javascript:void (0)"><span class="lab-more"></span></a>
                </div>
                <div class="list">
                    <ul>
                    	<c:forEach items="${result.prolist}" var="prolist" begin="0" end="1" varStatus="st">
                        <li>
                            <a class="projectTit" title="${prolist.title_cn_ais}" style="cursor: pointer"><p>${prolist.title_cn_ais}</p></a>
                            <p style="line-height: 25px;">负责单位：<span style="color: #4E4E4E;">${prolist.organization_if}</span></p> 
                            <p class="rightMark"><span class="mark" style="width:32px;">${prolist.year_is}</span> <span style="float:right;margin: 0 6px;">|</span> <span class="mark" title="${prolist.leader_ims}">${prolist.leader_ims}</span></p>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            </c:if>
            <c:if test="${result.finalWorkplaceList!=null && fn:length(result.finalWorkplaceList)>0}">
            <div id="organization">
                <div class="tit">
                    <p>相关机构</p>
                </div>
                <div id="orgList">
                    <div class="listLeft">
                        <ul>
                        <c:forEach items="${result.finalWorkplaceList}" var="orglist" begin="0" end="4" varStatus="st">
                            <li>
                                <p style="color: #4E4E4E;font-size: 14px">${st.index +1}.${orglist.first }</p>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="listRight">
                        <ul>
                        <c:forEach items="${result.finalWorkplaceList}" var="orglist" begin="5" end="9" varStatus="st">
                            <li>
                                <p style="color: #4E4E4E;font-size: 14px">${st.index +1}.${orglist.first }</p>
                            </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            </c:if>
        </div>
    </div>

    <!--底部底边栏-->
    <jsp:include page="../template/footer.jsp" ></jsp:include>

</div>

<script src="${rlab}/front/js/util/pagination.js"></script>
<script src="${rlab}/front/js/common/main.js?v_=20180331"></script>

<script src="${rlab}/front/assets/echarts/echarts-plain.js" type="text/javascript" charset="utf-8"></script>
<%-- <script src="${rlab}/front/js/view/echarts_database.js" type="text/javascript" charset="utf-8"></script> --%>

<script>

    showPages(100, 0, 5, function (from, max) {
        location.href = "http://v3.bootcss.com/components/#pagination-default";
    }, "page_container");

    function moveToTop() {
        $('body,html').animate({scrollTop: 0}, 500);
    }

    function toGoodsDetail(){

    }

    //$("#serach").val('<c:out value="${keyword}" escapeXml="true"/>');
      function eConsole(param) {
        if (typeof param.seriesIndex == 'undefined') {
            return;
        }


        if (param.type == 'click') {
            toSearchFromSuper(param.name);
        }
    } 
    
    
	var myChart = echarts.init(document.getElementById('echartsView'));
     myChart.on("click", eConsole);  

	var option = {
			tooltip : {
				trigger : 'item',
				formatter : '{a} : {b}'
			},
			series : [ {
				type : 'force',
				name : "领域关系",
				lineStyle: {
					normal: {
						opacity: 0.9,
						width: 1,
						curveness: 0,
						color: '#000',
						type:'dotted'
					}
				},
				categories : [ {
					name : '中心词',
					itemStyle : {
						normal : {
							color : '#009800'
						}
					}
				}, {
					name : '相关领域',
					itemStyle : {
						normal : {
							color : '#4592FF'
						}
					}
				},{
					name : '相关领域',
					itemStyle : {
						normal : {
							color : '#4592FF'
						}
					}
				},
				{
					name : '相关领域',
					itemStyle : {
						normal : {
							color : '#4592FF'
						}
					}
				}, {
					name : '相关领域',
					itemStyle : {
						normal : {
							color : '#4592FF'
						}
					}
				}, {
					name : '相关领域',
					itemStyle : {
						normal : {
							color : '#4592FF'
						}
					}
				}],
				itemStyle : {
					normal : {
						label : {
							show : true,
							textStyle : {
								color : '#FFFFFF'
							}
						},
						nodeStyle : {
							brushType : 'both',
							strokeColor : 'rgba(255,255,255,0.4)',
							lineWidth : 0
						},linkStyle : {
                            type : 'curve'
                        }
					},
					emphasis : {
						label : {
							show : false
						// textStyle: null      // 默认使用全局文本样式，详见TEXTSTYLE
						},
						nodeStyle : {
							r : 50
						},
						linkStyle : {
                            color: '#000',
                        }
					}
				},
				minRadius : 25,
				maxRadius : 30,
				density : 0.05,
				attractiveness : 0.9,
				nodes : [<c:forEach items="${result.similarFields.nodes}" var="nodes" varStatus="st">
        				{"category": "${nodes.category}","name": "${nodes.name}","value": ${nodes.value}},
						</c:forEach>
	
				],
				links : [<c:forEach items="${result.similarFields.links}" var="links" varStatus="st">
  				{"source": ${links.source},"target": ${links.target},"weight": ${links.weight}},
	     		</c:forEach>
	
				],
				
			} ]
		};
	
	myChart.setOption(option);

    $(".projectTit").on("click", function () {
        var $this = $(this);
        var data = $this.data();
        var html =
            '<div id="qrCode">\
                 <p>如果您需要查看相关项目<br />请关注人人实验公众号，联系客服人员</p>\
                 <img src="../imgs/icon/qr_code_wx_renrenlab_300_300.jpg"/>\
                 <a id="close">我知道了</a>\            </div>';

        //页面层-自定义
        var layer_info = layer.open({
            type: 1,
            title: false,
            closeBtn: 0,
            shadeClose: true,
            skin: 'company_info_layer',
            content: html
        });

        $("#close").off("click").on("click", function () {
            layer.close(layer_info);
        })

    })

    // 跳转到相关项目
    function toProject() {

        var keyword = encodeURI($("#search").val());
        keyword=keyword.replace(/\+/g, "%2B");
        keyword=keyword.replace(/#/g, "%23");
        keyword=keyword.replace(/&/g, "%26");
        keyword=keyword.replace(/</g, "%3c");
        keyword=keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/kejso/morePro?pageNo=1&pageSize=10&query='+ keyword;
        window.open(URL);

    }

    // 跳转到论文页面
    function toThesis() {

        var keyword = encodeURI($("#search").val());

        keyword=keyword.replace(/\+/g, "%2B");
        keyword=keyword.replace(/#/g, "%23");
        keyword=keyword.replace(/&/g, "%26");
        keyword=keyword.replace(/</g, "%3c");
        keyword=keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/kejso/morePaper?pageNo=1&pageSize=10&query='+ keyword;
        window.open(URL);

    }

    function toInformation() {
        var keyword = encodeURI($("#search").val());

        keyword=keyword.replace(/\+/g, "%2B");
        keyword=keyword.replace(/#/g, "%23");
        keyword=keyword.replace(/&/g, "%26");
        keyword=keyword.replace(/</g, "%3c");
        keyword=keyword.replace(/>/g, "%3e");

        var URL = BASE_URL + '/front/kejso/moreRelatedInfo?pageNo=1&pageSize=10&query='+ keyword;

        window.open(URL);

    }


    function toSearchFromSuper(keywords) {

        var URL = BASE_URL + "/instrument/search?keyword=" + encodeURI(keywords) + "&pageNo=1&pageSize=10";

        var address = getCurremtAdress();

        if (address !== -1) {
            if(address === "北京") {
                CUR_PROVINCE = "北京市";
            } else if(address === "上海"){
                CUR_PROVINCE = "上海";
            } else if(address === "重庆"){
                CUR_PROVINCE = "重庆";
            }else if(address === "天津"){
                CUR_PROVINCE = "天津";
            }else {
                if(address !== "全国") {
                    CUR_CITY = address;
                }
            }


            if (CUR_PROVINCE !== null) {
                // province
                // formData.province = CUR_PROVINCE;
                URL = URL + "&province=" + CUR_PROVINCE
            }

            if (CUR_CITY !== null) {
                // city
                // formData.city = CUR_CITY;
                URL = URL + "&city=" + CUR_CITY
            }
        }
        window.open(URL);
    }
</script>
<script src="${rlab}/front/js/view/goods_list.js?v_=20170622"></script>

</body>
</html>