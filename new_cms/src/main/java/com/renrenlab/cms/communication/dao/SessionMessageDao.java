package com.renrenlab.cms.communication.dao;

import java.util.List;

import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.vo.MessageInfo;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import org.springframework.stereotype.Repository;

/**
 * 会话消息
 */
@Repository
public interface SessionMessageDao {
    int deleteByPrimaryKey(Long id);

    int insert(SessionMessage record);

    int insertSelective(SessionMessage record);

    SessionMessage selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(SessionMessage record);

    int updateByPrimaryKey(SessionMessage record);

    /**
     * 获取会话ID最后发送一条消息
     * @param id
     * @return
     */
    SessionMessage selectLastItemMessageBySessionId(long id);

    /**
     * 根据会话ID分页查询消息列表
     * @param sessionId
     * @return
     */
    List<MessageInfo> selectMessageBySessionId(long sessionId);

    /**
     * 获取该会话最后一条用户发来的消息
     *
     * @param sessionBriefInfo
     * @return
     */
    SessionMessage selectLastMsgBySsIdFromUser(SessionBriefInfo sessionBriefInfo);
}