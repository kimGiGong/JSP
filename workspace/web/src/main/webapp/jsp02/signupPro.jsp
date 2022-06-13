<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	
	String job = request.getParameter("job");
	String bio = request.getParameter("bio");
	
	//	넘어온 데이터 출력확인
	System.out.println("ID : "+id);
	System.out.println("Password : "+pw);
	System.out.println("Name : "+name);
	System.out.println("E-mail : "+email);
	System.out.println("Gender : "+gender);
	if(hobbies != null){
		for(String s : hobbies){
			System.out.println("Hobbies : "+s);
		}
	}
	System.out.println("Job : "+job);
	System.out.println("Bio : "+bio);
	%>
	<h1>회원가입 완료</h1>
	<form action="signupPro.jsp" method="post">
		<table>
			<tr>
				<td>ID</td>
				<td><%= id  %></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><%= pw  %></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><%= name  %> </td>
			</tr>
			<tr>
				<td>E-mail</td>
				<td><%= email  %></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
					<%= gender  %>
				</td>
			</tr>	
			<tr>
				<td>hobbies</td>
				<td>
				<%
					if(hobbies != null){
						for(int i=0; i< hobbies.length; i++){ %>
						<%= hobbies[i] %>
				<%		}
					}
				%>
				</td>
			</tr>
			<tr>
				<td>Job</td>
				<td>
					<%= job%>
				</td>
			</tr>
			<tr>
				<td>Bio</td>
				<td>
					<textarea rows="5" cols="22" name="bio"><%= bio %></textarea>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>