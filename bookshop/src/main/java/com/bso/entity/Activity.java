package com.bso.entity;
/**
 * 活动
 * @author Administrator
 *
 */
public class Activity {

	private Integer aid;//活动id
	private String aname;//活动名
	private Integer bid;//书籍id 
	private Integer tid;//书籍类型id
	private Integer inventory;//库存
	private Double price;//活动价
	
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Activity [aid=" + aid + ", aname=" + aname + ", bid=" + bid
				+ ", tid=" + tid + ", inventory=" + inventory + ", price="
				+ price + "]";
	}
	public Activity(Integer aid, String aname, Integer bid, Integer tid,
			Integer inventory, Double price) {

		this.aid = aid;
		this.aname = aname;
		this.bid = bid;
		this.tid = tid;
		this.inventory = inventory;
		this.price = price;
	}
	public Activity() {
		
	}
	

}
