package com.renrenlab.cms.communication.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

/**
 * 定时更新会话状态
 *
 * Created by lihongxun on 2017/4/8.
 */
public class RefreshSessionStatusJob extends QuartzJobBean {

    private RefreshSessionStatusTask refreshSessionStatusTask = null;

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        refreshSessionStatusTask.refreshStatus();
    }

    public void setRefreshSessionStatusTask(RefreshSessionStatusTask refreshSessionStatusTask) {
        this.refreshSessionStatusTask = refreshSessionStatusTask;
    }

    public RefreshSessionStatusTask getRefreshSessionStatusTask() {
        return refreshSessionStatusTask;
    }

}
