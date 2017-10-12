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

        Date d = new Date();
        SimpleDateFormat df = new SimpleDateFormat("M/d");
        String format = df.format(d.getTime()-86400000L);
        String[] dates = new String[7];
        for (int i = 7; i > 0; i--) {
            dates[7-i]="\""+df.format(d.getTime()-86400000L*i)+"\"";
        }
        //返回日期
        map.put("days", Arrays.toString(dates));

        //用户统计
        List<BgHomeInfo> userInfo = bgHomeDao.selectUserCountsByDate();
        int[] users = new int[]{0,0,0,0,0,0,0};
        int[] inss = new int[]{0,0,0,0,0,0,0};
        int[] orgs = new int[]{0,0,0,0,0,0,0};
        int i = 1;
        for (BgHomeInfo user : userInfo) {
            String s = user.getBefore();
            if(s.contains("days")){
                s = s.substring(0,s.length()-5);
            }else {
                s = s.substring(0,s.length()-4);
            }
            i = Integer.parseInt(s);
            users[7-i]=user.getCount();
        }
        Integer userCounts = bgHomeDao.selectUserCounts();
        map.put("userInfo",users);
        map.put("userCounts",userCounts);
        //机构总数
        List<BgHomeInfo> orgInfo = bgHomeDao.selectOrgCountsByDate();
        Integer orgCounts = bgHomeDao.selectOrgCounts();
        for (BgHomeInfo org : orgInfo) {
            String s = org.getBefore();
            if(s.contains("days")){
                s = s.substring(0,s.length()-5);
            }else {
                s = s.substring(0,s.length()-4);
            }
            i = Integer.parseInt(s);
            orgs[7-i]=org.getCount();
        }
        map.put("orgInfo",orgs);
        map.put("orgCounts",orgCounts);
        //仪器总数
        List<BgHomeInfo> insInfo = bgHomeDao.selectInsCountsByDate();
        Integer insCounts = bgHomeDao.selectInsCounts();
        for (BgHomeInfo ins : insInfo) {
            String s = ins.getBefore();
            if(s.contains("days")){
                s = s.substring(0,s.length()-5);
            }else {
                s = s.substring(0,s.length()-4);
            }
            i = Integer.parseInt(s);
            inss[7-i]=ins.getCount();
        }
        map.put("insInfo",inss);
        map.put("insCounts",insCounts);


        return map;
    }
}
