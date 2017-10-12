package com.renrenlab.rlab.vo;

import java.util.List;
import java.util.Map;

/**
 * 相关资讯2.0
 */
public class SuperSearchNewsInfo {

	/**
     * map中数据格式
	 * "title": "<font style='color:red'>质谱仪</font>",
	 * "content": "    2011-04-29 版权所有：南京医科大学分析测试中心 地址：南京市汉中路140号 联系电话：025-86868686",
	 * "url": "http://fxcszx.njmu.edu.cn/s/55/t/175/3b/b8/info15288.htm"
	 */
    private List<Map<String,Object>> fieldnews;

	public List<Map<String, Object>> getFieldnews() {
		return fieldnews;
	}

	public void setFieldnews(List<Map<String, Object>> fieldnews) {
		this.fieldnews = fieldnews;
	}

	@Override
	public String toString() {
		return "SuperSearchNewsInfo{" +
				"fieldnews=" + fieldnews +
				'}';
	}
}
