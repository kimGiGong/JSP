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
	
	
	
	
	
	
	
}
