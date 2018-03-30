package com.renrenlab.rlab.vo;

/**
 * 后台首页统计信息VO
 */
public class BgHomeInfo {

    private Integer count;
    private String time;
    private String before;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getBefore() {
        return before;
    }

    public void setBefore(String before) {
        this.before = before;
    }
}
