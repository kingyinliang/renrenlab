package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.InstrumentBaseInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.vo.InstrumentInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface InstrumentBaseInfoDao {

    /**
     * 插入仪器成功后 得到仪器id 插入表t_org_instrument_map时使用
     *
     * @param record
     * @return
     */
    Long insertSelective(InstrumentInfo record);

    int inserOrgInstrumentMap(InstrumentInfo record);

    InstrumentBaseInfo selectByInsIid(Long insId);

    List<InstrumentInfo> searchInstrumentByMode(@Param("keyword") String keyword);

    List<InstrumentInfo> searchInstrumentByInsName(@Param("keyword") String keyword);

    /**
     * 根据仪器id 得到仪器信息
     *
     * @param insIid
     * @return
     */
    InstrumentInfo searchInstrumentById(@Param("insIid") Long insIid, @Param("mapId") Long mapId);

    /**
     * 根据仪器id 查仪器列表
     *
     * @param mapId
     * @return
     */
    InstrumentInfo searchInstrumentByMapId(@Param("mapId") Long mapId);

    int updateByInsIid(@Param("insIid") Long insIid, @Param("insState") Integer insState);

    int updateInstrumentBaseInfo(InstrumentInfo record);

    /**
     * 根据机构名称查找 仪器列表
     *
     * @param keyword
     * @return
     */
    List<InstrumentInfo> searchInstrumentInfoByOrgName(@Param("keyword") String keyword);


    List<String> getBrandName(@Param("key") String key);

    List<OrgBaseInfo> getOrgNameAndId(@Param("key") String key);

    int addBrand(@Param("brandName") String brandName);

    String getOrgName(@Param("orgId") Long orgId);

    int updateIndex(@Param("mapId") Long mapId);

    int delIndex(@Param("mapId") Long mapId);

}