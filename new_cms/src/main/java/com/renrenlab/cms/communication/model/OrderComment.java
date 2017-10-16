package com.renrenlab.cms.communication.model;

import java.io.Serializable;
import java.util.Date;

public class OrderComment implements Serializable {

	private static final long serialVersionUID = -3979953295930737555L;

	private Long id;

    private Long cmId;

    private Integer cmScore;

    private String cmContent;

    private Long oId;

    private Long uUid;

    private Integer cmUType;

    private Date createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCmId() {
		return cmId;
	}

	public void setCmId(Long cmId) {
		this.cmId = cmId;
	}

	public Integer getCmScore() {
		return cmScore;
	}

	public void setCmScore(Integer cmScore) {
		this.cmScore = cmScore;
	}

	public String getCmContent() {
		return cmContent;
	}

	public void setCmContent(String cmContent) {
		this.cmContent = cmContent;
	}

	public Long getoId() {
		return oId;
	}

	public void setoId(Long oId) {
		this.oId = oId;
	}

	public Long getuUid() {
		return uUid;
	}

	public void setuUid(Long uUid) {
		this.uUid = uUid;
	}

	public Integer getCmUType() {
		return cmUType;
	}

	public void setCmUType(Integer cmUType) {
		this.cmUType = cmUType;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


}