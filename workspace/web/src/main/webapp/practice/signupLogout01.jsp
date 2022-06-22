<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
session.removeAttribute("SessionID");

Cookie [] coos = request.getCookies();
for(Cookie c : coos){
	if(c.getName().equals("username")){
		c.setMaxAge(0);			
		response.addCookie(c);	
	}
	if(c.getName().equals("pw")){
		c.setMaxAge(0);			
		response.addCookie(c);	
	}
	if(c.getName().equals("auto")){
		c.setMaxAge(0);			
		response.addCookie(c);	
	}
}
response.sendRedirect("signupmain01.jsp");
%>
<body>

</body>
</html>