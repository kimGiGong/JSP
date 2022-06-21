package practice.form.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Testform02DAO {

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		Connection conn = ds.getConnection();
		return conn;
	}
	
	public void insertSignForm(Testform02DTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "insert into testinsert values (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getFname());
			pstmt.setString(2, dto.getLname());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getPw());
			pstmt.setString(6, dto.getTel());
			int rs = pstmt.executeUpdate();
			System.out.println("등록수 : "+rs);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try { conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	
	
	
	
	public List listAll() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Testform02DTO> list = null;
		try {
			conn = getConnection();
			String sql = "select * from testinsert";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<Testform02DTO>();
				 do{ 
					Testform02DTO dto = new Testform02DTO();
					dto.setFname(rs.getString("fname"));
					dto.setLname(rs.getString("lname"));
					dto.setUsername(rs.getString("username"));
					dto.setPw(rs.getString("pw"));
					dto.setTel(rs.getString("tel"));
					list.add(dto);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
}
