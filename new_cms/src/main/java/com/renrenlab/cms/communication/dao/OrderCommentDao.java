package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.OrderComment;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderCommentDao {
    int deleteByPrimaryKey(Long id);

    int insert(OrderComment record);

    int insertSelective(OrderComment record);

    OrderComment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(OrderComment record);

    int updateByPrimaryKey(OrderComment record);

	OrderComment selectByOId(long oId);
}