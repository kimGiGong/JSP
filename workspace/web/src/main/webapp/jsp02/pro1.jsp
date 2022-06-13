<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>profile1</title>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String address = request.getParameter("address");
	
	// 파라미터 이름 목록
	Enumeration<String> enu = request.getParameterNames();
	while(enu.hasMoreElements()){
		String paraname = enu.nextElement();
		out.println(paraname);
	}
	
	%>
</head>
<body>
	
	
	<h3>이름 : <%= name %></h3>
	<h3>나이 : <%= age %></h3>
	<h3>주소 : <%= address %></h3>
</body>
</html>