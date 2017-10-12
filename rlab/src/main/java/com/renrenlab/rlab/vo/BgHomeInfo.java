package com.renrenlab.rlab.vo;

import java.util.Date;

/**
 * 后台首页统计信息VO
 */
public class BgHomeInfo {

    private Integer count;
    private Date time;
    private String before;

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getBefore() {
        return before;
    }

    public void setBefore(String before) {
        this.before = before;
    }
}
