<%@page import="practice.test03.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	String pw = request.getParameter("pw");
	BoardDAO dao = new BoardDAO();
	int deleteOK = dao.deleteOne(boardno,pw);
	
%>
<body>
<%	if(deleteOK==0){ %>
		<script type="text/javascript">
			alert("비밀번호가 다릅니다").
			href = history.go(-1);
		</script>	
<%	}else{ %>
		<script type="text/javascript">
			alert("삭제완료");
			window.location="listAll.jsp";
		</script>
<%	} %>

</body>
</html>