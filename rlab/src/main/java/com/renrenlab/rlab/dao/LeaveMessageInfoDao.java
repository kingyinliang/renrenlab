package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.LeaveMessageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public interface LeaveMessageInfoDao {
    int deleteByPrimaryKey(Integer id);

    int insertSelective(LeaveMessageInfo record);

    LeaveMessageInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveMessageInfo record);

    List<LeaveMessageInfo> selectInfoList(@Param("keyword") String keyword,
                                                 @Param("state") Integer state,
                                                 @Param("beginTime") String beginTime,
                                                 @Param("endTime") String endTime,
                                                 @Param("order") String order);

    int updateState(@Param("messageId") Integer messageId,
                    @Param("contactState") Integer state,
                    @Param("operator") String operator);
}