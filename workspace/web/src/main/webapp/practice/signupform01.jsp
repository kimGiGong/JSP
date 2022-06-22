<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupform01.jsp</title>
</head>
<body>
<fieldset>
<legend>Login</legend>
<form action="signuppro01.jsp" method="post">
	<table>
		<tr>
			<td>사용자이름 : <input type="text" name="username" /></td>
		</tr>
		<tr>
			<td>PW : <input type="password" name="pw" /></td>
		</tr>
		<tr>
			<td>자동로그인 : <input type="checkbox" name="auto" value="1"> 
			<input type="submit" value="로그인"></td>
		</tr>	 
	</table>
</form>
</fieldset>
</body>
</html>