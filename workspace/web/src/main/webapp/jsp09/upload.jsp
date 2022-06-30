<%@page import="web.jsp09.model.UploadDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>upload.jsp</title>
</head>
 <%
	/* com.oreilly.servlet == cos약자 */	
 
 	request.setCharacterEncoding("UTF-8");
 	/*	 MultipartRequest 객체 생성시, 필요한 인자들.
			1. request 내장 객체 (jsp에 이미 있다)
			2. 업로드 될 파일 저장 경로
			3. 업로드 할 파일 최대 크기
			4. 인코딩 타입 : UTF-8
			5. 업로드된 파일 이름이 같을경우, 덮어씌우기 방지 객체
 	*/

 	
 	//	2. 브라우저에서 보낸 파일 저장할 서버측의 파일 저장 경로 *
 	//	2-1. PC에 저장 (서버쪽X, 서버가 있는 내PC에 저장)
 	//		 - 업로드된 이미지를 다시 서비스(사용자가 볼수 있게) 해줄 수 없다.			
 //	String path ="d:\\tmp\\";
 	//	2-2. 서버상의 경로로 파일 저장해야 사용자가 볼수 있다.
 	String path = request.getRealPath("save");		//	서버상의 save 폴더의 실제 경로 찾기
 	System.out.println(path);
 	
 	//	3. 업로드 할 파일 최대 크기
 	int max = 1024*1024*5;	//	5MB
	//	4. 인코딩
	String enc = "UTF-8";
 	//	5. 덮어씌우기 방지 객체
 	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
 	
 	//	MultipartRequest 객체 생성
 	MultipartRequest mr = new MultipartRequest(request,path,max,enc,dp);
 	
 	//	파라미터 받기
 	String writer = mr.getParameter("writer");
 	String sysName = mr.getFilesystemName("upload");		//	업로드 파일 이름
 	String orgName = mr.getOriginalFileName("upload");		//	파일 원본 이름
	String contentType = mr.getContentType("upload");		// 파일 종류 : 사진, 글....
 	
	
	//	DB에 저장
	UploadDAO dao = new UploadDAO();
	dao.insertData(writer, sysName);
	
	
	
	
	
	
	
 %>
<body>
	<h1> upload page </h1>
	<h2> 작성자 : <%= writer %></h2>
	<h2> 업로드 파일명 : <%= sysName %></h2>
	<h2> 파일 원본이름 : <%= orgName %></h2>
	<h2> 컨텐트 타입(파일종류) : <%= contentType %></h2>
	
	<img  src="/web/save/<%= sysName %>" width="300px">
	
	
	
	
</body>
</html>




















