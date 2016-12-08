package com.bso.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bso.entity.PaginationBean;
import com.bso.service.BookInfoService;

@Controller
@RequestMapping("/search")
public class BookInfoHandler {
	@Autowired
	private BookInfoService bookInfoService;
	
	@ResponseBody
	@RequestMapping(value="/findAllByPage",method=RequestMethod.POST)
	public PaginationBean listBooks(String page,String rows){
		LogManager.getLogger().debug("请求findAllByPage被BookInfoHandler.listBooks()处理");
		return bookInfoService.listBooks(page,rows);
	}
	
}
