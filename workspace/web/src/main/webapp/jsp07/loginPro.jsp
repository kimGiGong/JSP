<%@page import="web.jsp07.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>loginPro.jsp</title>
</head>
	<%	if(session.getAttribute("memId") != null){	%>
			<script type="text/javascript">
			alert("로그인 상태 입니다.");
			window.location.href = "main.jsp";
			</script>	
	<%	}else{ 	
	// loginForm -> Pro (파라미터 들고옴)
	// main -> 쿠키있다고 pro (파라미터 X)
	
	
	//	한글깨짐 방지
	request.setCharacterEncoding("UTF-8");
	//	넘어온 파라미터 꺼내기 (main에서 바로 오면 아래 변수 null)
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String auto = request.getParameter("auto");
	
	// 쿠키가 꺼내서 정보가 나오면 위 변수에 저장
	Cookie [] coos = request.getCookies();
	if(coos != null){
		for(Cookie c : coos){
			if(c.getName().equals("autoId")) id=c.getValue();
			if(c.getName().equals("autoPw")) pw=c.getValue();
			if(c.getName().equals("autoCh")) auto=c.getValue();
		}
	}
	
	MemberDAO dao = new MemberDAO();
	boolean result = dao.idPwCheck(id,pw);
	
	if(result){	// id,pw 일치 : 로그인 상태로 만들기
		// 자동로그인이면 쿠키도 생성
		if(auto != null){	// 자동로그인 체크했다
			Cookie c1 = new Cookie("autoId",id);
			Cookie c2 = new Cookie("autoPw",pw);
			Cookie c3 = new Cookie("autoCh",auto);
			c1.setMaxAge(60*60); // 24시간
			c2.setMaxAge(60*60); 
			c3.setMaxAge(60*60);
			response.addCookie(c1);
			response.addCookie(c2);
			response.addCookie(c3);
		}
		session.setAttribute("memId",id);	// 세션 생성
		response.sendRedirect("main.jsp");	// 메인 이동
	}else{ %>
		<script type="text/javascript">
			alert("아이디 또는 비밀번호가 다릅니다.");
			window.location="loginForm.jsp";
			
			//	history.go(-1);
		</script>
<%	}%>
<body>

</body>
<%} %>
</html>