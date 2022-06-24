package web.jsp07.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	//	커넥션
	private Connection getConnection() throws NamingException , SQLException{
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	// 회원가입 메서드
	public void addMember(MemberDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into member values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getId());
			pstmt.setString(2,dto.getPw());
			pstmt.setString(3,dto.getName());
			pstmt.setString(4,dto.getGender());
			pstmt.setString(5,dto.getEmail());
			
			int result = pstmt.executeUpdate();
			System.out.println("insert result = "+result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	// 아이디 비밀번호 체크
	public boolean idPwCheck(String id, String pw) {
		boolean result = false;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				System.out.println("id pw 일치");
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return result;
	}
	
	//	회원 1명 정보 가져오기	: select * from where id=?
	public MemberDTO getMember(String id) {
		MemberDTO member = null;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			conn = getConnection();
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {	// 결과가 있다면
				System.out.print("ID 있음!");
				member = new MemberDTO();	// 	dto 객체 생성	(메모리관리) 확정되면 생성하면
				member.setId(rs.getString("id"));	// setId(id);
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString("name"));
				member.setGender(rs.getString("gender"));
				member.setEmail(rs.getString("email"));
				member.setReg(rs.getTimestamp("reg"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return member;
	}
	
	//  회원정보 수정 처리 메서드
	public void updateMember(MemberDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update member set pw=?, name=? , email=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getId());
			int result = pstmt.executeUpdate();
			System.out.println("update result : "+ result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	// 회원 탈퇴 처리 메서드
	public int deleteMember(String id, String pw) {
		String dbpw = ""; 	//	db에서 pw만 꺼내 담아줄 변수
		int result = -1;		// 	최종 결과 숫자로 리턴해줄 변수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			// id, pw 맞는지 검사하고 맞으면 데이터 삭제
			conn = getConnection();
			String sql = "select pw from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){ // 결과를 하나 가져왔으면
				dbpw = rs.getString("pw");	// 해당 사용자(id)로 db에 저장된 pw 꺼내기
				System.out.println("DAO"+dbpw);
				if(dbpw.equals(pw)) {	// 비번 일치할때
					//	회원정보 삭제처리
					sql = "delete from member where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,id);
					pstmt.executeUpdate();
					result = 1; //	비번 맞고 삭제 성공
				}else {
					result = 0;	// 	비번 틀림
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null )try { rs.close();} catch (SQLException e) { e.printStackTrace();}
			if(pstmt != null )try { pstmt.close();} catch (SQLException e) { e.printStackTrace();}
			if(conn != null )try { conn.close();} catch (SQLException e) { e.printStackTrace();}
		}
		return result;
	}
	
	//	id 중복확인 메서드
	public boolean confirmId(String id) {
		boolean result = false;
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			conn= getConnection();
			String sql = "select count(*) from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);	// 첫번째 컬럼을 준다
				System.out.println("count = "+count);
				if(count == 1) {
					result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null )try { rs.close();} catch (SQLException e) { e.printStackTrace();}
			if(pstmt != null )try { pstmt.close();} catch (SQLException e) { e.printStackTrace();}
			if(conn != null )try { conn.close();} catch (SQLException e) { e.printStackTrace();}
		}
		
		return result;	// ID가 result == true 이미존재 , result==false  존재하지 않는다
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
	