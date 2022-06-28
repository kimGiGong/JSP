<%@page import="web.jsp08.model.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp08.model.ReplyDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.jsp08.model.BoardDAO"%>
<%@page import="web.jsp08.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="style02.css" rel="stylesheet" type="text/css" />	
</head>
<%
	//	list에서 제목클릭해 넘어올때 같이 넘겨준 DB상 글 고유번호 num 파라미터 꺼내기
	int num = Integer.parseInt(request.getParameter("num"));

	// 	위 글 고유번호 주고, DB에서 글 하나에 해당하는 정보 가져옴 -> BoardDTO
	BoardDAO dao = new BoardDAO();
	BoardDTO article = dao.getArticle(num);
	dao.updateReadcount(num);
	
	// 	댓글 목록 DB에서 가져오기
	ReplyDAO replyDAO = new ReplyDAO();
	List<ReplyDTO> replyList = replyDAO.getReplies(num);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm");
%>
<body>
	<br>
	<h1 align="center"> Content </h1>
	<table>
		<tr>
			<td colspan="2"><%= article.getSubject() %></td>                       
		</tr>
		<tr>
			<td colspan="2"> <textarea rows="15" cols="70" disabled> <%=article.getContent() %> </textarea></td>
		</tr>
		<tr>
			<td> posted by
			<a href="<%= article.getEmail() %>"> <%= article.getWriter() %></a> 
			at <%= sdf.format(article.getReg()) %></td>
			<td><%=  article.getReadcount() %> view</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="window.location='modifyForm.jsp?num=<%=num %>'"> 수정 </button>
				<button onclick="window.location='deleteForm.jsp?num=<%=num %>'"> 삭제 </button>
				<button onclick="window.location='list.jsp'"> 리스트</button>
			</td>
		</tr>
	</table>
	<br> <br>
	<%-- 댓글 list 보여주기 --%>
	<h4 align="center"> 댓	글 </h4>
	
	<%
	if(replyList == null){ // 댓글 없음 %>
		<table>
			<tr>
				<td colspan="3"> 
					<b>댓	글 </b>	
					<button onclick="window.location='replyForm.jsp?boardNum=<%= num %>'">댓글작성</button> 
				</td>	
			</tr>
			<tr>
				<td>댓글이 없습니다</td>	
			</tr>
			<%-- 댓글 있는만큼 반복해서 tr묶음 뿌리기 --%>
			
		</table>
<%	}else{ 	// 댓글 있음%>
	<table>
		<tr>
			<td colspan="3"> 
				<b>댓	글 </b>	
				<button onclick="window.location='replyForm.jsp?boardNum=<%= num %>'">댓글작성</button> 
			</td>	
		</tr>
		<tr>
			<td>내	용</td>	
			<td>작성자</td>	
			<td>작성시간</td>	
		</tr>	
		<%-- 댓글 있는만큼 뿌리기 --%>
	<% 	for (int i = 0; i<replyList.size() ; i++){
		ReplyDTO dto = replyList.get(i); %>
		
			<tr>
				<td> <%= dto.getReply() %></td>
				<td> <%= dto.getReplyer() %></td>
				<td> <%= sdf.format(dto.getReplyReg()) %></td>
			</tr>
<%		} %>		
	</table>
	<br>
		
<%	}%>
	
</body>
</html>





