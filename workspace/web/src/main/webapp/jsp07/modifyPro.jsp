<%@page import="web.jsp07.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modifyPro.jsp</title>
	<link href="style.css" rel="stylesheet" type="text/css" /> 
</head>
<%	if(session.getAttribute("memId") == null || request.getParameter("pw")==null){		// 로그인 안함 %>
		<script type="text/javascript">
			alert("로그인 후 사용 가능한 페이지 입니다");
			window.location.href = "loginForm.jsp";
		</script>
<%	}else{				// 로그인했다 %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" class ="web.jsp07.model.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<%
	// pw name email 3개 데이터
	// id는 modifyForm에서 넘어오지 못했기 때문에
	//	session에서 꺼내서 직접 채워주자.
	String id = (String)session.getAttribute("memId");
	member.setId(id);
	
	//	DB 에 member 주고, 업데이트 요청
	MemberDAO dao = new MemberDAO();
	dao.updateMember(member);
%>
<body>

	<br>
	<h1 align="center"> 회원 정보 수정</h1>
	<table>
		<tr>
			<td>회원정보가 수정되었습니다</td>
		</tr>
		<tr>
			<td> <button onclick="window.location='main.jsp'">메인으로</button> </td>
		</tr>
		
	</table>

</body>
<% }%>
</html>