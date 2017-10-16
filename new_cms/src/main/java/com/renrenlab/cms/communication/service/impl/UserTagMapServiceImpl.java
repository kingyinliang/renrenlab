package com.renrenlab.cms.communication.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.renrenlab.cms.communication.dao.UserTagMapDao;
import com.renrenlab.cms.communication.service.IUserTagMapService;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

@Service
public class UserTagMapServiceImpl implements IUserTagMapService {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JedisPool jedisPool;
//	@Autowired
//	private UserCouponMapDao userCouponMapDao;
//	@Autowired
//	private UserTagMapDao userTagMapDao;


/**
 * 处理用户标签关系
 * 0：不存在该标签
 * 1：存在该标签
 */
	@Override
	public int handlerTapMap(String openId) {
		Jedis jedis =null;
		try {
			jedis = jedisPool.getResource();
			String tid = jedis.get("tag_"+openId);
			if(tid==null){
				return 0;
			}
			return 1;
		} catch (JedisConnectionException e) {
			log.error("redis连接异常");
		} finally {
			if (jedis != null) {
                jedis.close();
            };
		}
		return 0;
	}
	
}
