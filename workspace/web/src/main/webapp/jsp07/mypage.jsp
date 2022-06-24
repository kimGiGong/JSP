<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mypage.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css">
</head>
<%	if(session.getAttribute("memId") == null){		// 로그인 안함 %>
		<script type="text/javascript">
		alert("로그인 후 사용 가능한 페이지 입니다");
		window.location.href = "loginForm.jsp";
		</script>
<%	}else{											// 로그인했다 %>
<body>
	<br>
	<h2 align="center"> My Page </h2>
	<table>
		<tr>
			<td><a href="modifyForm.jsp">회원 정보 수정</a></td>
		</tr>
		<tr>
			<td><a href="deleteForm.jsp">회원 탈퇴</a></td>
		</tr>
		<tr>
			<td><a href="main.jsp">메인으로</a></td>
		</tr>
	</table>
<%	} %>	
</body>
</html>