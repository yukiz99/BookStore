package com.zhu.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhu.domain.OrderItem;

@Mapper
public interface OrderItemMapper {

	public void add(OrderItem orderItem);
	public void deleteByOrder_id(@Param("order_id")String order_id);
	
}
