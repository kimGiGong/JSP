<%@page import="java.util.List"%>
<%@page import="practice.test03.model.BoardDTO"%>
<%@page import="practice.test03.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../jsp08/style02.css" rel="stylesheet" type="text/css">
</head>
<% 
	request.setCharacterEncoding("UTF-8");
	int pageno;
	try{pageno = Integer.parseInt(request.getParameter("pageno"));
	}catch(NumberFormatException e){pageno = 1;}
	
	
	

	BoardDAO dao = new BoardDAO();
	int listAll = dao.countList(); 
	
	
	//	list 카운트
	
	int listMax = 5;
	int flist = listMax*(pageno-1)+1;
	int llist = listMax*pageno;
	int listcount = listAll-(listMax*(pageno-1));
	System.out.println(listcount);
	List<BoardDTO> list = dao.readAllBorad(flist,llist);
	
	// page 카운트
	int pageMax = 5;
	int pageStart = (int)pageMax*((pageno-1)/pageMax)+1;
	int pageEnd= pageMax+pageStart-1;
	int pageCount = listAll/listMax+(listcount%listMax == 0? 0 : 1);
	System.out.println(pageCount);
	if(pageEnd>pageCount) pageEnd=pageCount; //	최대 페이지보다 많게 출력방지	
%>
<body>

<table>
	<tr>
		<td colspan="5" align="right"> 
			<button onclick="window.location='write.jsp'">글쓰기</button> 
		</td>
	</tr>
	<tr>
		<td width="80" height="20">번	호</td>
		<td width="350" height="20">제	목</td>
		<td width="80" height="20">작성자</td>
		<td width="80" height="20">작성일</td>
		<td width="50" height="20">조회수</td>
	</tr>
	<%	for (int i = 0 ; i<list.size() ; i++){
		BoardDTO article = list.get(i);%>
	<tr>
		<td><%= listcount-- %></td>
		<td> 
			<a href="content.jsp?boardno=<%= article.getBoardno()%>"> 
			<%= article.getSubject() %> </a> 
		</td>
		<td><%= article.getWriter() %></td>
		<td><%= article.getReg() %></td>
		<td><%= article.getReadcount() %></td>
	</tr>
	<% }%>
</table >
<div align="center" >
	<tr>
		<% for( pageno = pageStart ; pageno<=pageEnd ;pageno++) {%>
		<td>
			<div style="display :inline; margin: 4px; "> 
				<a style="color: black;" href="listAll.jsp?pageno=<%=pageno%>"><%=pageno%></a>
			</div>
		</td>
		<%} %>
	</tr>
</div>
</body>
</html>