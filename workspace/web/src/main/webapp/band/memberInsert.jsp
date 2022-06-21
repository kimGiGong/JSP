<%@page import="web.model.band.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInsert</title>
</head>
<% 
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String addr = request.getParameter("addr");
	String favorite = request.getParameter("favorite");
	
	// DB 접속해서 테이블에 레코드 하나 추가
	MemberDAO dao = new MemberDAO(); 
	dao.insertMember(id, pw, name, tel, addr, favorite);	// 상단에 변수에 담아놓은 값 던지며 처리 요청
%>
<body>
	<h1>hello</h1>
</body>
</html>