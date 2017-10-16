package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.TmpOrgInfo;
import org.springframework.stereotype.Repository;

@Repository
public interface TmpOrgInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(TmpOrgInfo record);

    int insertSelective(TmpOrgInfo record);

    TmpOrgInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TmpOrgInfo record);

    int updateByPrimaryKey(TmpOrgInfo record);

    /**
     * 根据用户Id查询机构信息
     *
     * @param uId
     * @return
     */
    TmpOrgInfo selectByUserId(Long uId);

    /**
     * 更新用户机构信息
     *
     * @param tmpOrgInfo
     * @return
     */
    int updateByUserIdSelective(TmpOrgInfo tmpOrgInfo);
}