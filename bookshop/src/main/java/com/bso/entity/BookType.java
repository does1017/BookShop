package com.bso.entity;

public class BookType {
	
	private Integer tid;//书籍类型编号
	private Integer tid_parent;//父类型编号
	private String tname;//类型名
	private Integer status;//状态
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getTid_parent() {
		return tid_parent;
	}
	public void setTid_parent(Integer tid_parent) {
		this.tid_parent = tid_parent;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
	@Override
	public String toString() {
		return "BookType [tid=" + tid + ", tid_parent=" + tid_parent
				+ ", tname=" + tname + ", status=" + status + "]";
	}
	
	public BookType(Integer tid, Integer tid_parent, String tname,
			Integer status) {
		this.tid = tid;
		this.tid_parent = tid_parent;
		this.tname = tname;
		this.status = status;
	}
	
	public BookType() {
	
	}
	
	
}
