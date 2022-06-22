<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout.jsp</title>
</head>
<%
	//	session에서 속성삭제 전에 사용자 id 가져와 변수에 담아두기
	String id = (String) session.getAttribute("sid");

	//	일반 로그인 -> 로그아웃 : session에서 sid속성 삭제	
	session.invalidate();
	
	//	자동 로그인 -> 쿠키도 삭제
	Cookie [] coos = request.getCookies();
	for(Cookie c : coos){
		if(c.getName().equals("cid") || c.getName().equals("cpw") || c.getName().equals("cauto")){
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
%>
<body>
	<h1>로그아웃</h1>
	<h3><%= id %>님, 로그아웃 처리 되었습니다.</h3>
	<button onclick="window.location.href='main.jsp'">메인</button>
</body>
</html>