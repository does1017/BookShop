package com.bso.mapper;

import com.bso.entity.User;

public interface UserMapper {
	int insertUser(User user);

	User findUserByUser(User user);

	int updateUser(Integer usid);
}
