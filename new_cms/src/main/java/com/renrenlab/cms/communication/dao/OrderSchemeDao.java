package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.vo.SchemeInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 方案
 */
@Repository
public interface OrderSchemeDao {

    /**
     * 插入
     *
     * @param scheme
     * @return
     */
    int insertSelective(OrderScheme scheme);

    /**
     * 查询
     *
     * @param schId
     * @return
     */
    OrderScheme selectBySchId(Long schId);

    /**
     * 查询
     *
     * @param schId
     * @return
     */
    SchemeInfo selectBySchId2(Long schId);

    /**
     * 根据项目id检索方案
     *
     * @param pj_id
     * @return
     */
    List<OrderScheme> selectByPjId(Long pj_id);

    /**
     * 更新根据SchId 方案Id
     *
     * @param scheme
     * @return
     */
    int updateBySchIdSelective(OrderScheme scheme);

    /**
     * 根据shc_id 删除方案
     *
     * @param shc_id
     * @return
     */
    int delBySchId(Long shc_id);

}