<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> EL01.jsp </title>
</head>
<% 

	request.setAttribute("name", "피카츄");
	session.setAttribute("memId", "꼬북이");

%>
<body>

	<h1> EL </h1>
	<h2> ${ "10"+10 }</h2>
	<%-- <h2> ${"haha" + 10 }</h2> 		에러 EL명령어	--%>		
	<h2> ${ null + 10 }</h2>
	
	<h2> name : ${ name }</h2>
	<h2> requestScope.name : ${ requestScope.name }</h2>
	<h2> sessionScope.name : ${ sessionScope.name }</h2>
	<h2> memId : ${ memId }</h2>
	
</body>
</html>