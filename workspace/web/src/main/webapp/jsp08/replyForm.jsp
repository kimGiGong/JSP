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
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	// 	replyBoard 테이블에 들어가야할 데이터를 초기화해서
	//	hidden 태그로 같이 보내기.
	int replyNum = 0, replyGrp = 1 , replyStep = 0, replyLevel = 0;
	// 	새 댓글 = replyNum = 0, 댓글의 댓글 = replyNum이 1이상
%>

<body>
	<h1 align="center"> Reply Form </h1>
	<%-- 댓글 작성란 --%>
	<form action="replyPro.jsp" method="post">
		<input type="hidden" name ="boardNum" value="<%=boardNum%>">
		<input type="hidden" name ="replyNum" value="<%=replyNum%>">
		<input type="hidden" name ="replyGrp" value="<%=replyGrp%>">
		<input type="hidden" name ="replyStep" value="<%=replyStep%>">
		<input type="hidden" name ="replyLevel" value="<%=replyLevel%>">
		<table>
			<tr>
				<td>내	용</td>
				<td><textarea rows="3" cols="40" name="reply"></textarea></td>
			</tr>
			<tr>
				<td> 작성자 </td>
				<td align="left"> <input type="text" name="replyer"> </td>
			</tr>
			<tr>
				<td colspan="2" align="left"> 
					<input type="submit" value="댓글저장"> 
					<input type="button" value="취소" onclick="window.location='content.jsp?num=<%=boardNum %>'"> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>








