package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.ManagerInfo;
import com.renrenlab.rlab.model.NewRoleInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface NewUserRoleDao {

    ManagerInfo getUserRoleByUuid(Long uUid);

    //根据u_uid 获取所有permissison_id
    Set getPermissionIds(Long uUid);

    //根据role_id 查询权限permissison_id
    List getPermissionByRoleIds(@Param("roleIds") Set<Long> roleIds);

    Set getPermissionNames(@Param("permissionIds") Set<Long> permissionIds);

    //根据用户角色id 查询角色名称
    List<NewRoleInfo> getRoleInfoByRoleIds(@Param("roleIds") Set roleIds);

    //查询库中除超级管理员外所有角色
    List<NewRoleInfo> getAllRoles();

    //获取管理员信息
    List<ManagerInfo> getManagerInfo(@Param("keyword") String keyword, @Param("roleId") String roleId);

    ManagerInfo getManagerDetail(@Param("uUid") Long uUid);

    //添加管理员
    int addManager(ManagerInfo record);

    //检查该工号是否存在
    int isExist(@Param("jobNum") String jobNum, @Param("uUid") Long uUid);

    //添加角色
    int addRole(NewRoleInfo roleInfo);

    int delRole(Long roleId);

    //检查该角色id 是否存在
    int rolePermissionCount(@Param("roleId") Long roleId);

    //根据角色修改权限
    int modifyRolePermission(@Param("roleId") Long roleId, @Param("permissionIds") String permissionIds);

    //插入角色 权限
    int insertRolePermission(@Param("roleId") Long roleId, @Param("permissionIds") String permissionIds);

    /**
     * 修改管理员信息
     *
     * @param record
     * @return
     */
    int modifyManager(ManagerInfo record);

    int deleteManager(@Param("uUid") Long uUid);
}