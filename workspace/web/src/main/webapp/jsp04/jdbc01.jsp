<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jdbc01.jsp</title>
</head>
<% 
	//1 : JDBC 드라이버 로딩 : 클래스명:Class의 forName 메서드를 사용하여
	//			드라이버 클래스를 한번 로딩.
	//			JDBC 드라이버가 로딩되면 자동으로 객체 생성되고,
	//			DriverManager 클래스에 등록됨.
	Class.forName("oracle.jdbc.driver.OracleDriver");

	//2 : DB접속을 위한 Connection 객체 생성 (사용자계정명, 비번 , DB url정보)
	String username = "java04", pw ="java04";
	String url = "jdbc:oracle:thin:@192.168.100.250:1521:ORCL";
	Connection conn = DriverManager.getConnection(url, username, pw);
	
	//3 : 쿼리 실행을 위한 Statement 객체 생성, 쿼리문 작성
	String sql = "select * from test";
	PreparedStatement pstmt = conn.prepareStatement(sql);	
	
	//4 : 쿼리 실행
	ResultSet rs = pstmt.executeQuery();
	
	//5 : (가져오는 결과물이 있으면 사용)
	while(rs.next()){
		String id = rs.getString("id");
		String passwd = rs.getString("pw");
		int age = rs.getInt("age");
		Timestamp reg= rs.getTimestamp("reg"); %>
		
		<p> id : <%= id %> / pw : <%= passwd %> / age : <%= age %> / reg : <%= reg %></p>
	<% }
	
	//6 : 사용된 객체(ResultSet, Statement, Connection 등) 종료

%>
<body>
	
	<h1> JDBC page</h1>
	
	
	
	
	
</body>
</html>