package com.renrenlab.cms.communication.service.impl;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.common.constant.WeixinFinalValue;
import com.renrenlab.cms.common.util.JsonUtil;
import com.renrenlab.cms.common.util.WeixinBasicUtil;
import com.renrenlab.cms.communication.dao.OrderProjectDao;
import com.renrenlab.cms.communication.dao.OrderSchemeDao;
import com.renrenlab.cms.communication.dao.UserWxDao;
import com.renrenlab.cms.communication.dto.WeixinContext;
import com.renrenlab.cms.communication.model.OrderProject;
import com.renrenlab.cms.communication.model.OrderScheme;
import com.renrenlab.cms.communication.model.UserWx;
import com.renrenlab.cms.communication.service.IOrderProjectService;
import com.renrenlab.cms.communication.service.IOrderSchemeService;
import com.renrenlab.cms.wechat.quartz.RefreshAccessTokenTask;
import org.springframework.transaction.annotation.Transactional;

/**
 * 项目
 *
 * Created by lihongxun on 2017/5/16.
 */
@Service
@Transactional
public class OrderProjectSchemeServiceImpl implements IOrderProjectService, IOrderSchemeService {

    @Autowired
    private OrderProjectDao orderProjectDao;
    @Autowired
    private OrderSchemeDao orderSchemeDao;
    @Autowired
    private UserWxDao userWxDao;
    @Autowired
	private RefreshAccessTokenTask refreshAccessTokenTask;
    
    @Override
    public int addPro(OrderProject project) {
        return orderProjectDao.insertSelective(project);
    }

    @Override
    public List<OrderProject> selectProList(long u_id) {
        return orderProjectDao.selectByUIdKey(u_id);
    }

    /**
     * 发送消息给微信
     *
     * @param uId
     * @return
     */
    @Override
    public String postPjScheToWechat(Long uId, Long[] scheId) {
        UserWx userWx = userWxDao.selectChatUserByUuId(uId);
        String openId = userWx.getWxOpenId();

        String str = Arrays.toString(scheId).replace(",", "&ids=").replaceAll(" ", "");
        String url = WeixinContext.getInstance().getBaseUrl() + "/wx/order/scheme/list.do?ids=" + str.substring(1, str.length() - 1);
        String weChatUrl = WeixinBasicUtil.replaceAccessTokenUrl(WeixinFinalValue.ADD_MESSAGE);

        Map<String, Object> map = new HashMap<String, Object>();
        Map<String, Object> map1 = new HashMap<String, Object>();
        map.put("touser", openId);
        map.put("msgtype", "text");
        map1.put("content", "您好，根据您的需求，匹配到如下几家机构\n<a href=\"" + url + "\">点击查看方案</a>");
        map.put("text", map1);

        String rel = WeixinBasicUtil.sendJsonPost(weChatUrl, JsonUtil.getInstance().obj2json(map));

        if (!WeixinBasicUtil.checkRequestSucc(rel)) {
        	if(WeixinBasicUtil.getRequestCode(rel)==WeixinFinalValue.INVALIDACCESSTOKEN){
    			refreshAccessTokenTask.refreshToken();
    			rel=WeixinBasicUtil.sendJsonPost(weChatUrl, JsonUtil.getInstance().obj2json(map));
    		}
        	if(WeixinBasicUtil.checkRequestSucc(rel)){
        		return "方案发送成功";
        	}
            throw new RuntimeException("发布方案失败：" + WeixinBasicUtil.getRequestMsg(rel));
        }
        return "方案发送成功";
    }

    @Override
    public int addScheme(OrderScheme scheme) {
        scheme.setSchProject(replaceSpecialCharacters(scheme.getSchProject()));
        scheme.setSchOrganization(replaceSpecialCharacters(scheme.getSchOrganization()));
        scheme.setSchStandard(replaceSpecialCharacters(scheme.getSchStandard()));
        scheme.setSchInstrument(replaceSpecialCharacters(scheme.getSchInstrument()));
        scheme.setSchQualifications(replaceSpecialCharacters(scheme.getSchQualifications()));
        return orderSchemeDao.insertSelective(scheme);
    }

    /**
     * 替换特殊字符
     *
     * @param specail
     * @return
     */
    private String replaceSpecialCharacters(String specail) {
        specail = specail.replaceAll("\\\\", "\\\\\\\\");
        specail = specail.replaceAll("\"", "\\\\\"");
        specail = specail.replaceAll("\'", "\\\\\'");
        specail = specail.replaceAll("&", "&#38;");
        specail = specail.replaceAll("<", "&#60;");
        specail = specail.replaceAll(">", "&#62;");
        specail = specail.replaceAll(" ", "&#160;");
        specail = specail.replaceAll("\\r", "&#13;&#10;");
        specail = specail.replaceAll("\\n", "&#13;&#10;");
        specail = specail.replaceAll("\\t", "&#009;");
        specail = specail.replaceAll("\\f", "&012;");
        return specail;
    }

    @Override
    public List<OrderScheme> querySchemeList(Long pj_id) {
        return orderSchemeDao.selectByPjId(pj_id);
    }

    @Override
    public int updateScheme(OrderScheme scheme) {
        return orderSchemeDao.updateBySchIdSelective(scheme);
    }

    @Override
    public int deleScheme(Long sch_id) {
        return orderSchemeDao.delBySchId(sch_id);
    }
}
