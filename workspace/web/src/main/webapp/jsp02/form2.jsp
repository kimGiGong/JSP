<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> form2 </title>
</head>
<body>
	
	<h2> form2</h2>
	<%-- 폼태그로 전송할 때!!!
		method="get"은 action값에  ?로 파라미지터 전송 불가
		method="post"일 경우 action값에  ?로 파라미지터 전송 가능,
		내부 input 태그는 post로 전달
	 --%>
	<form action="pro2.jsp?test=10" method="get">
			username : <input type="text" name="username"> <br>
			password : <input type="passwor" name="pw"> <br>
			<input type="submit" value="전송!"> <br>
	</form>
</body>
</html>