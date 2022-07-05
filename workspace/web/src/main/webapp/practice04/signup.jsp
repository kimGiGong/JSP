<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>signup</title>
	<link href="../jsp10/style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<br>
	<h1 align="center">회원가입</h1>
	<form action="signupPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>이름 *</td>
				<td colspan="4"> <input type="text" name = "name"> </td>
			</tr>
			<tr>
				<td>아이디 * </td>
				<td colspan="4"><input type="text" name = "id"></td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td colspan="4"><input type="password"  name ="pw" ></td>
			</tr>
			<tr>
				<td>휴대폰 *</td>
				<td colspan="4"> <input type="text" name ="phone" placeholder="-없이 입력"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="4"> <input type="text" name = "birth" placeholder="YYYY/MM/DD /없이 입력(선택사항)"> </td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td colspan="4"> <input type="file" name ="profile"></td>
			</tr>
			
			<tr>
				<td colspan="5"> 
				<input type="submit" value="가입">
				<input type="button" value="취소" onclick="window.location='main.jsp'"> 
				</td>
			</tr>
		</table>
	</form>

</body>
</html>