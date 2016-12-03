package com.bso.entity;

public class OrderInfo {
	
	private Integer oriid;//订单信息id
	private Integer bid;//书籍id
	private Integer usid;//用户id
	private Integer orid;//订单id
	private Integer bookNum;//书本数量
	private Double price;//单价
	
	public Integer getOriid() {
		return oriid;
	}
	public void setOriid(Integer oriid) {
		this.oriid = oriid;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public Integer getOrid() {
		return orid;
	}
	public void setOrid(Integer orid) {
		this.orid = orid;
	}
	public Integer getBookNum() {
		return bookNum;
	}
	public void setBookNum(Integer bookNum) {
		this.bookNum = bookNum;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "OrderInfo [oriid=" + oriid + ", bid=" + bid + ", usid=" + usid
				+ ", orid=" + orid + ", bookNum=" + bookNum + ", price="
				+ price + "]";
	}

}
