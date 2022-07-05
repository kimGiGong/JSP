package web.jsp10.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ImgSignupDAO {

	private Connection getConnection() throws SQLException,NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	
	
	// 1명 회원가입 (프로필사진 포함)
	public void insertMember(ImgSignupDTO member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into imgSignup values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getGender());
			pstmt.setString(5, member.getEmail());
			pstmt.setString(6, member.getPhoto());
			int result = pstmt.executeUpdate();
			if(result == 1) {
				System.out.println("Insert Member(To.photo) = "+result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	
	
	
	
	// 1명 로그인 ID PW 체크 
		public int idPwCheck(String id, String pw) {
			int result = -1; 
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs= null;
			try {
				conn = getConnection();
				String sql = "select id from imgSignup where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					sql = "select count(*) from imgSignup where id=? and pw=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, pw);
					rs=pstmt.executeQuery();
					if(rs.next()) {result = rs.getInt(1);}	//	비번 맞으면 1 틀리면 0
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return result;
		}
	
	
		
		
		
	//	사용자 id 주면 그 사용자의 photo컬럼값 돌려주는 메서드	
	public String  getPhoto(String id) {
		String photo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select photo from ImgSignup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				photo = rs.getString(1); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return photo;
	}

	
	
	
	//	회원 한명 정보 가져오는 메서드
	public ImgSignupDTO getMember(String id) {
		ImgSignupDTO member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from ImgSignup where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new ImgSignupDTO();
				member.setId(id); 
				member.setPw(rs.getString("pw")); 
				member.setName(rs.getString("name")); 
				member.setGender(rs.getString("gender")); 
				member.setEmail(rs.getString("email")); 
				member.setReg(rs.getTimestamp("reg")); 
				member.setPhoto(rs.getString("photo")); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return member;
	}

	
	
	
	//	회원 한명 정보 가져오는 메서드
		public int updateMember(ImgSignupDTO member) {
			int result = 0;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = getConnection();
				String sql = "update ImgSignup set pw=? , email=?, photo=? where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getPw() );
				pstmt.setString(2, member.getEmail());
				pstmt.setString(3, member.getPhoto());
				pstmt.setString(4, member.getId());
				result = pstmt.executeUpdate();		//	잘되면 리턴1, 잘안되면 리턴0
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return result;
		}
	
	
	
		//	회원 탈퇴 처리 메서드
			public void deleteMember(String id) {
				Connection conn = null;
				PreparedStatement pstmt = null;
				try {
					conn = getConnection();
					String sql = "delete from imgSignup where id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					int result = pstmt.executeUpdate();
					if(result ==1) {
						System.out.println("deleteMember = "+result);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
					if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
				}
			}
	
	
	
	
	
	
	
	
	
	
	
	
	











}
