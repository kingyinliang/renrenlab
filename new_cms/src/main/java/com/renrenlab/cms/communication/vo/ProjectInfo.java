package com.renrenlab.cms.communication.vo;

import java.io.Serializable;

/**
 * 项目表
 */
public class ProjectInfo implements Serializable {

	private static final long serialVersionUID = -4473330838159827930L;

	public Long getPjId() {
        return pjId;
    }

    public void setPjId(Long pjId) {
        this.pjId = pjId;
    }

    public String getPjName() {
        return pjName;
    }

    public void setPjName(String pjName) {
        this.pjName = pjName;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    private Long pjId;

    private String pjName;

    private Long uId;
}