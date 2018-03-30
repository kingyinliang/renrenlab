package com.renrenlab.rlab.model;

/**
 * Created by renrenlab on 18/1/9.
 */
public class ServiceClassify {
    private Long id;
    private Long parentId;
    private String classifyName;
    private Long classifyLevel;
    private  Long classifyMap;
    private String classifyPic;

    public String getClassifyPic() {
        return classifyPic;
    }

    public void setClassifyPic(String classifyPic) {
        this.classifyPic = classifyPic;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getClassifyName() {
        return classifyName;
    }

    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }

    public Long getClassifyLevel() {
        return classifyLevel;
    }

    public void setClassifyLevel(Long classifyLevel) {
        this.classifyLevel = classifyLevel;
    }

    public Long getClassifyMap() {
        return classifyMap;
    }

    public void setClassifyMap(Long classifyMap) {
        this.classifyMap = classifyMap;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ServiceClassify that = (ServiceClassify) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (parentId != null ? !parentId.equals(that.parentId) : that.parentId != null) return false;
        if (classifyName != null ? !classifyName.equals(that.classifyName) : that.classifyName != null) return false;
        if (classifyLevel != null ? !classifyLevel.equals(that.classifyLevel) : that.classifyLevel != null)
            return false;
        return classifyMap != null ? classifyMap.equals(that.classifyMap) : that.classifyMap == null;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (parentId != null ? parentId.hashCode() : 0);
        result = 31 * result + (classifyName != null ? classifyName.hashCode() : 0);
        result = 31 * result + (classifyLevel != null ? classifyLevel.hashCode() : 0);
        result = 31 * result + (classifyMap != null ? classifyMap.hashCode() : 0);
        return result;
    }
}
