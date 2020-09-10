package com.zhu.domain;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import lombok.Data;


@Data
public class Order {
	private String id;
	private Date ordertime;
	private double price;
	private boolean state;
	
	private String user_id;
	private User user; //用户
	private List<OrderItem> orderItems = new ArrayList<OrderItem>(); //订单详情
}
  