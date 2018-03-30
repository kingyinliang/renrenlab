package com.renrenlab.rlab.common.util;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.PostConstruct;
import java.util.*;

/**
 * Created by guanjipeng on 2017/10/17.
 */
@Component
public final class RedisUtil {
    public static final Logger logger = LoggerFactory.getLogger(RedisUtil.class);
    //默认存储时间一天
    private static final int ONE_DAY = 1 * 24 * 60 * 60;

    private static RedisUtil redisUtil;
    @Autowired
    JedisPool jedisPool;

    @PostConstruct
    public void init() {
        redisUtil = this;
        redisUtil.jedisPool = this.jedisPool;
    }


    private RedisUtil() {
    }

    public static RedisUtil getInstance() {
        if (redisUtil == null) {
            synchronized (RedisUtil.class) {
                if (redisUtil == null) {
                    redisUtil = new RedisUtil();
                }
            }
        }
        return redisUtil;
    }

    public String getValue(String key) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            return jedis.get(key);
        } catch (Exception e) {
            logger.error("RedisUtil getValue()报错", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public String setValue(String key, String value) {
        return this.setValueWithTime(key, value, null);
    }

    public String setValueWithTime(String key, String value, Integer seconds) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            if (seconds != null) {
                return jedis.setex(key, seconds, value);
            } else {
                return jedis.set(key, value);
            }
        } catch (Exception e) {
            logger.error("RedisUtil setValue()报错", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public Long setListValue(String key, String... list) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            jedis.rpush(key, list);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return Long.valueOf(list.length);
    }

    public List<String> getListValue(String key) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            return jedis.lrange(key, 0, -1);
        } catch (Exception e) {
            logger.error("", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public boolean setMap(String key, Map<String, String> map) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            jedis.hmset(key, map);
            jedis.expire(key, ONE_DAY);
        } catch (Exception e) {
            logger.error("RedisUtil setMap()报错", e);
            return false;
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return true;
    }

    public List<String> getMapValueByKey(String map, String key) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            return jedis.hmget(map, key);
        } catch (Exception e) {
            logger.error("RedisUtil getMapValueByKey()报错", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public Long setMapValueByKey(String map, String key, String value) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            return jedis.hset(map, key, value);
        } catch (Exception e) {
            logger.error("RedisUtil setMapValueByKey()报错", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public Map<String, String> getMap(String map) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            Set<String> set = jedis.hkeys(map);
            if (CollectionUtils.isEmpty(set)) {
                return null;
            }
            Iterator iterator = set.iterator();
            Map<String, String> resultMap = new HashMap<>();
            while (iterator.hasNext()) {
                String key = iterator.next().toString();
                resultMap.put(key, jedis.hget(map, key));
            }
            return resultMap;
        } catch (Exception e) {
            logger.error("RedisUtil getMapKeys()报错", e);
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return null;
    }

    public boolean delKey(String key) {
        Jedis jedis = null;
        try {
            jedis = redisUtil.jedisPool.getResource();
            jedis.del(key);
        } catch (Exception e) {
            logger.error("RedisUtil delKey()报错", e);
            return false;
        } finally {
            if (jedis != null) {
                jedis.close();
            }
        }
        return true;
    }
}
