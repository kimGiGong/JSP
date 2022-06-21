<%@page import="practice.form.test.Testform02DTO"%>
<%@page import="java.util.List"%>
<%@page import="practice.form.test.Testform02DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<% 
		Testform02DAO dao = new Testform02DAO();
		List<Testform02DTO> list = dao.listAll();
%>
<body>
<fieldset>
	<table border="1">
		<tr>
			<td>성</td>
			<td>이름</td>
			<td>사용자이름</td>
			<td>비밀번호</td>
			<td>Email</td>
			<td>전화번호</td>
		</tr>
		
			
	<%	if(list == null){ %>
		<tr>
			<td colspan="6"> 회원 목록이 없습니다.</td>
		</tr>
	<%	}else{
			for( int i = 0 ; i<list.size() ; i++){
				Testform02DTO dto = list.get(i); %>
				
				<tr>
					<td><%= dto.getFname() %></td>
					<td><%= dto.getLname() %></td>
					<td><%= dto.getUsername() %></td>
					<td><%= dto.getPw() %></td>
					<td><%= dto.getEmail() %></td>
					<td><%= dto.getTel() %></td>
				</tr>
				
		<%	}
		}
		%> 	
		
		
	</table>
</fieldset>
</body>
</html>