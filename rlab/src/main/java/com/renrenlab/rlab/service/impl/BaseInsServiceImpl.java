package com.renrenlab.rlab.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.renrenlab.rlab.common.util.CommonUtil;
import com.renrenlab.rlab.dao.*;
import com.renrenlab.rlab.model.BaseInsInfo;
import com.renrenlab.rlab.model.InstrumentCategory;
import com.renrenlab.rlab.model.InstrumentCoreParam;
import com.renrenlab.rlab.service.BaseInsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guanjipeng on 2017/7/20.
 */
@Service
@Transactional
public class BaseInsServiceImpl implements BaseInsService {

    @Autowired
    private BaseInsDao baseInsDao;

    @Autowired
    private InstrumentCategoryDao instrumentCategoryDao;

    @Autowired
    private InstrumentCoreParamDao instrumentCoreParamDao;

    @Autowired
    private InstrumentScopeDao instrumentScopeDao;

    @Autowired
    private InstrumentFeatureDao instrumentFeatureDao;


    @Override
    public PageInfo<BaseInsInfo> getList(String keyword,
                                         String insCatogry,
                                         String beginTime,
                                         String endTime,
                                         Integer pageNo,
                                         Integer pageSize,
                                         String order) {

        Long insId = null;
        if (CommonUtil.isNum(keyword))
            insId = Long.parseLong(keyword);
        PageHelper.startPage(pageNo, pageSize);
        List<BaseInsInfo> infos = null;
        if (beginTime != null && beginTime.equals("")) beginTime = null;
        if (endTime != null && endTime.equals("")) endTime = null;
        //case1:insCatogry为空
        if (insCatogry == null || insCatogry.equals("")) {
            infos = baseInsDao.getList(keyword, insId, beginTime, endTime, order);
        } else {
            //case2:insCatogry为一级分类
            String insCatogry2 = "\"" + insCatogry + "\"";
            infos = baseInsDao.getListWithCate(keyword, insId, insCatogry, insCatogry2, beginTime, endTime, order);
        }
        //保存仪器分类的数组一级分类，二级分类，三级分类
        String[] categories = null;
        List<InstrumentCategory> insturmentCategories = null;
        for (BaseInsInfo ins : infos) {
            insturmentCategories = new ArrayList<>();
            categories = JSONObject.parseObject(ins.getInsCategory().toString(), String[].class);
            if (categories[0] != null && categories[1] != null) {
                insturmentCategories.add(instrumentCategoryDao.selectCategory(categories[0], 1l));
                insturmentCategories.add(instrumentCategoryDao.selectCategory(categories[1], 2l));
                ins.setInsturmentCategories(insturmentCategories);
            }
            //处理时间
            ins.setTime(CommonUtil.formatTime(ins.getModifyTime()));
        }
        return new PageInfo<>(infos);
    }

    @Override
    public BaseInsInfo getDetail(Long insId) {
        BaseInsInfo insInfo = baseInsDao.getDetail(insId);
        String[] insCategory = JSONObject.parseObject(insInfo.getInsCategory().toString(), String[].class);
        List<InstrumentCategory> categories = new ArrayList<>();
        InstrumentCategory insturmentCategory = null;

        for (int i = 0; i < insCategory.length; i++) {
            if (insCategory[i] != null) {
                insturmentCategory = instrumentCategoryDao.selectCategory(insCategory[i], Long.valueOf(i + 1));
                categories.add(insturmentCategory);
            }
        }
        insInfo.setInsturmentCategories(categories);
        return insInfo;
    }

    @Override
    public int modify(BaseInsInfo insInfo) {

        return baseInsDao.updateBaseInfo(insInfo);
    }

    /**
     * 仪器三级分类
     *
     * @param level
     * @param code
     * @return
     */
    @Override
    public Map<String, Object> getCategory(Integer level, String code) {
        Map<String, Object> result = new HashMap<>();
        List<InstrumentCategory> list = instrumentCategoryDao.selectByLevelAndCode(level, code);
        result.put("code", "200");
        result.put("payload", list);
        return result;
    }

    @Override
    public Map<String, Object> getCoreParam(String code) {
        Map<String, Object> result = new HashMap<>();
        result.put("code", "200");
        result.put("payload", null);
        InstrumentCoreParam coreParam = instrumentCoreParamDao.selectByCode(code);
        if (coreParam != null) {
            String parameters = coreParam.getParameters();
            JSONArray jsonArray = JSON.parseObject(parameters, JSONArray.class);
            result.put("payload", jsonArray);
        }
        return result;
    }
}
