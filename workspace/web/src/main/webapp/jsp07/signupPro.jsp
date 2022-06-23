<%@page import="web.jsp07.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupPro.jsp</title>
</head>

<% request.setCharacterEncoding("UTF-8");	//인코딩 처리 %>

<jsp:useBean id="dto" class="web.jsp07.model.MemberDTO" /> <%-- dto 객체생성 --%>
<jsp:setProperty property="*" name="dto"/>			<%-- 파라미터 dto에 담기 --%>
	<%
	MemberDAO dao = new MemberDAO();
	dao.addMember(dto); //	회원 가입 처리 메서드 호출
	
	// 메인으로 이동
	response.sendRedirect("main.jsp");
	%>

<body>
	
	
</body>
</html>