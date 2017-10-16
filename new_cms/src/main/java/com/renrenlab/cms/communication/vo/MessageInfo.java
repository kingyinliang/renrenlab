package com.renrenlab.cms.communication.vo;

import java.io.Serializable;
import java.util.Date;

public class MessageInfo implements Serializable{

	private static final long serialVersionUID = 1220793821693992277L;

    private Long msgFrom;

    private Integer msgState;

    private String msgBody;

    private Date msgTime;
    
    private String uNickname;
    
    private String uAvatar;
    
    private String csAvatar;

	public Long getMsgFrom() {
		return msgFrom;
	}

	public void setMsgFrom(Long msgFrom) {
		this.msgFrom = msgFrom;
	}

	public Integer getMsgState() {
		return msgState;
	}

	public void setMsgState(Integer msgState) {
		this.msgState = msgState;
	}

	public String getMsgBody() {
		return msgBody;
	}

	public void setMsgBody(String msgBody) {
		this.msgBody = msgBody;
	}

	public Date getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Date msgTime) {
		this.msgTime = msgTime;
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

	public String getCsAvatar() {
		return csAvatar;
	}

	public void setCsAvatar(String csAvatar) {
		this.csAvatar = csAvatar;
	}
}
