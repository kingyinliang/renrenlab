package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.renrenlab.rlab.dao.NewUserRoleDao;
import com.renrenlab.rlab.dao.UrlPermissionDao;
import com.renrenlab.rlab.model.ManagerInfo;
import com.renrenlab.rlab.model.NewRoleInfo;
import com.renrenlab.rlab.model.UrlPermission;
import com.renrenlab.rlab.service.IShiro;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * @author guanjipeng
 * @date 2018/3/13
 */
@Service
public class ShiroImp implements IShiro {
    @Autowired
    NewUserRoleDao newUserRoleDao;
    @Autowired
    private UrlPermissionDao permissionDao;

    /**
     * 初始化拦截路径
     *
     * @return
     */
    @Override
    public Map getFilterMap() {
        Map<String, String> filterMap = new LinkedHashMap<>();

/*        filterMap.put("/user/login", "anon");
        filterMap.put("/bg/home/toHome", "authc");
        filterMap.put("/bg/user/list", "perms[list]");
        filterMap.put("/bg/**", "authc");*/

        List<UrlPermission> urlPermissions = permissionDao.getFilterMap();
        //需要拦截的路径，所需要的权限
        urlPermissions.stream().forEach(urlPermission -> {
            String type = urlPermission.getRequestType();
            String url = urlPermission.getUrl();
            if (type.equals("get") || type.equals("post") || type.equals("put") || type.equals("delete")) {
                filterMap.put(url,
                        "perms[" + urlPermission.getUrl() + "+" + type + "]");
            } else {
                filterMap.put(url, type);
            }
        });
        filterMap.put("/bg/**", "authc");
        filterMap.put("/druid/**", "roles[超级管理员]");
        filterMap.put("/**", "anon");
        return filterMap;
    }

    /**
     * 根据用户id获取所有用户角色
     *
     * @param uUid
     * @return
     */
    @Override
    public Set getUserRoles(Long uUid) {
        ManagerInfo userRole = newUserRoleDao.getUserRoleByUuid(uUid);
        if (null != userRole) {
            Set<String> roleSet = new HashSet<>();
            if (StringUtils.isBlank(userRole.getRoleIds())) {
                return null;
            }
            //根据用户角色id 查询角色名称
            Set<Long> roleIds = new HashSet<>();
            JSONArray.parseArray(userRole.getRoleIds())
                    .forEach(item -> {
                        roleIds.add(Long.valueOf(item.toString()));
                    });
            List<NewRoleInfo> roleInfos =
                    newUserRoleDao.getRoleInfoByRoleIds(roleIds);
            if (CollectionUtils.isNotEmpty(roleInfos)) {
                roleInfos.forEach(roleInfo -> {
                    roleSet.add(roleInfo.getRoleName());
                });
                return roleSet;
            }
        }
        return null;
    }

    /**
     * 根据用户id获取所有权限
     *
     * @param uUid
     * @return
     */
    @Override
    public Set getUserPermissions(Long uUid) {
        Set<UrlPermission> urlPermissions = null;
        //用户权限id
        Set<Long> permissionIds = new HashSet<>();
        Set<String> permissionSet = new HashSet<>();
        Set<String> permissionIdsSet = newUserRoleDao.getPermissionIds(uUid);
        permissionIdsSet.forEach(permission -> {
            JSONArray.parseArray(permission.toString())
                    .stream()
                    .forEach(item -> {
                        permissionIds.add(Long.valueOf(item.toString()));
                    });
        });
        //根据用户权限id,获取所有权限
        if (CollectionUtils.isNotEmpty(permissionIds)) {
            if (this.getUserRoles(uUid).contains("超级管理员")) {
                //超级管理员拥有所有权限
                urlPermissions = permissionDao.selectPermission(null);
            } else {
                urlPermissions = permissionDao.selectPermission(permissionIds);
            }
            urlPermissions.stream().forEach(urlPermission -> {
                permissionSet.add(urlPermission.getUrl()
                        + "+" + urlPermission.getRequestType());
            });
        }
        return permissionSet;
    }
}
