package com.renrenlab.rlab.controller;

import com.renrenlab.rlab.service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by guanjipeng on 2017/8/9.
 */
@Component
public class BgReqScheduler {

    @Autowired
    private RequirementService requirementService;

    /**
     * 1.若需求还剩3天过期，则上午十点给用户发信息提醒
     * 2.若需求已延长过一次有效期，还剩3天的时候仍然发短信给用户
     */
    @Scheduled(cron = "0 0 10 * * ? ")
    public void sendMess() {
//        System.out.println("---------------定时器");
        requirementService.getOutDate();
    }
}
