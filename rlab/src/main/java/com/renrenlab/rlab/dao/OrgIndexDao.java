package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.OrgIndex;
import com.renrenlab.rlab.vo.OrgInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrgIndexDao {
    /**
     * 根据oid删除索引
     * @param oid
     * @return
     */
    int deleteByOid(Long oid);

    int insertSelective(OrgIndex record);

    /**
     * 根据oid插入
     * @param orgOid
     * @return
     */
    int insertSelectiveByOrgOid(Long orgOid);

    OrgIndex selectByOid(Long oid);

    int updateByOidSelective(OrgIndex record);
    /**
     * 按条件搜索机构列表
     * @param keyword
     * @param province
     * @param city
     * @param district
     * @param order 0 排序规则 0 默认（认证状态和距离） 1 距离排序 2 共享指数
     * @param longitude
     * @param latitude
     * @return
     */
    List<OrgIndex> selectByCondition(@Param("keyword") String keyword,
                                     @Param("province")String province,
                                     @Param("city")String city,
                                     @Param("district")String district,
                                     @Param("order")Integer order,
                                     @Param("longitude")Double longitude,
                                     @Param("latitude")Double latitude);

    /**
     * 判断城市是否存在机构
     * @param location
     * @param isCity
     * @return
     */
    int IsExistedOrg(@Param("location") String location,@Param("isCity") boolean isCity);

    /**
     * 根据省市拿到区域信息
     * @param province
     * @param city
     * @return
     */
    List<String> getDistrict(@Param("province")String province,@Param("city") String city);

    /**
     * 查询排名前k的机构
     * @param k
     * @return
     */
    List<OrgInfo> searchOrgBaseInfoListTopK(@Param("k") Integer k);
}