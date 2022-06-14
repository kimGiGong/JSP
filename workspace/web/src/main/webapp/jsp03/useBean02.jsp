<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean02</title>
</head>
<body>

	<jsp:useBean id="person" class="web.jsp03.test.Bean" />
	<%
		System.out.println(person);	// 객체 주소값	(콘솔 출력)
		person.setId("java");
		person.setPw("1234");
	
	
	%>
	
	<%-- 저장 잘되었는지 출력 --%>
	person : <%= person %>			<%-- HTML 출력 --%>
	아이디 : <%= person.getId() %>
	비밀번호 : <%= person.getPw() %>

</body>
</html>