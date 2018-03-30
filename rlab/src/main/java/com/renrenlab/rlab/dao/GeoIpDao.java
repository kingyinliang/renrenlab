package com.renrenlab.rlab.dao;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GeoIpDao {

    Integer selectGeoIpByIp(@Param("ip") Long ip);

}