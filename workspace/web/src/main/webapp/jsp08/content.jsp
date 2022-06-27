<%@page import="java.text.SimpleDateFormat"%>
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
	//	list에서 제목클릭해 넘어올때 같이 넘겨준 DB상 글 고유번호 num 파라미터 꺼내기
	int num = Integer.parseInt(request.getParameter("num"));

	// 	위 글 고유번호 주고, DB에서 글 하나에 해당하는 정보 가져옴 -> BoardDTO
	BoardDAO dao = new BoardDAO();
	BoardDTO article = dao.getArticle(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd. HH:mm");
%>
<body>
	<br>
	<h1 align="center"> Content </h1>
	<table>
		<tr>
			<td colspan="2"><%= article.getSubject() %></td>                       
		</tr>
		<tr>
			<td colspan="2"> <textarea rows="15" cols="70" disabled> <%= article.getContent() %> </textarea></td>
		</tr>
		<tr>
			<td> posted by
			<a href="<%= article.getEmail() %>"> <%= article.getWriter() %></a> 
			at <%= sdf.format(article.getReg()) %></td>
			<td><%=  article.getReadcount() %> view</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="window.location='modifyForm.jsp'"> 수정 </button>
				<button onclick="window.location='deleteForm.jsp'"> 삭제 </button>
				<button onclick="window.location='list.jsp'"> 리스트</button>
			</td>
		</tr>
	</table>

</body>
</html>