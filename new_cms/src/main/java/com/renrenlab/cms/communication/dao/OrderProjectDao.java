package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.OrderProject;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 项目表
 */
@Repository
public interface OrderProjectDao {

    int deleteByPrimaryKey(Long id);

    int insert(OrderProject project);

    int insertSelective(OrderProject project);

    OrderProject selectByPrimaryKey(Long id);

    OrderProject selectByPjId(Long pjId);

    List<OrderProject> selectByUIdKey(Long u_id);

    int updateByPrimaryKeySelective(OrderProject project);

    int updateByPrimaryKey(OrderProject project);

}