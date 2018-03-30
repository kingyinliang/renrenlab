package com.renrenlab.rlab.model;

import java.time.LocalDateTime;

public class KeywordInfo {

    private Long kId;

    private String keyword;

    private Integer kCount;

    private LocalDateTime createTime;

    private LocalDateTime modifyTime;

    public Long getkId() {
        return kId;
    }

    public void setkId(Long kId) {
        this.kId = kId;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public Integer getkCount() {
        return kCount;
    }

    public void setkCount(Integer kCount) {
        this.kCount = kCount;
    }

    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }

    public LocalDateTime getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(LocalDateTime modifyTime) {
        this.modifyTime = modifyTime;
    }
}