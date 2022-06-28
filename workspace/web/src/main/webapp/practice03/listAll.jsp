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

	BoardDAO dao = new BoardDAO();
	int listAll = dao.countList(); 
	
	//	list 
	String pagenow = request.getParameter("page");
	if(pagenow==null){pagenow="1";}
	int listnow = Integer.parseInt(pagenow);
	int listMax = 5;
	int flist = listMax*(listnow-1)+1;
	int llist = listMax*listnow;
	int listcount = listAll-(listMax*(listnow-1));
	System.out.println(listcount);
	List<BoardDTO> list = dao.readAllBorad(flist,llist);
	
	// page
	int pageMax = 5;
	int pageStart = (int)pageMax*((listnow-1)/pageMax)+1;
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
			<a href="window.location='content?no=<%= article.getBoardno()%>'"> 
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
		<% for(int i = pageStart ; i<=pageEnd ;i++) {%>
		<td>
			<div style="display :inline; margin: 4px; "> 
				<a style="color: black;" href="listAll.jsp?page=<%=i%>"><%=i%></a>
			</div>
		</td>
		<%} %>
	</tr>
</div>
</body>
</html>