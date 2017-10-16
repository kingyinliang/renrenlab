package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.SessionHistory;

/**
 * 会话历史
 *
 * Created by lihongxun on 2017/5/23.
 */
public interface ISessionHistoryService {

    /**
     * 会话最后一次更新时间
     *
     * @param ssId
     * @return
     */
    SessionHistory selectLast(Long ssId);

    /**
     * 会话历史插入
     *
     * @param sessionHistory
     * @return int
     */
    int insertSelective(SessionHistory sessionHistory);

}
