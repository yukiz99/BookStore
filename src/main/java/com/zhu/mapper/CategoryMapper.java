package com.zhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zhu.domain.Category;

@Mapper
public interface CategoryMapper {
   
	public List<Category> getAll();
	public Category find(@Param("id")String id);//编辑的时候需要
	
	public void add(Category category);
	
	
	public void update(Category category);

	//这里记得判断该类是否还有书
	public void delete(@Param("id")String id);
	public int getBookCountByCategory(@Param("id")String id);
}
