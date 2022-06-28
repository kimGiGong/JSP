 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="web.jsp08.model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="web.jsp08.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list.jsp</title>
	<link href="style02.css" rel="stylesheet" type="text/css" />	
</head>
<% 	
	// 현재 요청된 게시판 페이지 번호
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){		//	없으면	(../jsp08/list.jsp)get파라미터없음
		pageNum = "1";			// 	1 줌
	}
	// 현재 페이지에서 보여줄 게시글의 시작과 끝 등의 정보 셋팅
	int pageSize = 3;									// 한페이지에 보여줄 게시글의 갯수
	int currentPage = Integer.parseInt(pageNum);		// 연산을 위해 pageNum을 숫자로 형변환 		current = 현재의
	int startRow = (currentPage -1) * pageSize +1;		// DB에서 잘라올 페이지 시작글 번호
	int endRow = currentPage * pageSize;				// DB에서 잘라올 페이지 마지막글 번호
	System.out.println("endRow ="+startRow +"endRow ="+endRow);
	
	//	작성시간 형태 정하는 클래스
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//	DB에서 전체 글 갯수 가져오기
	BoardDAO dao = new BoardDAO();
	int count = dao.getAriticleCount();
	System.out.println("count = "+count);
	
	List<BoardDTO> list = null;		 	//  글 가져올 변수 미리선언
	//	목록에 보여줄 게시글 가져오기
	if(count>0){						// 게시글 1개 이상시 생성
	//	list = dao.getAllArticles();	// 이전버전	(페이징처리X)
		list = dao.getArticleList(startRow, endRow);
	}
	
	int number = count - ( currentPage -1 ) * pageSize;		// 화면에 뿌려줄 글번호 (DB 고유번호 아님)
	System.out.println("number ="+number);
%>	
<body>
	<br>
	<h1 align="center">게시판</h1>
	<%
	if(count ==0) { %>
		<table>
			<tr>
				<td colspan="5" align="left"> 
					<button onclick="window.location='writeForm.jsp'">글작성</button> 
				</td>
			</tr>	
			<tr>
				<td> 게시글이 없습니다. </td>
			</tr>
		</table>
<%	}else{%> 
		<table>
			<tr>
				<td colspan="5" align="left"> 
					<button onclick="window.location='writeForm.jsp'">글작성</button> 
				</td>
			</tr>	
			<tr>
				<td>No.</td>
				<td>제	목</td>
				<td>작성자</td>
				<td>시	간</td>
				<td>조회수</td>
			</tr>
			<%
			for(int i = 0 ; i<list.size() ; i++){
				BoardDTO article = list.get(i); 	// 글 하나 레코드 뽑기
				//	한 개의 글에대한 정보를 td에 출력 %>
				<tr>
					<td><%= number-- %></td>
					<%-- 제목 a태그로 묶어 클릭이동할 수 있도록하고,
						href에는 content.jsp 와 클릭한 글의 DB상 글 고유번호 파라미터로 전달
						content.jsp에서는 넘어온 글 고유번호를 받아서 DB접근해
						해당 글 하나만 가져와 화면에 뿌려준다. --%>
					<td> <a href="content.jsp?num=<%=article.getNum() %>"> <%= article.getSubject() %> </a> </td>	<%-- 글제목에 하이퍼링크 --%>
					<td> <a href="mailto:<%= article.getEmail() %>"> <%= article.getWriter() %> </a> </td>
					<td><%= sdf.format(article.getReg())  %></td>
					<td><%= article.getReadcount() %></td>
				</tr>	
			<%}%>
		</table>
	<% } %>
<%-- 게시글 목록 밑에 페이지 번호 뷰어 추가  --%>
	<br>
	<div align="center">
	<%
		if(count > 0){
			//	3페이지 번호씩 보여주겠다
			//	총 몇페이지 나오는지 계산 -> 뿌려야되는 페이지번호
			int pageCount = count/ pageSize +(count % pageSize == 0? 0 : 1);
			int pageNumSize = 2; // 한페이지에 보여줄 페이지번호 갯수
			int startPage = (int)((currentPage-1)/pageNumSize)*pageNumSize +1;
			int endPage = startPage + pageNumSize -1;
			//	전체 페이지수보다 위에 계산된 페이지 마지막번호가 더 크면 안되므로.
			//	아래서 endPage 다시 조정
			if(endPage > pageCount){ endPage = pageCount; }			// 엔드페이지가 최종페이지보다 크면 엔드=최종
			System.out.println("pageCount ="+pageCount);
			System.out.println("startPage ="+startPage);
			System.out.println("endPage ="+endPage);
			
			// 페이지 번호 뿌리기
			
			if(startPage > pageNumSize){ 				//	시작페이지가 표기사이즈보다 크면  < 꺽세 눌러 페이지 이동	%>				
				<a class = "pageNums" href="list.jsp?pageNum=<%= startPage-pageNumSize %>"> &lt; &nbsp;</a>		<%-- <꺽세 표시 = &lt; >꺽세= &gt;  --%>
				
		<%	}
			
			for(int i = startPage ; i<=endPage ; i++){
				%> <a class = "pageNums" href= "list.jsp?pageNum=<%= i %>"> <%= i %> &nbsp; </a> &nbsp; <%	//	&nbsp; 가 띄어쓰기 한칸 
				
			}
			if(endPage < pageCount){ %>				
				<a class = "pageNums" href="list.jsp?pageNum=<%= startPage+pageNumSize %>"> &nbsp; &gt; </a>		<%-- < >꺽세 표시 = &lt; --%>
				
		<%	}
		}
	%>
	</div>
</body>
</html>


















