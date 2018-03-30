package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.common.util.SearchUtil;
import com.renrenlab.rlab.dao.PVStatDao;
import com.renrenlab.rlab.model.PVStatInfo;
import com.renrenlab.rlab.service.IPVService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static com.renrenlab.rlab.common.interceptor.PVInterceptor.PV_KEY;

/**
 * Created by guanjipeng on 2017/11/30.
 */
@Transactional
@Service
public class PVServiceImpl implements IPVService {
    @Autowired
    PVStatDao pvStatDao;

    @Autowired
    JedisPool jedisPool;

    @Override
    public List<PVStatInfo> getPV(Integer day) {
        //每次获取pv之前 把redis存的pv数据入库
//        this.statisticsPVCount();
        LocalDate currentDate = LocalDate.now().minusDays(1);
        LocalDate lastDate = currentDate.minusDays(day);
        List<PVStatInfo> pvStatInfos = pvStatDao.selectByDate(lastDate.toString(), currentDate.toString());
        Collections.reverse(pvStatInfos);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        pvStatInfos.stream().forEach(pvStatInfo -> {
            pvStatInfo.setCreatTimeStr(format.format(pvStatInfo.getCreatTime()));
        });
        return pvStatInfos;
    }

    @Override
    public void statisticsPVCount() {
        Jedis jedis = jedisPool.getResource();
        try {
            String pvValue = jedis.get(PV_KEY);
            if (StringUtils.isNotEmpty(pvValue)) {
                String currentTime = LocalDate.now().toString();
                int count = Integer.valueOf(pvValue);
                List<PVStatInfo> pvStatInfos = pvStatDao.selectByDate(currentTime, currentTime);
                if (pvStatInfos != null && pvStatInfos.size() > 0) {
                    //说明今天已经统计过pv数值
                    PVStatInfo pvStatInfo = pvStatInfos.get(0);
                    pvStatInfo.setPvCount(pvStatInfo.getPvCount() + count);
                    pvStatDao.updatePVCount(pvStatInfo);
                } else {
                    pvStatDao.addPVCount(count);
                }
            }
        } finally {
            if (jedis != null) {
                jedis.del(PV_KEY);
                jedis.close();
            }
        }
    }

    @Override
    public List<Map<String, Object>> rankList() {
        List<Map<String, Object>> rankList = pvStatDao.getRankList();
        int sumCounts = 0;
        for (int i = 0; i < rankList.size(); i++) {
            Map<String, Object> map = rankList.get(i);
            map.put("rank", i + 1);
            String value = map.get("insCount").toString();
            map.put("insCount", String.format("%.2f", Math.sqrt(Integer.valueOf(value)) * 100));
            map.put("sumCount", Double.valueOf(map.get("insCount").toString()) + sumCounts);
        }
        return rankList;
    }

    @Override
    public List<Map<String, Object>> getOrgRank() {
        List<Map<String, Object>> rankList = pvStatDao.getOrgRank();
        int sumIndex = 0;
        rankList.forEach(map -> {
            map.put("shareIndex", String.format("%.2f", map.get("shareIndex")));
            map.put("sumIndex", Double.valueOf(map.get("shareIndex").toString()) + sumIndex);

            Object orgLogo = map.get("orgLogo");
            if (orgLogo != null) {
                map.put("orgLogo", SearchUtil.handlePicToStr(orgLogo.toString(), "orgimage"));
            }
        });
        return rankList;
    }
}
