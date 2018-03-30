package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.Requirement;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/8/8.
 */
public interface RequirementService {
    /**
     * @param keyword
     * @param state
     * @param beginTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<Requirement>  getList(String keyword,
                                   Integer state,
                                   String beginTime,
                                   String endTime,
                                   Integer pageNo,
                                   Integer pageSize,
                                   String sort);

    /**
     * 前端/管理员用户 延长需求
     *
     * @param uReqId
     * @return
     */
    int delay(Long uReqId);

    /**
     * 管理员审核
     *
     * @param requirement
     * @return
     */
    int auditing(Requirement requirement);

    /**
     * 前端用户发布需求
     *
     * @param requirement
     * @return
     */
    int publish(Requirement requirement);

    /**
     * 前端用户修改需求
     *
     * @param requirement
     * @return
     */
    int modify(Requirement requirement);

    /**
     * 检索即将过期的所有需求
     *
     * @return
     */
    List<Requirement> getOutDate();

    /**
     * 获取最新的已解决10记录
     *
     * @return
     */
    List<Requirement> getTop10(HttpServletRequest request);

    PageInfo<Requirement> getListByUid(Long uid,
                                       Integer state,
                                       Integer pageNo,
                                       Integer pageSize);

    List<Map<String, Integer>> getCount(Long uUid);

    Integer getAllCount(Long uUid);

    Requirement getDetailById(Long uReqId);

    int addCount(Long uRedId);

    List<Requirement> mGetTinyList();
}
