package com.zhu.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.zhu.domain.Order;
import com.zhu.domain.User;
import com.zhu.service.OrderService;
import com.zhu.service.UserService;

@Controller
@RequestMapping("/manager")
public class OrderController {

	private final int pageSize=15;
	@Autowired
	private OrderService service;
	@Autowired
	private UserService userService;
	
//	@RequestMapping("/getAllOrder")
//	public PageInfo<Order> getAllOrder(@RequestParam(defaultValue="1")int pageNum){
//		return service.getAllOrder(pageNum);
//	}
	
//	@RequestMapping("/getAllOrderByUser")
//	public PageInfo<Order> getAllOrderByUser(@RequestParam String id,@RequestParam(defaultValue="1")int pageNum){
//		return service.getAllOrderByUser(id, pageNum);
//	}
	
	@RequestMapping("/getAllOrderByState")
	public String getAllOrderByState(@RequestParam boolean state,@RequestParam(defaultValue="1")int pageNum,Model model){
		PageInfo<Order> pageInfo=service.getAllOrderByState(state, pageNum,pageSize);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("url","/getAllOrderByState");
		return "manager/listOrder";
	}
	
//	@RequestMapping("/getAllOrderByUsernameAndState")
//	public String getAllOrderByUserAndState(@RequestParam String username,@RequestParam boolean state,
//			@RequestParam(defaultValue="1")int pageNum,Model model){
//		   User user=userService.findUserByUsername(username);
//		   PageInfo<Order> pageInfo=service.getAllOrderByUserAndState(user.getId(), state, pageNum, pageSize);
//            model.addAttribute("url","getAllOrderByUsernameAndState");
//		model.addAttribute("pageInfo",pageInfo);
//		return "manager/listOrder";
//	}
	
	
	
	@RequestMapping("/findOrderById")
	public String findOrderById(@RequestParam String id,Model model) {
		model.addAttribute("order",service.findOrderById(id));
		System.out.println(service.findOrderById(id).getOrdertime());
		return "manager/orderDetail";
	}
	
	//因为没有发货状态
//	@RequestMapping("/deleteOrder")
//	public String deleteOrder(@RequestParam String id) {
//		service.deleteOrder(id);
//	}
	
	
	@RequestMapping("/updateOrderState")
	public String updateOrderState(@RequestParam String id,Model model) {
		service.updateOrderState(id);
		model.addAttribute("msg","订单发货成功");
		return "manager/right";
	}
	
	
	
	
	
}
