<%@page import="web.jsp08.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyPro</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="article" class="web.jsp08.model.BoardDTO"></jsp:useBean>
<jsp:setProperty property="*" name="article"/>

<%
	// DB에 접속해서 데이터 수정하기
	BoardDAO dao = new BoardDAO();
	int result = dao.updateArticle(article);	// 수정처리(pw맞는지) 결과 돌려받기
	//	1=수정잘됨, 0 = 비번틀림 , -1= 가능성없게
	if(result ==1){
		String uri = "content.jsp?num="+ article.getNum();
		response.sendRedirect(uri);
	}else{ %>
		<script type="text/javascript">
			alert("비밀번호가 맞지 않습니다. 다시 시도해주세요....");
			history.go(-1);
		</script>	
<%	}
%>

</body>
</html>













