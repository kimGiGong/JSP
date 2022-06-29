<%@page import="web.jsp08.model.ReplyDTO"%>
<%@page import="web.jsp08.model.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="style02.css" rel="stylesheet" type="text/css" />
</head>
<%
	//	댓글 고유 번호
	int replyNum  = Integer.parseInt(request.getParameter("replyNum"));
	String replyPageNum= request.getParameter("replyPageNum");
	String pageNum=request.getParameter("pageNum");

	//	아래 폼에 뿌려줄 기존 내용 DB가서 가져오기
	ReplyDAO dao = new ReplyDAO();
	ReplyDTO replyDTO = dao.getOneReply(replyNum);
	
%>
<body>
	<h1 align="center"> Reply Modify </h1>
	<%-- 댓글 작성란 --%>
	<form action="replyModifyPro.jsp?replyPageNum=<%=replyPageNum%>&pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name ="replyNum" value="<%=replyNum%>">
		<input type="hidden" name ="boardNum" value="<%=replyDTO.getBoardNum()%>">
		<%-- Pro에서 처리후 content로 귀환용 boardNum --%>
		<table>
			<tr>
				<td>내	용</td>
				<td><textarea rows="3" cols="40" name="reply"><%= replyDTO.getReply() %></textarea></td>
			</tr>
			<tr>
				<td> 작성자 </td>
				<td align="left"> <input type="text" name="replyer" value="<%= replyDTO.getReplyer() %>" /> </td>
			</tr>
			<tr>
				<td colspan="2" align="left"> 
					<input type="submit" value="댓글저장"> 
					<input type="button" value="취소" onclick="history.go(-1)"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


















