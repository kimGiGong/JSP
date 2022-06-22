package web.jsp06.medel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class SignupDAO {

	// 커넥션 메서드
	private Connection getConnection() throws NamingException, SQLException{
		Context ctx = new InitialContext();
		Context env = (Context)ctx.lookup("java:comp/env");
		DataSource ds = (DataSource) env.lookup("jdbc/orcl");
		return ds.getConnection();
	}
	
	//	로그인 : id, pw 맞는지 체크해서 결과 돌려주는 메서드
	//			 id, pw 맞으면 true, 둘중 하나라도 틀리거나 없으면 false
	public boolean idPwCheck(String id, String pw) {
		System.out.println("idpw호출!");
		boolean result = false; // 최종결과 리턴해줄 변수 미리선언
		Connection conn = null;
		PreparedStatement pstmt = null;	
		ResultSet rs = null;
		
		try {
			conn = getConnection();	// Naming / SQLException 발생가능
			String sql = "select * from signup where id=? and pw=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			
			
			rs = pstmt.executeQuery();
			// rs에 돌려받은 결과에 따라 result 변수값 변경
			
			if(rs.next()) {
				System.out.println("rs.next() ->true");
				result = true;
			}
		} catch (Exception e) {	// Naming / SQLException 발생했을때 둘다 받아줄 부모로 처리
			e.printStackTrace();
		}finally {
			if(rs != null)try {rs.close();} catch (SQLException e) { e.printStackTrace();}
			if(pstmt != null)try {pstmt.close();} catch (SQLException e) { e.printStackTrace();}
			if(conn != null)try {conn.close();} catch (SQLException e) { e.printStackTrace();}
		}
		
		return result;
	}
	
		
}
