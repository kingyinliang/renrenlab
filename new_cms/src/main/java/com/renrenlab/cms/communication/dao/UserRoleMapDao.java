package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.UserRoleMap;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleMapDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserRoleMap record);

    int insertSelective(UserRoleMap record);

    UserRoleMap selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserRoleMap record);

    int updateByPrimaryKey(UserRoleMap record);

    UserRoleMap selectByuUid(Long uUid);
    /**
     * 删除客服
     *
     * @param cs_id
     * @return
     */
    int deleteByCsId(@Param("cs_id") Long cs_id);
}