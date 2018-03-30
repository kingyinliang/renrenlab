package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.dao.InfomationDao;
import com.renrenlab.rlab.model.Infomation;
import com.renrenlab.rlab.model.InsListInfo;
import com.renrenlab.rlab.model.ServiceIndexInfo;
import com.renrenlab.rlab.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2018/1/10.
 */
@Service
public class SearchAllImpl implements ISearchAll {
    @Autowired
    FrontInsService insService;
    @Autowired
    InfomationService infomationService;
    @Autowired
    ISuperSearchService superSearchService;
    @Autowired
    IServiceIndexService indexService;
    @Autowired
    InfomationDao infomationDao;

    /**
     * 搜索内容包括：共享仪器，科技头条，高级搜索（标签：第三方检测，科研众包）
     *
     * @param pageNo
     * @param pageSize
     * @param searchKey
     * @return
     */
    @Override
    public Map<String, PageInfo> searchAll(Integer pageNo, Integer pageSize, String searchKey,
                                           String province,
                                           String city,
                                           String district) {
        Map<String, PageInfo> map = new HashMap<>();
        //共享仪器
        PageInfo<InsListInfo> shareIns = insService.searchInstrument(searchKey, null, null, null, null,
                null, province, city, district, pageNo, pageSize, false, null, null);
        //科技头条
        PageInfo<Infomation> infos = infomationService.searchByKey(pageNo, pageSize, searchKey);
        String customTag = "科研众包";
        PageInfo<ServiceIndexInfo> serviceIndexsKeyan = indexService.search(searchKey, province, city, district, null, null, null, null,
                null, pageNo, pageSize, null, null, customTag,"0",null);
        customTag = "第三方检测";
        PageInfo<ServiceIndexInfo> serviceIndexJianCe = indexService.search(searchKey, province, city, district, null, null, null, null,
                null, pageNo, pageSize, null, null, customTag,"101",null);
        map.put("shareIns", shareIns);
        map.put("infos", infos);
        map.put("serviceIndexsKeyan", serviceIndexsKeyan);
        map.put("serviceIndexJianCe", serviceIndexJianCe);
        return map;
    }

    /**
     * 仪器预约
     *
     * @param pageNo
     * @param pageSize
     * @param searchKey
     * @param tag       仪器预约
     * @return
     */
    @Override
    public PageInfo<InsListInfo> getMoreIns(Integer pageNo, Integer pageSize, String searchKey,
                                            String category2,
                                            String province,
                                            String city,
                                            String district,
                                            String tag) {
        if (StringUtils.isBlank(tag)) {
            tag = null;
        }
        //共享仪器
        PageInfo<InsListInfo> shareIns = insService.searchInstrument(searchKey, null, null, null, null,
                category2, province, city, district, pageNo, pageSize, false, null, tag);
        return shareIns;
    }

    @Override
    public PageInfo<ServiceIndexInfo> getService(Integer pageNo, Integer pageSize, String key, String tag, String province, String city, String district, String category) {
        if (StringUtils.isBlank(category)) {
            category = null;
        }
        if ("第三方检测".equals(tag)) {
            tag = null;
            category = "101";
        } else if ("科研众包".equals(tag) && category == null) {
            //18,95,99,103
            category = "0";
            tag = null;
        }

        PageInfo<ServiceIndexInfo> serviceInfoPageInfo = indexService.search(key, province, city, district, null,
                null, null, null, null, pageNo, pageSize, null, null,
                tag, category, null);
        return serviceInfoPageInfo;
    }

    /**
     * 科技头条( 行业动态 政策速报 最新活动)
     */
    @Override
    public PageInfo<Infomation> getClassify(String classifyName, Integer pageNo) {
        PageHelper.startPage(pageNo, 10);
        List<Infomation> articles = infomationDao.getArticles(classifyName, null);
        LocalDateTime localDateTime = LocalDateTime.now().withNano(0);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        articles.forEach(article -> {
            article.setHours((int) Duration.between(article.getCreateTime(), localDateTime).toHours());
            //处理标签
            article.settInfoTags(JSONObject.parseArray(article.gettInfoTags().toString()));
            //处理日期
            article.setCreateTimeStr(article.getCreateTime().format(formatter));
        });
        return new PageInfo<>(articles);
    }
}
