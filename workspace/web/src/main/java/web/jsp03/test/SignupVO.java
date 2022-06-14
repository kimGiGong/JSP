package web.jsp03.test;

//회원가입 VO (자바 빈즈)
public class SignupVO {
	public SignupVO(){}
	
	private String id;
	private String pw;
	private String name;
	private String gender;
	private String email;
	private String music;
	private String movies;
	private String travel;
	private String sports;
	private String job;
	private String bio;

	
	public String getId() {
		return id;
	}
	public String getPw() {
		return pw;
	}
	public String getName() {
		return name;
	}
	public String getGender() {
		return gender;
	}
	public String getEmail() {
		return email;
	}
	public String getMusic() {
		return music;
	}
	public String getMovies() {
		return movies;
	}
	public String getTravel() {
		return travel;
	}
	public String getSports() {
		return sports;
	}
	public String getJob() {
		return job;
	}
	public String getBio() {
		return bio;
	}
	
	
	public void setId(String id) {
		this.id= id;
	}
	public void setPw(String pw) {
		this.pw= pw;
	}
	public void setName(String name) {
		this.name=name;
	}
	public void setGender(String gender) {
		this.gender= gender;
	}
	public void setEmail(String email) {
		this.email= email;
	}
	public void setMusic(String music) {
		this.music= music;
	}
	public void setMovies(String movies) {
		this.movies= movies;
	}
	public void setTravel(String travel) {
		this.travel= travel;
	}
	public void setSports(String sports) {
		this.sports= sports;
	}
	public void setJob(String job) {
		this.job= job;
	}
	public void setBio(String bio) {
		this.bio= bio;
	}
	
}
