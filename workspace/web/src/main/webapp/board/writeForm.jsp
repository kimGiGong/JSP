<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>writeForm.jsp</title>
	<link href="style02.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<br>
	<h1 align="center"> Write Article</h1>
	<form action="writePro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>제	목</td>
				<td> <input type="text" name="subject" /> </td>
			</tr>
			<tr>
				<td>작성자</td>
				<td> <input type="text" name="writer" /> </td>
			</tr>
			<tr>
				<td>내	용</td>
				<td> <textarea rows="15" cols="50" name="content"></textarea></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td> <input type="file" name="img" /> </td>
			</tr>
			<tr>
				<td>email</td>
				<td> <input type="text" name="email" /> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="bpw" /> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<input type="submit" value="저장" />	<%-- form에서 이벤트 등록되어있어 onclick 사용하지 않음 --%> 
					<input type="reset" value="재작성" /> 
					<input type="button" value="취소" onclick="window.location = 'list.jsp'"/> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>


































