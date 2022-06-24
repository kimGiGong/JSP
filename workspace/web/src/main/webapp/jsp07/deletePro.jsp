<%@page import="web.jsp07.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
		<%	if(session.getAttribute("memId") != null || request.getParameter("pw")!= null){	%>
			<script type="text/javascript">
				alert("비정상적인 접근");
				window.location.href = "main.jsp";
			</script>	
		<%	}else{ %>
<%
	String id = (String) session.getAttribute("memId");
	String pw = request.getParameter("pw");
	
	MemberDAO dao = new MemberDAO();
	int check = dao.deleteMember(id,pw);
	System.out.print(check);
	if(check == 1 ){	// 회원 탈퇴 성공
		//	로그아웃 처리
		session.invalidate();
		Cookie [] cs = request.getCookies();
		if( cs != null){
			for(Cookie c : cs){
				if(c.getName().equals("autoId")||c.getName().equals("autoPw")||c.getName().equals("autoCh")){
					c.setMaxAge(0);
					response.addCookie(c);
				}
			}
		}	%>
<body>
	<br>
	<table>
		<tr>
			<td> 회원 정보가 삭제 되었습니다</td>
		</tr>
		<tr>
			<td> <button onclick="window.location='main.jsp'">메인으로</button> </td>
		</tr>
	</table>		
</body>
<%	}else{	// 비번이 틀렸을때	%>
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
		</script>
<%	}
}
%>

</html>