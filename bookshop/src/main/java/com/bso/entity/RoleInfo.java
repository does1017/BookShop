package com.bso.entity;

public class RoleInfo {

	private Integer rid;//管理员id
	private String rname;//管理员姓名
	private String pwd;//登录密码
	private Integer status;//账号状态
	private String authority;//权限
	
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "RoleInfo [rid=" + rid + ", rname=" + rname + ", pwd=" + pwd
				+ ", status=" + status + ", authority=" + authority + "]";
	}
	public RoleInfo(Integer rid, String rname, String pwd, Integer status,
			String authority) {

		this.rid = rid;
		this.rname = rname;
		this.pwd = pwd;
		this.status = status;
		this.authority = authority;
	}
	public RoleInfo() {
	
	}
	
}
