package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.Requirement;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RequirementDao {
    int deleteByUReqId(Long id);

    List<Requirement> selectByKeyword(@Param("keyword") String keyword,
                                      @Param("state") Integer state,
                                      @Param("beginTime") String beginTime,
                                      @Param("endTime") String endTime,
                                      @Param("sort") String sort);

    Requirement selectByUreqId(@Param("uReqId") Long uReqId);

    /**
     * 前端/管理员用户 延长需求
     *
     * @param uReqId
     * @return
     */
    int delay(@Param("uReqId") Long uReqId);

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

    int addCount(@Param("uReqId") Long uReqId);

    /**
     * 检索即将过期的所有需求
     *
     * @return
     */
    List<Requirement> getOutDate();

    /**
     * 根据用户id 检索该用户所有的需求
     *
     * @param uUid
     * @return
     */
    List<Requirement> getListByUid(@Param("uUid") Long uUid, @Param("state") Integer state);

    /**
     * 统计该用户所有需求的状态
     *
     * @return
     */
    List<Map<String, Integer>> getCount(@Param("uUid") Long uUid);

    Integer getAllCount(@Param("uUid") Long uUid);

    /**
     * 获取最新的已解决的或者发布的十条记录
     *
     * @return
     */
    List<Requirement> getTop10();
}