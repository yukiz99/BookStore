package com.zhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhu.domain.Book;
import com.zhu.mapper.BookMapper;
import com.zhu.utils.CommonUtils;

/**
 * List<Book>全部采用分页
 * 添加书的时候记得设置uuid
 */
@Service
public class BookService {


	@Autowired   
	private BookMapper mapper;
	
	public PageInfo<Book> getAllBook(int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<Book> list=mapper.getAll();
		PageInfo<Book> pageInfo=new PageInfo<Book>(list);
		return pageInfo;
	}
	
	public PageInfo<Book> getAllBookByCategory(String category_id,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<Book> list=mapper.getAllByCategory(category_id);
		PageInfo<Book> pageInfo=new PageInfo<Book>(list);
		return pageInfo;
	}
	
	public PageInfo<Book> queryBook(Book book,int pageNum,int pageSize){
		PageHelper.startPage(pageNum, pageSize);
		List<Book> list=mapper.query(book);
		PageInfo<Book> pageInfo=new PageInfo<Book>(list);
		return pageInfo;
	}
	 
	public Book findBookById(String id) {
		return mapper.findById(id);
	}
	
	public void addBook(Book book) {
		book.setId(CommonUtils.uuid());//设置uuid
		mapper.add(book);
	}
	
	public void deleteBook(String id) {
		mapper.delete(id);
		//删除图片
	}
	public void updateBook(Book book) {
		mapper.update(book);
	}

}
