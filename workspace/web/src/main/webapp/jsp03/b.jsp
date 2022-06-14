<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>BBB</h1>
	
	<% 
		System.out.println("BBBBBB");
		// response.sendRedirect("c.jsp");
	%>
<%-- 	<jsp:forward page="c.jsp"></jsp:forward>   --%>

	<jsp:forward page="c.jsp">
		<jsp:param value="test" name="id"/>	
	</jsp:forward>
</body>
</html>