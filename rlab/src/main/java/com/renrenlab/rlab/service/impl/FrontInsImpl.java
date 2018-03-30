package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.FrontInsService;
import com.renrenlab.rlab.service.IComonService;
import com.renrenlab.rlab.vo.OrgContacts;
import net.sf.json.JSONArray;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import static com.renrenlab.rlab.common.util.SearchUtil.doHandleKeyword;

/**
 * Created by guanjipeng on 2017/5/17.
 */
@Service
public class FrontInsImpl implements FrontInsService {
    @Autowired
    private InsSearchDao insSearchDao;

    @Autowired
    private OrgAddressDao orgAddressDao;
    @Autowired
    private ShareInsDao shareInsDao;
    @Autowired
    private OrgContactsDao orgContactsDao;
    @Autowired
    private InstrumentCategoryDao instrumentCategoryDao;
    @Autowired
    private InstrumentFeatureDao instrumentFeatureDao;

    @Autowired
    private InstrumentScopeDao instrumentScopeDao;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    IComonService comonService;

    @Resource(name = "taskExecutor")
    private TaskExecutor taskExecutor;

    @Override
    public PageInfo<InsListInfo> searchInstrument(String keyword,
                                                  String insServiceType,
                                                  Integer scopeLowPrice,
                                                  Integer scopeHighPrice,
                                                  String category1,
                                                  String category2,
                                                  String province,
                                                  String city,
                                                  String district,
                                                  Integer pageNo,
                                                  Integer pageSize,
                                                  boolean isDis,
                                                  HttpServletRequest request,
                                                  String isSubscribe) {
        province = doHandleKeyword(province);
        city = doHandleKeyword(city);
        category1 = doHandleKeyword(category1);
        category2 = doHandleKeyword(category2);

        if (scopeHighPrice != null) scopeHighPrice *= 100;
        if (scopeLowPrice != null) scopeLowPrice *= 100;
        if (pageNo == null) pageNo = 1;
        if (pageSize == null) pageSize = 10;

        keyword = doHandleKeyword(keyword);
        PageHelper.startPage(pageNo, pageSize);
        List<InsListInfo> infoList = null;
        //判断isDis 是否需要根据经纬度去查
        if (isDis) {
            //从session取出经纬度 经纬度有可能为空
            Double longitude = null, latitude = null;
            Object o1, o2;
            if ((o1 = request.getSession().getAttribute(Constant.Service.LONGITUDE)) != null && (o2 = request.getSession().getAttribute(Constant.Service.LATITUDE)) != null) {
                longitude = Double.parseDouble(o1.toString());
                latitude = Double.parseDouble(o2.toString());
            }
            infoList = insSearchDao.selectBykeyword(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, city, district, isDis, longitude, latitude, isSubscribe);
        } else {
            infoList = insSearchDao.selectBykeyword(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, city, district, isDis, null, null, isSubscribe);
        }
        infoList = doHandleResult(infoList);
        comonService.saveSearchTerm(keyword);
       /* //线程池任务
        final String finalKeyword = keyword;
        try {
            taskExecutor.execute(new Runnable() {
                @Override
                public void run() {
                    doPost(finalKeyword);
                }
            });
        } catch (Exception e) {
            logger.error(e.getMessage());
        }*/
        return new PageInfo<>(infoList);
    }

    @Override
    public List<String> getDistrict(String province, String city) {
        return insSearchDao.getDistrict(province, city);
    }

    @Override
    public InsDetailInfo search(Long mapId) {
        InsDetailInfo detailInfo = insSearchDao.searchDetail(mapId);
        detailInfo = SearchUtil.handleInsDetail(detailInfo);
        if (detailInfo != null) {
            //检查mapDes是否含有mapNewIns字段
            if (detailInfo.getMapNewIns() != null) {
                //处理mapdescription  key类型为字符串 value类型有可能是字符串or字符串数组
                net.sf.json.JSONObject jsonObject = net.sf.json.JSONObject.fromObject(detailInfo.getMapNewIns().toString());
                detailInfo.setInsName(jsonObject.get("insName").toString());
                detailInfo.setInsMode(jsonObject.get("insMode").toString());
                detailInfo.setInsPic(jsonObject.get("insPic").toString());
                detailInfo.setInsBrand(jsonObject.get("insBrand").toString());
                detailInfo.setInsOrigin(jsonObject.get("insOrigin").toString());
                detailInfo.setInsCategory(jsonObject.get("insCategory").toString());
                detailInfo.setInsDescription(jsonObject.get("insDescription").toString());
                Iterator iterator = jsonObject.keys();
                List<TitleContent> mapTitleContent = new ArrayList<>();
                String key;
                String value;
                String[] valueArray;
                while (iterator.hasNext()) {
                    TitleContent titleContent = new TitleContent();
                    key = String.valueOf(iterator.next());
                    titleContent.setTitle(key);
                    if (jsonObject.get(key) instanceof JSONArray) {
                        int size = ((JSONArray) jsonObject.get(key)).size();
                        valueArray = new String[size];
                        if (size > 0) {
                            for (int i = 0; i < size; i++) {
                                valueArray[i] = ((JSONArray) jsonObject.get(key)).get(i).toString();
                            }
                        }
                        titleContent.setContent(valueArray);
                    } else if (jsonObject.get(key) instanceof net.sf.json.JSONObject) {
                        //核心参数
                        detailInfo.setInsCoreParam(jsonObject.get(key));
                    } else {
                        value = (String) jsonObject.get(key);
                        titleContent.setContent(value);
                    }
                    mapTitleContent.add(titleContent);
                }
            }

            //得到联系人id根据id检索其他信息
            if (detailInfo.getConId() != null) {
                detailInfo.setConId(getConList(detailInfo.getConId().toString()));
            }
            //仪器分类
            String[] insCategory = JSONObject.parseObject(detailInfo.getInsCategory().toString(), String[].class);
            com.alibaba.fastjson.JSONArray jsonArray = new com.alibaba.fastjson.JSONArray();
            InstrumentCategory insturmentCategory = null;
            for (int i = 0; i < insCategory.length; i++) {
                if (insCategory[i] != null) {
                    insturmentCategory = instrumentCategoryDao.selectCategory(insCategory[i], (long) (i + 1));
                    if (insCategory != null) {
                        String categoryName = insturmentCategory.getCategoryName();
                        if (StringUtils.isNotBlank(categoryName)) {
                            jsonArray.add(categoryName);
                        }
                    }
                }
            }
            detailInfo.setInsCategory(jsonArray);
            //得到领域id
            if (detailInfo.getInsScope() != null) {
                detailInfo.setInsScope(getScopeList(detailInfo.getInsScope().toString()));
            }
            //处理仪器特点
            if (detailInfo.getInsFeature() != null) {
                detailInfo.setInsFeature(getFeature(detailInfo.getInsFeature().toString()));
            }
            //价格处理
            if (detailInfo.getInsOrgPriceList() != null) {
                detailInfo.setPrice(SearchUtil.handlePrice(detailInfo.getInsOrgPriceList().toString()));
            }
            //处理核心参数
            if (detailInfo.getInsCoreParam() != null) {
                detailInfo.setInsCoreParam(SearchUtil.handelCoreParam(detailInfo.getInsCoreParam().toString()));
            }
            //图片处理
            if (detailInfo.getInsPic() != null) {
                detailInfo.setInsPic(SearchUtil.handlePic(detailInfo.getInsPic().toString()));
            }
            //处理描述
            if (detailInfo.getInsDescription() != null) {
                List<TitleContent> list = new ArrayList<>();
                if (detailInfo.getInsDescription() != null) {
                    list.addAll(SearchUtil.handleDes(detailInfo.getInsDescription().toString()));
                }
                if (detailInfo.getMapDescription() != null && !detailInfo.getMapDescription().toString().equals("[]")) {
                    list.addAll(SearchUtil.handelCoreParam(detailInfo.getMapDescription().toString()));
                }
                detailInfo.setInsDescription(list);
            }
        }
        return detailInfo;
    }

    @Override
    public boolean IsExistedInstrument(String location, boolean isCity) {
        Integer count = insSearchDao.IsExistedInstrument(location, isCity);
        if (count != null && count > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void doPost(String keyword) {
        String url = Constant.SEARCHURL;
        String mimeType = "urlencoded";
        String stringEntity = "query=" + keyword + "&core=fields&ret=cache_only";
        HttpClientUtils.doPost(url, stringEntity, mimeType);
    }

    private List<InsListInfo> doHandleResult(List<InsListInfo> infos) {
        Price price;
        String insPicURL;
        for (InsListInfo info : infos) {
            price = SearchUtil.handlePrice(info.getInsOrgPriceList());
            info.setPrice(price);
            insPicURL = info.getInsPic();
            info.setInsPic(SearchUtil.handlePicToStr(insPicURL));
            //仪器分类
            info.setInsCategory(JSONObject.parseObject(info.getInsCategory().toString(), String[].class));
            //仪器特点
            if (info.getInsFeatureName() != null) {
                info.setInsFeatureName(JSONObject.parseObject(info.getInsFeatureName().toString(), List.class));
            }
        }
        return infos;
    }

    /**
     * 根据联系人ids 检索联系人信息
     *
     * @param conIds
     * @return
     */
    private List<OrgContacts> getConList(String conIds) {
        List<OrgContacts> contactInfos = new ArrayList<>();
        Long conId = null;
        OrgContacts contactInfo = null;
        try {
            com.alibaba.fastjson.JSONArray conIdArr = JSONObject.parseArray(conIds);
            for (int i = 0; i < conIdArr.size(); i++) {
                conId = Long.parseLong((String) conIdArr.get(i));
                contactInfo = shareInsDao.getContactInfo(conId);
                if (contactInfo != null)
                    contactInfos.add(contactInfo);
            }
        } catch (Exception e) {
            logger.error("根据联系人ids 检索联系人信息出现问题", e);
        }
        return contactInfos;
    }

    /**
     * 根据适用领域ids 得到集合
     *
     * @param scopeIds
     * @return
     */
    private com.alibaba.fastjson.JSONArray getScopeList(String scopeIds) {
        Long scopeId = null;
        InstrumentScope scope = null;
        com.alibaba.fastjson.JSONArray scopeIdArr = null;
        try {
            scopeIdArr = JSONObject.parseArray(scopeIds);
            for (int i = 0; i < scopeIdArr.size(); i++) {
                scopeId = Long.parseLong((String) scopeIdArr.get(i));
                scope = instrumentScopeDao.selectById(scopeId);
                if (scope != null) {
                    scopeIdArr.remove(i);
                    scopeIdArr.add(i, scope.getInsScopeName());
                }
            }
        } catch (NumberFormatException e) {
            logger.error("根据适用领域ids 得到集合 出现异常", e);
        }
        return scopeIdArr;
    }

    /**
     * 仪器特点
     *
     * @param str
     * @return
     */
    private com.alibaba.fastjson.JSONArray getFeature(String str) {
        Long featureId = null;
        InstrumentFeature feature = null;
        com.alibaba.fastjson.JSONArray featureArr = null;
        try {
            featureArr = JSONObject.parseArray(str);
            for (int i = 0; i < featureArr.size(); i++) {
                featureId = Long.valueOf((String) featureArr.get(i));
                feature = instrumentFeatureDao.selectById(featureId);
                if (feature != null) {
                    featureArr.remove(i);
                    featureArr.add(i, feature.getInsFeatureName());
                }
            }
        } catch (NumberFormatException e) {
            logger.error("仪器特点 出现异常", e);
        }
        return featureArr;
    }
}
