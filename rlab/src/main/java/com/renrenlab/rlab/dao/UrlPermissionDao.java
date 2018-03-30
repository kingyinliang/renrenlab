package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UrlPermission;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface UrlPermissionDao {
    /**
     * 从数据库读取需要拦截的url
     *
     * @return
     */
    List<UrlPermission> getFilterMap();

    Set<UrlPermission> selectPermission(@Param("permissionIds") Set permissionIds);

    List<UrlPermission> getAllPermission();

}