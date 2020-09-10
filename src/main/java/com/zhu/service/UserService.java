package com.zhu.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhu.domain.User;
import com.zhu.mapper.UserMapper;
import com.zhu.utils.CommonUtils;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;
	
	//登陆
	public User login(String username,String password) {
		User user=mapper.findByUsernameAndPwd(username,password);
		return user;
	}
	
	
	//注册
	public void regist(User user) {
		user.setId(CommonUtils.uuid());
		mapper.add(user);
	}
	
	
	//判断该用户名是否已被使用
	public Boolean  isUsernameExist(String username) {
		User user=mapper.findByUsername(username);
			if(user==null) return false;
			else           return  true;
		
	}
	
	
	public User findUserByUsername(String username) {
		User user=mapper.findByUsername(username);
		return user;
	}
	
	
	
}
   