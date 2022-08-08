<%@page import="web.jsp08.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl01.jsp</title>
</head>
<body>
	<%-- 변수 선언 --%>
	<c:set var="id" value="java"/>
	<c:set var="name">피카츄</c:set>
	<h3> id : ${id} </h3>
	<h3> name : ${name} </h3>
	
	<%-- 프로퍼티 설정:  
		#1. 스크립트릿 = 표현식 <%= 
		#2. 액션태그 = EL 사용 --%>
		<% BoardDTO dto = new BoardDTO(); %>
		<c:set target="<%= dto %>" property ="writer" value="hahahaha"/>
		<h3> dto.writer : <%= dto.getWriter() %></h3>
		
		<jsp:useBean id="vo" class="web.jsp08.model.BoardDTO" />
		<c:set target="${vo}" property="writer" value="hohohoho" />
		<h3>vo.writer : ${ vo.writer }</h3>
	
	
	
	
</body>
</html>

























