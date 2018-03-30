package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.ServiceIndexInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ServiceIndexDao {
    /**
     * 检索服务列表
     *
     * @param keyword
     * @param province
     * @param city
     * @param district
     * @param lowPrice
     * @param highPrice
     * @param orderByDefault
     * @param orderByPrice
     * @param orderByDis
     * @param longitude
     * @param latitude
     * @param orgOid
     * @return
     */
    List<ServiceIndexInfo> search(
            @Param("keyword") String keyword,
            @Param("province") String province, @Param("city") String city, @Param("district") String district,
            @Param("scopeLowPrice") Integer lowPrice, @Param("scopeHighPrice") Integer highPrice,
            @Param("orderByDefault") String orderByDefault, @Param("orderByPrice") String orderByPrice, @Param("orderByDis") String orderByDis,
            @Param("longitude") Double longitude, @Param("latitude") Double latitude,
            @Param("orgOid") Long orgOid,
            @Param("customTag") String customTag,
            @Param("category1") String category1,
            @Param("category2") String category2);

    /**
     * 关闭服务后 删除索引
     *
     * @param serviceId
     * @return
     */
    int deleteIndexByServiceId(Long serviceId);

    /**
     * 删除该机构下所有服务索引
     *
     * @param orgOid
     * @return
     */
    int deleteIndexByOrgOid(Long orgOid);

    /**
     * 审核通过或者开启服务后,添加索引
     *
     * @param serviceId
     * @return
     */
    int insertIndexByServiceId(Long serviceId);

    /**
     * 根据机构id批量插入服务索引
     *
     * @param orgOid
     * @return
     */
    int insertIndexByOrgOid(Long orgOid);

    /**
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(ServiceIndexInfo record);

    /**
     * 根据机构id查询服务条数
     *
     * @param orgOid
     * @return
     */
    int selectCountsByOrgOid(Long orgOid);

    /**
     * 根据机构id查询索引信息
     *
     * @param oid
     * @return
     */
    ServiceIndexInfo selectByOid(Long oid);

    ServiceIndexInfo selectByServiceId(Long serviceId);

    /**
     * @param province
     * @param city
     * @return
     */
    List<String> getDistrict(@Param("province") String province, @Param("city") String city);
}