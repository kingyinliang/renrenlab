package com.renrenlab.cms.wechat.quartz;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.renrenlab.cms.common.util.DuplicateMessageUtil;


public class ClearDuplicateMessageJob extends QuartzJobBean {

    @Override
    protected void executeInternal(JobExecutionContext arg0)
            throws JobExecutionException {
        DuplicateMessageUtil.clear();
    }

}
