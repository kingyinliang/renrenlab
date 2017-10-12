package com.renrenlab.rlab.vo;

import java.util.List;
import java.util.Map;

/**
 * 高级搜索可能感兴趣的领域2.0
 */
public class SuperSearchRelatedInfo {

	/**
	 * map中数据格式 paper
	 "brief": "<font style='color:red'>蛋白质</font>二级结构与<font style='color:red'>蛋白质</font>三级结构及<font style='color:red'>蛋白质</font>功能密切相关,是生物信息学研究的热点,其中概率图模型隐马尔可夫算法(HMM)是该领域研究的重要工具.但是在实际应用中,存在着HMM训...",
	 "briefen": null,
	 "workspace": "内蒙古民族大学计算机科学与技术学院,内蒙古通辽,028043 河北科技大学理学院,河北石家庄,050018 内蒙古民族大学计算机科学与技术学院,内蒙古通辽028043;河北科技大学理学院,河北石家庄050018",
	 "keywords": null,
	 "year": "2016",
	 "title": " <font style='color:red'>蛋白质</font>二级结构预测概率图模型的改进 ",
	 "url": "http://d.wanfangdata.com.cn/Periodical/hbkjdx201602009",
	 "journal": "河北科技大学学报 ISTICPKU",
	 "journalen": null,
	 "titleen": null,
	 "keywordsen": null,
	 "id": "473865",
	 "authors": ["赵凌琪","朱丽娟","王柯静","董小庆","张屹"]
	 *
	 * map中project格式
	 * "brief": "","leader": ["林圣彩"],"proType": null,"year": "2014","subject": null,"pid": null,"summaryCn": null,"source": null,"title": "自噬东北亚学术研讨会",
	 * "keywordsCn": null,"summaryEn": null,"fund": null,"keywordsEn": null,"intro": "","leaderOnly": null,"organization": ["厦门大学"],"id": "a_579265","category": "生物物理、生物化学与分子生物学","status": null
	 */
    private List<Map<String,Object>> re;

	public List<Map<String, Object>> getRe() {
		return re;
	}

	public void setRe(List<Map<String, Object>> re) {
		this.re = re;
	}

	@Override
	public String toString() {
		return "SuperSearchRelatedInfo{" +
				"re=" + re +
				'}';
	}
}
