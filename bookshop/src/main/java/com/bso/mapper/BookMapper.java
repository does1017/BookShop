package com.bso.mapper;

import com.bso.entity.BookInfo;
import com.bso.entity.PaginationBean;

public interface BookMapper {
	PaginationBean<BookInfo> getPartBooks(PaginationBean<BookInfo> pb);

}
