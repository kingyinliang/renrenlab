package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.UserCouponMap;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 大学生创新券关联dao
 */
@Repository
public interface UserCouponMapDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserCouponMap record);

    int insertSelective(UserCouponMap record);

    UserCouponMap selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserCouponMap record);

    int updateByPrimaryKey(UserCouponMap record);

    /**
     * 根据用户id查询大学生创新券
     * @param uId
     * @return
     */
    List<UserCouponMap> selectByUId(Long uId);
}