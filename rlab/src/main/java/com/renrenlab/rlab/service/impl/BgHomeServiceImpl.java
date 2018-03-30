package com.renrenlab.rlab.service.impl;

import com.renrenlab.rlab.dao.BgHomeDao;
import com.renrenlab.rlab.service.BgHomeService;
import com.renrenlab.rlab.vo.BgHomeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by guowanting on 2017/7/27.
 */
@Service
public class BgHomeServiceImpl implements BgHomeService{

    @Autowired
    private BgHomeDao bgHomeDao;

    /**
     * 后台查询统计信息
     * @return
     */
    @Override
    public Map<String, Object> searchInfo() {
        Map<String,Object> map = new HashMap<>();
        Integer[] users = new Integer[12];
        int[] inss = new int[12];
        int[] orgs = new int[12];
        int[] services = new int[12];

        //处理日期(按月份)
        SimpleDateFormat format=new SimpleDateFormat("yy/MM");
        String[] dates = new String[12];
        for (int i = 11; i >= 0; i--) {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.MONTH, -i);
        Date m = c.getTime();
        String mon = format.format(m);
            dates[11-i]="\""+mon+"\"";
        }
        map.put("month", Arrays.toString(dates));
        //处理日期 （按日）
        //用户统计
        Integer uUserCounts12MonthAgo = bgHomeDao.selectUserCounts12MonthAgo();
        List<BgHomeInfo> userInfo = bgHomeDao.selectUserCountsByDate();
        //机构总数
        List<BgHomeInfo> orgInfo = bgHomeDao.selectOrgCountsByDate();
        //仪器总数
        List<BgHomeInfo> insInfo = bgHomeDao.selectInsCountsByDate();
        List<BgHomeInfo> serviceInfo = bgHomeDao.selectServiceCountsByDate();
        //拿到用户数量
        for (int i = 0; i < 12; i++) {
            Integer orgRise=0;
            Integer insRise=0;
            Integer serviceRise=0;
            for (BgHomeInfo user : userInfo) {
                if(dates[i].contains(user.getTime())){
                    uUserCounts12MonthAgo=user.getCount()+uUserCounts12MonthAgo;
                }
            }
            for (BgHomeInfo org : orgInfo) {
                if(dates[i].contains(org.getTime())){
                    orgRise=org.getCount();
                }
            }
            for (BgHomeInfo ins : insInfo) {
                if(dates[i].contains(ins.getTime())){
                    insRise=ins.getCount();
                }
            }
            for (BgHomeInfo service : serviceInfo) {
                if(dates[i].contains(service.getTime())){
                    serviceRise=service.getCount();
                }
            }
            users[i]=uUserCounts12MonthAgo;
            orgs[i]=orgRise;
            inss[i]=insRise;
            services[i]=serviceRise;
        }
        Integer userCounts = bgHomeDao.selectUserCounts();
        Integer insCounts = bgHomeDao.selectInsCounts();
        Integer orgCounts = bgHomeDao.selectOrgCounts();
        Integer serviceCounts = bgHomeDao.selectSerivceCounts();
        map.put("userInfo",users);
        map.put("userCounts",userCounts);
        map.put("serviceInfo",services);
        map.put("serviceCounts",serviceCounts);

        map.put("orgInfo",orgs);
        map.put("orgCounts",orgCounts);
        map.put("insInfo",inss);
        map.put("insCounts",insCounts);


        return map;
    }
}
