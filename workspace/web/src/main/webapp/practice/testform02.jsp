<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>계정만들기</h1>
<form action="testpro02.jsp" method="post">
	<fieldset>
	<legend>회원가입</legend>
		<table>
			<tr>
				<td>성</td>
				<td>이름</td>
			</tr>
			<tr>
				<td><input type="text" name="fname" required placeholder="FirstName"></td>
				<td><input type="text" name="lname" required placeholder="LastName"></td>
			</tr>	
			<tr>
				<td>사용자 이름</td>
			</tr>
			<tr>
				<td><input type="text" name="username" required placeholder="UserName"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>확인</td>
			</tr>
			<tr>
				<td><input type="password" name="pw" required placeholder="PassWord"></td>
				<td><input type="password" name="pwconfrim" required placeholder="Confirm"></td>
			</tr>
			<tr>
				<td>전화번호</td>
			</tr>
			<tr>
				<td><input type="text" name="tel" required placeholder="tel Number"></td>
			</tr>
			<tr>
				<td><input type="submit" value="가입"></td>
			</tr>
		</table>
	</fieldset>
</form>


</body>
</html>