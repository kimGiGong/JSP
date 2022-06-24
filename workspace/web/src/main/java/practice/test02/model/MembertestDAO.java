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
	// 회원가입
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
	// 아이디 비밀번호 체크
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
	
	// 회원 정보 가져오기
		public MembertestDTO getMember(String id) {
			MembertestDTO dto= null;
			Connection conn = null;
			PreparedStatement pstmt =null;
			ResultSet rs = null;
			try {
				conn = getConnection();
				String sql = "select * from testmember02 where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new MembertestDTO();
					dto.setId(rs.getString("id"));
					dto.setPw(rs.getString("pw"));
					dto.setName(rs.getString("name"));
					dto.setBirth(rs.getString("birth"));
					dto.setGender(rs.getString("gender"));
					dto.setEmail(rs.getString("email"));
					dto.setTel(rs.getString("tel"));
					dto.setSince(rs.getTimestamp("since"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs != null)try {rs.close();} catch (SQLException e) {e.printStackTrace();}
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
			return dto;
		}
		public void updateMember(MembertestDTO dto) {
			Connection conn = null;
			PreparedStatement pstmt =null;
			try {
				int data = 0;
				conn = getConnection();
				if(dto.getPw()!=null) {
					String sql = "update testmember02 set pw=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getPw());
					data = pstmt.executeUpdate();
				}
				if(dto.getEmail()!=null) {
					String sql = "update testmember02 set email=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getEmail());
					data = pstmt.executeUpdate();
				}
				if(dto.getTel()!=null) {
					String sql = "update testmember02 set tel=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dto.getTel());
					data = pstmt.executeUpdate();
				}
				
				System.out.println("DB저장 ="+data);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null)try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
				if(conn != null)try {conn.close();} catch (SQLException e) {e.printStackTrace();}
			}
		}
	
	
	
	
	
}
