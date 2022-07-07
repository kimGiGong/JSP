<%@page import="web.jsp10.model.ImgSignupDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	if(session.getAttribute("memId")!=null){
		response.sendRedirect("main.jsp");
	}else{ 
		request.setCharacterEncoding("UTF-8");
	

%>
<jsp:useBean id="member" class="web.jsp10.model.ImgSignupDTO" />
	<%-- 파일 업로드 처리시 <jsp:setProperty> 사용불가 --%>
<% 
		String path = request.getRealPath("save");	//	서버상의 save 폴더 경로 찾기
		System.out.println(path);
		int max = 1024*1024*5;	// 업로드 파일 크기 제한
		String enc/*encoding*/ = "UTF-8";	
		DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();		//	중복방지 객체
		MultipartRequest mr = new MultipartRequest(request, path , max ,enc ,dp);	//	실제파일은 저장됨!
		
		member.setId(mr.getParameter("id"));
		member.setPw(mr.getParameter("pw"));
		member.setName(mr.getParameter("name"));
		member.setGender(mr.getParameter("gender"));
		if(mr.getParameter("email")==null){
			member.setEmail("none");
		}else{
			member.setEmail(mr.getParameter("email"));
		}
		
		if(mr.getFilesystemName("photo")==null){
			member.setPhoto("default.png");
		}else{
		//	실제 save 폴더에 저장된 파일명을 dto에 담기 (파일명 중복처리되어 저장되므로, 원본이름X)
			member.setPhoto(mr.getFilesystemName("photo"));
		}
		
		//	BD가서 저장해!!!
		ImgSignupDAO dao = new ImgSignupDAO();
		dao.insertMember(member);
		
		
		//	처리 후 main 페이지로 이동
		response.sendRedirect("main.jsp");
	}
%>
<body>

</body>
</html>











