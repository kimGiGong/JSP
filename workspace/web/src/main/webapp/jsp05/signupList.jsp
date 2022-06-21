<%@page import="web.jsp05.model.SignupDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp05.model.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupList.jsp</title>
</head>
<%
	// DB에서 회원 목록 가져오기
	SignupDAO dao = new SignupDAO();	// DAO 사용위해 객체 생성
	//	회원목록 가져오는 메서드 호출해서 결과 받기
	List<SignupDTO> list = dao.getAllMembers();
%>
<body>
	<h2>회원 목록 페이지</h2>
	<table border="1">
		<tr>
			<td>Id</td>
			<td>Pw</td>
			<td>Name</td>
			<td>Email</td>
			<td>Gender</td>
			<td>Hobies</td>
			<td>Job</td>
			<td>Bio</td>
			<td>Reg</td>
		</tr>
		<%
		if (list == null){ %>
			<tr>
				<td colspan="9"> 회원 목록이 없습니다.</td>
			</tr>
	<%	}else{
			for (int i = 0; i<list.size(); i++){
				SignupDTO dto = list.get(i);
			%>
			
			<tr>
				<td><%= dto.getId() %></td>
				<td><%= dto.getPw() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getEmail() %></td>
				<td><%= dto.getGender() %></td>
				<td>
				<%= dto.getMusic() %>,<%= dto.getSports() %>,
				<%= dto.getTravel() %>,<%= dto.getMovies() %>
				</td>
				<td><%= dto.getJob() %></td>
				<td><%= dto.getBio() %></td>
				<td><%= dto.getReg() %></td>
				
			</tr>
	<%		}
		}
		%>
	</table>
</body>
</html>