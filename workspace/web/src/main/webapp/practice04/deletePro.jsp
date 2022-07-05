<%@page import="practice.test04.model.SignDAO"%>
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
	String pw = request.getParameter("pw");
	String id = (String) session.getAttribute("SID");
	
	SignDAO dao = new SignDAO();
	int result = dao.idPwCheck(id, pw);
%>
<body>
<% 	if(result == 1){ 
		dao.deleteMember(id);
		session.invalidate();
		%>
		<script type="text/javascript">
			alert("회원 탈퇴 했습니다.");
			window.location='main.jsp'
		</script>
<% 	}else{ %>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다");
			window.location='delete.jsp'
		</script>
<% 	} %>
</body>
</html>