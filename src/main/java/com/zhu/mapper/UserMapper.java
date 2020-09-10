package com.zhu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhu.domain.User;

@Mapper
public interface UserMapper {
  
	public User findByUsernameAndPwd(@Param("username")String username,@Param("password")String password);
	public User findByUsername(@Param("username")String username);
	public void add(User user);
}
