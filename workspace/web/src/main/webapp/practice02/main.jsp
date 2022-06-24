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
System.out.println(session.getAttribute("loginID"));
if( session.getAttribute("loginID") == null ){	// 비회원
	
	String id = null, pw =null , auto =null;	// 생성
	Cookie [] cs = request.getCookies();
	if(cs != null){
		for(Cookie c: cs){
			if(c.getName().equals("autoID")) id= c.getValue();
			if(c.getName().equals("autoPW")) pw= c.getValue();
			if(c.getName().equals("autoLogin")) auto= c.getValue();
		}
	}
	if(id!=null && pw !=null&& auto!= null){
		response.sendRedirect("loginPro.jsp");
	}
	%>
	<table>
		<tr>
			<td>로그인을 원하시면 버튼을 누루세요 <br>
				<button onclick="window.location='login.jsp'"> 로그인 </button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="form.jsp"> 회원가입 </a>
			</td>
		</tr>
	</table>
<%
}else{	// 회원 %>
	<table>
	<tr>
		<td> <%= session.getAttribute("loginID") %>님 환영합니다 <br>
				<button onclick="window.location='mypage.jsp'"> 마이페이지 </button>
				<button onclick="window.location='logout.jsp'"> 로그아웃 </button>
		</td>
	</tr>
	<tr>
		<td>
			<a href="form.jsp"> 회원가입 </a>
		</td>
	</tr>
</table>
<%	
}
%>
</body>
</html>