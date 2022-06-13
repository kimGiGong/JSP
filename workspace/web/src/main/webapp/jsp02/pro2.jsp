<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>profile2</title>
</head>
<%-- 브라우저에서 타이핑해서 요청 (form 안타고)
		local...../web/jsp02/pro2.jsp?username=hello&pw=1234&test=10010
--%>

<% 
	request.setCharacterEncoding("UTF-8");

	String username = request.getParameter("username");
	String pw = request.getParameter("pw");
	String test = request.getParameter("test");
	
	System.out.println(username);
	System.out.println(pw);
	System.out.println(test);
%>

<body>
	<h2> pro2 page</h2>
	
	<h3> username : <%= username %></h3>
	<h3> password : <%= pw %></h3>
	<h3> test : <%= test %></h3>
</body>
</html>