<%@page import="web.jsp10.model.ImgSignupDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<%	
	if(session.getAttribute("memId")!=null){
		response.sendRedirect("main.jsp");
	}else{ 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String auto = request.getParameter("auto");
		String re = request.getParameter("re");
		
		//	DB에 id,pw 전달해서 DB상 데이터와 일치하는지 결과를 받아와야함.
		ImgSignupDAO dao = new ImgSignupDAO();
		int result = dao.idPwCheck(id,pw);	//	result : 1 = OK , 0 비번틀림  , -1 아이디없다
	%>
		<script type="text/javascript">
		function checkPageReturn(){
			if(<%=!re.equals("null")%>){
				window.location.href ="/web/board/<%=re%>.jsp";
			}else{
				window.location="main.jsp";
			}
		}
		</script>
	<body>
	<%	if(result == -1){ %>
			<script type="text/javascript">
				alert("존재하지 않는 id 입니다...");
				history.go(-1);
			</script>		
	<%	}else if(result == 0){ %>
			<script type="text/javascript">
				alert("비밀번호가 맞지 않습니다.. 다시 시도해주세요...");
				history.go(-1);
			</script>	
	<%	}else{ 
			session.setAttribute("memId", id);
			if(auto=="1"){
				
			}%>
			<script type="text/javascript">
				alert("로그인 성공");
				checkPageReturn();
			</script>
	<%	} %>
<% 	} %>
	
</body>
</html>

















