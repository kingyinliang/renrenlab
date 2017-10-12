package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgContactsMap;
import com.renrenlab.rlab.vo.OrgContacts;
import org.springframework.stereotype.Repository;

@Repository
public interface OrgContactsMapDao {

    /**
     * 插入机构联系方式映射表
     * @param orgContactsMap
     * @return
     */
    int insertOrgContactsMap(OrgContactsMap orgContactsMap);

}