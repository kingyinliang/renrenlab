package com.renrenlab.cms.communication.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.vo.MessageInfo;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;

/**
 * 消息表
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface ISessionMessageService {

    /**
     * 添加消息
     * @param msg
     * @param sessionId
     * @throws Exception
     */
    void add(SessionMessage msg, long sessionId, long csId);

    /**
     * 根据会话ID分页查询消息
     * @param sessionId
     * @param from
     * @param max
     * @return
     * @throws Exception
     */
    PageInfo<MessageInfo> list(long csId, long sessionId, int from, int max) throws Exception;

    /**
     * 查询用户最后一条消息
     *
     * @param sessionBriefInfo
     * @return
     */
    SessionMessage selectLastMsgBySsIdFromUser(SessionBriefInfo sessionBriefInfo);

    /**
     * 根据会话Id查询最后一条消息
     *
     * @param ssId
     * @return
     */
    SessionMessage selectLastMsgBySsId(long ssId);
}
