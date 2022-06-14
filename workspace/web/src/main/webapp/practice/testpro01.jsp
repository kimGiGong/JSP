<%@page import="practice.form.test.SignuptestVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<jsp:useBean id="vo" class="practice.form.test.SignuptestVO" />
	<jsp:setProperty property="*" name="vo" />
</head>

<body>
	<h2>회원가입 완료</h2>
	<table>
		<tr>
			<td>이름</td>
			<td></td>
			<td><jsp:getProperty property="lname" name="vo"/> <jsp:getProperty property="fname" name="vo"/></td>
		</tr>
		<tr>
			<td>사용자 ID</td>
			<td></td>
			<td><jsp:getProperty property="id" name="vo"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td></td>
			<td><jsp:getProperty property="pw" name="vo"/></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td></td>
			<td><jsp:getProperty property="email" name="vo"/></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td></td>
			<td><jsp:getProperty property="tel" name="vo"/></td>
		</tr>
	</table>
</body>
</html>