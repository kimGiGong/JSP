package web.jsp08.model;

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
	
	// 커넥션
	private Connection getConnection() throws NamingException,SQLException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	// 	글 작성 처리 메서드
	public void insertAriticle(BoardDTO article){
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn= getConnection();
			String sql = "insert into board (num, writer, subject, email,content,pw,reg,readcount)";
			sql += " values(board_seq.nextval,?,?,?,?,?,?,?)";	// 앞에 띄어 쓰기 필쑤!!! 어째 전에 안되드라
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setString(3, article.getEmail());
			pstmt.setString(4, article.getContent());
			pstmt.setString(5, article.getPw());
			pstmt.setTimestamp(6, article.getReg());
			pstmt.setInt(7, article.getReadcount());
			int result = pstmt.executeUpdate();
			System.out.println("insert result = "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	 }
	
	public List<BoardDTO> getAllArticles() {
		List<BoardDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from board order by reg desc" ;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<BoardDTO>();
			while(rs.next()){
				BoardDTO article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setSubject(rs.getString("subject"));
				article.setWriter(rs.getString("writer"));
				article.setContent(rs.getString("content"));
				article.setEmail(rs.getString("email"));
				article.setPw(rs.getString("pw"));
				article.setReadcount(rs.getInt("readcount"));
				article.setReg(rs.getTimestamp("reg"));
				list.add(article);
			};
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return list;
	}
	
	// (구버전) 전체 페이지 리턴해주는 메서드
	public int getAriticleCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int count = 0;
		try {
			conn = getConnection();
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();		// execute = 실행하다
			if(rs.next()) {
				count = rs.getInt(1);	// (컬럼값)
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return count;
	}
	
	// 게시글 가져오기 (페이징 처리 O)
	public List<BoardDTO> getArticleList(int start,int end){
		List<BoardDTO> list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select B.* from (select rownum r, A.* from "
					+ "(select * from board order by reg desc) A "
					+ ") B where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<BoardDTO>();
				do {
					BoardDTO article = new BoardDTO();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setSubject(rs.getString("subject"));
					article.setContent(rs.getString("content"));
					article.setEmail(rs.getString("email"));
					article.setPw(rs.getString("pw"));
					article.setReg(rs.getTimestamp("reg"));
					article.setReadcount(rs.getInt("readcount"));
					list.add(article);
				} while (rs.next());
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
	
	
	public BoardDTO getArticle(int num) {
		BoardDTO article = null;
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select * from board where num=?"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new BoardDTO();
				article.setNum(num); 
				article.setWriter(rs.getString("writer")); 
				article.setSubject(rs.getString("subject")); 
				article.setContent(rs.getString("content")); 
				article.setEmail(rs.getString("email")); 
				article.setPw(rs.getString("pw")); 
				article.setReg(rs.getTimestamp("reg")); 
				article.setReadcount(rs.getInt("readcount")); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();} catch (SQLException e) {e.printStackTrace();}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return article;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
