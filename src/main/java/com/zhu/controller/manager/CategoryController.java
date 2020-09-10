package com.zhu.controller.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.zhu.domain.Category;
import com.zhu.domain.Msg;
import com.zhu.service.CategoryService;

@Controller
@RequestMapping("/manager")
public class CategoryController {
	
	@Autowired
	private CategoryService service;
	
	@RequestMapping("/getAllCategory")
	public String getAllCategory(Model model){
		model.addAttribute("categories",service.getAllCategory());
		return "manager/listCategory";
	}
	
	@RequestMapping("/forAddBookJsp")
	public String ForAddBookJsp(Model model) {
		model.addAttribute("categories",service.getAllCategory());
		return "manager/addBook";
	}
	
	@RequestMapping("/findCategoryById")
	@ResponseBody
	public Msg findCategoryById(@RequestParam String id) {
		return new Msg(1,service.findCategoryById(id));
	}
	
	@RequestMapping("/addCategory")
	@ResponseBody
	public Msg addCategory(Category category) {
		service.addCategory(category);
		return new Msg(1,"添加成功");
	}
	
	@RequestMapping("/updateCategory")
	@ResponseBody
	public Msg updateCategory(Category category) {
		try {
			service.updateCategory(category);
		}catch(Exception e){
			e.printStackTrace();
			return new Msg(0,"更新失败");
		}
		return new Msg(1,"更新成功");
	}
	
	
	@RequestMapping("/deleteCategory")
	@ResponseBody
	public Msg deleteCategory(@RequestParam String id) {
		boolean flag=service.deleteCategory(id);
		if(flag) {
			return new Msg(1,"删除成功");
		}else { 
			return new Msg(0,"该类别下存有书籍，不可删除");
		}
	}

}
