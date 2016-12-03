package com.bso.entity;

public class BookInfo {
	
	private Integer bid;//书籍id
	private String bname;//书名
	private String author;//作者
	private String publisher;//出版社
	private Integer tid;//书籍类型
	private String intro;//书籍简介
	private String image;//图片地址
	private Double price;//书籍价格
	private  Integer status;//上下架
	private Integer inventory;//库存
	private String temp;//备用字段
	private String flag;//备用字段
	
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	@Override
	public String toString() {
		return "BookInfo [bid=" + bid + ", bname=" + bname + ", author="
				+ author + ", publisher=" + publisher + ", tid=" + tid
				+ ", intro=" + intro + ", image=" + image + ", price=" + price
				+ ", status=" + status + ", inventory=" + inventory + ", temp="
				+ temp + ", flag=" + flag + "]";
	}

}
