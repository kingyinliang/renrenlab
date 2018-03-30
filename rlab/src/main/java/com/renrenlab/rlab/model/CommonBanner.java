package com.renrenlab.rlab.model;

import java.util.Date;

/**
 * 轮播配置实体类
 */
public class CommonBanner {
    private Long bId;

    private Long id;

    private Integer bSeq;

    private String bTitle;

    private String bPic;

    private String bLink;

    /**
     * 链接类型 0 不跳转 1 站内 2 站外
     */
    private Integer bLinkType;

    /**
     * 位置 0 咨讯板块 1 首页
     */
    private Integer bPosition;

    /**
     * 状态 0 停用 1 启用 2 删除
     */
    private Short bState;

    private Date creatTime;

    private Date modifyTime;

    public Long getbId() {
        return bId;
    }

    public void setbId(Long bId) {
        this.bId = bId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getbSeq() {
        return bSeq;
    }

    public void setbSeq(Integer bSeq) {
        this.bSeq = bSeq;
    }

    public String getbTitle() {
        return bTitle;
    }

    public void setbTitle(String bTitle) {
        this.bTitle = bTitle == null ? null : bTitle.trim();
    }

    public String getbPic() {
        return bPic;
    }

    public void setbPic(String bPic) {
        this.bPic = bPic == null ? null : bPic.trim();
    }

    public String getbLink() {
        return bLink;
    }

    public void setbLink(String bLink) {
        this.bLink = bLink == null ? null : bLink.trim();
    }

    public Integer getbLinkType() {
        return bLinkType;
    }

    public void setbLinkType(Integer bLinkType) {
        this.bLinkType = bLinkType;
    }

    public Integer getbPosition() {
        return bPosition;
    }

    public void setbPosition(Integer bPosition) {
        this.bPosition = bPosition;
    }

    public Short getbState() {
        return bState;
    }

    public void setbState(Short bState) {
        this.bState = bState;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}