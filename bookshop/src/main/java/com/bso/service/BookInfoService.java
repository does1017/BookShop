package com.bso.service;

import com.bso.entity.BookInfo;
import com.bso.entity.PaginationBean;


public interface BookInfoService {
	PaginationBean<BookInfo> listBooks(String page,String rows);
}
