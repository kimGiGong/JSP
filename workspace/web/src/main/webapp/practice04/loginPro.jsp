<%@page import="practice.test04.model.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro.jsp</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	SignDAO dao = new SignDAO();
	int check = dao.idPwCheck(id,pw);
%>
<body>
<% 	if(check == 1){ 
		session.setAttribute("SID", id); 
		%>
		<script type="text/javascript">
			alert("로그인 성공");
			window.location="main.jsp";
		</script>
<% 	}else if(check == 0){ %>
		<script type="text/javascript">
			alert("로그인 실패 , 비밀번호를 확인하세욧!");
			history.go(-1);
		</script>
<% 	}else{ %>
		<script type="text/javascript">
			alert("로그인 실패 , 아이디와 비밀번호를 확인하세욧!");
			history.go(-1);
		</script>
<% 	} %>
</body>
</html>