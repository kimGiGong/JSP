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
	//객체 보내기
	Calendar cal = Calendar.getInstance();
	// request 내부 객체의 속성 추가 : .setAttribute("String 이름",Object 값)
	request.setAttribute("time", cal);
%>
	<jsp:forward page="timeViewer.jsp"></jsp:forward>
	
	
</body>
</html>