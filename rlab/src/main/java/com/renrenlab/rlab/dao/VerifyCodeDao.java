package com.renrenlab.rlab.dao;

import com.renrenlab.rlab.model.VerifyCode;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
@Repository
public interface VerifyCodeDao {

    VerifyCode selectByMoblie(@Param("mobile") String mobile);

    Integer selectHodiernalVerifyCode(@Param("mobile") String moile, @Param("time") Date time);

    Integer insertVerifyCode(@Param("mobile") String mobile, @Param("verifyCode") String verifyCode);

}