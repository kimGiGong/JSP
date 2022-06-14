<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>param01</title>
</head>
<body>
	<h1>param 01 page</h1>
	
	<%-- param02 로 제어가 옮겨갈때 파라미터 들고가서 실행하고,
		결과를 여기다 다시 붙히는것 --%>
		<jsp:include page="param02.jsp">
			<jsp:param  name="date" value="<%= new java.util.Date() %>" />
		</jsp:include>
	<h3> Java Server Page</h3>
</body>
</html>