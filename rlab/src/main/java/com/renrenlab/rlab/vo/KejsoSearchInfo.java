package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * 科搜搜索vo
 */
public class KejsoSearchInfo {

    private String average_count;

    private String core;
    
    private Integer fieldsFlag;
    //科研人员排名
    private List<KejsoRankInfo> finalAuthorList;
    //机构排名
    private List<KejsoRankInfo> finalWorkplaceList;
    //文献列表
    private List<KejsoPaperListInfo> paperlist;
    //项目列表
    private List<KejsoProListInfo> prolist;
    //原查询词
    private String query;
    //推荐词条
    private List<String> relatedFields_word2vec;
    //错误时返回
    private String status;
    //错误时返回
    private Object requestparam;
    
   //相关领域，echarts 格式
    private KejsoEchartsInfo similarFields;
    
    //相关资讯，单独赋值
    private List<KejsoRelatedInfo> relatedInfo;
    
    
	public String getAverage_count() {
		return average_count;
	}
	public void setAverage_count(String average_count) {
		this.average_count = average_count;
	}
	public String getCore() {
		return core;
	}
	public void setCore(String core) {
		this.core = core;
	}
	public Integer getFieldsFlag() {
		return fieldsFlag;
	}
	public void setFieldsFlag(Integer fieldsFlag) {
		this.fieldsFlag = fieldsFlag;
	}
	public List<KejsoRankInfo> getFinalAuthorList() {
		return finalAuthorList;
	}
	public void setFinalAuthorList(List<KejsoRankInfo> finalAuthorList) {
		this.finalAuthorList = finalAuthorList;
	}
	public List<KejsoRankInfo> getFinalWorkplaceList() {
		return finalWorkplaceList;
	}
	public void setFinalWorkplaceList(List<KejsoRankInfo> finalWorkplaceList) {
		this.finalWorkplaceList = finalWorkplaceList;
	}
	public List<KejsoPaperListInfo> getPaperlist() {
		return paperlist;
	}
	public void setPaperlist(List<KejsoPaperListInfo> paperlist) {
		this.paperlist = paperlist;
	}
	public List<KejsoProListInfo> getProlist() {
		return prolist;
	}
	public void setProlist(List<KejsoProListInfo> prolist) {
		this.prolist = prolist;
	}
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	public List<String> getRelatedFields_word2vec() {
		return relatedFields_word2vec;
	}
	public void setRelatedFields_word2vec(List<String> relatedFields_word2vec) {
		this.relatedFields_word2vec = relatedFields_word2vec;
	}
	public KejsoEchartsInfo getSimilarFields() {
		return similarFields;
	}
	public void setSimilarFields(KejsoEchartsInfo similarFields) {
		this.similarFields = similarFields;
	}
	
	public List<KejsoRelatedInfo> getRelatedInfo() {
		return relatedInfo;
	}
	public void setRelatedInfo(List<KejsoRelatedInfo> relatedInfo) {
		this.relatedInfo = relatedInfo;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Object getRequestparam() {
		return requestparam;
	}
	public void setRequestparam(Object requestparam) {
		this.requestparam = requestparam;
	}
	@Override
	public String toString() {
		return "KejsoSearchInfo [average_count=" + average_count + ", core=" + core + ", fieldsFlag=" + fieldsFlag
				+ ", finalAuthorList=" + finalAuthorList + ", finalWorkplaceList=" + finalWorkplaceList + ", paperlist="
				+ paperlist + ", prolist=" + prolist + ", query=" + query + ", relatedFields_word2vec="
				+ relatedFields_word2vec + ", status=" + status + ", requestparam=" + requestparam + ", similarFields="
				+ similarFields + ", relatedInfo=" + relatedInfo + "]";
	}
   
    
}
