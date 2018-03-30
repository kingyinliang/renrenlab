package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.CommonBanner;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 轮播配置DAO
 */
@Repository
public interface CommonBannerDao {

    int deleteByPrimaryKey(Long bId);

    int insertSelective(CommonBanner record);

    CommonBanner selectByPrimaryKey(Long bId);

    int updateByPrimaryKeySelective(CommonBanner record);

    /**
     * 根据条件查询
     * @param commonBanner
     * @return
     */
    List<CommonBanner> selectByCondition(CommonBanner commonBanner);

    List<CommonBanner> selectFrontBannerList(@Param("position") Integer bannerPositionInfo, @Param("state")short state);
}