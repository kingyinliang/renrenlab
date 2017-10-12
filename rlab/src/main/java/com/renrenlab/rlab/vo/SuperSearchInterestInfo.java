package com.renrenlab.rlab.vo;

import java.util.List;
import java.util.Map;

/**
 * 高级搜索可能感兴趣的领域2.0
 */
public class SuperSearchInterestInfo {

	/**
	 * map中数据格式
	 * "link": "javascript:$('#query').val('碳水化合物');myform.submit();",
	 * "weight": 100,
	 * "text": "碳水化合物",
	 * "linkCotent": "碳水化合物",
	 * "handlers": null
	 */
    private List<Map<String,Object>> recommendfield;

	public List<Map<String, Object>> getRecommendfield() {
		return recommendfield;
	}

	public void setRecommendfield(List<Map<String, Object>> recommendfield) {
		this.recommendfield = recommendfield;
	}

	@Override
	public String toString() {
		return "SuperSearchInterestInfo{" +
				"recommendfield=" + recommendfield +
				'}';
	}
}
