<%@page import="practice.test02.model.MembertestDAO"%>
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
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String auto = request.getParameter("auto");

Cookie [] cs = request.getCookies();
if(cs != null){
	for (Cookie c : cs){
		if(c.getName().equals("autoID")) id = c.getValue();
		if(c.getName().equals("autoPW")) pw = c.getValue();
//		if(c.getName().equals("autoLogin")) auto = c.getValue();
	}
}

MembertestDAO dao = new MembertestDAO();
int login = dao.login(id, pw);
System.out.println(login);
if(login!=0){
	if(auto != null){
		Cookie cookie1 = new Cookie("autoID",id);
		Cookie cookie2 = new Cookie("autoPW",pw);
		Cookie cookie3 = new Cookie("autoLogin",auto);
		cookie1.setMaxAge(60*60);
		cookie2.setMaxAge(60*60);
		cookie3.setMaxAge(60*60);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
		response.addCookie(cookie3);
	}
	
	session.setAttribute("loginID", id);
	response.sendRedirect("main.jsp");
}else{ %>
	<script type="text/javascript">
	alert("아이디 또는 비밀번호가 다릅니다.");
	window.location="login.jsp";
	</script>
<%}
%>

<body>

</body>
</html>