<%@page import="web.model.band.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.model.band.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	MemberDAO dao = new MemberDAO();
	List list = dao.selectAll();
%>
<body>
<%
for(int i=0 ; i< list.size() ; i++){
	MemberDTO dto = (MemberDTO) list.get(i); %>
	
	<p> id : <%= dto.getId() %> pw : <%= dto.getPw() %> name : <%= dto.getName() %> 
	tel : <%= dto.getTel() %> adrress : <%= dto.getAddr() %> favorite : <%= dto.getFavorite() %></p>
	
	
<% 	}
%>

</body>
</html>