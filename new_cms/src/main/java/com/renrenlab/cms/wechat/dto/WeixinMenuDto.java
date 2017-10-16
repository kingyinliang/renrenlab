package com.renrenlab.cms.wechat.dto;

import java.util.ArrayList;
import java.util.List;

public class WeixinMenuDto {
	private String name;
	private String key;
	private String type;
	private String url;
	private List<WeixinMenuDto> sub_button = new ArrayList<WeixinMenuDto>();
	private Long id;
	
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<WeixinMenuDto> getSub_button() {
		return sub_button;
	}
	public void setSub_button(List<WeixinMenuDto> sub_button) {
		this.sub_button = sub_button;
	}
}
