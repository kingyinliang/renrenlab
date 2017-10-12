package com.renrenlab.rlab.vo;

/**
 * 科搜相关领域Echarts图node VO
 */
public class KejsoEchartsNodesInfo {
	
    private String category;
    private String  name;
    private Integer  value;
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getValue() {
		return value;
	}
	public void setValue(Integer value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "KejsoEchartsNodesInfo [category=" + category + ", name=" + name + ", value=" + value + "]";
	}

    

}
