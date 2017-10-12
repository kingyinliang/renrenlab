package com.renrenlab.rlab.service;

import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.vo.InstrumentInfo;

import java.util.List;

/**
 * Created by guanjipeng on 2017/5/15.
 */
public interface InstrumentService {

    /**
     * 仪器查询接口
     *
     * @param keyword  查询关键字
     * @param oci
     * @param pageNo   查询第几页
     * @param pageSize 该页条数
     * @return 仪器列表页面
     */
    PageInfo<InstrumentInfo> searchInstrument(String keyword, Integer oci, Integer pageNo, Integer pageSize);

    /**
     * 根据仪器id 查询仪器详情
     *
     * @param insIid
     * @return
     */
    InstrumentInfo searchInstrument(Long insIid, Long mapId);

    /**
     * 仪器添加接口
     *
     * @param instrumentInfo 仪器类对象
     * @return
     */
    InstrumentInfo addInstrument(InstrumentInfo instrumentInfo);

    /**
     * 仪器修改接口
     *
     * @param instrumentInfo 仪器类对象
     * @return
     */
    int modifyInstrument(InstrumentInfo instrumentInfo);

    /**
     * 关闭仪器接口
     *
     * @param mapId
     * @param id    想要关闭的仪器id
     * @param value 0:开启仪器 1:关闭仪器
     * @return
     */
    int closeOrOpenInstrument(Long mapId, Long id, Integer value);

    List<String> getBrandName(String brand);

    List<OrgBaseInfo> getOrgNameAndId(String key);

    String getOrgName(Long orgId);

}
