package com.renrenlab.cms.communication.vo;

/**
 * 会话id、用户id、会话状态ss_chatting
 *
 * Created by lihongxun on 2017/4/9.
 */
public class SessionBriefInfo {

    /**
     * 会话id
     */
    private long ssId;

    /**
     * 用户id
     */
    private long uId;

    private int ssState;

    private int ssChatting;

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

    public int getSsState() {
        return ssState;
    }

    public void setSsState(int ssState) {
        this.ssState = ssState;
    }

    public int getSsChatting() {
        return ssChatting;
    }

    public void setSsChatting(int ssChatting) {
        this.ssChatting = ssChatting;
    }
}
