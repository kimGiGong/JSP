package web.jsp05.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import javax.xml.crypto.Data;

public class SignupDAO {
	
	// 커넥션 메서드
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource)env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	//	회원가입 처리 메서드 : insert into signup (id, pw, name, email)values(?,?,?,?....) 
	public void insertMember(SignupDTO dto) {
		// finally 영역에서 아래변수에 접근해 close() 하기위해, try에서 선언하지않고
		// try 전에 미리 변수만 선언해둠. try에 선언하면 finally에서 접근 불가능.
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		// 커넥션
		try {
			Context ctx = new InitialContext();		// 컨텍스트 객체 생성
			// java comp컴포넌트(부품)/ env(환경변수) 찾아오기
			Context env = (Context)ctx.lookup("java:comp/env");	
			//  환경설정에서 필요한 설정의 이름(name)을 찾아오고 지정해둔 타입 형변환하기
			DataSource ds = (DataSource) env.lookup("jdbc/orcl");
			// 	DataSource 를 통해서 커넥션 연결 (커넥션 객체 얻기)
			conn=ds.getConnection();
			
			
			// 쿼리문 -> Pstmt
			String sql = "insert into signup values(?,?,?,?,?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getMusic());
			pstmt.setString(7, dto.getSports());
			pstmt.setString(8, dto.getTravel());
			pstmt.setString(9, dto.getMovies());
			pstmt.setString(10, dto.getJob());
			pstmt.setString(11, dto.getBio());
			// 실행
			int result = pstmt.executeUpdate();
			System.out.println("result : " + result);
			// 결과??
			// close()
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e1) {e1.printStackTrace();	}
			if(conn != null)try {conn.close();} catch (SQLException e1) {e1.printStackTrace();	}
		}
		
		
		
		
	}
	
	//	회원 전체 조회 메서드
	public List getAllMembers(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<SignupDTO> list = null;	// db테이블에 레코드가 하나도없으면 null리턴
		
		try {
			// 우리가 분리해서 만들어 놓은 메서드 호출하여 커넥션 얻어오기
			conn = getConnection();
			
			// 쿼리문 작성, pstmt로 준비
			String sql = "select * from signup";
			pstmt = conn.prepareStatement(sql);
			// 실행
			rs = pstmt.executeQuery();
			// 결과 잘 정리해서
			// 하나의 레코드 -> DTO
			// DTO 여러개 -> ArrayList 리턴
			if(rs.next()) { // 쿼리문 실행한 결과가 레코드가 있으면
				list = new ArrayList<SignupDTO>(); // list 객체생성 (list != null)
				
				do{
					SignupDTO dto = new SignupDTO();
					
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setGender (rs.getString("gender"));
					dto.setMusic(rs.getString("music"));
					dto.setSports(rs.getString("sports"));
					dto.setTravel(rs.getString("travel"));
					dto.setMovies(rs.getString("movies"));
					dto.setJob(rs.getString("job"));
					dto.setBio(rs.getString("bio"));
					dto.setReg(rs.getTimestamp("reg"));
					
					list.add(dto);
				}while(rs.next()) ;
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			// close() 자원해제
			if( rs != null ) try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if( pstmt != null ) try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if( conn != null ) try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		// 	결과물 리턴 : 메서드에서 리턴할 수 있는 값이 1개. 
		// 	메서드 마지막에 작성
		return list;
		
	}
	
	//	회원 한명 조회 메서드
	//	회원 정보 수정 메서드
	//	회원 정보 삭제 메서드
	
	
}
