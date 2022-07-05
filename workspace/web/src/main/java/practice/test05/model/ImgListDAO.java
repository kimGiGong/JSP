package practice.test05.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import practice.test04.model.SignDTO;

public class ImgListDAO {

	private Connection getConnection() throws SQLException, NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	
	//	글쓰기
	public int saveContent(ImgListDTO dto) {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into tcontentboard (bno,subject, writer,content,bpw,img) "
						+ "values(tcontentboard_seq.nextval,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getBpw());
			pstmt.setString(5, dto.getImg());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return result;
	}
	
	
	
	
	
	//	모든 글 가져오기
	public List getAllList(int start , int end) {
		List list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = getConnection();
			String sql = "select B.* from(select rownum r, A.* from (select * from tcontentboard order by bno desc) A) B where r>=? and r<=?;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					ImgListDTO dto = new ImgListDTO();
					dto.setBno(rs.getInt("bno"));
					dto.setSubject(rs.getString("subject"));
					dto.setBpw(rs.getString("bpw"));
					dto.setContent(rs.getString("content"));
					dto.setImg(rs.getString("img"));
					dto.setReadcount(rs.getInt("readcount"));
					dto.setReg(rs.getTimestamp("reg"));
					dto.setWriter(rs.getString("writer"));
					list.add(dto);
				} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return list;
	}
	
	
	
	
	
	//	모든 글 갯수
	public int getAllNumber() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		try {
			conn = getConnection();
			String sql = "select count(*) from tcontentboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
