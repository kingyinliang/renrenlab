package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgCertificateTmp;
import com.renrenlab.rlab.vo.OrgCertificate;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/7/20.
 */
@Repository
public interface OrgCertificateDao {

    /**
     * 查询机构资质认证列表
     *
     * @param orgOid
     * @return
     */
    List<OrgCertificate> searchOrgCertificateByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 查询机构资质认证
     *
     * @param orgCertificateId
     * @return
     */
    OrgCertificate searchOrgCertificateByOrgCertificateId(@Param("orgCertificateId") Long orgCertificateId);

    /**
     * 插入机构联系方式
     *
     * @param orgCertificate
     * @return
     */
    Long insertOrgCertificate(OrgCertificate orgCertificate);

    /**
     * 更新机构联系方式
     *
     * @param orgCertificate
     * @return
     */
    int updateOrgCertificate(OrgCertificate orgCertificate);

    /**
     * 添加机构资质名
     *
     * @param name
     * @return
     */
    int insertOrgCertificateTmp(@Param("name") String name);

    /**
     * 查询所有机构资质名
     *
     * @return
     */
    List<OrgCertificateTmp> selectOrgCertificateTmp();

    int delOrgCertificateByCerId(@Param("orgCertificateId") Long orgCertificateId);
}
