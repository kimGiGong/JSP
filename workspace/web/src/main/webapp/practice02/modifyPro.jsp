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
%>
<jsp:useBean id="dto" class="practice.test02.model.MembertestDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
request.setCharacterEncoding("UTF-8");
MembertestDAO dao = new MembertestDAO();
dao.updateMember(dto);
%>
<body>
	<h1> 회원 정보 수정</h1>
	<table>
		<tr>
			<td>회원정보가 수정완료</td>
		</tr>
		<tr>
			<td> <button onclick="window.location='main.jsp'">메인으로</button> </td>
		</tr>
	</table>
</body>
</html>