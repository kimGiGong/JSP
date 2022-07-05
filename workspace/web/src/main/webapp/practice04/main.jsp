<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>main</title>
	<link href="../jsp10/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<br>
	<h1 align="center"> Main Page</h1>
	
	<% if(session.getAttribute("SID")==null){ %>
	<table>
		<tr>
			<td> <button onclick="window.location='login.jsp'">로그인</button> </td>
		</tr>
		<tr>
			<td> <button onclick="window.location='signup.jsp'">회원가입</button> </td>
		</tr>
	</table>
	<% }else{ %>
	<table>
		<tr>
			<td> <button onclick="window.location='logout.jsp'">로그아웃</button> </td>
		</tr>
		<tr>
			<td> <button onclick="window.location='mypage.jsp'">마이페이지</button> </td>
		</tr>
	</table>
	<% } %>
</body>
</html>