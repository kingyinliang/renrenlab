package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.ManagerInfo;
import com.renrenlab.rlab.model.NewRoleInfo;
import com.renrenlab.rlab.model.UrlPermission;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by guanjipeng on 2018/3/19.
 */
public interface IPermission {
    /**
     * 管理员列表
     *
     * @param keyword
     * @param roleName
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<List<ManagerInfo>> getManagerInfo(String keyword, String roleName, Integer pageNo, Integer pageSize);

    /**
     * 查询库中除超级管理员外所有角色
     *
     * @return
     */
    List<NewRoleInfo> getAllRoles();

    /**
     * 根据role_ids 查询permission_ids
     *
     * @param roleIds
     * @return
     */
    Set getPermissionByRoleIds(Set<Long> roleIds);

    Map<String, List<UrlPermission>> getAllPermission();

    /**
     * 获取管理员详情
     *
     * @param uUid
     * @return
     */
    ManagerInfo getManagerDetail(Long uUid);

    boolean addRole(NewRoleInfo roleInfo);

    boolean delRole(Long roelId);

    /**
     * 移除管理员
     *
     * @param uUid
     * @return
     */
    boolean delManager(Long uUid);

    /**
     * 添加管理员
     *
     * @param managerInfo
     */
    boolean addManager(ManagerInfo managerInfo);

    /**
     * 修改管理员信息
     *
     * @param managerInfo
     * @return
     */
    boolean modifyManager(ManagerInfo managerInfo);

    /**
     * 修改角色权限
     *
     * @param roleId
     * @param permissionIds
     * @return
     */
    boolean modifyRolePermission(Long roleId, Set<Long> permissionIds);
}
