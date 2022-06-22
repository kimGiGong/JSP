<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
String login = (String)session.getAttribute("SessionID");

if(login ==null ){
%>
	<button onclick="location.href='signupform01.jsp'">로그인</button>
<%
}else{
%>
	<button onclick="location.href='signupLogout01.jsp'">로그아웃</button>
<%	
}
%>
<body>


</body>
</html>