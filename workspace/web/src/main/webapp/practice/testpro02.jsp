<%@page import="practice.form.test.Testform02DAO"%>
<%@page import="java.beans.JavaBean"%>
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
String pwconfirm = request.getParameter("pwconfrim");
if(!pw.equals(pwconfirm)){ %>
	<script type="text/javascript">
	alert('비밀번호 불일치');
	location.href="testform02.jsp"
	</script><%
}else{

%>
<%-- use 이다 java ㄴㄴ  --%>
<jsp:useBean id="dto" class="practice.form.test.Testform02DTO" />
<jsp:setProperty property="*" name="dto"/>
<%
Testform02DAO dao = new Testform02DAO();
dao.insertSignForm(dto);
// DAO 생성하고 메소드 실행
}%>
<body>

</body>
</html>