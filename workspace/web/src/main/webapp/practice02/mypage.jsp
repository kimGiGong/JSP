<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<td> <%= session.getAttribute("loginID") %>님의 마이페이지 <br>
			</td>
		</tr>
		<tr>
			<td><a href="modify.jsp"> 회원정보수정 </a></td>
		</tr>
		<tr>
			<td><a href="delete.jsp"> 회원탈퇴 </a></td>
		</tr>
	</table>
</body>
</html>