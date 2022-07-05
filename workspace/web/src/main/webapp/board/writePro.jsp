<%@page import="web.board.model.ImgBoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="web.board.model.ImgBoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	ImgBoardDTO article = new ImgBoardDTO();

	String path = request.getRealPath("save");
	System.out.println(path);
	int max = 1024*1024*10;
	String encoding = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,max,encoding,dp);
	
	//	subject writer content img email bpw
	article.setSubject(mr.getParameter("subject"));
	article.setWriter(mr.getParameter("writer"));
	article.setContent(mr.getParameter("content"));
	article.setEmail(mr.getParameter("email"));
	article.setBpw(mr.getParameter("bpw"));
		
	if(mr.getFilesystemName("img") != null){	// 파일 업로드를 했다면
		article.setImg(mr.getFilesystemName("img"));	// 저장된 파일명으로 dto의 img 변수 채워주기 
	}else{
		article.setImg("default.png");	// save 폴더에있는 default 이미지 파일명으로 체우기
	}
	
	ImgBoardDAO dao = new ImgBoardDAO();
	dao.insertArticle(article);
		
	response.sendRedirect("list.jsp");
	
%>
<body>

</body>
</html>


































