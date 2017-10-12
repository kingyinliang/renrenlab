package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * 科搜相关领域Echarts图VO
 */
public class KejsoEchartsInfo {
	
    private List<KejsoEchartsLinksInfo> links;
    private List<KejsoEchartsNodesInfo> nodes;
    
	public List<KejsoEchartsLinksInfo> getLinks() {
		return links;
	}
	public void setLinks(List<KejsoEchartsLinksInfo> links) {
		this.links = links;
	}
	public List<KejsoEchartsNodesInfo> getNodes() {
		return nodes;
	}
	public void setNodes(List<KejsoEchartsNodesInfo> nodes) {
		this.nodes = nodes;
	}
	@Override
	public String toString() {
		return "KejsoEchartsListInfo [links=" + links + ", nodes=" + nodes + "]";
	}

    

}
