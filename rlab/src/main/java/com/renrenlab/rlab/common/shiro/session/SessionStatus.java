package com.renrenlab.rlab.common.shiro.session;

import java.io.Serializable;

public class SessionStatus implements Serializable {
    //是否踢出 true:有效，false：踢出。
    private Boolean onlineStatus = Boolean.TRUE;


    public Boolean isOnlineStatus() {
        return onlineStatus;
    }

    public void setOnlineStatus(Boolean onlineStatus) {
        this.onlineStatus = onlineStatus;
    }


}
