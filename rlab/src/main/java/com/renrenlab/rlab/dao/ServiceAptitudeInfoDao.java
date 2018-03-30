package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.ServiceAptitudeInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceAptitudeInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(ServiceAptitudeInfo record);

    int insertSelective(ServiceAptitudeInfo record);

    ServiceAptitudeInfo selectByName(String name);

    /**
     * @param uid
     * @param isManager 0是前端用户，1是管理员
     * @return
     */
    List<ServiceAptitudeInfo> selectList(@Param("uid") Long uid, @Param("isManager") Integer isManager);

    int updateByPrimaryKeySelective(ServiceAptitudeInfo record);

    int updateByPrimaryKey(ServiceAptitudeInfo record);
}