package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.vo.OrgAddress;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/7/20.
 */
@Repository
public interface OrgAddressDao {

    /**
     * 查询机构地址信息
     * @param orgOid
     * @return
     */
    OrgAddress searchOrgAddressByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 插入机构地址信息
     * @param orgAddress
     * @return
     */
    int insertOrgAddress(OrgAddress orgAddress);

    /**
     * 更新机构地址信息
     * @param orgAddress
     * @return
     */
    int updateOrgAddress(OrgAddress orgAddress);

    /**
     * 查询机构地址信息通过ID
     * @param orgAddrId
     * @return
     */
    OrgAddress searchOrgAddressByOrgAddrId(@Param("orgAddrId") Long orgAddrId);

}
