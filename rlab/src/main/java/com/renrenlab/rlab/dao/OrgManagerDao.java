package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.vo.OrgManager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/7/20.
 */
@Repository
public interface OrgManagerDao {

    /**
     * 查询机构管理人员信息
     * @param orgOid
     * @return
     */
    List<OrgManager> searchOrgManagerByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 查询机构拥有者信息
     * @param orgMid
     * @return
     */
    OrgManager searchOrgOwnerByOrgMid(@Param("orgMid") Long orgMid);

    /**
     * 插入机构管理人员信息
     * @param orgManager
     * @return
     */
    int insertOrgManager(OrgManager orgManager);

    /**
     * 更新机构管理人员信息
     * @param orgManager
     * @return
     */
    int updateOrgManager(OrgManager orgManager);

    /**
     * 查询机构创建人员信息
     * @param orgOid
     * @return
     */
    OrgManager searchOrgCreatorByOrgId(@Param("orgOid") Long orgOid);
}
