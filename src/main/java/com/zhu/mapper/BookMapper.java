package com.zhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhu.domain.Book;

@Mapper
public interface BookMapper {
	
	public List<Book> getAll();
	public List<Book> getAllByCategory(@Param("category_id")String category_id);
	public List<Book> query(Book book);
	
	public Book findById(@Param("id")String id);
	
	public void add(Book book);
	public void delete(@Param("id")String id);
	public void update(Book book);
	

}
