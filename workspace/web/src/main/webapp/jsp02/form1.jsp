<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form1</title>
</head>
<body>
	<h2> form1 </h2>
	<%-- 이름, 나이, 주소 입력하는 폼 작성하고,
		pro1.jsp페이지로 데이터 넘겨, 넘어간 데이터 화면에 출력해보세요.
	--%>
	
	 <form action="pro1.jsp" method="post">
	 	이름 : <input type="text" name="name" required>
	 	나이 : <input type="text" name="age" required>
	 	주소 : <input type="text" name="address" required>
	 	<input type="submit" value="전송!">
	 </form>
</body>
</html>