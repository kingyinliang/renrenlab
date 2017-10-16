package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.OrderScheme;

import java.util.List;

/**
 * 方案
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IOrderSchemeService {

    /**
     * 添加方案
     *
     * @param scheme
     * @return
     */
    int addScheme(OrderScheme scheme);

    /**
     * 检索方案
     *
     * @param pj_id
     * @return
     */
    List<OrderScheme> querySchemeList(Long pj_id);

    /**
     * 修改方案
     *
     * @param scheme
     * @return
     */
    int updateScheme(OrderScheme scheme);

    /**
     * 删除方案
     *
     * @param sch_id
     * @return
     */
    int deleScheme(Long sch_id);

}
