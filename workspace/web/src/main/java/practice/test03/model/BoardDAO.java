package practice.test03.model;

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

public class BoardDAO {
	private Connection getConnection() throws SQLException, NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	//	ContentIn
	public void contentIn(BoardDTO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rs = -1;
		try {
			conn=getConnection();
			String sql = "insert into tboard (boardno,subject,writer,pw,content, reg) "
					+"values(tboard_seq.nextval , ?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getSubject());
			pstmt.setString(2, article.getWriter());
			pstmt.setString(3, article.getPw());
			pstmt.setString(4, article.getContent());
			
			rs = pstmt.executeUpdate();
			System.out.println("insert="+rs);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
	}
	
	
	
	
	
	
	
	
	//	readAllBorad
	public List<BoardDTO> readAllBorad(int flist,int llist) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardDTO> list = null;
		try {
			conn = getConnection();
			String sql = "select B.* from (select rownum r , A.* from (select * from tboard order by boardno desc)A )B"
					+ " where r >= ? and r<= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, flist);
			pstmt.setInt(2, llist);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do{
					BoardDTO dto = new BoardDTO();
					dto.setBoardno(rs.getInt("boardno"));
					dto.setWriter(rs.getString("writer"));
					dto.setPw(rs.getString("pw"));
					dto.setContent(rs.getString("content"));
					dto.setSubject(rs.getString("subject"));
					dto.setReg(rs.getTimestamp("reg"));
					dto.setReadcount(rs.getInt("readcount"));
					list.add(dto);
				}while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return list;
	}
	
	
	
	
	
	// 카운트
	public int countList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = -1;
		try {
			conn = getConnection();
			String sql = "select count(*) from tboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return count;
	}
	
	
	
	
	//	contentOut
	public BoardDTO contentOut(int boardno) {
		BoardDTO dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from tboard where boardno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1 , boardno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoardno(boardno);
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setWriter(rs.getString("writer"));
				dto.setPw(rs.getString("pw"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setReg(rs.getTimestamp("reg"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return dto;
	}
	
	
	
	
	//	1개 게시물 DB 업데이트하는 set메서드
	public int reContentIn(int boardno,String subject, String Content , String pw) {
		int pwOK= 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "update tboard set subject=? ,content=? where boardno=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1 , subject);
			pstmt.setString(2 , Content);
			pstmt.setInt(3 , boardno);
			pstmt.setString(4 ,pw);
			pwOK = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return pwOK;
	}
	
	
	
//	1개 게시물 DB 삭제하는 delete메서드
	public int deleteOne(int boardno, String pw) {
		int deleteOK= 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "delete from tboard where boardno=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1 , boardno);
			pstmt.setString(2 ,pw);
			deleteOK = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return deleteOK;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
}
