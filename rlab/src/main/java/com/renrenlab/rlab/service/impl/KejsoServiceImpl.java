package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.JsonMapper;
import com.renrenlab.rlab.service.IKejsoService;
import com.renrenlab.rlab.vo.KejsoPaperListInfo;
import com.renrenlab.rlab.vo.KejsoProListInfo;
import com.renrenlab.rlab.vo.KejsoRelatedInfo;
import com.renrenlab.rlab.vo.KejsoSearchInfo;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.List;

@Service
public class KejsoServiceImpl implements IKejsoService {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Autowired
    JedisPool jedisPool;

    @Override
    public KejsoSearchInfo SearchMsgFromKejso(String query) {
        Jedis jedis = jedisPool.getResource();
        try {
            log.debug("invoke --- SearchMsgFromKejso,query=" + query);
            KejsoSearchInfo searchInfo = null;
            String str = jedis.get("kejso_" + query);
            if (str != null && str.length() != 0) {
                log.debug("SearchMsgFromKejso 读缓存----");
                searchInfo = (KejsoSearchInfo) JsonMapper.json2obj(str, KejsoSearchInfo.class);

                return searchInfo;
            }
            String mimeType = "urlencoded";
            String url = null;
            String stringEntity = null;
            String req = null;
            KejsoRelatedInfo relatedInfo = null;
            KejsoPaperListInfo paperInfo = null;
            String leader_ims = "不详";
            // 搜索科搜相关
            url = Constant.SEARCHURL;
            stringEntity = "query=" + query + "&core=fields&ret=json";
            log.debug("查询参数" + stringEntity);
            req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("搜索科搜相关，请求失败");
                return null;
            }
            searchInfo = (KejsoSearchInfo) JsonMapper.json2obj(req, KejsoSearchInfo.class);
            log.debug("invoke --- SearchMsgFromKejso,searchInfo=" + searchInfo);
            if (searchInfo != null && searchInfo.getStatus() != null) {
                return null;
            }
            //处理相关项目带头人信息
            List<KejsoProListInfo> prolist = searchInfo.getProlist();
            if (prolist != null && !prolist.isEmpty()) {
                for (KejsoProListInfo kejsoProListInfo : prolist) {
                    if (StringUtils.isNotBlank(kejsoProListInfo.getLeader_ims())) {
                        leader_ims = kejsoProListInfo.getLeader_ims();
                        leader_ims = leader_ims.substring(0, leader_ims.indexOf(","));
                        if (StringUtils.isBlank(leader_ims) || "null".equals(leader_ims) || "".equals(leader_ims.trim())) {
                            leader_ims = "不详";
                        }
                    }
                    kejsoProListInfo.setLeader_ims(leader_ims);
                }
            }
            // 查询相关咨询
            url = Constant.RELATEDINFO;
            stringEntity = "query=" + query + "&start=0&which=webpages";
            log.debug("查询参数" + stringEntity);
            req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            relatedInfo = (KejsoRelatedInfo) JsonMapper.json2obj(req, KejsoRelatedInfo.class);
            log.debug("invoke --- SearchMsgFromKejso,relatedInfo=" + relatedInfo);
            if (relatedInfo.getRe() != null && !relatedInfo.getRe().isEmpty()) {
                searchInfo.setRelatedInfo(relatedInfo.getRe());
            }
            // 查询论文详细信息
            url = Constant.PAPERINFO;
            List<KejsoPaperListInfo> paperlist = searchInfo.getPaperlist();
            if (paperlist != null && !paperlist.isEmpty()) {
                for (KejsoPaperListInfo kejsoPaperListInfo : paperlist) {
                    String id = kejsoPaperListInfo.getId();
                    stringEntity = "name=" + query + "&id=" + id + "&which=single_paper";
                    req = HttpClientUtils.doPost(url, stringEntity, mimeType);
                    paperInfo = (KejsoPaperListInfo) JsonMapper.json2obj(req, KejsoPaperListInfo.class);
                    kejsoPaperListInfo.setKeywords(paperInfo.getRe().get(0).getKeywords());
                    kejsoPaperListInfo.setWorkplace_ais(paperInfo.getRe().get(0).getWorkplace_ais());
                }
            }
            String jsonString = JsonMapper.getJsonString(searchInfo);
            jedis.set("kejso_" + query, jsonString);
            jedis.expire("kejso_" + query, 60 * 60 * 24*15);
            return searchInfo;
        } catch (Exception e) {
            log.error("SearchMsgFromKejso方法出现异常Exception" + e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    @Override
    public KejsoPaperListInfo morePaper(String query, Integer pageNo, Integer pageSize) {
        Jedis jedis = jedisPool.getResource();
        try {
            log.debug("invoke --- morePaper,query=" + query + "pageNo=" + pageNo + "pageSize=" + pageSize);
            KejsoPaperListInfo paperInfo = new KejsoPaperListInfo();
            KejsoPaperListInfo paperInfo1 = null;
            List<KejsoPaperListInfo> list = new ArrayList<>();
            //默认10条
            if (pageSize == null || pageSize == 0) {
                pageSize = 10;
            }
            pageNo = pageNo * 10;
            Integer page = pageSize * pageNo + 9;
            //从redis中取数据
            List<String> lrange = jedis.lrange("kejsopaper_" + query, pageNo, page);
            if (lrange != null && !lrange.isEmpty()) {
                log.debug("morePaper 读缓存----");
                for (String string : lrange) {
                    paperInfo1 = (KejsoPaperListInfo) JsonMapper.json2obj(string, KejsoPaperListInfo.class);
                    list.add(paperInfo1);
                }
                paperInfo.setRe(list);

                return paperInfo;
            }
            String mimeType = "urlencoded";
            String url = null;
            String stringEntity = null;
            String req = null;
            url = Constant.RELATEDINFO;
            stringEntity = "query=" + query + "&start=" + pageNo + "&which=paper";
            log.debug("查询参数" + stringEntity);
            req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("搜索科搜相关论文，请求失败");
                return paperInfo;
            }
            paperInfo = (KejsoPaperListInfo) JsonMapper.json2obj(req, KejsoPaperListInfo.class);
            List<KejsoPaperListInfo> paperList = paperInfo.getRe();
            url = Constant.PAPERINFO;
            //取论文列表
            if (paperList != null && !paperList.isEmpty()) {
                for (KejsoPaperListInfo kejsoPaperListInfo : paperList) {
                    //取论文详情
                    String id = kejsoPaperListInfo.getId();
                    stringEntity = "name=" + query + "&id=" + id + "&which=single_paper";
                    req = HttpClientUtils.doPost(url, stringEntity, mimeType);
                    paperInfo1 = (KejsoPaperListInfo) JsonMapper.json2obj(req, KejsoPaperListInfo.class);
                    kejsoPaperListInfo.setKeywords(paperInfo1.getRe().get(0).getKeywords());
                    kejsoPaperListInfo.setWorkplace_ais(paperInfo1.getRe().get(0).getWorkplace_ais());
                    //存到redis中,list存储
                    String jsonString = JsonMapper.getJsonString(kejsoPaperListInfo);
                    jedis.rpush("kejsopaper_" + query, jsonString);
                    jedis.expire("kejsopaper_" + query, 60 * 60 * 24*15);
                }
            }
            return paperInfo;
        } catch (Exception e) {
            log.error("morePaper方法出现异常Exception" + e);
            //e.printStackTrace();
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    @Override
    public KejsoProListInfo morePro(String query, Integer pageNo, Integer pageSize) {
        Jedis jedis = jedisPool.getResource();
        try {
            log.debug("invoke --- morePro,query=" + query + "pageNo=" + pageNo + "pageSize=" + pageSize);
            KejsoProListInfo proInfo = new KejsoProListInfo();
            KejsoProListInfo proInfo1 = new KejsoProListInfo();
            List<KejsoProListInfo> list = new ArrayList<>();
            String leader_ims = "不详";
            //默认10条
            if (pageSize == null || pageSize == 0) {
                pageSize = 10;
            }
            pageNo = pageNo * 10;
            Integer page = pageSize * pageNo + 9;
            //从redis中取数据
            List<String> lrange = jedis.lrange("kejsopro_" + query, pageNo, page);
            if (lrange != null && !lrange.isEmpty()) {
                log.debug("morePro 读缓存----");
                for (String string : lrange) {
                    proInfo1 = (KejsoProListInfo) JsonMapper.json2obj(string, KejsoProListInfo.class);
                    list.add(proInfo1);
                }
                proInfo.setRe(list);
                return proInfo;
            }
            String mimeType = "urlencoded";
            String url = null;
            String stringEntity = null;
            String req = null;
            url = Constant.RELATEDINFO;
            stringEntity = "query=" + query + "&start=" + pageNo + "&which=project";
            log.debug("查询参数" + stringEntity);
            req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("搜索科搜相关项目，请求失败");
                return proInfo;
            }
            proInfo = (KejsoProListInfo) JsonMapper.json2obj(req, KejsoProListInfo.class);
            List<KejsoProListInfo> proList = proInfo.getRe();
            //取项目列表
            if (proList != null && !proList.isEmpty()) {
                for (KejsoProListInfo kejsoProListInfo : proList) {
                    if (StringUtils.isNotBlank(kejsoProListInfo.getLeader_ims())) {
                        leader_ims = kejsoProListInfo.getLeader_ims();
                        leader_ims = leader_ims.substring(0, leader_ims.indexOf(","));
                        if (StringUtils.isBlank(leader_ims) || "null".equals(leader_ims)) {
                            leader_ims = "不详";
                        }
                    }
                    kejsoProListInfo.setLeader_ims(leader_ims);
                    //存到redis中,list存储
                    String jsonString = JsonMapper.getJsonString(kejsoProListInfo);
                    jedis.rpush("kejsopro_" + query, jsonString);
                    jedis.expire("kejsopro_" + query, 60 * 60 * 24*15);
                }
            }
            return proInfo;
        } catch (Exception e) {
            log.error("morePro方法出现异常Exception" + e);
            //e.printStackTrace();
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    @Override
    public KejsoRelatedInfo moreRelatedInfo(String query, Integer pageNo, Integer pageSize) {
        Jedis jedis = jedisPool.getResource();
        try {
            log.debug("invoke --- moreRelatedInfo,query=" + query + "pageNo=" + pageNo + "pageSize=" + pageSize);
            KejsoRelatedInfo relatedInfo = new KejsoRelatedInfo();
            KejsoRelatedInfo relatedInfo1 = new KejsoRelatedInfo();
            List<KejsoRelatedInfo> list = new ArrayList<>();
            //默认10条
            if (pageSize == null || pageSize == 0) {
                pageSize = 10;
            }
            pageNo = pageNo * 10;
            Integer page = pageSize * pageNo + 9;
            //从redis中取数据
            List<String> lrange = jedis.lrange("kejsorelated_" + query, pageNo, page);
            if (lrange != null && !lrange.isEmpty()) {
                log.debug("moreRelatedInfo 读缓存----");
                for (String string : lrange) {
                    relatedInfo1 = (KejsoRelatedInfo) JsonMapper.json2obj(string, KejsoRelatedInfo.class);
                    list.add(relatedInfo1);
                }
                relatedInfo.setRe(list);
                return relatedInfo;
            }
            String mimeType = "urlencoded";
            String url = null;
            String stringEntity = null;
            String req = null;
            url = Constant.RELATEDINFO;
            stringEntity = "query=" + query + "&start=" + pageNo + "&which=webpages";
            log.debug("查询参数" + stringEntity);
            req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("搜索科搜相关咨询，请求失败");
                return relatedInfo;
            }
            relatedInfo = (KejsoRelatedInfo) JsonMapper.json2obj(req, KejsoRelatedInfo.class);
            List<KejsoRelatedInfo> proList = relatedInfo.getRe();
            //取论文列表
            if (proList != null && !proList.isEmpty()) {
                for (KejsoRelatedInfo kejsoRelatedInfo : proList) {
                    //存到redis中,list存储
                    String jsonString = JsonMapper.getJsonString(kejsoRelatedInfo);
                    jedis.rpush("kejsorelated_" + query, jsonString);
                    jedis.expire("kejsorelated_" + query, 60 * 60 * 24*15);
                }
            }
            return relatedInfo;
        } catch (Exception e) {
            log.error("moreRelatedInfo方法出现异常Exception" + e);
            //e.printStackTrace();
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

}
