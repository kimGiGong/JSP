<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>deleteForm.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
	<script type="text/javascript">
		function pageCheck() {
			let input = document.deleteForm;
			if(!input.pw.value){
				alert("비밀번호를 입력하세요")
				return false;
			}
		}
	</script>
	<%	if(session.getAttribute("memId") == null){	%>
		<script type="text/javascript">
			alert("로그인 상태가 아닙니다.");
			window.location.href = "loginForm.jsp";
		</script>	
	<%	}else{ %>
<body>
	<br>
	<h2 align="center"> 회원 탈퇴 </h2>
	<form action="deletePro.jsp" method="post" name="deleteForm" onsubmit="return pageCheck()">
		<table>
			<tr>
				<td> <input type="password" name="pw" />  </td>			
			</tr>
			<tr >
				<td > 
					<input type="submit" value="탈퇴" />  		
					<input type="button" value="취소" onclick="window.location='main.jsp'" /> 	
				</td>
			</tr>
		</table>
	</form>

</body>
<%} %>
</html>