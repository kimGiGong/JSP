<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="practice.test05.model.ImgListDTO"%>
<%@page import="practice.test05.model.ImgListDAO"%>
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
	String path = request.getRealPath("save");
	int max = 1024*1024*10;
	String encoding = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request , path , max , encoding, dp);


	ImgListDTO dto = new ImgListDTO();
	dto.setSubject(mr.getParameter("subject"));
	dto.setWriter(mr.getParameter("writer"));
	dto.setContent(mr.getParameter("content"));
	dto.setBpw(mr.getParameter("bpw"));
	
	if(mr.getFilesystemName("img")==null){
		dto.setImg("default.png");						// null
	}else{
		dto.setImg(mr.getFilesystemName("img"));		// null X
	}
	
	ImgListDAO dao = new ImgListDAO();
	dao.saveContent(dto);
	
	response.sendRedirect("list.jsp");
%>
<body>

</body>
</html>