package com.renrenlab.rlab.model;

import java.io.Serializable;
import java.util.Date;

public class GeoIp implements Serializable {

    private static final long serialVersionUID = -484576968801391574L;

    private Long id;

    private Long ipId;

    private String ipFrom;

    private String ipTo;

    private Long ipFromStamp;

    private Long ipToStamp;

    private String countryShort;

    private String country;

    private Date createTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIpId() {
        return ipId;
    }

    public void setIpId(Long ipId) {
        this.ipId = ipId;
    }

    public String getIpFrom() {
        return ipFrom;
    }

    public void setIpFrom(String ipFrom) {
        this.ipFrom = ipFrom == null ? null : ipFrom.trim();
    }

    public String getIpTo() {
        return ipTo;
    }

    public void setIpTo(String ipTo) {
        this.ipTo = ipTo == null ? null : ipTo.trim();
    }

    public Long getIpFromStamp() {
        return ipFromStamp;
    }

    public void setIpFromStamp(Long ipFromStamp) {
        this.ipFromStamp = ipFromStamp;
    }

    public Long getIpToStamp() {
        return ipToStamp;
    }

    public void setIpToStamp(Long ipToStamp) {
        this.ipToStamp = ipToStamp;
    }

    public String getCountryShort() {
        return countryShort;
    }

    public void setCountryShort(String countryShort) {
        this.countryShort = countryShort == null ? null : countryShort.trim();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}