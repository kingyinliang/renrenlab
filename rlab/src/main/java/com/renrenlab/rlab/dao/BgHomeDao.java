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

    Integer selectOrgCounts();

    Integer selectInsCounts();
}
