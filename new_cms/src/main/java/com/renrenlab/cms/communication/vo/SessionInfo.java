package com.renrenlab.cms.communication.vo;

import java.util.Date;

public class SessionInfo {

    private long ssId;

    private long uId;

    private long csId;

    private int ssState;

    private int ssSource;

    private String uNickname;

    private String uAvatar;

    private String msgBody;

    private int msgType;

    private Date msgTime;

    private Long unRead;

    public long getSsId() {
        return ssId;
    }

    public void setSsId(long ssId) {
        this.ssId = ssId;
    }

    public long getuId() {
        return uId;
    }

    public void setuId(long uId) {
        this.uId = uId;
    }

    public long getCsId() {
        return csId;
    }

    public void setCsId(long csId) {
        this.csId = csId;
    }

    public int getSsState() {
        return ssState;
    }

    public void setSsState(int ssState) {
        this.ssState = ssState;
    }

    public int getSsSource() {
        return ssSource;
    }

    public void setSsSource(int ssSource) {
        this.ssSource = ssSource;
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

    public Date getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(Date msgTime) {
        this.msgTime = msgTime;
    }

    public String getMsgBody() {
        return msgBody;
    }

    public void setMsgBody(String msgBody) {
        this.msgBody = msgBody;
    }

    public int getMsgType() {
        return msgType;
    }

    public void setMsgType(int msgType) {
        this.msgType = msgType;
    }

    public Long getUnRead() {
        return unRead;
    }

    public void setUnRead(Long unRead) {
        this.unRead = unRead;
    }
}
