<%@page import="web.jsp06.medel.SignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>pro.jsp</title>
</head>
<% 
	// form에서 넘어온 id,pw 꺼내서 DB에 체크
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");	// 체크하면 "1", 안했으면 null
	System.out.println("id : "+id);
	System.out.println("pw : "+pw);
	System.out.println("auto : "+auto);
	
	SignupDAO dao = new SignupDAO();
	boolean result = dao.idPwCheck(id,pw);
	System.out.println("result : "+result);
	
	if(result){		// id pw 일치 -> 로그인 : session 속성추가, 자동로그인여부에 따라 쿠키 생성
		System.out.println("id pw 일치!!!");
		session.setAttribute("sid", id); 	//	일반 로그인 처리
		
		if(auto != null){	//	사용자가 자동로그인 체크하고 로그인했을때
			//	쿠키 생성
			Cookie c1 = new Cookie("cid", id);
			Cookie c2 = new Cookie("cpw", pw);
			Cookie c3 = new Cookie("cauto", auto);
			//	유효기간 설정
			c1.setMaxAge(60 * 60);	// 1시간
			c2.setMaxAge(60 * 60);	// 1시간
			c3.setMaxAge(60 * 60);	// 1시간
			//	응답객체에 추가해서 사용자에게 저장하라고 전달
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}
		
		
//		response.sendRedirect("main.jsp"); 	// 메인페이지로 이동 %>
		<h3><%= id %>님, 로그인 되셨습니다.</h3>
		<button onclick="window.location.href='main.jsp'">메인</button>
<%	}else{	%>	// id pw 불일치 -> 뒤로가기
		<script type="text/javascript">
			alert("ID 또는 PW가 일치하지 않습니다");
			history.go(-1);
		</script>
<%	}
%>
<body>

</body>
</html>