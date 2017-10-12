package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgProjectTmp;
import com.renrenlab.rlab.vo.OrgProjectTmpInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 创新券项目dao
 */
@Repository
public interface OrgProjectTmpDao {

    int insert(OrgProjectTmp record);

    int insertSelective(OrgProjectTmp record);

    List<OrgProjectTmpInfo> selectByKeyword(@Param("keyword") String keyword, @Param("state") String state, @Param("startTime") String startTime, @Param("endTime") String endTime,  @Param("order") String order);

    /**
     * 根据认证id查询项目列表基本信息
     * @param orgCerId
     * @return
     */
    List<OrgProjectTmp> selectBaseInfoByCerId(Long orgCerId);

    /**
     * 根据项目id修改项目信息
     * @param orgProjectTmp
     * @return
     */
    int updateByProIdSelective(OrgProjectTmp orgProjectTmp);

    /**
     * 根据项目id查询
     * @param id
     * @return
     */
    OrgProjectTmpInfo selectByProid(Long id);
}