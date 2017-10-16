package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.SessionMessage;
import com.renrenlab.cms.communication.vo.MessageTmpInfo;

import java.util.List;

/**
 * 临时消息
 *
 * Created by lihongxun on 2017/5/17.
 */
public interface ISessionMessageTmpService {

    /**
     * 快速获取临时消息
     *
     * @param sessionId
     * @return
     * @throws Exception
     */
    List<MessageTmpInfo> quickQuery(long sessionId) throws Exception;

    /**
     * 根据会话Id选取最后一条消息
     *
     * @param ssId
     * @return
     */
    SessionMessage selectLastMsgBySsId(Long ssId);

}
