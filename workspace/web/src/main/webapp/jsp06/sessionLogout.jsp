<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	// 	로그아웃 처리 페이지
	
	// #1. 로그인 유지해주는 속성만 삭제 (로그인 이외에 유지되어야할 속성이 있을경우)
	session.removeAttribute("sid");

	// #2. 세션에 있는 모든 속성 삭제(다 지워도 될 경우)
	//	session.invalidate();
	
	// 로그아웃 처리 다했으면, 메인으로 이동시키기
	response.sendRedirect("signupmain01.jsp");	// 자바 response 객체를 통해 페이지 단순이동
%>
<body>
</body>
</html>