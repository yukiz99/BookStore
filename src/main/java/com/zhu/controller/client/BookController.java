package com.zhu.controller.client;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.zhu.domain.Book;
import com.zhu.domain.Category;
import com.zhu.service.BookService;
import com.zhu.service.CategoryService;

/**
 * 全部采用的分页，List<Book>返回PageInfo,
 * pageSize全局定义
 *  * 还未涉及到批量删除
 */
@Controller("ClientBookController")
@RequestMapping("/client")
public class BookController {
	private final int pageSize=6;
	
	@Autowired
	private BookService service;
	@Autowired
    private CategoryService categoryService;
	
/*
 * * 
解决办法：
仅对主表一方进行分页。连接表的数据分开查询即可。 
当代码块中有多个查询时，pagehelper 自动对下方最先执行的sql进行分页。
 
 你说的对 必须分开 不要 一句sql left join 都连完 ，指定 属性 association collection就行了
	 * */
	@RequestMapping("/getAllBook")
	public String getAllBookAndCategory(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageInfo<Book> pageInfo=service.getAllBook(pageNum,pageSize);
		List<Category> categories=categoryService.getAllCategory();	
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("categories",categories);
		model.addAttribute("url","getAllBook");	
		return "client/body";  
	}
	
     
	@RequestMapping("/getAllBookByCategory")
	public String getAllBookByCategory(@RequestParam String category_id,
			         @RequestParam(defaultValue="1")int pageNum,Model model){
		PageInfo<Book> pageInfo=service.getAllBookByCategory(category_id,pageNum,pageSize);
	    List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("categories",categories);
		model.addAttribute("url","getAllBookByCategory");
		return "client/body";
	}
	
	@RequestMapping("/queryBook")
	public String queryBook(Book book,@RequestParam(defaultValue="1")int pageNum,Model model) {
		PageInfo<Book> pageInfo=service.queryBook(book, pageNum,pageSize);
	    List<Category> categories=categoryService.getAllCategory();
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("categories",categories);
		model.addAttribute("url","queryBook");
		model.addAttribute("query_name",book.getName());
		return "client/body";
	}
	
	@RequestMapping("/findBookById")
	public String findBookById(@RequestParam String id,Model model) {
		Book book=service.findBookById(id);
		model.addAttribute("book",book);
	     return "client/bookDetail"; 
	}
	
}
