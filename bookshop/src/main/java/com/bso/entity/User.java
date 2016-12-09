package com.bso.entity;
/**
 * 用户信息
 * @author Administrator
 *
 */
public class User {

	private Integer usid;
	private String uname;
	private String pwd;
	private String sex;
	private String email;
	private String tel;
	private String addr;
	private String question;
	private String answer;
	private String temp;
	private String flag;
	private Integer status;


	public User() {
		super();
	}

	public User(Integer usid, String uname, String pwd, String sex,
			String email, String tel, String addr, String question,
			String answer, String temp, String flag, Integer status) {
		super();
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
		this.status = status;
	}

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
	
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "User [usid=" + usid + ", uname=" + uname + ", pwd=" + pwd
				+ ", sex=" + sex + ", email=" + email + ", tel=" + tel
				+ ", addr=" + addr + ", question=" + question + ", answer="
				+ answer + ", temp=" + temp + ", flag=" + flag + ", status="
				+ status + "]";
	}

}
