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
	<h1 align="center">회원탈퇴</h1>
	<form action="deletePro.jsp">
	<table>
		<tr>
			<td>비밀번호를 입력하시면 탈퇴처리됩니다.</td>
		</tr>
		<tr>
			<td> <input type="password" name="pw" placeholder="비밀번호"> </td>
		</tr>
		<tr>
			<td colspan="2"> 
			<input type="submit" value="회원탈퇴">
			<input type="button" value="취소" onclick="window.location='mypage.jsp'"> 
			</td>
		</tr>
	</table>
	</form>
</body>
</html>