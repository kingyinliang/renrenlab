package com.renrenlab.rlab.model;

import java.util.List;

/**
 * 仪器分类
 */
public class InstrumentCategory {
    private Long id;

    private Integer level;

    private String insCategory;

    private String categoryName;

    private String href;

    private String parentCode;

    private Short com;

    private List<InstrumentCategory> categoryList;

    public List<InstrumentCategory> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<InstrumentCategory> categoryList) {
        this.categoryList = categoryList;
    }

    @Override
    public String toString() {
        return "InstrumentCategory{" +
                "id=" + id +
                ", level=" + level +
                ", insCategory='" + insCategory + '\'' +
                ", categoryName='" + categoryName + '\'' +
                ", href='" + href + '\'' +
                ", parentCode='" + parentCode + '\'' +
                ", com=" + com +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getInsCategory() {
        return insCategory;
    }

    public void setInsCategory(String insCategory) {
        this.insCategory = insCategory == null ? null : insCategory.trim();
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href == null ? null : href.trim();
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode == null ? null : parentCode.trim();
    }

    public Short getCom() {
        return com;
    }

    public void setCom(Short com) {
        this.com = com;
    }
}