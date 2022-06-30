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
	String boardno = request.getParameter("boardno");
%>
<body>
	<form action="" method="post">
		<table>
			<tr>
				<td> <textarea rows="40" cols="20" name="comment"></textarea> </td>			
			</tr>
			<tr>
				<td></td>			
			</tr>
			<tr>
				<td></td>			
				<td></td>			
			</tr>
		</table>
	</form>
</body>
</html>