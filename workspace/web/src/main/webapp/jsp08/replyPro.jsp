<%@page import="web.jsp08.model.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reply 댓글작성처리</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="reply" class="web.jsp08.model.ReplyDTO" />
<jsp:setProperty property="*" name="reply"/>
<% 
	ReplyDAO dao = new ReplyDAO();
	dao.insertReply(reply);
	response.sendRedirect("content.jsp?num="+reply.getBoardNum());
	
%>

<body>

</body>
</html>