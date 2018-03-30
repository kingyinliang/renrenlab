package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.vo.BgHomeInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guowanting on 2017/7/27.
 */
@Repository
public interface BgHomeDao {

    List<BgHomeInfo> selectUserCountsByDate();

    List<BgHomeInfo> selectInsCountsByDate();

    List<BgHomeInfo> selectOrgCountsByDate();

    Integer selectUserCounts();

    Integer selectUserCounts12MonthAgo();

    Integer selectOrgCounts();

    Integer selectInsCounts();

    Integer selectOrgCounts12MonthAgo();

    Integer selectInsCounts12MonthAgo();

    Integer selectServiceCounts12MonthAgo();

    List<BgHomeInfo> selectServiceCountsByDate();

    Integer selectSerivceCounts();
}
