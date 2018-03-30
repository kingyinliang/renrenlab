package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.ServiceFeature;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceFeatureDao {
    int deleteByPrimaryKey(Long id);

    int insert(ServiceFeature record);

    int insertSelective(ServiceFeature record);

    ServiceFeature selectByName(String name);

    List<ServiceFeature> selectList(Long uid);

    int updateByPrimaryKeySelective(ServiceFeature record);

    int updateByPrimaryKey(ServiceFeature record);


}