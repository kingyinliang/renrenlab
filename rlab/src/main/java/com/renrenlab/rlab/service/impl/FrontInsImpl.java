package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.InsUtil;
import com.renrenlab.rlab.common.util.PriceUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.*;
import com.renrenlab.rlab.service.FrontInsService;
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
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

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
    @Resource(name = "taskExecutor")
    private TaskExecutor taskExecutor;

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
                                                  HttpServletRequest request) {
        province = doHandleKeyword(province);
        city = doHandleKeyword(city);
        category1 = doHandleKeyword(category1);
        category2 = doHandleKeyword(category2);

        if (scopeHighPrice != null) scopeHighPrice *= 100;
        if (scopeLowPrice != null) scopeLowPrice *= 100;

        keyword = doHandleKeyword(keyword);
        isDis = StringUtils.isNotEmpty(keyword);
        PageHelper.startPage(pageNo, pageSize);
        List<InsListInfo> infoList = null;
        //判断isDis 是否需要根据经纬度去查
        if (isDis) {
            //从session取出经纬度 经纬度有可能为空
            Double longitude = null, latitude = null;
            try {
                longitude = Double.parseDouble(request.getSession().getAttribute("lng") + "");
                latitude = Double.parseDouble(request.getSession().getAttribute("lat") + "");
            } catch (NumberFormatException e) {
                logger.error("session 中获取经纬度失败");
            }
            infoList = insSearchDao.selectBykeyword(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, city, district, isDis, longitude, latitude);
        } else {
            infoList = insSearchDao.selectBykeyword(keyword, insServiceType, scopeLowPrice, scopeHighPrice,
                    category1, category2, province, city, district, isDis, null, null);
        }
        infoList = doHandleResult(infoList);
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

    public InsDetailInfo search(Long mapId) {
        InsDetailInfo detailInfo = insSearchDao.searchDetail(mapId);
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
                    jsonArray.add(insturmentCategory.getCategoryName());
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
                detailInfo.setPrice(InsUtil.handlePrice(detailInfo.getInsOrgPriceList().toString()));
            }
            //处理核心参数
            if (detailInfo.getInsCoreParam() != null) {
                detailInfo.setInsCoreParam(InsUtil.handelCoreParam(detailInfo.getInsCoreParam().toString()));
            }
            //图片处理
            if (detailInfo.getInsPic() != null) {
                detailInfo.setInsPic(InsUtil.handlePic(detailInfo.getInsPic().toString()));
            }
            //处理描述
            if (detailInfo.getInsDescription() != null) {
                List<TitleContent> list = new ArrayList<>();
                if (detailInfo.getInsDescription() != null)
                    list.addAll(InsUtil.handleDes(detailInfo.getInsDescription().toString()));
                if (detailInfo.getMapDescription() != null && !detailInfo.getMapDescription().toString().equals("[]"))
                    list.addAll(InsUtil.handelCoreParam(detailInfo.getMapDescription().toString()));
//            list.addAll(InsUtil.handelCoreParam(detailInfo.getInsCoreParam().toString()));
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

    /**
     * 处理关键词
     *
     * @param keyword
     * @return
     */
    private String doHandleKeyword(String keyword) {
        if (StringUtils.isEmpty(keyword)) return null;
        keyword = keyword.trim();
        //处理竖杠
        keyword = keyword.replaceAll("\\|", "");
        keyword = keyword.replaceAll("'", "");
        //处理html标签
        keyword = keyword.replaceAll("<", "");
        keyword = keyword.replaceAll(">", "");
        keyword = keyword.replaceAll("\\(", "");
        keyword = keyword.replaceAll("\\)", "");
        keyword = keyword.replaceAll("\\\\", "");
        //处理特殊字符  select/*!*/`version`
        keyword = keyword.replaceAll("`", "");
        keyword = keyword.replaceAll("/", "");
        keyword = keyword.replaceAll("\\*", "");
        keyword = keyword.replaceAll("!", "");
        keyword = keyword.replaceAll(":", "");
        //处理空格
        keyword = keyword.replaceAll("\\s+", "&");
        return keyword;
    }

    private List<InsListInfo> doHandleResult(List<InsListInfo> infos) {
        Price price;
        String insPicURL;
        for (InsListInfo info : infos) {
            price = JSON.parseObject(info.getInsOrgPriceList().toString(), Price.class);
            if (price.getFlag() == 1) {
                //精准价格
                price.setAccPrice(PriceUtil.handleListPrice(price.getAccPrice()));
            }
            if (price.getFlag() == 2) {
                //价格范围
                price.setScopeLowPrice(PriceUtil.handleListPrice(price.getScopeLowPrice()));
                price.setScopeHighPrice(PriceUtil.handleListPrice(price.getScopeHighPrice()));
            }
            info.setPrice(price);
            insPicURL = info.getInsPic();
            if (insPicURL != null && !insPicURL.startsWith("http")) {
                info.setInsPic(Constant.UPLOADIMG + info.getInsPic() + Constant.XOSS);
            } else if (insPicURL != null && insPicURL.startsWith("http://congye-spider")) {
                info.setInsPic(insPicURL + Constant.XOSSCONG);
            } else if (insPicURL != null && insPicURL.startsWith("http://renrenlab")) {
                info.setInsPic(info.getInsPic() + Constant.XOSS);
            }
            //仪器分类
            info.setInsCategory(JSONObject.parseObject(info.getInsCategory().toString(), String[].class));
            //仪器特点
            if (info.getInsFeatureName() != null)
                info.setInsFeatureName(JSONObject.parseObject(info.getInsFeatureName().toString(), List.class));
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
