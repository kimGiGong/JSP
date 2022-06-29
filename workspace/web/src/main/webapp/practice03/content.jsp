<%@page import="practice.test03.model.BoardDTO"%>
<%@page import="practice.test03.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../jsp08/style02.css" rel="stylesheet" type="text/css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.contentOut(boardno);
%>
<body>
<table>
	<tr>
		<td colspan="5" align="right"> 
			<button onclick="window.location='write.jsp'">글쓰기</button> 
		</td>
	</tr>
	<tr>
		<td> <div align="left"> 작성자 : <%= dto.getWriter() %></div></td>
		<td> <div align="right"> <%= dto.getReg() %> 조회수 <%= dto.getReadcount() %></div></td>
	</tr>	
	<tr >
		<td colspan="2" width="80" height="20"> <div> <%= dto.getSubject() %></div></td>
	</tr>	
	<tr>
		<td colspan="2" width="350" height="150"> <p> <%= dto.getContent() %> </p> </td>
	</tr>	
	<tr>
		<td colspan="4">
			<div align="left"> <button onclick="window.location='listAll.jsp'">목록</button></div>
			<div align="right"> 
				<button onclick="window.location='modify.jsp?boardno=<%=boardno %>'">수정</button>
				<form action="delete.jsp?boardno=<%=boardno%>" method="post">
					<input type="text" name=pw placeholder="삭제 : 비밀번호입력"/>
					<input type="submit" value="삭제" ></button>
				</form>
			</div>
		</td>
	</tr>
</table >
</body>
</html>