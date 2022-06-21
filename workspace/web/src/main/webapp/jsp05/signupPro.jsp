<%@page import="web.jsp05.model.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	//	넘어온 데이터 추출
	//SignupDTO dto = new SignupDTO(); 			// 액션태그로 대체함
	//dto.setId(request.getParameter("id"));	//	getProperty로 대체함 
%>
<jsp:useBean id="dto" class="web.jsp05.model.SignupDTO" />	<%-- useBean사용한 dto객체 생성 --%>
<jsp:setProperty property="*" name="dto"/>	<%-- getProperty 사용한 "*" 꺼내오기 --%>
<%
	// DB 접속해서 레코드 한줄 insert -> DAO (DB관련 처리 전담 자바 클래스)
	SignupDAO dao = new SignupDAO();
	dao.insertMember(dto);
%>
<body>

</body>
</html>












