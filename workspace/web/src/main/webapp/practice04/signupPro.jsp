<%@page import="practice.test04.model.SignDAO"%>
<%@page import="practice.test04.model.SignDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>signupPro</title>
</head>
<%
	String path = request.getRealPath("save");
	int max = 1024*1024*10;
	String encoding = "UTF-8";
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,max,encoding,dp);

	SignDTO dto = new SignDTO();
	dto.setName(mr.getParameter("name")) ;
	dto.setId(mr.getParameter("id")) ;
	dto.setPw(mr.getParameter("pw"));
	dto.setPhone(mr.getParameter("phone"));
	if(mr.getParameter("birth").equals("")){
		dto.setBirth("");
	}else{
		dto.setBirth(mr.getParameter("birth")); 
		
	}
	
	if(mr.getFilesystemName("profile")==null){
		dto.setProfile("default.png");
	}else{
		dto.setProfile(mr.getFilesystemName("profile"));
	}
	SignDAO dao = new SignDAO();
	int result = dao.insert(dto);
%>
<body>
<% 	if(result == 1){ %>
		<script type="text/javascript">
			alert("회원가입 성공");
			window.location="main.jsp";
		</script>
<% 	}else{ %>
		<script type="text/javascript">
			alert("회원가입 실패 다시 입력해주세요");
			history.go(-1);
		</script>
<% 	} %>
</body>
</html>