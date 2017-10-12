package com.renrenlab.rlab.vo;

/**
 * 科搜相关领域Echarts图links VO
 */
public class KejsoEchartsLinksInfo {
	
    private Integer source;
    private Integer target;
    private Integer weight;
	public Integer getSource() {
		return source;
	}
	public void setSource(Integer source) {
		this.source = source;
	}
	public Integer getTarget() {
		return target;
	}
	public void setTarget(Integer target) {
		this.target = target;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	@Override
	public String toString() {
		return "KejsoEchartsLinksInfo [source=" + source + ", target=" + target + ", weight=" + weight + "]";
	}

    

}
