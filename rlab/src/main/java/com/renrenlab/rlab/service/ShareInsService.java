package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.*;

import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/7/21.
 */
public interface ShareInsService {

    /**
     * 检索共享仪器列表
     *
     * @param keyword   仪器编号、仪器名称、仪器型号、持有机构
     * @param mapState
     * @param beginTime
     * @param endTime
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<ShareInsListInfo> getList(String keyword,
                                       String mapState,
                                       String beginTime,
                                       String endTime,
                                       Integer pageNo,
                                       Integer pageSize,
                                       String order) throws Exception;

    /**
     * 查看共享仪器详情
     *
     * @param mapId
     * @return
     */
    ShareInsDetailInfo getDetail(Long mapId) throws Exception;

    int updateShareIns(ShareInsDetailInfo shareInsDetailInfo) throws Exception;

    /**
     * 改状态
     *
     * @param mapIds
     * @return
     * @throws Exception
     */
    int turn(Long[] mapIds, Integer state) throws Exception;

    List<OrgBaseInfo> getOrgNameAndId(String key);

    Map<String, Object> getScope(String[] arr);

    Map<String, Object> getFeature(String[] arr);

    Map<String, Object> addFeature(InstrumentFeature feature);

    Map<String, Object> addScope(InstrumentScope scope);

    /**
     * 根据机构id 查询机构地址和联系方式
     *
     * @param orgId
     * @return
     */
    ShareInsDetailInfo getMore(Long orgId);

}
