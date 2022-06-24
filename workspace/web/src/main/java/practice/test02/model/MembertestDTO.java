package practice.test02.model;

import java.sql.Timestamp;

public class MembertestDTO {
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String birthyear;
	private String birthmonth;
	private String birthday;
	private String gender;
	private String email;
	private String tel;
	private Timestamp since;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		birth = birthyear+"-"+birthmonth+"-"+birthday;
		return birth;
	}
	public String setBirth(String birthday, String birthmonth , String birthyear) {
		birth = birthyear+"-"+birthmonth+"-"+birthday;
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setBirthday(String birthday) {
		this.birthday=birthday;
	}
	public void setBirthmonth(String birthmonth) {
		this.birthmonth = birthmonth;
	}
	public void setBirthyear(String birthyear) {
		this.birthyear=birthyear;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public Timestamp getSince() {
		return since;
	}
	public void setSince(Timestamp since) {
		this.since = since;
	}
	
	
}
