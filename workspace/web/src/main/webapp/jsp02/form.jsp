<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>form</title>
</head>
<body>
	<h1> form page </h1>
	
	<h3> get 방식 로그인 </h3>
	<form action="pro.jsp" method="get">
		id : <input type = "text" name="id">	<br>
		pw : <input type = "password" name="pw">	<br>
		<input type = "submit" value="로그인">	<br>
	</form>
	
	<h3> post 방식 로그인 </h3>
	<form action="pro.jsp" method="post">
		id : <input type = "text" name="id">	<br>
		pw : <input type = "password" name="pw">	<br>
		좋아하는 동물 : 
			<input type="checkbox" name="pet" value="dog"> 강아지  
			<input type="checkbox" name="pet" value="cat"> 고양이  
			<input type="checkbox" name="pet" value="tiget"> 호랑이 <br>  
		<input type = "submit" value="로그인">	<br>
	</form>
	
</body>
</html>