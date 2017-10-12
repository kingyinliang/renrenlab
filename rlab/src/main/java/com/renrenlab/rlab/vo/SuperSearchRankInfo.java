package com.renrenlab.rlab.vo;

import java.util.List;
import java.util.Map;

/**
 * 机构排名 人物排名2.0
 */
public class SuperSearchRankInfo {

	/**
     * map中数据格式
	 * "priorRankScore": 0,
	 * "score": 1,
	 * "ysNum": 0,
	 * "name": "王炜,南京大学",
	 * "baseNum": 0,
	 * "projectNum": 0,
	 * "nsfcScore": 0,
	 * "projectLevelScore": 0,
	 *　"dcScore": 0,
	 *　"first": "王炜,南京大学",
	 * "second": 1
	 */
    private List<Map<String,Object>> peoplerank;

	/**
	 * map中数据格式
	 * "priorRankScore": 0,
	 * "score": 1,
	 * "ysNum": 0,
	 * "name": "南京大学",
	 * "baseNum": 0,
	 * "projectNum": 0,
	 * "nsfcScore": 0,
	 * "projectLevelScore": 0,
	 *　"dcScore": 0,
	 *　"first": "南京大学",
	 * "second": 1
	 */
    private List<Map<String,Object>> orgrank;

	public List<Map<String, Object>> getPeoplerank() {
		return peoplerank;
	}

	public void setPeoplerank(List<Map<String, Object>> peoplerank) {
		this.peoplerank = peoplerank;
	}

	public List<Map<String, Object>> getOrgrank() {
		return orgrank;
	}

	public void setOrgrank(List<Map<String, Object>> orgrank) {
		this.orgrank = orgrank;
	}

	@Override
	public String toString() {
		return "SuperSearchRankInfo{" +
				"peoplerank=" + peoplerank +
				", orgrank=" + orgrank +
				'}';
	}
}
