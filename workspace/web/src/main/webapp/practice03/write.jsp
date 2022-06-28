<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../jsp08/style02.css" rel="stylesheet" type="text/css">
</head>
<% request.setCharacterEncoding("UTF-8"); %>
<body>
	<form action="writePro.jsp" method="post">
		<h1 align="center"> 글쓰기 </h1>
		<table>
			<tr>
				<td> <input style="width: 50%" type="text" name="writer" placeholder="닉네임">  </td>
				<td> <input style="width: 50%" type="text" name="pw" placeholder="비밀번호">  </td>
			</tr> 
			<tr>
				<td colspan="2"> <input style="width: 100%" type="text" name="subject" placeholder="제목을 입력하셈">  </td>
			</tr> 
			<tr>
				<td colspan="2"> <textarea rows="30" cols="100" name="content" placeholder="내용을 입력하셈"></textarea> </td>
			</tr> 
			<tr>
				<td colspan="4"> 
					<div align="left">
						<input type="button" value="목록" onclick="window.location='listAll.jsp'"> 
					</div>	
					<div align="right"> 
						<input  type="submit" value="저장" > 
						<input type="button" value="취소" onclick="history.go(-1)"> 
					</div> 
				</td>
			</tr> 
			
			
		</table>
	</form>
</body>
</html>