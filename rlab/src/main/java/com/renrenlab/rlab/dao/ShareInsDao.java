package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.vo.OrgContacts;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShareInsDao {

    List<ShareInsListInfo> getList(@Param("keyword") String keyword,
                                   @Param("mapId") Long mapId,
                                   @Param("mapState") String mapState,
                                   @Param("beginTime") String beginTime,
                                   @Param("endTime") String endTime,
                                   @Param("order") String order);


    ShareInsDetailInfo getDetail(@Param("mapId") Long mapId);

    /**
     * 根据联系人id 或者电话 检索联系人信息
     *
     * @return
     */
    OrgContacts getContactInfo(@Param("conId") Long conId);


    int updateShareInsParam(ShareInsDetailInfo shareInsDetailInfo);

    /**
     * 插入联系人信息表 获取最后插入数据的ID
     *
     * @param contactsMap
     * @return
     */
    Long insertContacts(OrgContacts contactsMap);

    /**
     * 插入机构地址表
     *
     * @param address
     * @return
     */
    Long insertOrgAddr(OrgAddress address);

    /**
     * 更新共享仪器信息
     *
     * @param shareInsDetailInfo
     * @return
     */
    int updateShareIns(ShareInsDetailInfo shareInsDetailInfo);

    int turn(@Param("mapId") Long mapId, @Param("state") Integer state);

    List<OrgBaseInfo> getOrgNameAndId(@Param("key") String key);

    List<InsServiceType> getServiceType();


}