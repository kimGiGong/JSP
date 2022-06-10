<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.Date"
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
</head>
<body>
	<h1> test 01 page </h1>
	
	<%-- 버전 확인 --%>
	서버 :  <%= application.getServerInfo() %> <br>
	서블릿 : <%= application.getMajorVersion() %>. <%= application.getMinorVersion() %> <br>	
	JSP : <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
	
	
	
</body>
</html>