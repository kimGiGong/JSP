<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pro</title>
</head>

<%-- request객체에서 넘어온 데이터 꺼내기 --%>
<%

	//	post 방식 인코딩 처리 : post방식으로 요청되어 넘어오는 파라미터값이 한글일경우		
	//							인코딩처리가 필요함.
	//							파라미터를 꺼내기 전에 미리 한번 
	//							아래와 같이 인코딩 세팅을 먼저해줘야한다
	request.setCharacterEncoding("UTF-8");

	//	http://localhost:8080/web/jsp02/pro.jsp?id=java&id=1234
	//			?물음표 뒤
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//	같은 이름의 파라미터명인 값이 여러개 넘어왔을 경우
	String[] pets = request.getParameterValues("pet");
	
	//	화면에 출력
//	out.println("id : "+ id +"<br>");
//	out.println("pw : "+ pw +"<br>");
/*	for(int i=0; i<pets.length; i++){
		out.println("pet : "+pets[i]); 
	} */
%>

<body>
	<h1> pro page </h1>
	<h3> id : <%= id %></h3>
	<h3> pw : <%= pw %></h3>
<% 	for(int i=0; i<pets.length; i++){
	%><h3> Pet : <%= pets[i] %></h3><%  
	}%>
	get방식은 주소창에 데이터가가 나온다 <br>
	post방식은 데이터를 숨겨서 보내기때문에 안보인다
	
</body>
</html>