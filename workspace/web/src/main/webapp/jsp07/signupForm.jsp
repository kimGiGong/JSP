<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signupForm.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
	<h1 align="center"> 회원가입 </h1>
	<form action="signupPro.jsp" method="post">
		<table>
			<tr>
				<td>아이디 *</td>
				<td> <input type="text" name="id"> </td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td> <input type="password" name="pw"> </td>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td> <input type="password" name="pwch"> </td>
			</tr>
			<tr>
				<td>이름 *</td>
				<td> <input type="text" name="name"> </td>
			</tr>
			<tr>
				<td>성별 *</td>
				<td> 
					남<input type="radio" name="gender" value="male" checked>
					여<input type="radio" name="gender" value="female">
				</td> 
			</tr>
			<tr>
				<td>email *</td>
				<td> <input type="text" name="email"> </td>
			</tr>
			<tr>
				<td>email *</td>
				<td colspan="2">
					<input type="submit" value="회원가입"> 
					<input type="reset" value="재작성"> 
					<input type="button" value="취소" onclick="window.location='main.jsp'"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>