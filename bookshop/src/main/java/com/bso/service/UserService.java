package com.bso.service;

import com.bso.entity.User;


public interface UserService {
	User register(User user) ;
	User login(User user);
	boolean activeUser(Integer usid);
}
