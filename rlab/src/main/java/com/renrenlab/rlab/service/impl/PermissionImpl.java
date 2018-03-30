package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.exception.BusinessException;
import com.renrenlab.rlab.common.exception.ResponseEntity;
import com.renrenlab.rlab.dao.NewUserRoleDao;
import com.renrenlab.rlab.dao.UrlPermissionDao;
import com.renrenlab.rlab.dao.UserBaseInfoDao;
import com.renrenlab.rlab.model.ManagerInfo;
import com.renrenlab.rlab.model.NewRoleInfo;
import com.renrenlab.rlab.model.UrlPermission;
import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.service.IPermission;
import com.renrenlab.rlab.service.UserBaseInfoService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by guanjipeng on 2018/3/19.
 */
@Service
@Transactional
public class PermissionImpl implements IPermission {
    @Autowired
    NewUserRoleDao userRoleDao;
    @Autowired
    UrlPermissionDao urlPermissionDao;
    @Autowired
    UserBaseInfoService userBaseInfoService;
    @Autowired
    UserBaseInfoDao baseInfoDao;

    @Override
    public PageInfo<List<ManagerInfo>> getManagerInfo(String keyword, String roleId, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        if (StringUtils.isBlank(keyword)) {
            keyword = null;
        }
        if (StringUtils.isBlank(roleId)) {
            roleId = null;
        }
        List<ManagerInfo> managerInfoList = userRoleDao.getManagerInfo(keyword, roleId);
        return new PageInfo(managerInfoList);
    }

    @Override
    public List<NewRoleInfo> getAllRoles() {
        return userRoleDao.getAllRoles();
    }

    @Override
    public Set getPermissionByRoleIds(Set<Long> roleIds) {
        Set<Long> set = new HashSet<>();
        if (CollectionUtils.isNotEmpty(roleIds)) {
            userRoleDao.getPermissionByRoleIds(roleIds).forEach(item -> {
                JSONArray.parseArray(item.toString()).forEach(item2 -> {
                    set.add(Long.valueOf(item2.toString()));
                });
            });
        }
        return set;
    }

    @Override
    public Map<String, List<UrlPermission>> getAllPermission() {
        List<UrlPermission> permissions = urlPermissionDao.getAllPermission();
        List<UrlPermission> queryList = new ArrayList<>();
        List<UrlPermission> modifyList = new ArrayList<>();
        List<UrlPermission> auditList = new ArrayList<>();
        List<UrlPermission> delList = new ArrayList<>();
        permissions.forEach(urlPermission -> {
            Long parentId = urlPermission.getParentId();
            if (parentId == -1) {
                //查询分组
                queryList.add(urlPermission);
            } else if (parentId == -2) {
                //修改分组
                modifyList.add(urlPermission);
            } else if (parentId == -3) {
                //审核分组
                auditList.add(urlPermission);
            } else if (parentId == -4) {
                //撤销分组
                delList.add(urlPermission);
            }
        });
        Map<String, List<UrlPermission>> map = new HashMap<>();
        map.put("query", queryList);
        map.put("modify", modifyList);
        map.put("audit", auditList);
        map.put("del", delList);
        return map;
    }

    /**
     * 获取管理员详情
     *
     * @param uUid
     * @return
     */
    @Override
    public ManagerInfo getManagerDetail(Long uUid) {
        return userRoleDao.getManagerDetail(uUid);
    }

    @Override
    public boolean addRole(NewRoleInfo roleInfo) {
        return userRoleDao.addRole(roleInfo) > 0;
    }

    @Override
    public boolean delRole(Long roleId) {
        return userRoleDao.delRole(roleId) > 0;
    }

    @Override
    public boolean delManager(Long uUid) {
        // todo 移除管理员，清除管理员session
        return userRoleDao.deleteManager(uUid) > 0;
    }

    /**
     * 添加管理员
     *
     * @param managerInfo
     */
    @Override
    public boolean addManager(ManagerInfo managerInfo) {
        asseetUUid(managerInfo);
        userRoleDao.addManager(managerInfo);
        UserBaseInfo baseInfo = new UserBaseInfo();
        baseInfo.setuUid(managerInfo.getuUid());
        baseInfo.setuName(managerInfo.getuName());
        baseInfo.setuEmail(managerInfo.getuEmail());
        return baseInfoDao.updateUserBaseInfo(baseInfo) > 0;
    }

    @Override
    public boolean modifyManager(ManagerInfo managerInfo) {
        return userRoleDao.modifyManager(managerInfo) > 0;
    }

    /**
     * 修改角色权限
     *
     * @param roleId
     * @param permissionIds
     * @return
     */
    @Override
    public boolean modifyRolePermission(Long roleId, Set<Long> permissionIds) {
        //如果该角色不存在则添加，如果存在则修改
        int count = userRoleDao.rolePermissionCount(roleId);
        if (count > 0) {
            return userRoleDao.modifyRolePermission(roleId, permissionIds.toString()) > 0;
        } else {
            return userRoleDao.insertRolePermission(roleId, permissionIds.toString()) > 0;
        }
    }


    /**
     * 检查该用户是否存在
     *
     * @param managerInfo
     */
    private void asseetUUid(ManagerInfo managerInfo) {
        //根据电话检索u_uid是否存在
        UserBaseInfo baseInfo = userBaseInfoService.searchUserBaseInfoByMobile(managerInfo.getuMobile());
        if (baseInfo == null) {
            throw new BusinessException(ResponseEntity.USER_NOT_FOUND_ERROR);
        }
        if (userRoleDao.isExist(managerInfo.getJobNum(), null) > 0) {
            throw new BusinessException(ResponseEntity.REPEAT_U_JOB_NUMBER);
        }
        //检查用户角色表中是否已经存在该管理员
        if (userRoleDao.isExist(null, baseInfo.getuUid()) > 0) {
            throw new BusinessException(ResponseEntity.USER_EXIST_ERROR);
        }
        managerInfo.setuUid(baseInfo.getuUid());
    }
}
