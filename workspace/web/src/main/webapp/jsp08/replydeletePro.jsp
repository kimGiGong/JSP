<%@page import="web.jsp08.model.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>replydeletePro.jsp</title>
</head>
<%
	int replyNum = Integer.parseInt(request.getParameter("replyNum"));	// 	삭제할 댓글번호
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));	//	귀환용
	String pageNum=request.getParameter("pageNum");
	
	String replyPageNum= request.getParameter("replyPageNum");
	
	System.out.println(boardNum);
	ReplyDAO dao = new ReplyDAO();
	dao.deleteReply(replyNum);
	
	//	처리 후 content로 돌아가기
	response.sendRedirect("content.jsp?num="+boardNum+"&replyPageNum="+replyPageNum+"&pageNum="+pageNum);
	
%>

<body>

</body>
</html>
















