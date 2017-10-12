package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * 科搜项目列表vo
 */
public class KejsoProListInfo {
	
	private List<KejsoProListInfo> re;

    private String leader_ims;

    private String organization_if;
    
    private String proType;
    
    private String title_cn_ais;
    
    private String year_is;
    //错误时返回
    private String status;
    //错误时返回
    private Object requestparam;

	public String getLeader_ims() {
		return leader_ims;
	}

	public void setLeader_ims(String leader_ims) {
		this.leader_ims = leader_ims;
	}

	public String getOrganization_if() {
		return organization_if;
	}

	public void setOrganization_if(String organization_if) {
		this.organization_if = organization_if;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public String getTitle_cn_ais() {
		return title_cn_ais;
	}

	public void setTitle_cn_ais(String title_cn_ais) {
		this.title_cn_ais = title_cn_ais;
	}

	public String getYear_is() {
		return year_is;
	}

	public void setYear_is(String year_is) {
		this.year_is = year_is;
	}

	public List<KejsoProListInfo> getRe() {
		return re;
	}

	public void setRe(List<KejsoProListInfo> re) {
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
		return "KejsoProListInfo [re=" + re + ", leader_ims=" + leader_ims + ", organization_if=" + organization_if
				+ ", proType=" + proType + ", title_cn_ais=" + title_cn_ais + ", year_is=" + year_is + ", status="
				+ status + ", requestparam=" + requestparam + "]";
	}

    
}
