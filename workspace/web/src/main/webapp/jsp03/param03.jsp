<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>param 03 page</h3>
	<jsp:forward page="param04.jsp">
		<jsp:param value="admin" name="id"/>
		<jsp:param value="1234" name="pw"/>
		<jsp:param value='<%= java.net.URLEncoder.encode("관리자") %>' name="name"/>
	</jsp:forward>
	<h3>java server page</h3>
</body>
</html>