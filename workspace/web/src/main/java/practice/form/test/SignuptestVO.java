package practice.form.test;

public class SignuptestVO {
	public SignuptestVO() {}
	
	private String fname;
	private String lname;
	private String id;
	private String pw;
	private String email;
	private String tel;
	
	public void setFname (String fname) {this.fname = fname;}
	public void setLname (String lname) {this.lname = lname;}
	public void setId (String id) {this.id = id;}
	public void setPw (String pw) {this.pw = pw;}
	public void setEmail (String email) {this.email = email;}
	public void setTel (String tel) {this.tel = tel;}
	
	public String getFname () {return fname;}
	public String getLname () {return lname;}
	public String getId () {return id;}
	public String getPw () {return pw;}
	public String getEmail () {return email;}
	public String getTel () {return tel;}
	
}
