<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>form</title>
</head>
<body>
<div>
	<a href="main.jsp"><img src="../jsp07/img/img.jpg" width="200px"></a>
</div>
<fieldset>
	<legend>회원가입</legend>
	<form action="formPro.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
			</tr>
			<tr>
				<td> <input type="text" name="id" required> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
			</tr>
			<tr>
				<td> <input type="password" name="pw" required> </td>
			</tr>
			<tr>
				<td>비밀번호 재확인</td>
			</tr>
			<tr>
				<td> <input type="password" name="pwconfirm" required> </td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td> <input type="text" name="name" required> </td>
			</tr>
			<tr>
				<td>생년월일</td>
			</tr>
			<tr>
				<td> 
					<input type="text" name="birthyear" required> 
					<select name="birthmonth" required>
						
					<%	int i=0;
						for(i = 1 ;i < 13 ;i++){
					%>	<option value=<%= i %> /><%= i %>
					<% }%>	
					</select>
					<input type="text" name="birthday" required> 
				</td>
			</tr>
			<tr>
				<td>성별</td>
			</tr>
			<tr>
				<td> 
					<select name="gender" required>
						<option value="남자" />남자
						<option value="여자" />여자
						<option />선택 안함
					</select>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td> <input type="text" name="email" placeholder="선택입력">  </td>
			</tr>
			<tr>
				<td>휴대전화</td>
			</tr>
			<tr>
				<td> 
					<input type="text" name="tel" required placeholder="전화번호 입력"> 
				</td>
			</tr>
			<tr>
				<td> 
					<input type="submit" value = "가입"> 
				</td>
			</tr>
		</table>
	</form>
</fieldset>
</body>
</html>