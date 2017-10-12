			var myChart = echarts.init(document.getElementById('echartsView'));

			var option = {
				title: {
					text: ""
				},
				tooltip: {},
				animationDurationUpdate: 1500,
				animationEasingUpdate: 'quinticInOut',
				label: {
					normal: {
						show: true,
						textStyle: {
							fontSize: 12
						},
					}
				},
				legend: {
					x: "center",
					show: false,
					data: ["朋友", "战友", '亲戚']
				},
				series: [

					{
						type: 'graph',
						layout: 'force',
						symbolSize: 50,
						focusNodeAdjacency: true,
						roam: true,
						categories: [{
							name: '朋友',
							itemStyle: {
								normal: {
									color: "#009800",
								}
							}
						}, {
							name: '战友',
							itemStyle: {
								normal: {
									color: "#4592FF",
								}
							}
						}, {
							name: '亲戚',
							itemStyle: {
								normal: {
									color: "#3592F",
								}
							}
						}],
						label: {
							normal: {
								show: true,
								textStyle: {
									fontSize: 12
								},
							}
						},
						force: {
							repulsion: 700
						},
						edgeSymbolSize: [4, 50],
						edgeLabel: {
							normal: {
								show: true,
								textStyle: {
									fontSize: 10
								},
								formatter: "{c}"
							}
						},
						data: [ {
					        "category": "0",
					        "name": "蛋白质",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "脂肪",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "碳水化合物",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "维他命",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "含量",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "糖类",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "矿物质",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "核酸",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "粗纤维",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "营养价值",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "生物价",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "直链淀粉",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "组织损伤",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "单宁酸",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "蛋白",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "脂质",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "摄入",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "稠度",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "视黄酸",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "无机盐",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "可食部分",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "营养物质",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "多肽",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "鸡蛋",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "小麦面粉",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "干基",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "微量元素",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "消化率",
					        "value": 100
					      },
					      {
					        "category": "3",
					        "name": "营养素",
					        "value": 100
					      }],
						links: [ {
					        "source": 1,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 2,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 3,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 4,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 5,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 6,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 7,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 8,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 9,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 10,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 11,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 12,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 13,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 14,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 15,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 16,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 17,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 18,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 19,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 20,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 21,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 22,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 23,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 24,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 25,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 26,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 27,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 28,
					        "target": 0,
					        "weight": 1
					      },
					      {
					        "source": 29,
					        "target": 0,
					        "weight": 1
					      }],
						lineStyle: {
							normal: {
								opacity: 0.9,
								width: 1,
								curveness: 0
							}
						}
					}
				]
			};
			
			myChart.setOption(option);