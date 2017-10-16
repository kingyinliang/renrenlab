package com.renrenlab.cms.communication.dao;

import com.renrenlab.cms.communication.model.TmpAddrInfo;
import org.springframework.stereotype.Repository;

/**
 * 用户地址
 */
@Repository
public interface TmpAddrInfoDao {
    int deleteByPrimaryKey(Long id);

    int insert(TmpAddrInfo record);

    int insertSelective(TmpAddrInfo record);

    TmpAddrInfo selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(TmpAddrInfo record);

    int updateByPrimaryKey(TmpAddrInfo record);

    /**
     * 根据用户Id查询地址信息
     *
     * @param uId
     * @return
     */
    TmpAddrInfo selectByUserId(Long uId);

    /**
     * 更新用户地址信息
     *
     * @param tmpAddrInfo
     * @return
     */
    int updateByUserIdSelective(TmpAddrInfo tmpAddrInfo);
}