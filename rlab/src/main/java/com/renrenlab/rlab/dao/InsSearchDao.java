package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InsDetailInfo;
import com.renrenlab.rlab.model.InsListInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface InsSearchDao {

    List<InsListInfo> selectBykeyword(
            @Param("keyword") String keyword,
            //服务方式
            @Param("insServiceType") String insServiceType,
            //价格范围
            @Param("scopeLowPrice") Integer scopeLowPrice,
            @Param("scopeHighPrice") Integer scopeHighPrice,
            //仪器分类
            @Param("category1") String category1,
            @Param("category2") String category2,
            @Param("province") String province,
            @Param("city") String city,
            @Param("district") String district,
            //是否根据经纬度排序
            @Param("isDis") boolean isDis,
            //经纬度
            @Param("longitude") Double longitude,
            @Param("latitude") Double latitude,
            @Param("isSubscribe") String isSubscribe
    );

    InsListInfo selectByMapId(Long mapId);

    /**
     * 获取省市下的区
     *
     * @param province
     * @param city
     * @return
     */
    List<String> getDistrict(@Param("province") String province, @Param("city") String city);

    InsDetailInfo searchDetail(@Param("mapId") Long mapId);

    /**
     * 判断仪器是否存在
     *
     * @param location
     * @param isCity
     * @return
     */
    Integer IsExistedInstrument(@Param("location") String location, @Param("isCity") boolean isCity);

    /**
     * 根据关键字查询机构排名
     *
     * @param keyword
     * @return
     */
    List<Map<String, Object>> selectOrgRankByKeyword(@Param("keyword") String keyword);

    int deleteByMapId(@Param("mapId") Long mapId);

    /**
     * 批量删除索引
     *
     * @param mapIds
     * @return
     */
    int deleteByMapIds(@Param("mapIds") List mapIds);

    int insertIndex(@Param("mapId") Long mapId);

    int insertIndexs(@Param("mapIds") List mapIds);

    /**
     * 根据机构ID查询仪器信息
     *
     * @param oid
     * @return
     */
    List<InsListInfo> selectInsByOid(@Param("oid") Long oid);
}