<%@page import="web.jsp03.test.SignupVO"%>
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
	/*
	vo.setId(request.getParameter("id"));
	vo.setPw(request.getParameter("pw"));
	vo.setName(request.getParameter("name"));
	vo.setEmail(request.getParameter("email"));
	vo.setGender(request.getParameter("gender"));
	vo.setMusic(request.getParameter("music"));
	vo.setSports(request.getParameter("sports"));
	vo.setMovies(request.getParameter("movies"));
	vo.setTravel(request.getParameter("travel"));
	vo.setJob(request.getParameter("job"));
	vo.setBio(request.getParameter("bio"));
	*/
 %>
<jsp:useBean id="vo" class="web.jsp03.test.SignupVO" />
<jsp:setProperty property="*" name="vo"/>
<%-- vo의 모든(*) 변수에 해당하는 set메서드를 호출해서 넘어온 파라미터를 채워줌 --%>		
 
<body>
	<h1>signupPro</h1>
	<table>
		<tr>
			<td>ID *</td>
			<td> <jsp:getProperty property="id" name="vo"/> </td> 
		</tr>
		<tr>
			<td>Password *</td>
			<td><jsp:getProperty property="pw" name="vo"/></td>
		</tr>
		<tr>
			<td>Name *</td>
			<td><jsp:getProperty property="name" name="vo"/></td>
		</tr>
		<tr>
			<td>E-mail</td>
			<td><jsp:getProperty property="email" name="vo"/></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>
				<jsp:getProperty property="gender" name="vo"/>
			</td>
		</tr>	
		<tr>
			<td>hobbies</td>
			<td>
				<jsp:getProperty property="music" name="vo"/>,<jsp:getProperty property="sports" name="vo"/>,
				<jsp:getProperty property="travel" name="vo"/>,<jsp:getProperty property="movies" name="vo"/>			
			</td>
		</tr>
		<tr>
			<td>Job</td>
			<td>
				<jsp:getProperty property="job" name="vo"/>
			</td>
		</tr>
		<tr>
			<td>Bio</td>
			<td>
				<textarea rows="5" cols="22" name="bio"><jsp:getProperty property="bio" name="vo"/></textarea>
			</td>
		</tr>
	</table>
</body>
</html>