<%@page import="web.jsp08.model.BoardDAO"%>
<%@page import="web.jsp08.model.BoardDTO"%>
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
	//	content.jsp 를 통해 현재페이지로 이동해왔고, 이때 글 고유번호 파라미터로 가져옴
	int num = Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = new BoardDAO();
	BoardDTO article = dao.getArticle(num);
%>
<body>
	<br>
	<h1 align="center"> Modify Article</h1>
	<form action="modifyPro.jsp" method="post">
		<%-- 글 고유번호 숨겨서 보내기 --%>
		<input type="hidden" name="num" value="<%= num %>">
		<table>
			<tr>
				<td>제	목</td>
				<td> <input type="text" name="subject" value="<%= article.getSubject() %>" /> </td>
			</tr>
			<tr>
				<td>작성자</td>
				<td> <input type="text" name="writer" value="<%= article.getWriter() %>" /> </td>
			</tr>
			<tr>
				<td>내	용</td>
				<td> <textarea rows="15" cols="50" name="content"><%= article.getContent() %></textarea></td>
			</tr>
			<tr>
				<td>email</td>
				<td> <input type="text" name="email" value="<%= article.getEmail() %>" /> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="pw" /> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<input type="submit" value="수정" />	<%-- form에서 이벤트 등록되어있어 onclick 사용하지 않음 --%> 
					<input type="reset" value="재작성" /> 
					<input type="button" value="취소" onclick="window.location = 'content.jsp'"/> 
				</td>
			</tr>
		</table>
	</form>

	update board set subject=?, writer=?, content=?, email=? where num=?
</body>
</html>



