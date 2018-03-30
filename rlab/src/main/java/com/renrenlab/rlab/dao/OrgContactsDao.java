package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.vo.OrgContacts;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/7/20.
 */
@Repository
public interface OrgContactsDao {

    /**
     * 查询机构联系人信息
     *
     * @param orgOid
     * @return
     */
    OrgContacts searchOrgContactsByOrgId(@Param("orgOid") Long orgOid);

    /**
     * 插入机构联系方式
     *
     * @param orgContacts
     * @return
     */
    int insertOrgContacts(OrgContacts orgContacts);

    /**
     * 更新机构联系方式
     *
     * @param orgContacts
     * @return
     */
    int updateOrgContacts(OrgContacts orgContacts);


    /**
     * 查询机构联系人信息通过ID
     *
     * @param conId
     * @return
     */
    OrgContacts searchOrgContactsByConId(@Param("conId") Long conId, @Param("conState") Integer conState);

    /**
     * 查询机构联系人信息
     *
     * @param orgOid
     * @return
     */
    List<OrgContacts> searchContactsByOrgId(@Param("orgOid") Long orgOid, @Param("conState") Integer conState);

    /**
     * 根据电话姓名查询联系人信息
     * @param conPhone
     * @param conName
     * @return
     */
    List<OrgContacts> searchContactsByPhoneAndName(@Param("conPhone") String conPhone, @Param("conName") String conName);

    /**
     * 删除机构联系人
     * @param conId
     */
    void delOrgContactsByConId(@Param("con_id") Long conId);

}
