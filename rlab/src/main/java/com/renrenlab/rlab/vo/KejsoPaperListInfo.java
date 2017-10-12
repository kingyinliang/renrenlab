package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * 科搜文献列表VO
 */
public class KejsoPaperListInfo {
	
	private List<KejsoPaperListInfo> re;
	
	/**
	 * 作者
	 */
    private String authors_ims;
    /**
	 * 论文id
	 */
    private String id;    /**
	 * 标题
	 */
    private String title_cn_s;
    /**
	 * 链接
	 */
    private String url_s;
    /**
	 * 年份
	 */
    private String year_if;
    /**
     * 关键字
     */
    private List<String> keywords;
    /**
     * 单位
     */
    private String workplace_ais;
    
    //错误时返回
    private String status;
    //错误时返回
    private Object requestparam;
    
	public String getAuthors_ims() {
		return authors_ims;
	}
	public void setAuthors_ims(String authors_ims) {
		this.authors_ims = authors_ims;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle_cn_s() {
		return title_cn_s;
	}
	public void setTitle_cn_s(String title_cn_s) {
		this.title_cn_s = title_cn_s;
	}
	public String getUrl_s() {
		return url_s;
	}
	public void setUrl_s(String url_s) {
		this.url_s = url_s;
	}
	public String getYear_if() {
		return year_if;
	}
	public void setYear_if(String year_if) {
		this.year_if = year_if;
	}
	public List<String> getKeywords() {
		return keywords;
	}
	public void setKeywords(List<String> keywords) {
		this.keywords = keywords;
	}
	public String getWorkplace_ais() {
		return workplace_ais;
	}
	public void setWorkplace_ais(String workplace_ais) {
		this.workplace_ais = workplace_ais;
	}
	
	public List<KejsoPaperListInfo> getRe() {
		return re;
	}
	public void setRe(List<KejsoPaperListInfo> re) {
		this.re = re;
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
		return "KejsoPaperListInfo [re=" + re + ", authors_ims=" + authors_ims + ", id=" + id + ", title_cn_s="
				+ title_cn_s + ", url_s=" + url_s + ", year_if=" + year_if + ", keywords=" + keywords
				+ ", workplace_ais=" + workplace_ais + ", status=" + status + ", requestparam=" + requestparam + "]";
	}
    

}
