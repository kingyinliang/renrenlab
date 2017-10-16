package com.renrenlab.cms.communication.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import com.renrenlab.cms.communication.vo.SessionInfo;

/**
 * 会话
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface ISessionBaseInfoService {

    /**
     * 会话接入
     *
     * @param sessionId
     * @throws Exception
     */
    void joinup(long sessionId, long csId);

    /**
     * 分页查询会话
     *
     * @param csId
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    PageInfo<SessionInfo> list(long csId, int pageNo, int pageSize) throws Exception;

    /**
     * 分页查询待接入会话
     *
     * @param pageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    PageInfo<SessionInfo> listWaitUpSession(int pageNo, int pageSize) throws Exception;

    /**
     * 通过SESSIONID选择性更新会话
     * @param session
     * @return
     */
    int updateBySsIdSelective(SessionBaseInfo session);

    /**
     * 获取所有会话信息
     *
     * @return
     */
    java.util.List<SessionBriefInfo> selectAllSsId();

    /**
     * 根据会话Id更新会话信息
     *
     * @param session
     * @return
     */
    int updateBySsId(SessionBaseInfo session);
}
