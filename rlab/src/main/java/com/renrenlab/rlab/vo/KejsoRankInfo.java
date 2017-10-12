package com.renrenlab.rlab.vo;

/**
 * 科搜排名vo
 */
public class KejsoRankInfo {

    private String first;
    
    private Integer second;

	public String getFirst() {
		return first;
	}

	public void setFirst(String first) {
		this.first = first;
	}

	public Integer getSecond() {
		return second;
	}

	public void setSecond(Integer second) {
		this.second = second;
	}

	@Override
	public String toString() {
		return "KejsoRankInfo [first=" + first + ", second=" + second + "]";
	}
    
    

}
