<%@page import="practice.test03.model.BoardDTO"%>
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
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pw = request.getParameter("pw");
	BoardDAO dao = new BoardDAO();
	int pwOK = dao.reContentIn(boardno,subject,content,pw);
%>
<body>
<%	if(pwOK==0){ %> 
		<script type="text/javascript">
			alert("비밀번호가 다릅니다").
			href = history.go(-1);
		</script>	
<%	}else{ %>
		<script type="text/javascript">
			alert("수정완료");
			window.location="content.jsp?boardno=<%=boardno%>";
		</script>
<%	}%>
	
</body>
</html>