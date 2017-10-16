package com.renrenlab.cms.communication.service.impl;

import com.renrenlab.cms.communication.dao.SessionHistoryDao;
import com.renrenlab.cms.communication.model.SessionHistory;
import com.renrenlab.cms.communication.service.ISessionHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 会话历史
 *
 * Created by lihongxun on 2017/5/23.
 */
@Service
public class SessionHistoryServiceImpl implements ISessionHistoryService {

    @Autowired
    private SessionHistoryDao sessionHistoryDao;

    /**
     * 选取最后一条
     *
     * @param ssId
     * @return
     */
    @Override
    public SessionHistory selectLast(Long ssId) {
        return sessionHistoryDao.selectLastSessionHistory(ssId);
    }

    /**
     * 会话历史插入
     *
     * @param sessionHistory
     * @return
     */
    @Override
    public int insertSelective(SessionHistory sessionHistory) {
        return sessionHistoryDao.insertSelective(sessionHistory);
    }

}
