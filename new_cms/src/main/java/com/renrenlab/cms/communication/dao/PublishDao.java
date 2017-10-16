package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.Publish;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublishDao {
    int deleteByPrimaryKey(Long id);

    int insert(Publish record);

    int insertSelective(Publish record);

    Publish selectByPrimaryKey(Long id);


    Publish selectByOpenId(String wxOpenId);

    List<Publish> listAll(Integer count);
}