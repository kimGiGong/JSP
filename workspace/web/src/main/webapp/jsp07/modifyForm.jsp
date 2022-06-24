<%@page import="web.jsp07.model.MemberDTO"%>
<%@page import="web.jsp07.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyForm.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
	<script type="text/javascript">
		function pageCheck() {
			let inputs = document.modifyForm;
			if(!inputs.pw.value){
				alert("비밀번호를 입력하세요.")
				return false;
			}
			if(!inputs.pwch.value){
				alert("비밀번호 확인을 입력하세요.")
				return false;
			}
			if(inputs.pwch.value != inputs.pw.value){
				alert("비밀번호가 일치하지 않습니다. 다시 입력하세요.")
				return false;
			}
			if(!inputs.name.value){
				alert("이름을 입력하세요.")
				return false;
			}

		}
	</script>
<body>
<%
	//	(로그인이 된 상태로 이 페이지에 접근했다는 가정하에.....)
	//	 로그인한 회원의 정보를 모두 가져와서
	// 	-> DB 접근 id를 주고 레코드 한줄 다 가져오기.
	//	id 꺼내기
	String id =(String) session.getAttribute("memId");
	
	if(session.getAttribute("memId") == null){		// 로그인 안함 %>
		<script type="text/javascript">
		alert("로그인 후 사용 가능한 페이지 입니다");
		window.location.href = "loginForm.jsp";
		</script>
<%	}else{				// 로그인했다 
	
	MemberDAO dao = new MemberDAO();
	MemberDTO member = dao.getMember(id);	//	id주고 해당 회원의 정보 받아오기
	// 	아래 폼 양식에 뿌려주기
%>	
<br>
	<h2 align="center">회원 정보 수정</h2>
		<form action="modifyPro.jsp" method="post" name="modifyForm" onsubmit="return pageCheck()">
		<table>
			<tr>
				<td>아이디 *</td>
				<td> <%= member.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호 *</td>
				<td> <input type="password" name="pw" value="<%= member.getPw() %>"> </td>
			</tr>
			<tr>
				<td>비밀번호 확인 *</td>
				<td> <input type="password" name="pwch"> </td>
			</tr>
			<tr>
				<td>이름 *</td>
				<td> <input type="text" name="name" value="<%= member.getName() %>"> </td>
			</tr>
			<tr>
				<td>성별 *</td>
				<td> 
					<%= member.getGender()%>
				</td> 
			</tr>
			<tr>
				<td>email *</td>
				<td> 
					<% if(member.getEmail() == null){ %>
					<input type="text" name="email"> 
					<% }else{ %>
					<input type="text" name="email" value="<%= member.getEmail() %>">
					<% } %> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"> 
					<input type="reset" value="재작성"> 
					<input type="button" value="취소" onclick="window.location='main.jsp'"> 
				</td>
			</tr>
		</table>
		</form>
	</body>
<% } %>
</html>