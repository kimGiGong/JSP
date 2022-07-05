package practice.test04.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SignDAO {
	
	private Connection getConnection() throws SQLException ,NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	
	
	// 회원 가입
	public int insert(SignDTO dto) {
		int result=0; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tsign values(?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getName());
			pstmt.setString(2,dto.getId());
			pstmt.setString(3,dto.getPw());
			pstmt.setString(4,dto.getPhone());
			pstmt.setString(5,dto.getBirth());
			pstmt.setString(6,dto.getProfile());
			result = pstmt.executeUpdate();
			if(result == 1) {
				System.out.println("SignDAO insert = "+result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return result;
	}
	
	
	
	
	
	
	
	// 회원 가입
	public int idPwCheck(String id , String pw) {
		int result=-1;
		String dbPw=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select pw from tsign where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dbPw=rs.getString(1);
				result=0;
				if(dbPw.equals(pw)) {
					result=1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return result;
	}




	
	// 회원탈퇴
	public void deleteMember(String id ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from tsign where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
	}	
	
	
	
	
	
	// 회원 1명 가져오기
	public SignDTO getMember(String id ) {
		SignDTO dto= null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			conn = getConnection();
			String sql = "select * from tsign where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new SignDTO();
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setPhone(rs.getString("phone"));
				dto.setProfile(rs.getString("profile"));
				dto.setBirth(rs.getString("birth"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return dto;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
