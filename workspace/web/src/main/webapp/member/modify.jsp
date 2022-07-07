<%@page import="web.jsp10.model.ImgSignupDTO"%>
<%@page import="web.jsp10.model.ImgSignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>mypage.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" />
</head>
<%
	if(session.getAttribute("memId")==null){ %>
		<script type="text/javascript">
			alert("로그인후 이용해주세요");
			window.location="main.jsp";
		</script>
<%	}else{ 
		//	로그인 했을때만 접근가능한 페이지
		String id = (String)session.getAttribute("memId");
	
		ImgSignupDAO dao = new ImgSignupDAO();
		ImgSignupDTO member =  dao.getMember(id);

%>
<body>
	<br>
	<h1 align="center"> 회원 정보 수정</h1>
	<form action="modifyPro.jsp" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>아이디</td>
				<td><%= member.getId() %></td>
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
				<td>이름</td>
				<td> <%= member.getName() %> </td>
			</tr>
			<tr>
				<td>성별</td>
				<td> 
					<%= member.getGender() %>
				</td> 
			</tr>
			<tr>
				<td>email</td>
				<td> 
				<%	if(member.getEmail()==null){ %>
						<input type="text" name="email"> 
				<%	}else{ //	DB에 사용자 email이 있는 상태	%>	
						<input type="text" name="email" value="<%= member.getEmail() %>">
				<%	} %>
				</td>
			</tr>
			<tr>
				<td>photo</td>
				<td><%	// 	화면에 이미지 띄우기		
					if(member.getPhoto()==null || member.getPhoto()==(null)){ //	DB에 사용자 photo가 없는경우	%>
						<img src="/web/save/default.png" width="150">
						<input type="hidden" name="exPhoto" value="img/default.png">
				<%	}else{	//	DB에 사용자 photo가 있는 상태 %>
						<img src="/web/save/<%= member.getPhoto()%>" width="150">
						<%-- 히든으로 기존에 사용자가 등록했던 이미지 파일명 숨겨서 보내기 --%>
						<input type="hidden" name="exPhoto" value="<%= member.getPhoto() %>">
				<%	} %>
						<br>
						<%-- 사용자가 등록/수정 파일버튼 --%>
						<input type="file" name="photo" >	
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"> 
					<input type="reset" value="재작성"> 
					<input type="button" value="취소" onclick="window.location='mypage.jsp'"> 
				</td>
			</tr>
		</table>
	</form>
</body>
<%	} %>
</html>











