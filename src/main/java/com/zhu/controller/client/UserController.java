package com.zhu.controller.client;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhu.domain.Msg;
import com.zhu.domain.User;
import com.zhu.service.UserService;

@Controller
@RequestMapping("/client")
public class UserController {

	@Autowired
	private UserService service;
	
	//登录
	@RequestMapping("/login")
	@ResponseBody
	public Msg login(HttpSession session,@RequestParam String username,@RequestParam String password) {
		
		User user=service.login(username,password);
		 if(user==null) {
			 return new Msg(0,"用户名或密码错误，登陆失败");
		 }else {
			 session.setAttribute("user", user);//给user设置session
			return  new Msg(1,"登陆成功");
		 }
	}

	/*
	  * 注册
	  *判断该用户名是否存在、若存在则应该换一个名、不存在就注册 
	 */
	@RequestMapping("/regist")
	@ResponseBody
	public Msg regist(User user,Model model) {
	     if(!service.isUsernameExist(user.getUsername())) {
	    	 service.regist(user);
	    	return new Msg(1,"注册成功");
	    }else {
	    	 return new Msg(0,"该用户名已被注册，请重新填写");
	     } 
	}
	
	
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
