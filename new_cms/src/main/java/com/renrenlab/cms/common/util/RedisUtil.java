package com.renrenlab.cms.common.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

@Component
public class RedisUtil {

	private Log logger = LogFactory.getLog(getClass());
	@Autowired
	private JedisPool jedisPool;

	public void clearRedis(String key) {
		Jedis jedis = null;
		try {
			jedis = jedisPool.getResource();
			// 建连接
			jedis.del(key);// 到redis 中删除数据
		} catch (JedisConnectionException e) {
			logger.error("redis连接异常");
		} finally {
			if (jedis != null) {
                jedis.close();
            };// 关闭连接
		}
	}
}
