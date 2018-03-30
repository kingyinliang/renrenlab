package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.LeaveMessageInfo;

/**
 * Created by renrenlab on 18/3/12.
 */
public interface LeaveMessageService {
    PageInfo<LeaveMessageInfo> list(String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order);

    Integer updateState(Integer messageId, Integer state, String operator);

    Integer addMessage(LeaveMessageInfo leaveMessageInfo);
}
