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

public class ReplyDAO {
	
	// 커넥션
	private Connection getConnection() throws NamingException,SQLException {
		Context ctx = new InitialContext();
		Context env = (Context) ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	
	//	댓글 등록처리 메서드
	public void insertReply(ReplyDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		// 	새 댓글인지, 댓글의 댓글인지에 따라 조정이 필요한 값들 일단 변수에 꺼내기
		int replyNum = dto.getReplyNum();	//	새댓글 0 , 댓글의 댓글 1이상
		int replyGrp = dto.getReplyGrp();	//	댓글그룹	새댓글 1
		int replyStep = dto.getReplyStep();	//	정렬순서 	새댓글 0
		int replyLevel =dto.getReplyLevel();	//	댓글의 레벨 새댓글 0
		int number = 0;

		try {
			//	새 댓글 : replyGrp = 시퀀스로 자동으로 채워질 replyNum과 같은수
			//	댓글의 댓글 : replyGrp = 원본댓글의 replyNum으로 저장
			//	-> DB상에서 가장 큰 replyNum 값을 찾아서 +1 한다음 replyGrp 으로 사용
			//		만약 DB에 레코드가 한개도 없으면 replyGrp를 1로 처리
			conn = getConnection();
			String sql = "select max(replyNum) from replyBoard";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) number = rs.getInt(1)+1;
			else number =1;
			
			//	새 글 작성일때,
			replyGrp = number;
			replyStep = 0;
			replyLevel =0;
			
			sql = "insert into replyBoard values (reply_seq.nextval,?,?,sysdate,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getReply());
			pstmt.setString(2, dto.getReplyer());
			pstmt.setInt(3, dto.getBoardNum());
			pstmt.setInt(4, replyGrp);
			pstmt.setInt(5, replyLevel);
			pstmt.setInt(6, replyStep);
			
			int result = pstmt.executeUpdate();
			System.out.println("reply insert result = "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null ) try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null ) try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null ) try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		
	}
	
		
		
	public List<ReplyDTO> getReplies(int boardNum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReplyDTO> list = null;
		try {
			conn = getConnection();
			//	게시판 글에 해당하는 모든 댓글 가져오기
			String sql = "select *from replyBoard where boardNum=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,boardNum );
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<ReplyDTO>();
				//	댓글이 없으면 list = null 상태로 남아 null 리턴
				do {
					ReplyDTO reply = new ReplyDTO();
					reply.setReplyNum(rs.getInt("replyNum"));
					reply.setReply(rs.getString("reply"));
					reply.setReplyer(rs.getString("replyer"));
					reply.setReplyReg(rs.getTimestamp("replyReg"));
					reply.setBoardNum(boardNum);
					reply.setReplyGrp(rs.getInt("replyGrp"));
					reply.setReplyLevel(rs.getInt("replyLevel"));
					reply.setReplyStep(rs.getInt("replyStep"));
					list.add(reply);
				}while(rs.next());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null ) try {rs.close();} catch (Exception e) {e.printStackTrace();}
			if(pstmt != null ) try {pstmt.close();} catch (Exception e) {e.printStackTrace();}
			if(conn != null ) try {conn.close();} catch (Exception e) {e.printStackTrace();}
		}
		return list;
	}	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}











