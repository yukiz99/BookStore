package com.zhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zhu.domain.Category;
import com.zhu.mapper.CategoryMapper;
import com.zhu.utils.CommonUtils;

/**
 * catefgory不分页，直接查询
 * 删除的时候记得判断该类别下是否还有书，假如有，就不允许删除
 * 方法名全部加上category
 * add方法记得设置uuid
 * @author 遗忘之前
 *
 */

@Service
public class CategoryService {
   
	@Autowired
	private CategoryMapper mapper;
	
	public List<Category> getAllCategory(){
		return  mapper.getAll(); 
	}
	
	public Category findCategoryById(String id){
	     return mapper.find(id);
	}
	
	public void addCategory(Category c) {
		c.setId(CommonUtils.uuid());//设置uuid
		 mapper.add(c);
	}
	
	public void updateCategory(Category c) {
		mapper.update(c);
	}
	
	//这里调用了mapper的getBookCountByCategory方法，为了判断该类是否还有书
	public boolean deleteCategory(String id) {
		int count=mapper.getBookCountByCategory(id);
		if(count==0) {
			mapper.delete(id);
			return true;
		}else {
			return false;
		}
	}
	
}
