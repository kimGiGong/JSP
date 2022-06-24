<%@page import="practice.test02.model.MembertestDTO"%>
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
	String id = (String)session.getAttribute("loginID");
	
	MembertestDAO dao = new MembertestDAO();
	MembertestDTO dto = dao.getMember(id);
%>
<body>
<form action="modifyPro.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><%= dto.getId() %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td> <input type="password" name="pw" required></td>
		</tr>
		<tr>
			<td>비밀번호 재확인</td>
			<td><input type="password" name="pwconfirm" required> </td>
		</tr>
		<tr>
			<td>이메일(선택)</td>
			<td><input type="text" name="email" > </td>
		</tr>
		<tr>
			<td> 전화번호(선택)</td>
			<td><input type="text" name="tel" ></td>
		</tr>
		<tr>
			<td> 
				<input type="submit" value ="수정"> 
			</td>
		</tr>
	</table>
</form>
</body>
</html>