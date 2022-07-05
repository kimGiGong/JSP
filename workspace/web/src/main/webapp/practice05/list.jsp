<%@page import="practice.test05.model.ImgListDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>List</title>
	<link href="../jsp10/style.css" rel="stylesheet" type="text/css">

</head>
<% 
	request.setCharacterEncoding("UTF-8");
	ImgListDAO dao = new ImgListDAO();
	List list = dao.getAllList;

%>
<body>
	<br> <h1 align="center"> 게시글 </h1>
	<table>
		<tr>
			<td align="right" colspan="5"> <button onclick="window.location='writeForm.jsp'">글쓰기</button> </td>
		</tr> 
		<tr>
			<td>글번호</td>
			<td>제	목</td>
			<td>작성자</td>
			<td>작성시간</td>
			<td>조회수</td>
		</tr>
	<% 	for(int i =0 ; i<list.size() ; i++ ){ %>
			<tr>
				<td>글번호</td>
				<td>제	목</td>
				<td>작성자</td>
				<td>작성시간</td>
				<td>조회수</td>
			</tr>
	<% 	} %>
	</table>
</body>
</html>