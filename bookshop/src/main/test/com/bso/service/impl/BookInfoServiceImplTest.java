package com.bso.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bso.entity.BookInfo;
import com.bso.entity.PaginationBean;
import com.bso.service.BookInfoService;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring.xml")
public class BookInfoServiceImplTest {
	
	@Autowired
	private BookInfoService bookService;

	@Test
	public void testListBooks() {
		PaginationBean<BookInfo> pb = bookService.listBooks(2 + "", 5 + "");
		System.out.println(pb);
	}

}
