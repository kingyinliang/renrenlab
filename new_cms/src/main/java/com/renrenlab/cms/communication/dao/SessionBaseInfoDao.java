package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.SessionBaseInfo;
import com.renrenlab.cms.communication.vo.SessionBriefInfo;
import com.renrenlab.cms.communication.vo.SessionInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SessionBaseInfoDao {


    //TODO 返回值问题
    int insertSelective(SessionBaseInfo record);

    SessionBaseInfo selectByPrimaryKey(Long id);


	SessionBaseInfo selectByUId(Long uid);


    /**
     * 根据SESSIONID查询会话
     *
     * @param id
     * @return
     */
    SessionBaseInfo selectBySsId(Long id);

    /**
     * 根据客服id查询该客服接待人数
     *
     * @param cs_id
     * @return
     */
    Long selectByCsId(Long cs_id);

    /**
     * 客服ID分页查询会话列表
     *
     * @param id
     * @return
     */
    List<SessionInfo> selectSessionsByCsId(Long id);

    /**
     * 查询待接入会话
     * @return
     */
    List<SessionInfo> selectSessionIsWaitJoinUp();

    /**
     * 通过会话ID选择性更新会话
     *
     * @param session
     * @return
     */
    int updateSession(SessionBaseInfo session);

    /**
     * 获取所有会话Id
     *
     * @return
     */
    List<SessionBriefInfo> selectAllSsId();
}