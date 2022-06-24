<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginForm.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		//	유효성 검사
		function checkField(){
			let inputs = document.loginForm;
			if(!inputs.id.value){
				alert("아이디를 입력해주세요.");
				return false;
			}
			if(!inputs.pw.value){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
		}
	</script>
</head>
<%	if(session.getAttribute("memId") != null){	// 로그인시 -> 로그인 불가능 %>
		<script type="text/javascript">
			alert("이미 로그인된 상태입니다...");
			window.location.href = "main.jsp";
		</script>	
<%	}else{	// 비로그인시 -> 로그인 가능 %>
<body>	
	<br>
	<h2 align="center"> 로그인 </h2>
	<form action="loginPro.jsp" method="post" name="loginForm" onsubmit="return checkField()">
		<table>
			<tr>
				<td>아이디</td>			
				<td> <input type="text" name="id"> </td>			
			</tr>
			<tr>
				<td>비밀번호</td>			
				<td> <input type="password" name="pw"> </td>			
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="auto" value="1">자동로그인</td>			
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="window.location='signupForm.jsp'">
				</td>			
			</tr>
		</table>
	</form>
</body>
<% } %>
</html>