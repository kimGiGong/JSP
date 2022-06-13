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
	request.setCharacterEncoding("UTF-8");

	String pw = request.getParameter("pw");
	String pwconfirm = request.getParameter("pwconfirm");
	
	boolean equal= false;
	if(pw.equals(pwconfirm)){
		equal=true;
		response.sendRedirect("testpro01.jsp");
	}else{%>
		<script>
		alert('비밀번호가 일치하지 않습니다.'); 
		location.href="testform01.jsp"				// 이동 tag location.herf="위치 주소"
		</script>
		
		<%
	}%>

</body>
</html>