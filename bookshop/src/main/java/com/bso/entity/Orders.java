package com.bso.entity;

public class Orders {

	private Integer orid;//订单编号
	private Integer usid;//用户编号
	private Double total_price;//订单总价
	private Integer status;//订单状态
	private String create_time;//订单创建时间
	
	public Integer getOrid() {
		return orid;
	}
	public void setOrid(Integer orid) {
		this.orid = orid;
	}
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public Double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(Double total_price) {
		this.total_price = total_price;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}
	
	@Override
	public String toString() {
		return "Orders [orid=" + orid + ", usid=" + usid + ", total_price="
				+ total_price + ", status=" + status + ", create_time="
				+ create_time + "]";
	}

}
