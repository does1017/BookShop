package com.bso.conn;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class RedisConnTest {
	
	@Autowired
	JedisConnectionFactory jedisConnectionFactory;
	
	@Test
	public void redisConn() {
		RedisConnection con=jedisConnectionFactory.getConnection();
		assertNotNull(con);
	}

}
