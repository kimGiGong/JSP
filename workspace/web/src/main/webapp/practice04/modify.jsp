<%@page import="practice.test04.model.SignDTO"%>
<%@page import="practice.test04.model.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="../jsp10/style.css" rel="stylesheet" type="text/css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("SID");
	SignDAO dao = new SignDAO();
	SignDTO dto = dao.getMember(id);
	System.out.println(dto.getBirth());
	if(dto.getBirth()==null){
		dto.setBirth("");
	}
%>
	
<body>
	<br>
	<h1 align="center">회원정보수정</h1>
	<form action="modifyPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>이름</td>
				<td colspan="4"> <%= dto.getName() %> </td>
			</tr>
			<tr>
				<td>아이디</td>
				<td colspan="4"><%= dto.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td colspan="4"><input type="password"  name ="pw" value="<%= dto.getPw() %>"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td colspan="4"> <input type="text" name ="phone" value="<%= dto.getPhone() %>" placeholder="-없이 입력"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td colspan="4"> 
					<input type="text" name = "birth" value="<%=dto.getBirth() %>" 
					placeholder="YYYY/MM/DD /없이 입력(선택사항)"> 
				</td>
			</tr>
			<tr>
				<td>프로필 사진</td>
				<td> <img src="/web/save/<%= dto.getProfile() %>" width="100"> </td>
				<td colspan="4"> <input type="file" name ="profile"></td>
			</tr>
			
			<tr>
				<td colspan="5"> 
				<input type="submit" value="수정">
				<input type="button" value="취소" onclick="window.location='mypage.jsp'"> 
				</td>
			</tr>
		</table>
	</form>

</body>
</html>