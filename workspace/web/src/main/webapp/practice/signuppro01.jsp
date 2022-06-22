<%@page import="practice.form.test.Signuptest01DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signuppro01.jsp</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	String username = request.getParameter("username");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	Signuptest01DAO dao = new Signuptest01DAO();
	boolean logincheck = dao.loginCheck(username, pw);
	String login = "0";
	if(logincheck){
		session.setAttribute("SessionLogin", username);
		if(auto != null){
			Cookie cookieUserName = new Cookie("username",username);
			Cookie cookiePw = new Cookie("pw",pw);
			Cookie cookieAuto = new Cookie("auto",auto);
			cookieUserName.setMaxAge(60*60*24*14);
			cookiePw.setMaxAge(60*60*24*14);
			cookieAuto.setMaxAge(60*60*24*14);
			response.addCookie(cookieUserName);
			response.addCookie(cookiePw);
			response.addCookie(cookieAuto);
		}
		response.sendRedirect("signupmain01.jsp");
		
	}else{ %>
		<script type="text/javascript">
		alert("사용자 이름 또는 비밀번호 가 다릅니다");
		location.href="signupform01.jsp";
		</script>
<%	}
%>
<body>


</body>
</html>