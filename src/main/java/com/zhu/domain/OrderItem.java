package com.zhu.domain;

import lombok.Data;

@Data
public class OrderItem {
	private String id;
	private int quantity;
	private double price;
	
	private String order_id;
	private String book_id;
	
	private Book book;
		
}
