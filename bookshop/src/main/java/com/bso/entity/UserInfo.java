package com.bso.entity;

public class UserInfo {
	
	private Integer usid;//用户编码
	private String uname;//用户名
	private String pwd;//密码
	private String sex;//性别
	private String email;//邮箱
	private String tel;//电话
	private String addr;//发货
	private String question;//密保问题
	private String answer;//密保答案
	private String temp;//备用字段
	private String flag;//备用字段
	
	public Integer getUsid() {
		return usid;
	}
	public void setUsid(Integer usid) {
		this.usid = usid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
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
		return "UserInfo [usid=" + usid + ", uname=" + uname + ", pwd=" + pwd
				+ ", sex=" + sex + ", email=" + email + ", tel=" + tel
				+ ", addr=" + addr + ", question=" + question + ", answer="
				+ answer + ", temp=" + temp + ", flag=" + flag + "]";
	}
	
	public UserInfo(Integer usid, String uname, String pwd, String sex,
			String email, String tel, String addr, String question,
			String answer, String temp, String flag) {

		this.usid = usid;
		this.uname = uname;
		this.pwd = pwd;
		this.sex = sex;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.question = question;
		this.answer = answer;
		this.temp = temp;
		this.flag = flag;
	}
	public UserInfo() {
	
	}

}
