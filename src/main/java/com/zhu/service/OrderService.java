package com.zhu.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhu.domain.Book;
import com.zhu.domain.Cart;
import com.zhu.domain.CartItem;
import com.zhu.domain.Order;
import com.zhu.domain.OrderItem;
import com.zhu.domain.User;
import com.zhu.mapper.BookMapper;
import com.zhu.mapper.OrderItemMapper;
import com.zhu.mapper.OrderMapper;
import com.zhu.utils.CommonUtils;


/**
 * 采用分页、order和orderItem记得设置uuid、
 * order与orderitem同时添加、删除
 * @author 遗忘之前
 *
 */
@Service
public class OrderService {

	@Autowired 
	private OrderMapper mapper;
	@Autowired
	private OrderItemMapper orderItemMapper;
	@Autowired
	private BookMapper bookMapper;
	
	private String orderBy="ordertime desc";
	
	public PageInfo<Order> getAllOrder(int pageNum,int pageSize){
		PageHelper.startPage(pageNum,pageSize,orderBy);
		List<Order> list=mapper.getAll();
		PageInfo<Order> pageInfo=new PageInfo<Order>(list);
		return pageInfo;
	}
	
	public PageInfo<Order>  getAllOrderByState(boolean state,int pageNum,int pageSize){
		PageHelper.startPage(pageNum,pageSize,orderBy);
		List<Order> list=mapper.getAllByState(state);
		PageInfo<Order> pageInfo=new PageInfo<Order>(list);
		return pageInfo;
	}
	
	
	public PageInfo<Order> getAllOrderByUser(String user_id,int pageNum,int pageSize){
		PageHelper.startPage(pageNum,pageSize,orderBy);
		List<Order> list=mapper.getAllByUser(user_id);
		PageInfo<Order> pageInfo=new PageInfo<Order>(list);
		return  pageInfo;
	}
	
	
	public PageInfo<Order> getAllOrderByUserAndState(String id,boolean state,int pageNum,int pageSize){
		PageHelper.startPage(pageNum,pageSize,orderBy);
		List<Order> list=mapper.getAllByUserAndState(id, state);
		PageInfo<Order> pageInfo=new PageInfo<Order>(list);
		return pageInfo;
	}
	//只有这个查到了关于订单的所有，其余的都只是查到了OrderUser
	public Order findOrderById(String id) {
		return mapper.find(id);
	}
	
	//在图书详情下立即购买一种书
	public void buyBook(String id,int count,User user) {
		Book book=bookMapper.findById(id);
		
		Order order = new Order();
		order.setId(CommonUtils.uuid());//记得
		order.setOrdertime(new Date());
		order.setPrice(book.getPrice()*count);
		order.setState(false);
		order.setUser_id(user.getId());
		mapper.add(order);
		
		OrderItem oitem =new OrderItem();
		oitem.setId(CommonUtils.uuid());
		oitem.setBook_id(book.getId());
		oitem.setOrder_id(order.getId());
		oitem.setPrice(book.getPrice()*count);//这里存的是该图书总价
		oitem.setQuantity(count);
		orderItemMapper.add(oitem);
	
	}
	//设置id、应该先添加order，再添加orderItem
	public void createOrder(Cart cart,User user) {
		
		Order order = new Order();
		order.setOrdertime(new Date());
		order.setPrice(cart.getPrice());
		order.setState(false);
		order.setUser_id(user.getId());
		order.setId(CommonUtils.uuid());
		mapper.add(order);
		
		
       List<OrderItem> list=new ArrayList<OrderItem>();
		for(Map.Entry<String, CartItem> me : cart.getCartItems().entrySet()) {
			//得到一个购物项就生成一个订单项
			CartItem citem = me.getValue();
			OrderItem oitem = new OrderItem();
			oitem.setId(CommonUtils.uuid());
			oitem.setBook_id(citem.getBook().getId());
			oitem.setPrice(citem.getPrice());
			oitem.setQuantity(citem.getQuantity());
			oitem.setOrder_id(order.getId());
			orderItemMapper.add(oitem);
		}	
		
	}
	
//	//先判断是否收货
//	//先删orderItem，再删order
//	public void deleteOrder(String id) {
//		Order order=mapper.find(id);
//		if(order.isState()) {//
//			
//		}
//		orderItemMapper.deleteByOrder_id(id);
//		mapper.delete(id);
//	} 
	  
	public void updateOrderState(String id) {
		mapper.updateOrderState(id);
	}
	
}
