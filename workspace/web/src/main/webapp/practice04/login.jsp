<%@page import="practice.test04.model.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../jsp10/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br>
	<h1 align="center">로그인</h1>
	<form action="loginPro.jsp" method="post" >
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name = "id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password"  name ="pw" ></td>
			</tr>
			<tr>
				<td>자동로그인</td>
				<td><input type="checkbox"  name ="auto" value="1"></td>
			</tr>
			<tr>
				<td colspan="2"> 
				<input type="submit" value="로그인">
				<input type="button" value="취소" onclick="window.location='main.jsp'"> 
				</td>
			</tr>
		</table>
	</form>

</body>
</html>