package com.zhu.domain;

import lombok.Data;

@Data
public class Book {
	
	private String id;
	private String name;
	private String author;
	private double price;
	private String image;
	private String description;
	
	private String category_id;//书类别
	private Category category;

	
}
