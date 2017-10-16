package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.SessionHistory;
import org.springframework.stereotype.Repository;

/**
 * 会话历史
 */
@Repository
public interface SessionHistoryDao {

    int deleteByPrimaryKey(Long id);

    int insert(SessionHistory record);

    SessionHistory selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SessionHistory record);

    int updateByPrimaryKey(SessionHistory record);

    /**
     * 插入会话
     *
     * @param sessionHistory
     * @return int
     */
    int insertSelective(SessionHistory sessionHistory);


    /**
     * 会话最后一次更新时间
     *
     * @param ssId
     * @return
     */
    SessionHistory selectLastSessionHistory(Long ssId);
}