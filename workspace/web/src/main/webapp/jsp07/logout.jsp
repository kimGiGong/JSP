<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
		<%	if(session.getAttribute("memId") == null){	%>
			<script type="text/javascript">
				alert("로그인 상태가 아닙니다.");
				window.location.href = "loginForm.jsp";
			</script>	
		<%	}else{ %>
<%
	// 로그아웃처리
	session.invalidate();
	// 쿠키 있으면 쿠키 삭제
	Cookie []cs =request.getCookies();
	if( cs != null){
		for (Cookie c : cs ){
			if(c.getName().equals("autoId")|| c.getName().equals("autoPw")|| c.getName().equals("autoCh")){
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
	}
	
	// 메인 이동
	response.sendRedirect("main.jsp");
%>
<body>

</body>
<% } %>
</html>