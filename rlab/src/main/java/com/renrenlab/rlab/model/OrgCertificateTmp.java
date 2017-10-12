package com.renrenlab.rlab.model;

import java.util.Date;

public class OrgCertificateTmp {
	
    private Long id;

    private String orgCertificateName;

    private Date createTime;

    private Date modifyTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOrgCertificateName() {
        return orgCertificateName;
    }

    public void setOrgCertificateName(String orgCertificateName) {
        this.orgCertificateName = orgCertificateName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

}