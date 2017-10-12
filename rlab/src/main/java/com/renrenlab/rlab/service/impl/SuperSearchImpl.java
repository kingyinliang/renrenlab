package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.common.constant.Constant;
import com.renrenlab.rlab.common.util.HttpClientUtils;
import com.renrenlab.rlab.common.util.JsonMapper;
import com.renrenlab.rlab.dao.InsSearchDao;
import com.renrenlab.rlab.service.ISuperSearchService;
import com.renrenlab.rlab.vo.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guowanting on 2017/7/4.
 */
@Service
@Transactional
public class SuperSearchImpl implements ISuperSearchService {
    private Logger log = LoggerFactory.getLogger(this.getClass());
    //请求头格式
    private String mimeType = "urlencoded";

    @Resource(name = "taskExecutor")
    private TaskExecutor taskExecutor;

    @Autowired
    private InsSearchDao instrumentSearchDao;

    @Autowired
    JedisPool jedisPool;

    @Override
    public Map<String, Object> searchAll(String query) {

        Map<String,Object> map = new HashMap<>();
        //可能感兴趣的领域
        List<?> interest = searchInterestWords(query);
        map.put("interestWords",interest);
        //相关论文
        List<?> paper = searchRelatedInfo(query, "paper", 0, 10);
        map.put("relatedPaper",paper);
        //相关项目
        List<?> project = searchRelatedInfo(query, "project", 0, 10);
        map.put("relatedProject",project);
        //机构排名
        //List<?> orgrank = searchRankInfo(query);
        List<Map<String, Object>> orgrank = orgRank(query);
        map.put("orgrank",orgrank);
        //关联领域
        KejsoEchartsInfo kejsoEchartsInfo = searchRelatedField(query);
        map.put("relatedField",kejsoEchartsInfo);
        //相关咨讯
        List<?> news = searchRelatedNews(query, 0, 10);
        map.put("relatedNews",news);
        if(interest==null && paper==null && project==null && orgrank==null && kejsoEchartsInfo==null && news==null){
            return null;
        }
        return map;
    }

    /**
     * 可能感兴趣的领域2.0接口
     * @param query
     * @return
     */
    @Override
    public List<?> searchInterestWords(String query) {
        Jedis jedis = jedisPool.getResource();
        try{
            SuperSearchInterestInfo interestInfo;
            String str = jedis.get("sup_interest_" + query);
            if(str != null && str.length() != 0){
                log.debug("searchInterestWords 读缓存----查询词："+query);
                interestInfo = (SuperSearchInterestInfo) JsonMapper.json2obj(str, SuperSearchInterestInfo.class);
                return interestInfo.getRecommendfield();
            }
            log.debug("searchInterestWords 未缓存----查询词："+query);
            String url = Constant.INTERESTURL;
            String stringEntity = "searchword=" + query + "&thisType=field";
            String req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("可能感兴趣2.0接口，请求失败");
                return null;
            }
            interestInfo = (SuperSearchInterestInfo)JsonMapper.json2obj(req, SuperSearchInterestInfo.class);
            if(interestInfo==null){
                return null;
            }
            jedis.set("sup_interest_"+query,req);
            jedis.expire("sup_interest_" + query, 60 * 60 * 24 * 15);
            return interestInfo.getRecommendfield();
        } catch (Exception e) {
            log.error("请求可能感兴趣的领域2.0接口时出现异常",e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return  null;
    }

    /**
     * 关联领域2.0接口（echarts）
     * @param query
     * @return
     */
    @Override
    public KejsoEchartsInfo searchRelatedField(String query){
        Jedis jedis = jedisPool.getResource();
        try {
            KejsoEchartsInfo kejsoEchartsInfo;
            String str = jedis.get("sup_realatedfield_" + query);
            if(str != null && str.length() != 0){
                log.debug("searchRelatedField 读缓存----查询词："+query);
                kejsoEchartsInfo = (KejsoEchartsInfo) JsonMapper.json2obj(str,KejsoEchartsInfo.class);
                return kejsoEchartsInfo;
            }
            log.debug("searchRelatedField 未缓存----查询词："+query);
            String url = Constant.RELATEDFIELDTURL;
            String stringEntity = "searchword=" + query + "&thisType=field";

            String req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("关联领域2.0接口，请求失败");
                return null;
            }
            kejsoEchartsInfo = (KejsoEchartsInfo)JsonMapper.json2obj(req, KejsoEchartsInfo.class);
            if(kejsoEchartsInfo==null){
                return null;
            }
            if(kejsoEchartsInfo.getLinks()==null){
                return null;
            }if(kejsoEchartsInfo.getNodes()==null){
                return null;
            }
            jedis.set("sup_realatedfield_"+query,req);
            jedis.expire("sup_realatedfield_" + query, 60 * 60 * 24 * 15);
            return kejsoEchartsInfo;
        } catch (Exception e) {
            log.error("请求关联领域2.0接口时出现异常",e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    /**
     * 相关咨讯2.0接口
     * @param query
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    @Transactional
    public List<?> searchRelatedNews(String query, Integer pageNum, Integer pageSize){
        Jedis jedis = jedisPool.getResource();
        //页容量目前没得到控制
        try {
            SuperSearchNewsInfo newsInfo;
            List<Map<String, Object>> news = new ArrayList<>();
            List list = new ArrayList();
            Map<String,Object> map = new HashMap();
            int start = pageNum * pageSize;
            int end = ( pageNum - 1 ) * pageSize - 1 ;
            List<String> lrange = jedis.lrange("sup_realatednews_" + query, start, end);
            if (lrange != null && !lrange.isEmpty()) {
                log.debug("searchRelatedNews方法，query={},pageNum={} 读缓存---- ",query,pageNum);
                for (String string : lrange) {
                    map = (HashMap) JsonMapper.json2obj(string, HashMap.class);
                    list.add(map);
                }
                return list;
            }
            log.debug("searchRelatedNews方法，query={},pageNum={} 未缓存---- ",query,pageNum);
            String url= Constant.RELATEDNEWSURL;
            String stringEntity = "searchword=" + query + "&thisType=field&start="+pageNum;
            String req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("相关咨询2.0接口，请求失败");
                return null;
            }
            newsInfo = (SuperSearchNewsInfo)JsonMapper.json2obj(req, SuperSearchNewsInfo.class);
            if(newsInfo==null){
                return null;
            }
            news =  newsInfo.getFieldnews();
            for (Map<String, Object> m : news) {
                String jsonString = JsonMapper.getJsonString(m);
                jedis.rpush("sup_realatednews_" + query,jsonString);
                jedis.expire("sup_realatednews_" + query, 60 * 60 * 24 * 15);
            }
            return news;
        } catch (Exception e) {
            log.error("请求相关咨询2.0接口时出现异常",e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    /**
     * 相关论文、项目信息2.0
     * which指定论文或项目
     * @param query
     * @param which
     * @param pageNum
     * @param pageSize
     * @return
     */
    @Override
    @Transactional
    public List<?> searchRelatedInfo(String query, String which, Integer pageNum, Integer pageSize){
        Jedis jedis = jedisPool.getResource();
        try {
            SuperSearchRelatedInfo relatedInfo;
            int start = pageNum * pageSize;
            int end = ( pageNum - 1 ) * pageSize - 1 ;
            List<String> lrange = jedis.lrange("sup_" + which + "_" + query, start, end);
            List list = new ArrayList();
            Map<String,Object> map = new HashMap();
            if (lrange != null && !lrange.isEmpty()) {
                log.debug("searchRelatedInfo方法，query={},pageNum={} 读缓存---- ",query,pageNum);
                for (String string : lrange) {
                    map = (HashMap) JsonMapper.json2obj(string, HashMap.class);
                    list.add(map);
                }
                return list;
            }
            log.debug("searchRelatedInfo方法，query={},pageNum={} 未缓存---- ",query,pageNum);
            //页容量目前没得到控制
            String url= Constant.INFOURL;
            String stringEntity = "searchword=" + query + "&thisType=field&pagenum="+pageNum+"&which="+which;
            String req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("相关论文、项目信息2.0，请求失败");
                return null;
            }
            relatedInfo = (SuperSearchRelatedInfo)JsonMapper.json2obj(req, SuperSearchRelatedInfo.class);
            List<Map<String, Object>> relatedInfoRe = relatedInfo.getRe();
            for (Map<String, Object> m : relatedInfoRe) {
                String jsonString = JsonMapper.getJsonString(m);
                jedis.rpush("sup_"+which+"_" + query,jsonString);
                jedis.expire("sup_"+which+"_" + query, 60 * 60 * 24 * 15);

            }
            return relatedInfoRe;
        } catch (Exception e) {
            log.error("请求相关论文、项目信息2.0时出现异常",e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    /**
     * 人物、机构排名2.0接口
     * @param query
     * @return
     */
    @Override
    public List<?> searchRankInfo(String query){
        SuperSearchRankInfo rankInfo;
        Jedis jedis = jedisPool.getResource();
        try {
            String str = jedis.get("sup_rankinfo_" + query);
            if(str != null && str.length() != 0){
                log.debug("searchRankInfo 读缓存----查询词："+query);
                rankInfo = (SuperSearchRankInfo) JsonMapper.json2obj(str, SuperSearchRankInfo.class);
                return rankInfo.getOrgrank();
            }
            log.debug("searchRankInfo 未缓存----查询词："+query);
            //页容量目前没得到控制
            String url= Constant.RANKURL;
            String stringEntity = "searchword=" + query + "&thisType=field";
            String req = HttpClientUtils.doPost(url, stringEntity, mimeType);
            if (req == null) {
                log.error("相关人物机构排名2.0，请求失败");
                return null;
            }
            rankInfo = (SuperSearchRankInfo)JsonMapper.json2obj(req, SuperSearchRankInfo.class);
            if(rankInfo==null){
                return null;
            }
            List<Map<String, Object>> orgrank = rankInfo.getOrgrank();
            if(orgrank==null){
                return null;
            }
            //默认取10条
            if(orgrank.size()>=10){
                orgrank = orgrank.subList(0,10);
            }
            String jsonString = JsonMapper.getJsonString(rankInfo);
            jedis.set("sup_rankinfo_"+query,jsonString);
            jedis.expire("sup_rankinfo_" + query, 60 * 60 * 24*15);
            return orgrank;
        } catch (Exception e) {
            log.error("请求相关人物机构排名2.0时出现异常",e);
        }finally {
            if(jedis != null){
                jedis.close();
            }
        }
        return null;
    }

    public List<Map<String, Object>> orgRank(String query){
        List<Map<String, Object>> list = instrumentSearchDao.selectOrgRankByKeyword(query);
        return list;
    }

}
