package com.bso.entity;

public class UserComment {

	private Integer ucid;//用户评论id
	private Integer usid;//用户id
	private Integer bid;//书籍id
	private String content;//评论内容
	
	public Integer getUcid() {
		return ucid;
	}
	public void setUcid(Integer ucid) {
		this.ucid = ucid;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public Integer getBid() {
		return bid;
	}
	public void setBid(Integer bid) {
		this.bid = bid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		return "UserComment [ucid=" + ucid + ", usid=" + usid + ", bid=" + bid
				+ ", content=" + content + "]";
	}
	public UserComment(Integer ucid, Integer usid, Integer bid, String content) {

		this.ucid = ucid;
		this.usid = usid;
		this.bid = bid;
		this.content = content;
	}
	public UserComment() {
		
	}

}
