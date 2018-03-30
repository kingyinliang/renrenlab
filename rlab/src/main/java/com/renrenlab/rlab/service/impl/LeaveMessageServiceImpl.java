package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.dao.LeaveMessageInfoDao;
import com.renrenlab.rlab.model.LeaveMessageInfo;
import com.renrenlab.rlab.service.LeaveMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by renrenlab on 18/3/12.
 */
@Service
public class LeaveMessageServiceImpl implements LeaveMessageService {
    @Autowired
    LeaveMessageInfoDao leaveMessageInfoDao;

    public PageInfo<LeaveMessageInfo> list(String keyword, Integer state, String beginTime, String endTime, Integer pageNo, Integer pageSize, String order){
        if (state != null && 99 == state)
            state = null;

        PageHelper.startPage(pageNo, pageSize);
        List<LeaveMessageInfo> infomations = leaveMessageInfoDao.selectInfoList(keyword, state, beginTime, endTime, order);
        for (LeaveMessageInfo leaveMessageInfo : infomations) {
//            infomation.setCreateTimeStr(CommonUtil.formatTime(infomation.getCreateTime()));
        }
        return new PageInfo<>(infomations);
    }

    @Override
    public Integer updateState(Integer messageId, Integer state, String operator) {
        Integer result = leaveMessageInfoDao.updateState(messageId, state, operator);
        return result;
    }

    @Override
    public Integer addMessage(LeaveMessageInfo leaveMessageInfo) {
        Integer result = leaveMessageInfoDao.insertSelective(leaveMessageInfo);
        return result;
    }
}
