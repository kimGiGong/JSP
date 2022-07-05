<%@page import="web.jsp10.model.ImgSignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>deletePro.jsp</title>
</head>
<%
	String id = (String)session.getAttribute("memId");
	String pw = request.getParameter("pw");
	
	ImgSignupDAO dao = new ImgSignupDAO();
	int check = dao.idPwCheck(id, pw);
	if(check == 1){		//	id,pw 맞다
		
		//	(save 폴더에 남아있는 회원 사진 삭제)
		//	DB에서 회원 사진의 파일명 가져오기 (default.png 아닌것 확인하고 지우기)
		//	save  실제 파일경로 찾아서 뒤에 회원사진파일명 붙히고
		//	최종경로로 File 객체 만들어 file.delete() 로 실제 파일 삭제
		
		dao.deleteMember(id);		// 	db에서 삭제
		session.invalidate();		//	탈퇴시 로그아웃처리
		response.sendRedirect("main.jsp");
	}else{	//	pw 안맞다
	%> 	<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다... 다시 시도해주세요...")
			history.go(-1);
		</script><%
	}
%>
<body>

</body>
</html>






























