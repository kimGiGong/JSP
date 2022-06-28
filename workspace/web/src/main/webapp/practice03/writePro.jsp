<%@page import="java.text.SimpleDateFormat"%>
<%@page import="practice.test03.model.BoardDAO"%>
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


%>
<jsp:useBean id="article" class="practice.test03.model.BoardDTO" />
<jsp:setProperty property="*" name="article"/>

<%
	BoardDAO dao = new BoardDAO();
	dao.contentIn(article);
	response.sendRedirect("writeEnd.jsp");
	
%>


</html>