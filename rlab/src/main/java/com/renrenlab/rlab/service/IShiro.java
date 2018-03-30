package com.renrenlab.rlab.service;

import java.util.Map;
import java.util.Set;

/**
 * Created by guanjipeng on 2018/3/13.
 */
public interface IShiro {
    /**
     * 初始化拦截路径
     *
     * @return
     */
    Map getFilterMap();

    /**
     * 根据用户id获取所有用户角色
     *
     * @param uUid
     * @return
     */
    Set getUserRoles(Long uUid);

    /**
     * 根据用户id获取所有权限
     *
     * @param uUid
     * @return
     */
    Set getUserPermissions(Long uUid);


}
