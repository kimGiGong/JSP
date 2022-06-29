<%@page import="web.jsp08.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro.jsp</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String pageNum=request.getParameter("pageNum");
	int num = Integer.parseInt(request.getParameter("num"));
	String pw = request.getParameter("pw");
	
	// DB 가서 비번맞는지 확인하고 삭제
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteArticle(num,pw);
	System.out.println("jsp d result : "+ result);
	if(result == 1){
		response.sendRedirect("list.jsp?pageNum="+pageNum);
	}else{%>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>	
<%	}
%>
<body>

</body>
</html>