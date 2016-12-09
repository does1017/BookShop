package com.bso.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bso.entity.User;
import com.bso.mapper.UserMapper;
import com.bso.service.UserService;
import com.bso.util.Encrypt;

@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;

	public User register(User user) {
		user.setPwd(Encrypt.md5AndSha(user.getPwd()));
		if( userMapper.insertUser(user) > 0){
			return user;
		}
		return null;
	}
	
	@Override
	public User login(User user) {
		user.setPwd(Encrypt.md5AndSha(user.getPwd()));
		return userMapper.findUserByUser(user);
	}

	@Override
	public boolean activeUser(Integer usid) {
		return userMapper.updateUser(usid) > 0;
	}
}
