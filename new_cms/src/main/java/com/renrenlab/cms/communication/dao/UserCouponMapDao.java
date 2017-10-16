package com.renrenlab.cms.communication.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.renrenlab.cms.communication.model.UserCouponMap;
import org.springframework.stereotype.Repository;

@Repository
public interface UserCouponMapDao {
    int deleteByPrimaryKey(Long id);

    int insert(UserCouponMap record);

    int insertSelective(UserCouponMap record);

    UserCouponMap selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(UserCouponMap record);

    int updateByPrimaryKey(UserCouponMap record);

	List<UserCouponMap> selectByUIdAndCoId(@Param("uId") Long uId,@Param("coId") Long coId);

	List<UserCouponMap> selectByUId(Long uId);

	void updateStatusByUidAndCoId(UserCouponMap userCoupon);

	List<UserCouponMap> selectByuIds(List<Long> uIds);

	List<UserCouponMap> selectByuIdsAndcoId(@Param("uIds") List<Long> uIds,@Param("coId") Long coId);

	List<UserCouponMap> selectAll();

	List<UserCouponMap> selectBycoId(Long coId);
}