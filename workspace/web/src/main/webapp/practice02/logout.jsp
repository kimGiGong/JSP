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
session.invalidate();

Cookie [] cs = request.getCookies();
if(cs != null){
	for(Cookie c : cs){
		if(c.getName().equals("autoID")||c.getName().equals("autoPW")||c.getName().equals("autoLogin")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
}
response.sendRedirect("main.jsp");
%>
</body>
</html>