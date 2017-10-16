package com.renrenlab.cms.wechat.dto;

public class DuplicateMessageDto {
    private String fromUserName;
    private String createTime;
    private Long curTime;
    private String msgId;
    private String rel;

    public Long getCurTime() {
        return curTime;
    }

    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public void setCurTime(Long curTime) {
        this.curTime = curTime;
    }

    public String getFromUserName() {
        return fromUserName;
    }

    public void setFromUserName(String fromUserName) {
        this.fromUserName = fromUserName;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }


    public String getRel() {
        return rel;
    }

    public void setRel(String rel) {
        this.rel = rel;
    }

    public DuplicateMessageDto() {
    }

    public DuplicateMessageDto(String fromUserName, String createTime,String msgId) {
        super();
        this.fromUserName = fromUserName;
        this.msgId = msgId;
        this.createTime = createTime;
        this.curTime = System.currentTimeMillis();
        this.rel = null;
    }

    @Override
    public boolean equals(Object obj) {
        DuplicateMessageDto dm = (DuplicateMessageDto) obj;
        if (dm.getMsgId()!=null){
            if(dm.getMsgId().equals(this.getMsgId())){
                return true;
            }
            return false;
        }
        if (dm.getCreateTime().equals(this.getCreateTime()) && (dm.getFromUserName()).equals(this.getFromUserName())) {
            return true;
        }
        return false;
    }
}
