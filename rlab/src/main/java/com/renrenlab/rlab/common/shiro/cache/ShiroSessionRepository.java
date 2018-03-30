package com.renrenlab.rlab.common.shiro.cache;

import org.apache.shiro.session.Session;

import java.io.Serializable;
import java.util.Collection;

/**
 * @author guan
 */
public interface ShiroSessionRepository {

    /**
     * 存储Session
     *
     * @param session
     */
    void saveSession(Session session);

    /**
     * 删除session
     *
     * @param sessionId
     */
    void deleteSession(Serializable sessionId);

    /**
     * 获取session
     *
     * @param sessionId
     * @return
     */
    Session getSession(Serializable sessionId);

    /**
     * 获取所有sessoin
     *
     * @return
     */
    Collection<Session> getAllSessions();
}
