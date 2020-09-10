package com.zhu.controller.manager;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhu.domain.Msg;
import com.zhu.domain.User;
import com.zhu.service.UserService;

@Controller("/manager")
public class AdminController {
	
	@Autowired
	private UserService service;
	
	@RequestMapping("/login")
	@ResponseBody
	public  Msg login(HttpSession session,User user) {
		User u1=service.login(user.getUsername(), user.getPassword());
		if(u1!=null&&u1.isAdmin()) {
			session.setAttribute("admin", user);
			return new Msg(1,"登陆成功");
		}else {
			return new Msg(0,"登陆失败");
		}
		
	}

}
