<%@page import="web.jsp08.model.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 수정 처리	replyModifyPro.jsp</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String replyPageNum=request.getParameter("replyPageNum");
	String pageNum=request.getParameter("pageNum");
%>
<jsp:useBean id="replyDTO" class="web.jsp08.model.ReplyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="replyDTO"/>
<%
	// DB가서 수정처리
	ReplyDAO dao = new ReplyDAO();
	dao.updateReply(replyDTO);
	response.sendRedirect("content.jsp?num="+replyDTO.getBoardNum()+"&replyPageNum="+replyPageNum+"&pageNum="+pageNum);
	
%>

<body>

</body>
</html>














