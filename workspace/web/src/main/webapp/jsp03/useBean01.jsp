<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean01</title>
</head>
<body>
	<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
	
	<h2>date : <%= date %></h2>
	
	
</body>
</html>