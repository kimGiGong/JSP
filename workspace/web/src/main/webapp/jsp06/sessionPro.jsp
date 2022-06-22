<%@page import="web.jsp06.medel.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>sessionPro.jsp</title>
</head>
<%
	// 로그인 처리 페이지
	// 넘어온 id,pw 파라미터 꺼내기
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	System.out.println("id : " + id);
	System.out.println("pw : " + pw);
	
	// DB 접근해서 id,pw 꺼낸거 주고 맞는지 확인 결과 리턴받기
	SignupDAO dao = new SignupDAO();
	boolean result = dao.idPwCheck(id, pw);
	System.out.println("result : " + result);
	
	
	

%>
<body>

	<%
	if(result){		// id,pw 일치
		// 로그인 처리 (session에 속성 추가)
		session.setAttribute("sid", id);	// 세션에 속성 추가하기 %>
		<script>
			alert("로그인 성공!!");
			window.location.href = "sessionMain.jsp";
		</script>
		
		<h3><%= id %>님, 환영합니다.</h3>
		<h3>session sid 꺼내서 출력확인 : <%= session.getAttribute("sid") %></h3>
		
<%	}else {	// id,pw 불일치 (또는 회원가입안함) %>
		<script type="text/javascript">
		alert("로그인 실패..... 다시 시도해주세요.");
		history.go(-1);	// 뒤로가기 (sessionForm.jsp)
		</script>
<%	}
	%>
</body>
</html>