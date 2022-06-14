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
	
	if(pw.equals(pwconfirm)){
		%><jsp:forward page="testpro01.jsp" /><%
	}else{%>
		<script>
		alert('비밀번호가 일치하지 않습니다.'); 
		location.href="testform01.jsp"				// 이동 tag location.herf="위치 주소"
		</script>
	<%-- 	<jsp:forward page="testform01.jsp"></jsp:forward>  입력했던 값들이 남는다--%>	
		<%
	}%>

</body>
</html>