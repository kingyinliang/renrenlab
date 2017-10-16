package com.renrenlab.cms.communication.service;

import com.renrenlab.cms.communication.model.OrderProject;

import java.util.List;

/**
 * 项目
 *
 * Created by lihongxun on 2017/5/16.
 */
public interface IOrderProjectService {

    /**
     * 添加项目
     *
     * @param project
     * @return
     */
    int addPro(OrderProject project);

    /**
     * 检索项目
     *
     * @param u_id
     * @return
     */
    List<OrderProject> selectProList(long u_id);

    /**
     * 发送项目方案给微信
     *
     * @param u_id
     * @param sche_id
     * @return
     */
    String postPjScheToWechat(Long u_id, Long[] sche_id);

}
