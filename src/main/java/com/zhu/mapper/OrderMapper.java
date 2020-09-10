package com.zhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhu.domain.Order;

@Mapper
public interface OrderMapper {
  
	public List<Order> getAll();
	public List<Order> getAllByState(@Param("state")boolean state);
	public List<Order> getAllByUser(@Param("user_id")String user_id);
	public List<Order> getAllByUserAndState(@Param("user_id")String user_id,@Param("state")boolean state);
	public Order find(@Param("id")String id);
	
	
	public void add(Order order);
    public void delete(@Param("id")String id);	
    public void updateOrderState(@Param("id") String id);
}
