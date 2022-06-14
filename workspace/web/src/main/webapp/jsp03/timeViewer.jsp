<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		// 객체 꺼내기 : Object  getAttribute("이름"); 
		Calendar cal = (Calendar)request.getAttribute("time");
%>
	<h1>timeviewer</h1>
	
		현재시간 :	<%= cal.get(Calendar.HOUR) %>시
					<%= cal.get(Calendar.MINUTE) %>분
					<%= cal.get(Calendar.SECOND) %>초
					
					
</body>
</html>