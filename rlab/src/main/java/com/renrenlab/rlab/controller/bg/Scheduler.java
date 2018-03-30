package com.renrenlab.rlab.controller.bg;

import com.renrenlab.rlab.service.IComonService;
import com.renrenlab.rlab.service.IPVService;
import com.renrenlab.rlab.service.RequirementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by guanjipeng on 2017/8/9.
 */
@Component
public class Scheduler {

    @Autowired
    RequirementService requirementService;
    @Autowired
    IPVService ipvService;
    @Autowired
    IComonService comonService;


    /**
     * 1.若需求还剩3天过期，则上午十点给用户发信息提醒
     * 2.若需求已延长过一次有效期，还剩3天的时候仍然发短信给用户
     */
    @Scheduled(cron = "0 0 10 * * ? ")
    public void sendMess() {
//        System.out.println("---------------定时器");
        requirementService.getOutDate();
    }

    /**
     * 每晚23:50统计数据入库
     */
    @Scheduled(cron = "0 50 23 * * ? ")
    public void addPVCount() {
        ipvService.statisticsPVCount();
        comonService.saveSearchTermToDB();
    }
}
