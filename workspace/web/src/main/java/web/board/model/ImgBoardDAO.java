package web.board.model;

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

public class ImgBoardDAO {
	
	private Connection getConnection() throws SQLException ,NamingException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	
	//	게시글 등록 메서드
	public void insertArticle(ImgBoardDTO article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "insert into imgBoard(bno, writer, subject, content, img, email, bpw) ";
	        sql += "values(imgBoard_seq.nextval,?,?,?,?,?,?)"; 
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,article.getWriter());
			pstmt.setString(2,article.getSubject() );
			pstmt.setString(3,article.getContent() );
			pstmt.setString(4,article.getImg());
			pstmt.setString(5,article.getEmail() );
			pstmt.setString(6,article.getBpw());
			int result = pstmt.executeUpdate();
			if(result ==1) {
				System.out.println("ImgBoardDAO insert ="+result);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if(conn != null) try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	
	
	
	//	전체글의 갯수 카운팅 메서드
	public int getArticleCount() {
		int count = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select count(*) from imgboard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);	// 1번 컬럼
				System.out.println("ImgBoardDAO getCount ="+count);
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
	
	
	
	
	
	//	해당 페이지에 띄워줄 글 가져오기
	public List getArticles(int start, int end) {
		List list = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String sql = "select B.* from (select rownum r, A.* from (select * from imgboard order by reg desc) A) B where r>= ? and r<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList();
				do {
					ImgBoardDTO article = new ImgBoardDTO();
					article.setBno(rs.getInt("bno"));
					article.setBpw(rs.getString("bpw"));
					article.setContent(rs.getString("content"));
					article.setEmail(rs.getString("email"));
					article.setImg(rs.getString("img"));
					article.setReadcount(rs.getInt("readcount"));
					article.setReg(rs.getTimestamp("reg"));
					article.setSubject(rs.getString("subject"));
					article.setWriter(rs.getString("writer"));
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
	
	
	
	
	
	
	// 검색한 글의 총 개수 
	   public int getArticleSearchCount(String sel, String search) {
	      int count = 0; 
	      Connection conn = null; 
	      PreparedStatement pstmt = null; 
	      ResultSet rs = null;
	      try {
	         conn = getConnection(); 
	         String sql = "select count(*) from imgBoard where "+sel+" like '%"+search+"%'";
	         pstmt = conn.prepareStatement(sql);
	         rs = pstmt.executeQuery(); 
	         if(rs.next()) {
	            count = rs.getInt(1);
	         }
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace();}
	         if(pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace();}
	         if(conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace();}
	      }
	      return count;
	   }
	
	   
	// 검색한 글 목록 가져오는 메서드 
	   public List getArticlesSearch(int start, int end, String sel, String search) {
	      List list = null; 
	      Connection conn = null; 
	      PreparedStatement pstmt = null; 
	      ResultSet rs = null;
	      try {
	         conn = getConnection(); 
	         String sql = "select B.* from (select rownum r, A.* from "
	               + "(select * from imgBoard where "+sel+" like '%"+search+"%'"
	               + " order by reg desc) A) B "
	               + "where r >= ? and r <= ?";
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, start);
	         pstmt.setInt(2, end);
	         
	         rs = pstmt.executeQuery(); 
	         if(rs.next()) { // 결과 있는지 체크 + 커서 첫번째 레코드 가르키게됨.
	            list = new ArrayList(); // 저장공간 생성(결과없으면 저장공간도 차지하지않게하겠다)
	            do {
	               ImgBoardDTO article = new ImgBoardDTO(); 
	               article.setBno(rs.getInt("bno"));
	               article.setWriter(rs.getString("writer"));
	               article.setSubject(rs.getString("subject"));
	               article.setContent(rs.getString("content"));
	               article.setImg(rs.getString("img"));
	               article.setEmail(rs.getString("email"));
	               article.setBpw(rs.getString("bpw"));
	               article.setReg(rs.getTimestamp("reg"));
	               article.setReadcount(rs.getInt("readcount"));
	               list.add(article);
	            }while(rs.next());
	         }
	      }catch(Exception e) {
	         e.printStackTrace();
	      }finally {
	         if(rs != null) try { rs.close(); } catch(SQLException e) { e.printStackTrace();}
	         if(pstmt != null) try { pstmt.close(); } catch(SQLException e) { e.printStackTrace();}
	         if(conn != null) try { conn.close(); } catch(SQLException e) { e.printStackTrace();}
	      }
	      return list; 
	   }	
	
	
	
	
	
	
	
	
	
	
	
	
}
