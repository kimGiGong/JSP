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
	<form action="modifyPro.jsp?boardno=<%= boardno %>" method="post">
		<table>
			<tr>
				<td colspan="2"> <input style="width: 98%" type="text" name="subject" value="<%= dto.getSubject() %>" ></td>
			</tr> 
			<tr>
				<td colspan="2"> <textarea rows="30" cols="100" name="content"><%= dto.getContent() %></textarea> </td>
			</tr> 
			<tr>
				<td> <input style="width: 50%" type="text" name="pw" placeholder="비밀번호"></td>
			</tr> 
			<tr>
				<td colspan="4"> 
					<div align="right"> 
						<input  type="submit" value="수정" > 
						<input type="button" value="취소" onclick="content.jsp?boardno=<%=boardno%>"> 
					</div> 
				</td>
			</tr> 
			
			
		</table>
	</form>
</body>
</html>