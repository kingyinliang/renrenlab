package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.util.CommonUtil;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.ShareInsService;
import com.renrenlab.rlab.vo.OrgAddress;
import com.renrenlab.rlab.vo.OrgContacts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by guanjipeng on 2017/7/21.
 */
@Service
@Transactional
public class ShareInsServiceImpl implements ShareInsService {
    @Autowired
    private ShareInsDao shareInsDao;

    @Autowired
    private InstrumentScopeDao instrumentScopeDao;

    @Autowired
    private InstrumentCategoryDao instrumentCategoryDao;

    @Autowired
    private InstrumentFeatureDao instrumentFeatureDao;

    @Autowired
    private OrgContactsDao orgContactsDao;

    @Autowired
    private OrgAddressDao orgAddressDao;

    @Autowired
    private OrgContactsMapDao orgContactsMapDao;

    @Autowired
    private InsSearchDao insSearchDao;

    @Override
    public PageInfo<ShareInsListInfo> getList(String keyword,
                                              String mapState,
                                              String beginTime,
                                              String endTime,
                                              Integer pageNo,
                                              Integer pageSize,
                                              String order) throws Exception {
        List<ShareInsListInfo> infos = null;
        Long mapId = null;
        if (CommonUtil.isNum(keyword))
            mapId = Long.parseLong(keyword);
        if (mapState == null || mapState.equals("99")) {
            mapState = null;
        }
        PageHelper.startPage(pageNo, pageSize);
        if (beginTime != null && beginTime.equals("")) beginTime = null;
        if (endTime != null && endTime.equals("")) endTime = null;
        infos = shareInsDao.getList(keyword, mapId, mapState, beginTime, endTime, order);
        for (ShareInsListInfo shareInfo : infos) {
            //检查mapDes是否含有flag字段
            if (shareInfo.getMapNewIns() != null) {
                //处理mapdescription  key类型为字符串 value类型有可能是字符串or字符串数组
                net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(shareInfo.getMapNewIns().toString());
                shareInfo.setInsName(jsonObject.get("insName").toString());
            }
            //格式化显示时间
            shareInfo.setTime(CommonUtil.formatTime(shareInfo.getModifyTime()));
            //适用领域列表
            if (shareInfo.getInsScope() != null) {
                shareInfo.setInsScopeList(getScopeList(shareInfo.getInsScope().toString()));
            }
            //处理价格
            if (shareInfo.getInsOrgPriceList() != null) {
                shareInfo.setInsOrgPriceList(SearchUtil.handlePrice(shareInfo.getInsOrgPriceList().toString()));
            }
            //处理mapState
            if (shareInfo.getMapState() != null) {
                JSONArray mapSates = JSONObject.parseArray(shareInfo.getMapState().toString());
                shareInfo.setMapState(mapSates);
            }
        }

        return new PageInfo<>(infos);
    }

    @Override
    public ShareInsDetailInfo getDetail(Long mapId) throws Exception {
        ShareInsDetailInfo insDetailInfo = shareInsDao.getDetail(mapId);
        if (insDetailInfo == null) {
            return null;
        }
        //检查mapDes是否含有flag字段
        if (insDetailInfo.getMapNewIns() != null) {
            //处理mapdescription  key类型为字符串 value类型有可能是字符串or字符串数组
            net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(insDetailInfo.getMapNewIns().toString());
            insDetailInfo.setInsName(jsonObject.get("insName").toString());
            insDetailInfo.setInsMode(jsonObject.get("insMode").toString());
            insDetailInfo.setInsPic(jsonObject.get("insPic").toString());
            insDetailInfo.setInsBrand(jsonObject.get("insBrand").toString());
            insDetailInfo.setInsOrigin(jsonObject.get("insOrigin").toString());
            insDetailInfo.setInsCategory(jsonObject.get("insCategory").toString());
            insDetailInfo.setInsDescription(jsonObject.get("insDescription").toString());
            Iterator iterator = jsonObject.keys();
            List<TitleContent> mapTitleContent = new ArrayList<>();
            String key;
            String value;
            String[] valueArray;
            while (iterator.hasNext()) {
                TitleContent titleContent = new TitleContent();
                key = String.valueOf(iterator.next());
                titleContent.setTitle(key);
                if (jsonObject.get(key) instanceof net.sf.json.JSONArray) {
                    int size = ((net.sf.json.JSONArray) jsonObject.get(key)).size();
                    valueArray = new String[size];
                    if (size > 0) {
                        for (int i = 0; i < size; i++) {
                            valueArray[i] = ((net.sf.json.JSONArray) jsonObject.get(key)).get(i).toString();
                        }
                    }
                    titleContent.setContent(valueArray);
                } else if (jsonObject.get(key) instanceof net.sf.json.JSONObject) {
                    //核心参数
                    insDetailInfo.setInsCoreParam(jsonObject.get(key));
                } else {
                    value = (String) jsonObject.get(key);
                    titleContent.setContent(value);
                }
                mapTitleContent.add(titleContent);
            }
//            model.addAttribute("mapDesInfo", mapTitleContent);
        }

        //得到联系人id根据id检索其他信息
        if (insDetailInfo.getConId() != null) {
            insDetailInfo.setConList(getConList(insDetailInfo.getConId().toString()));
        }
        //得到领域id
        if (insDetailInfo.getInsScope() != null) {
            insDetailInfo.setInsScopeList(getScopeList(insDetailInfo.getInsScope().toString()));
        }
        //处理核心参数
        if (insDetailInfo.getInsCoreParam() != null) {
            insDetailInfo.setInsCoreParam(SearchUtil.handelCoreParam(insDetailInfo.getInsCoreParam().toString()));
        }
        //仪器分类
        String[] insCategory = JSONObject.parseObject(insDetailInfo.getInsCategory().toString(), String[].class);
        List<InstrumentCategory> categories = new ArrayList<>();
        InstrumentCategory insturmentCategory = null;
        for (int i = 0; i < insCategory.length; i++) {
            if (insCategory[i] != null) {
                insturmentCategory = instrumentCategoryDao.selectCategory(insCategory[i], (long) (i + 1));
                categories.add(insturmentCategory);
            }
        }
        insDetailInfo.setInsCategoryList(categories);
        //处理仪器特点
        if (insDetailInfo.getInsFeature() != null) {
            insDetailInfo.setInsFeatureList(getFeature(insDetailInfo.getInsFeature().toString()));
        }
        //处理描述
        if (insDetailInfo.getInsDescription() != null) {
//            List<TitleContent> descriptionList = JSONObject.parseArray(insDetailInfo.getInsDescription().toString(), TitleContent.class);
            insDetailInfo.setInsDescription(SearchUtil.handleDes(insDetailInfo.getInsDescription().toString()));
        }
        //价格处理
        if (insDetailInfo.getInsOrgPriceList() != null) {
            insDetailInfo.setInsOrgPriceList(SearchUtil.handlePrice(insDetailInfo.getInsOrgPriceList().toString()));
        }
        //图片处理
        if (insDetailInfo.getInsPic() != null) {
            insDetailInfo.setInsPic(SearchUtil.handlePic(insDetailInfo.getInsPic().toString()));
        }
        //处理mapState
        if (insDetailInfo.getMapState() != null) {
            JSONArray mapSates = JSONObject.parseArray(insDetailInfo.getMapState().toString());
            insDetailInfo.setMapState(mapSates);
        }
        //处理显示地址 (街道地址包含省 市)
        String orgStreet = insDetailInfo.getOrgAddrStreet();
        if (orgStreet != null && orgStreet.startsWith(insDetailInfo.getOrgAddrProvince())) {
            orgStreet = orgStreet.replace(insDetailInfo.getOrgAddrProvince(), "");
            insDetailInfo.setOrgAddrStreet(orgStreet);
            if (orgStreet != null && orgStreet.startsWith(insDetailInfo.getOrgAddrCity())) {
                orgStreet = orgStreet.replace(insDetailInfo.getOrgAddrCity(), "");
                insDetailInfo.setOrgAddrStreet(orgStreet);
            }
        }
        // 处理未知的 省 市
        String province = insDetailInfo.getOrgAddrProvince();
        String city = insDetailInfo.getOrgAddrCity();
        if (province != null && province.equals("未知")) {
            insDetailInfo.setOrgAddrProvince("");
        }
        if (city != null && city.equals("未知")) {
            insDetailInfo.setOrgAddrCity("");
        }
        //获取所有的服务类型
        insDetailInfo.setTypes(shareInsDao.getServiceType());
        return insDetailInfo;
    }

    @Override
    public int updateShareIns(ShareInsDetailInfo shareInsDetailInfo) throws Exception {
        int result = 0;
        //更新共享仪器信息
        // 检查联系人字段     插入联系人表
        OrgContacts orgContacts = null;
        //解析联系人字段
        if (shareInsDetailInfo.getObjConList() != null) {
            List<OrgContacts> list = JSONObject.parseArray(shareInsDetailInfo.getObjConList().toString(), OrgContacts.class);
            shareInsDetailInfo.setConList(list);

            String[] conIds = new String[shareInsDetailInfo.getConList().size()];
            for (int i = 0; i < shareInsDetailInfo.getConList().size(); i++) {
                //如果conId不存在 插入数据
                if (shareInsDetailInfo.getConList().get(i).getConId() == null) {
                    //插入联系人
                    shareInsDao.insertContacts(shareInsDetailInfo.getConList().get(i));
                    conIds[i] = shareInsDetailInfo.getConList().get(i).getConId() + "";
                    //插入t_org_contacts_map表 conId,orgId
                    OrgContactsMap orgContactsMap = new OrgContactsMap();
                    orgContactsMap.setConId(Long.parseLong(conIds[i]));
                    orgContactsMap.setOrgOid(shareInsDetailInfo.getOrgOid());
                    orgContactsMapDao.insertOrgContactsMap(orgContactsMap);
                }
                //否则更新
                else {
                    //更新联系人
                    OrgContacts contacts = new OrgContacts();
                    contacts.setConId(shareInsDetailInfo.getConList().get(i).getConId());
                    contacts.setConPhone(shareInsDetailInfo.getConList().get(i).getConPhone());
                    contacts.setConName(shareInsDetailInfo.getConList().get(i).getConName());
                    orgContactsDao.updateOrgContacts(contacts);
                    conIds[i] = shareInsDetailInfo.getConList().get(i).getConId() + "";
                }
            }
            shareInsDetailInfo.setConId(net.sf.json.JSONArray.fromObject(conIds).toString());
        }
        //根据地址id 检查地址是否更改过
        if (shareInsDetailInfo.getOrgAddrId() != null) {
            Long orgAddrId = shareInsDetailInfo.getOrgAddrId();
            OrgAddress orgAddress = orgAddressDao.searchOrgAddressByOrgAddrId(orgAddrId);
            if (orgAddress == null ||
                    !shareInsDetailInfo.getOrgAddrProvince().equals(orgAddress.getOrgAddrProvince()) ||
                    !shareInsDetailInfo.getOrgAddrCity().equals(orgAddress.getOrgAddrCity()) ||
                    !shareInsDetailInfo.getOrgAddrStreet().equals(orgAddress.getOrgAddrStreet()) ||
                    !shareInsDetailInfo.getOrgAddrDistrict().equals(orgAddress.getOrgAddrDistrict()) ||
                    !shareInsDetailInfo.getOrgAddrLongitude().equals(orgAddress.getOrgAddrLongitude()) ||
                    !shareInsDetailInfo.getOrgAddrLatitude().equals(orgAddress.getOrgAddrLatitude())
                    ) {
                //更新地址信息
                com.renrenlab.rlab.vo.OrgAddress address = new com.renrenlab.rlab.vo.OrgAddress();
                address.setOrgAddrId(shareInsDetailInfo.getOrgAddrId());
                address.setOrgAddrProvince(shareInsDetailInfo.getOrgAddrProvince());
                address.setOrgAddrCity(shareInsDetailInfo.getOrgAddrCity());
                address.setOrgAddrDistrict(shareInsDetailInfo.getOrgAddrDistrict());
                address.setOrgAddrStreet(shareInsDetailInfo.getOrgAddrStreet());
                address.setOrgAddrLatitude(shareInsDetailInfo.getOrgAddrLatitude());
                address.setOrgAddrLongitude(shareInsDetailInfo.getOrgAddrLongitude());
                orgAddressDao.updateOrgAddress(address);
//            shareInsDetailInfo.setOrgAddrId(shareInsDao.insertOrgAddr(address));
            }
        }
//        shareInsDetailInfo.setInsFeatureList(JSONObject.parseArray(shareInsDetailInfo.getObjInsFeatureList().toString(), InstrumentFeature.class));
        //修改仪器状态 为待审核
        result = shareInsDao.updateShareIns(shareInsDetailInfo);
        //删除索引
        insSearchDao.deleteByMapId(shareInsDetailInfo.getMapId());
        return result;
    }

    @Override
    public int turn(Long[] mapIds, Integer state) throws Exception {
        int result = 0;
        for (int i = 0; i < mapIds.length; i++) {
            result = shareInsDao.turn(mapIds[i], state);
            //删除索引
            insSearchDao.deleteByMapId(mapIds[i]);
            if (state == 0) {
                //插入索引
                insSearchDao.insertIndex(mapIds[i]);
            }
            if (result <= 0)
                return result;
        }
        return result;
    }

    /**
     * 根据适用领域ids 得到list
     *
     * @param scopeIds
     * @return
     */
    private List<InstrumentScope> getScopeList(String scopeIds) {
        JSONArray scopeIdArr = JSONObject.parseArray(scopeIds);
        List<InstrumentScope> scopes = new ArrayList<>();
        Long scopeId = null;
        InstrumentScope scope = null;
        for (int i = 0; i < scopeIdArr.size(); i++) {
            scopeId = Long.parseLong((String) scopeIdArr.get(i));
            scope = instrumentScopeDao.selectById(scopeId);
            if (scope != null)
                scopes.add(scope);
        }
        return scopes;
    }

    /**
     * 仪器特点
     *
     * @param str
     * @return
     */
    private List<InstrumentFeature> getFeature(String str) {
        JSONArray featureArr = JSONObject.parseArray(str);
        List<InstrumentFeature> featuresList = new ArrayList<>();
        Long featureId = null;
        InstrumentFeature feature = null;
        for (int i = 0; i < featureArr.size(); i++) {
            featureId = Long.valueOf((String) featureArr.get(i));
            feature = instrumentFeatureDao.selectById(featureId);
            if (feature != null)
                featuresList.add(feature);
        }
        return featuresList;
    }

    /**
     * 根据联系人ids 检索联系人信息
     *
     * @param conIds
     * @return
     */
    private List<OrgContacts> getConList(String conIds) {
        JSONArray conIdArr = JSONObject.parseArray(conIds);
        List<OrgContacts> contactInfos = new ArrayList<>();
        Long conId = null;
        OrgContacts contactInfo = null;
        for (int i = 0; i < conIdArr.size(); i++) {
            conId = Long.parseLong((String) conIdArr.get(i));
            contactInfo = shareInsDao.getContactInfo(conId);
            if (contactInfo != null)
                contactInfos.add(contactInfo);
        }
        return contactInfos;
    }

    @Override
    public List<OrgBaseInfo> getOrgNameAndId(String key) {
        return shareInsDao.getOrgNameAndId(key);
    }

    @Override
    public Map<String, Object> getScope(String[] arr) {
        Map<String, Object> result = new HashMap<>();
        List<InstrumentScope> list = instrumentScopeDao.listAll();
        Long scopeId = null;
        for (InstrumentScope scope : list) {
            scopeId = scope.getInsScopeId();
            for (String s : arr) {
                if (s.equals(scopeId + "")) {
                    scope.setId(1l);
                }
            }
        }
        result.put("code", "200");
        result.put("payload", list);
        return result;
    }

    @Override
    public Map<String, Object> getFeature(String[] arr) {
        Map<String, Object> result = new HashMap<>();
        List<InstrumentFeature> list = instrumentFeatureDao.listAll();
        Long featureId = null;
        for (InstrumentFeature feature : list) {
            featureId = feature.getInsFeatureId();
            for (String s : arr) {
                if (s.equals(featureId + "")) {
                    feature.setId(1l);
                }
            }
        }
        result.put("code", "200");
        result.put("payload", list);
        return result;
    }

    @Override
    public Map<String, Object> addFeature(InstrumentFeature feature) {
        Map<String, Object> result = new HashMap<>();
        instrumentFeatureDao.insertSelective(feature);
        result.put("code", "200");
        result.put("payload", feature);
        return result;
    }

    @Override
    public Map<String, Object> addScope(InstrumentScope scope) {
        Map<String, Object> result = new HashMap<>();
        instrumentScopeDao.insertSelective(scope);
        result.put("code", "200");
        result.put("payload", scope);
        return result;
    }

    @Override
    public ShareInsDetailInfo getMore(Long orgId) {
        //根据机构id 检索所有联系人
        ShareInsDetailInfo insDetailInfo = new ShareInsDetailInfo();
        List<OrgContacts> contacts = orgContactsDao.searchContactsByOrgId(orgId, null);
        if (contacts != null) {
            insDetailInfo.setConList(contacts);
        }
        //根据机构id 查询机构地址
        com.renrenlab.rlab.vo.OrgAddress orgAddress = orgAddressDao.searchOrgAddressByOrgId(orgId);
        if (orgAddress != null) {
            insDetailInfo.setOrgAddrId(orgAddress.getOrgAddrId());
            insDetailInfo.setOrgAddrProvince(orgAddress.getOrgAddrProvince());
            insDetailInfo.setOrgAddrCity(orgAddress.getOrgAddrCity());
            insDetailInfo.setConStreet(orgAddress.getOrgAddrStreet());
            insDetailInfo.setOrgAddrDistrict(orgAddress.getOrgAddrDistrict());
            insDetailInfo.setOrgAddrLongitude(orgAddress.getOrgAddrLongitude());
            insDetailInfo.setOrgAddrLatitude(orgAddress.getOrgAddrLatitude());
        }
        return insDetailInfo;
    }

}
