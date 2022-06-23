<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
</head>

<body>
<fieldset>
	<legend>로그인</legend>
	<form action="loginPro.jsp" method="post">
		<table>
			<tr>
				<td>아이디 <input type="text" name="id" required> </td>
			</tr>
			<tr>
				<td> 비밀번호 <input type="password" name="pw" required> </td>
			</tr>
			<tr>
				<td> 
					자동로그인<input type="checkbox" name="auto" value="1"> 
				</td>
			</tr>
			<tr>
				<td> 
					<input type="submit" value="로그인"> 
				</td>
			</tr>
		</table>
	</form>
</fieldset>

</body>
</html>