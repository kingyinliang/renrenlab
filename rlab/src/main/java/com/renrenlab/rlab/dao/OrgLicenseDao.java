package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgLicense;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/20.
 */
@Repository
public interface OrgLicenseDao {

    /**
     * 查询机构营业执照信息
     * @param orgOid
     * @return
     */
    OrgLicense searchOrgLicenseByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 插入机构营业执照信息
     * @param orgLicense
     * @return
     */
    int insertOrgLicense(OrgLicense orgLicense);

    /**
     * 更新机构营业执照信息
     * @param orgLicense
     * @return
     */
    int updateOrgLicense(OrgLicense orgLicense);

}
