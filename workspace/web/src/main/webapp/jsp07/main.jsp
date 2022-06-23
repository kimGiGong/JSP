<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>main.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<body>
	<br>
	<h1 align="center">메인 페이지</h1>


	<%
	if(session.getAttribute("memId") == null){	// 로그인 안했을때
		
		// 쿠키가 있는지 검사 
		String id = null, pw = null, auto= null;
		Cookie[] coos = request.getCookies();
		if(coos != null){
			for (Cookie c : coos){
				// 쿠키가 있다면 쿠키에 저장된 값꺼내 변수에 담기
				if(c.getName().equals("autoId")) id = c.getValue();	
				if(c.getName().equals("autoPw")) pw = c.getValue();	
				if(c.getName().equals("autoCh")) auto = c.getValue();	
			}
		}
		
		// 세개 변수에 값이 들어있을 경우 (쿠키 제대로 생성되어 다 갖고 있다.)
		if(auto != null && id != null && pw != null){
			// 로그인 처리되도록 loginPro.jsp 처리 페이지로 이동시키기
			response.sendRedirect("loginPro.jsp");
		}
		// 위 코드 다 지나치면,
		// session에 memId 속성도 없고, 쿠키도 없으니 로그인 버튼 보여주기
		
		
	%>
	<table>
		<tr>
			<td>로그인을 원하시면 버튼을 누루세요 <br>
				<button onclick="window.location='loginForm.jsp'"> 로그인 </button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="signupForm.jsp"> 회원가입 </a>
			</td>
		</tr>
	</table>
<%	}else{	// 로그인 했을때  %>
	<table>
		<tr>
			<td> <%= session.getAttribute("memId") %>님 환영합니다 <br>
 				<button onclick="window.location='mypage.jsp'"> 마이페이지 </button>
 				<button onclick="window.location='logout.jsp'"> 로그아웃 </button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="signupForm.jsp"> 회원가입 </a>
			</td>
		</tr>
	</table>
<%	} %>
	
	<br> <br>
	<div align="center">
		<img src="img/img.jpg" width="400px" />

</body>
</html>