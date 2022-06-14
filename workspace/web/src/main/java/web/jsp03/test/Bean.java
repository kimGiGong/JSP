package web.jsp03.test;

// 자바빈 : 캡슐화로 작성
public class Bean implements java.io.Serializable {

	//	변수
	private String id;
	private String pw;
	
	
	//기본생성자
	public Bean() {}
	
	
	//	set : 저장메서드
	public void setId(String id) {
		this.id= id.trim();
	}
	public void setPw(String pw) {
		this.pw= pw;
	}
	
	//	get : 데이터 가져오는 메서드
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	
	
	
}
