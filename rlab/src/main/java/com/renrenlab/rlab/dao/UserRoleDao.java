package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UserBaseInfo;
import com.renrenlab.rlab.model.UserRole;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by wanshou on 2017/9/13.
 */
@Repository
public interface UserRoleDao {

    /**
     * 通过用户u_uid查询用户角色
     *
     * @param u_uid
     * @return
     */
    UserRole selectUserRoleByUUID(@Param("u_uid") Long u_uid);

    /**
     * 根据名字获取角色权限
     */
    UserRole getRolePermissionByRname(String rName);

    /**
     * 查询所有用户角色
     *
     * @return
     */
    List<UserRole> selectAllPermission();

    int updateRole(@Param("uUid") Long uUid, @Param("rRid") Long rRid);

    int selectByUuidJobnum(@Param("uUid") Long uUid, @Param("uJobNumber") String uJobNumber);

    int updateDepartment(UserBaseInfo baseInfo);
}
