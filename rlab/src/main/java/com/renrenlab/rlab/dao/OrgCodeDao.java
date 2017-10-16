package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgCode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by wanshou on 2017/5/17.
 */
@Repository
public interface OrgCodeDao {

    /**
     * 查询机构组织机构代码信息
     *
     * @param orgOid
     * @return
     */
    OrgCode searchOrgCodeByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 添加机构组织机构代码
     *
     * @param orgCode
     * @return
     */
    int insertOrgCode(OrgCode orgCode);

    /**
     * 更新组织机构代码
     *
     * @param orgCode
     * @return
     */
    int updateOrgCode(OrgCode orgCode);

    OrgCode searchOrgCode(@Param("orgCode") String orgCode);

}
