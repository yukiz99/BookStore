package com.zhu.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.zhu.domain.Cart;
import com.zhu.domain.CartItem;
import com.zhu.domain.Msg;
import com.zhu.domain.Order;
import com.zhu.domain.User;
import com.zhu.service.OrderService;

/**
 * 还未涉及到批量删除
 * @author 遗忘之前
 * */
@Controller("ClientOrderController")
@RequestMapping("/client")
public class OrderController {
	private final int pageSize=15;

	@Autowired
	private OrderService service;
	
	
	
	@RequestMapping("/getAllOrderByUser")
	public String getAllOrderByUser(HttpSession session,@RequestParam(defaultValue="1")int pageNum,Model model ){
		User user=(User) session.getAttribute("user");
		if(user==null) {
			model.addAttribute("message","对不起，请先登录");
			return "message";
		}
		String user_id=user.getId();
		PageInfo<Order> pageInfo=service.getAllOrderByUser(user_id,pageNum,pageSize);
		model.addAttribute("url","getAllOrderByUser");
		model.addAttribute("pageInfo",pageInfo);  
		return "client/listOrder";
	}
	
	@RequestMapping("/getAllOrderByUserAndState")
	public String getAllOrderByUserAndState(HttpSession session,@RequestParam boolean state,
			@RequestParam(defaultValue="1")int pageNum,Model model){
		   String id=((User)session.getAttribute("user")).getId();
		   model.addAttribute("url","getAllOrderByUserAndState");
		   model.addAttribute("pageInfo",service.getAllOrderByUserAndState(id, state,pageNum,pageSize));
		   return "client/listOrder";
		
	}

	
	@RequestMapping("/findOrderById")
	public String findOrderById(@RequestParam String id,Model model) {
		Order order=service.findOrderById(id);
		model.addAttribute("order",order);
		return "client/orderDetail";
	}
	
	
@RequestMapping("/buyBook")
@ResponseBody
public Msg buyBook(HttpSession session,@RequestParam String id,@RequestParam int count) {
	 User user=(User) session.getAttribute("user");
	 if(user!=null) {
		 service.buyBook(id,count,user);
		 return new Msg(1,"购买成功");
	 }else {
		 return new Msg(0,"对不起，请先登录");
	 }
	  
}



@RequestMapping("/createOrder")
public String createOrder(HttpSession session,@RequestParam String ids,Model model) {
	Cart cart=(Cart) session.getAttribute("cart");
	String[] idsArr=ids.split("-");
	Cart cartTemp=new Cart();
	for(String s :idsArr) {
		CartItem item=cart.remove(s);
		cartTemp.getCartItems().put(s, item);
	}
	if(cart.getCartItems().size()==0) {
    	session.removeAttribute("cart");
    }else {
    	session.setAttribute("cart",cart);
    }
	User user=(User) session.getAttribute("user");
	service.createOrder(cartTemp,user);
	model.addAttribute("message","您的订单已生成，请等待发货");
	return "message";
	
}
	
	
//	@RequestMapping("/deleteOrder")
//	public void deleteOrder(@RequestParam String id) {
//		service.deleteOrder(id);
//	}
}
