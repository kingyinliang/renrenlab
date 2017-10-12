package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgCertifyTmp;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 创新券认证dao
 */
@Repository
public interface OrgCertifyTmpDao {


    int insertSelective(OrgCertifyTmp record);

    List<OrgCertifyTmp> selectByKeyword(@Param("keyword") String keyword, @Param("state") String state, @Param("startTime") String startTime, @Param("endTime") String endTime,  @Param("order") String order);

    OrgCertifyTmp selectByCerId(Long cerId);

    /**
     * 根据用户id查询创新券认证信息
     * @param uId
     * @return
     */
    OrgCertifyTmp selectByUId(Long uId);

    /**
     * 根据用户id修改认证信息
     * @param orgCertifyTmp
     * @return
     */
    int updateByUIdSelective(OrgCertifyTmp orgCertifyTmp);

    /**
     * 根据认证id修改认证信息
     * @param orgCertifyTmp
     * @return
     */
    int updateByCIdSelective(OrgCertifyTmp orgCertifyTmp);
}