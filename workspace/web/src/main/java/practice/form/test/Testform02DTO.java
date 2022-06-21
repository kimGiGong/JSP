package practice.form.test;

public class Testform02DTO {
	private String fname;
	private String lname;
	private String username;
	private String pw;
	private String pwconfirm;
	private String tel;
	
	
	
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String user) {
		this.username = user;
	}
	public String getEmail() {
		return username+"@gamil.com";
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPwconfirm() {
		return pwconfirm;
	}
	public void setPwconfirm(String pwconfirm) {
		this.pwconfirm = pwconfirm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
