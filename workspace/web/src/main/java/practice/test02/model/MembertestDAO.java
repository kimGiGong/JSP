package practice.test02.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MembertestDAO {

	public Connection getConnection() throws SQLException, NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	public void addMember(MembertestDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		try {
			conn = getConnection();
			String sql = "insert into testmember02 values (?,?,?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getBirth());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getTel());
			
			int data = pstmt.executeUpdate();
			System.out.println("DB저장 ="+data);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	public int login(String id, String pw) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from testmember02 where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result= 1;
				System.out.println("ID location = "+result);
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
	
}
