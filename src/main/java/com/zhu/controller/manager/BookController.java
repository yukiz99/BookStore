package com.zhu.controller.manager;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.zhu.domain.Book;
import com.zhu.domain.Msg;
import com.zhu.service.BookService;
import com.zhu.service.CategoryService;
import com.zhu.utils.CommonUtils;
import com.zhu.utils.FileUtil;

@Controller
@RequestMapping("/manager")
public class BookController {

	private final int pageSize=15;
	
	@Autowired
	private BookService service;
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("/getAllBook")
	public String getAllBook(@RequestParam(defaultValue="1")int pageNum,Model model){

		PageInfo<Book> pageInfo=service.getAllBook(pageNum,pageSize);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("url","getAllBook");
		return "manager/listBook";
	}
	
	@RequestMapping("/forUpdateBook")
	public String forUpdateBook(@RequestParam String id,Model model){
		model.addAttribute("book",service.findBookById(id));
		model.addAttribute("categories",categoryService.getAllCategory());
		return "manager/editBook";
	}
	
	@RequestMapping("/getAllBookByCategory")
	public String getAllBookByCategory(@RequestParam String category_id,@RequestParam(defaultValue="1")int pageNum,Model model){
		PageInfo<Book> pageInfo=service.getAllBookByCategory(category_id, pageNum,pageSize);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("url","getAllBookByCategory");
		return "manager/listBook";
	}
	
	@RequestMapping("/queryBook")
	public String queryBook(Book book,@RequestParam(defaultValue="1")int pageNum,Model model){
		PageInfo<Book> pageInfo=service.queryBook(book, pageNum,pageSize);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("url","queryBook");
		model.addAttribute("query_name",book.getName());
		return "manager/listBook";
	}
	@RequestMapping("/findBookById")
	public String findBookById(@RequestParam String id,Model model) {
		Book book=service.findBookById(id);
		model.addAttribute("book",book);
		model.addAttribute("url","findBookById");
		return "manager/editBook";
	}
	
	@RequestMapping("/addBook")
	public String addBook(Book book,@RequestParam("file")MultipartFile file,HttpSession session,Model model) {
		  String filename=doUpload(file,session);
		  book.setImage(filename);
		  service.addBook(book);
		  model.addAttribute("msg","添加成功");
		  return "manager/right";
	}
	
	private String doUpload(MultipartFile file,HttpSession session) {
		    String filename = file.getOriginalFilename();
            String suffixName=filename.substring(filename.lastIndexOf("."));
	        String filePath = session.getServletContext().getRealPath("upload/images/");
	        String newName=CommonUtils.uuid()+suffixName;
	        try {
	            FileUtil.uploadFile(file.getBytes(), filePath, newName);
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        return newName;
	}
	
	
	
	@RequestMapping("/deleteBook")
	@ResponseBody
	public Msg deleteBook(HttpSession session,@RequestParam String id){
		Book book=service.findBookById(id);
		try {
			service.deleteBook(id);
			File file=new File(session.getServletContext().getRealPath("upload/images/")+book.getImage());
			file.delete();
			return new Msg(1,"删除成功");
		}catch(Exception e) {
			e.printStackTrace();
			return new Msg(0,"删除失败");
		}
	}
	
	@RequestMapping("/updateBook")
	public String updateBook(Book book,@RequestParam("file")MultipartFile file,HttpSession session,Model model) {		
		String uploadname=file.getOriginalFilename();
		if(uploadname!=null&&!uploadname.trim().isEmpty()) {
		    String newName=doUpload(file, session);
			File oldImage=new File(session.getServletContext().getRealPath("upload/images/")+book.getImage());
			oldImage.delete();
			book.setImage(newName);
		}  else {
			book.setImage(book.getImage());
		}
		service.updateBook(book);
		model.addAttribute("msg","修改成功");
		return "/manager/right";
	}
	
}
