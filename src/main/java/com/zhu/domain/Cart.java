package com.zhu.domain;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<String, CartItem> cartItems = new HashMap<String, CartItem>();
	private double price;
	
	public void add(Book book,int count){
		CartItem item = cartItems.get(book.getId());
		if(item ==null){
			item = new CartItem();
			item.setBook(book);
			item.setQuantity(count);
			cartItems.put(book.getId(), item);
		}else{
			item.setQuantity(item.getQuantity() + count);
		}
	}	
	
	public void changeCount(String id,int count) {
		CartItem item = cartItems.get(id);
		item.setQuantity(count);
	}
	
	public CartItem remove(String id) {
		Map<String, CartItem> items=this.getCartItems();
		return items.remove(id);	
	}
	
	public Map<String, CartItem> getCartItems() {
		return cartItems;
	}
	public void setCartItems(Map<String, CartItem> map) {
		this.cartItems = map;
	}
	public double getPrice() {
		
		double totalprice = 0;
		for(Map.Entry<String, CartItem> me : cartItems.entrySet()){
			CartItem item = me.getValue();
			totalprice = totalprice + item.getPrice();
		}
		this.price = totalprice;
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
