package com.renrenlab.rlab.vo;

import java.util.List;

/**
 * 科搜相关咨询列表VO
 */
public class KejsoRelatedInfo {
	
	private List<KejsoRelatedInfo> re;

    private String _version_;
    private String boost;
    private String content;
    private String digest;
    private String host;
    private String id;
    private String segment;
    private String signature;
    private String title;
    private String tstamp;
    private String url;
    //错误时返回
    private String status;
    //错误时返回
    private Object requestparam;
    
	public String get_version_() {
		return _version_;
	}
	public void set_version_(String _version_) {
		this._version_ = _version_;
	}
	public String getBoost() {
		return boost;
	}
	public void setBoost(String boost) {
		this.boost = boost;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDigest() {
		return digest;
	}
	public void setDigest(String digest) {
		this.digest = digest;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSegment() {
		return segment;
	}
	public void setSegment(String segment) {
		this.segment = segment;
	}
	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTstamp() {
		return tstamp;
	}
	public void setTstamp(String tstamp) {
		this.tstamp = tstamp;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	public List<KejsoRelatedInfo> getRe() {
		return re;
	}
	public void setRe(List<KejsoRelatedInfo> re) {
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
		return "KejsoRelatedInfo [re=" + re + ", _version_=" + _version_ + ", boost=" + boost + ", content=" + content
				+ ", digest=" + digest + ", host=" + host + ", id=" + id + ", segment=" + segment + ", signature="
				+ signature + ", title=" + title + ", tstamp=" + tstamp + ", url=" + url + ", status=" + status
				+ ", requestparam=" + requestparam + "]";
	}
    

}
