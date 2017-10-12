package com.renrenlab.rlab.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.dao.InstrumentBaseInfoDao;
import com.renrenlab.rlab.dao.InstrumentCategoryDao;
import com.renrenlab.rlab.dao.InstrumentCoreParamDao;
import com.renrenlab.rlab.model.OrgBaseInfo;
import com.renrenlab.rlab.service.InstrumentService;
import com.renrenlab.rlab.vo.InstrumentInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by guanjipeng on 2017/5/15.
 */
@Service
@Transactional
public class InstrumentServiceImp implements InstrumentService {

    @Autowired
    private InstrumentBaseInfoDao instrumentDao;

    @Autowired
    private InstrumentCategoryDao instrumentCategoryDao;

    @Autowired
    private InstrumentCoreParamDao instrumentCoreParamDao;

    public PageInfo<InstrumentInfo> searchInstrument(String keyword, Integer oci, Integer pageNo, Integer pageSize) {
        if (keyword != null) keyword = keyword.trim();
        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;

        List<InstrumentInfo> list = new ArrayList<>();
        String orgName = "";
        if (null == oci) {
            //oci不作为条件
            PageHelper.startPage(pageNo, pageSize);
            list = instrumentDao.searchInstrumentByInsName("");
/*            InstrumentInfo instrumentInfo = list.get(0);
            System.out.println(JSONObject.toJSONString(instrumentInfo));*/
            return new PageInfo<>(list);
        }
        switch (oci) {
            case 0:
//               根据id准确查找
                try {
                    Long mapId = Long.parseLong(keyword);
                    PageHelper.startPage(pageNo, pageSize);
                    list.clear();
                    InstrumentInfo info = instrumentDao.searchInstrumentByMapId(mapId);
                    if (info != null)
                        list.add(info);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
                break;
            case 1:
//                根据仪器名称
                PageHelper.startPage(pageNo, pageSize);
                list = instrumentDao.searchInstrumentByInsName(keyword);
                break;
            case 2:
//                根据型号查找
                PageHelper.startPage(pageNo, pageSize);
                list = instrumentDao.searchInstrumentByMode(keyword);
                break;
            case 3:
                // 根据持有机构查找
                PageHelper.startPage(pageNo, pageSize);
                list = instrumentDao.searchInstrumentInfoByOrgName(keyword);
                break;
            default:
                break;
        }
        return new PageInfo<>(list);
    }

    public InstrumentInfo searchInstrument(Long insIid, Long mapId) {
        return instrumentDao.searchInstrumentById(insIid, mapId);
    }


    public InstrumentInfo addInstrument(InstrumentInfo instrumentInfo) {
        //跟机构做关联  仪器报价
        //默认添加仪器时  状态是开启的
        instrumentInfo.setInsState(0);
        //添加仪器之前 检查品牌表中是否含有 若没有该品牌则添加
        if (getBrandName(instrumentInfo.getInsBrand()).size() == 0) {
            instrumentDao.addBrand(instrumentInfo.getInsBrand());
        }
        instrumentDao.insertSelective(instrumentInfo);
        //仪器添加成功后 更新仪器机构关联表
        instrumentDao.inserOrgInstrumentMap(instrumentInfo);
        //仪器添加成功后更新索引表
        instrumentDao.updateIndex(instrumentInfo.getMapId());
        return instrumentInfo;
    }

    public int modifyInstrument(InstrumentInfo instrumentInfo) {
        //需要同时更新表t_instrument_org_map
        //修改仪器之前 检查品牌表中是否含有 若没有该品牌则添加
        if (getBrandName(instrumentInfo.getInsBrand()).size() == 0) {
            instrumentDao.addBrand(instrumentInfo.getInsBrand());
        }
        int re = instrumentDao.updateInstrumentBaseInfo(instrumentInfo);

        //若果为开启状态
        if (instrumentInfo.getInsState() == 0) {
            //删除索引
            instrumentDao.delIndex(instrumentInfo.getMapId());
            //新建索引
            instrumentDao.updateIndex(instrumentInfo.getMapId());
        }
        return re;
    }

    public int closeOrOpenInstrument(Long mapId, Long id, Integer value) {
        //insState 0:开启仪器 1:关闭仪器
        //关闭仪器后 删除索引 ，打开仪器后插入索引
        if (value == 0) {
            //开启仪器 ， 插入索引
            instrumentDao.delIndex(mapId);
            instrumentDao.updateIndex(mapId);
        } else if (value == 1) {
            //关闭仪器 ，删除索引
            instrumentDao.delIndex(mapId);
        }
        return instrumentDao.updateByInsIid(id, value);
    }

    public List<String> getBrandName(String key) {
        return instrumentDao.getBrandName(key);
    }

    public List<OrgBaseInfo> getOrgNameAndId(@Param("key") String key) {
        return instrumentDao.getOrgNameAndId(key);
    }

    @Override
    public String getOrgName(Long orgId) {
        return instrumentDao.getOrgName(orgId);
    }

}
