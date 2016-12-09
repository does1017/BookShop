package com.bso.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bso.entity.BookInfo;
import com.bso.entity.PaginationBean;
import com.bso.mapper.BookMapper;
import com.bso.service.BookInfoService;

@Service(value="BookInfoService")
public class BookInfoServiceImpl implements BookInfoService {
	
	@Autowired
	private BookMapper bookMapper;
	
	//分页查询所有的书籍信息
	public PaginationBean<BookInfo> listBooks(String page, String rows) {
		int pageSize=5;
		int currPage=1;
		
		if(page!=null){
			currPage=Integer.parseInt(page);
		}
		
		if(rows!=null){
			pageSize=Integer.parseInt(rows);
		}
		PaginationBean<BookInfo> pb=new PaginationBean<BookInfo>(pageSize,currPage);
		
		return bookMapper.getPartBooks(pb);
	}	


}
