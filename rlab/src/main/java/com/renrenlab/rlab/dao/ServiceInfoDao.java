package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.ServiceClassify;
import com.renrenlab.rlab.model.ServiceInfo;
import com.renrenlab.rlab.vo.ServiceInfoCustom;
import com.renrenlab.rlab.vo.ServiceListModel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface ServiceInfoDao {
    int deleteByPrimaryKey(Long id);

    int insertSelective(ServiceInfo record);

    ServiceInfoCustom selectByServiceId(Long serviceId);

    ServiceInfoCustom selectByOrgIdAndServiceName(@Param("serviceName") String serviceName, @Param("orgId") Long orgId);

    int updateByPrimaryKeySelective(ServiceInfo record);

    List<ServiceListModel> selectServiceList(@Param("managerId") Long managerId,
                                             @Param("permission") Integer permission,
                                             @Param("keyword") String keyword,
                                             @Param("serviceId") Long serviceId,
                                             @Param("state") Integer state,
                                             @Param("beginTime") String beginTime,
                                             @Param("endTime") String endTime,
                                             @Param("order") String order,
                                             @Param("uUid") Long uUid);

    List<ServiceInfoCustom> selectFrontList(@Param("keyword") String keyword,
                                            @Param("serviceId") Long serviceId,
                                            @Param("state") Integer state,
                                            @Param("beginTime") String beginTime,
                                            @Param("endTime") String endTime,
                                            @Param("order") String order,
                                            @Param("uUid") Long uUid);

    int auditService(@Param("serviceIds") List<Integer> serviceIds, @Param("state") Integer state);

    /**
     * 根据用户id 检索相关联的机构名称
     *
     * @param uUid
     * @return
     */
    List<Map> selectOrgNameByUid(@Param("uUid") Long uUid);

    /**
     * 根据用户id 检索认证服务商
     *
     * @param uUid
     * @return
     */
    List<Long> getOrgOids(@Param("uUid") Long uUid);

    List<Long> mSize();

//    List<TempModel> getModels();

    int insertIns(@Param("insId") int insId, @Param("orgId") int orgId);

    List<ServiceClassify> selectClassify(Long id);

    List<ServiceClassify> selectProductClassify(Long id);

    List<ServiceClassify> selectFrontProductClassify(@Param("ids")List<Long> ids);
}