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
String pw = request.getParameter("pw");
String pwconfirm = request.getParameter("pwconfirm");
if(pw.equals(pwconfirm)){
	

%>
<jsp:useBean id="dto" class="practice.test02.model.MembertestDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto" />
<% 
MembertestDAO dao = new MembertestDAO();
dao.addMember(dto);
System.out.print(dto.getBirth());

response.sendRedirect("main.jsp");
}else{ %>
	<script type="text/javascript">
		alert("비밀번호가 일치 하지 않습니다");
		window.location.href="form.jsp";
	</script>
<%}
%>
<body>


</body>
</html>