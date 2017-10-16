package com.renrenlab.cms.communication.vo;

import java.io.Serializable;
import java.util.Date;

public class MessageTmpInfo implements Serializable{

	private static final long serialVersionUID = 7304510692006312080L;
	
	private long count;//消息条数
	
	private long mtId;

    private Long mtFrom;
    
    private Long ssId;

    private String mtBody;
    
    private int mtType;

    private Date mtTime;
    
    private String uNickname;
    
    private String uAvatar;

	public Long getMtFrom() {
		return mtFrom;
	}

	public void setMtFrom(Long mtFrom) {
		this.mtFrom = mtFrom;
	}

	public Long getSsId() {
		return ssId;
	}

	public void setSsId(Long ssId) {
		this.ssId = ssId;
	}

	public String getMtBody() {
		return mtBody;
	}

	public void setMtBody(String mtBody) {
		this.mtBody = mtBody;
	}

	public Date getMtTime() {
		return mtTime;
	}

	public void setMtTime(Date mtTime) {
		this.mtTime = mtTime;
	}

	public long getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = count;
	}

	public String getuNickname() {
		return uNickname;
	}

	public void setuNickname(String uNickname) {
		this.uNickname = uNickname;
	}

	public String getuAvatar() {
		return uAvatar;
	}

	public void setuAvatar(String uAvatar) {
		this.uAvatar = uAvatar;
	}

	public long getMtId() {
		return mtId;
	}

	public void setMtId(long mtId) {
		this.mtId = mtId;
	}

	public int getMtType() {
		return mtType;
	}

	public void setMtType(int mtType) {
		this.mtType = mtType;
	}
}
