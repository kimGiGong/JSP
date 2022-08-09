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
	
	<%-- 변수 삭제 --%>
	<c:remove var="id"/>
	<c:remove var="name"/>
	<h3> id : ${id} </h3>
	<h3> name : ${name} </h3>
	
	<%-- c:if 조건문 --%>
	<c:set var="num" value="100" />
	
	<c:if test="${ num >= 100 }">
		<h2>${num} 은 100보다 크거나 같다.</h2>
	</c:if>
	<c:if test="${num < 100}">
		<h2>${ num }은 100보다 작다.</h2>
	</c:if>
	
	
	<%-- c:choose --%>
	<c:choose>
		<c:when test="${num>100}">
			<h2>${num}은 100보다 크다</h2>
		</c:when>
		<c:when test="${num<100}">
			<h2>${num}은 100보다 작다</h2>
		</c:when>
		<c:otherwise>
			<h2>${num}은 100과 같다</h2>
		</c:otherwise>
	</c:choose>
	
	
	<%-- forEach --%>
	<c:set var="arr" value="<%= new int []{1,2,3,4,5} %>"  />
	<c:forEach var="a" items="${arr}" varStatus="varstatus" >
		<h3> ${a}</h3>
		<h5> index : ${varstatus.index}</h5>
		<h5> arr[varstatus.index] : ${arr[varstatus.index]}</h5>
	</c:forEach>
	
	<c:forEach var="i" begin="1" end="10" step="1" varStatus="status">
		<h4> ${i} </h4>
		<h5> index : ${status.index}</h5>
		<h5> count : ${status.count}</h5>
	</c:forEach>
	
	<%-- 구구단 2단 ~ 9단 --%>
	<table>
		<c:forEach var="f" begin="2" end="9" step="1">
			<c:forEach var="l" begin="1" end="3" step="1">
				<tr>
					<td> ${f} x  ${l} = ${ f*l } </td> 
					<td>${f} x  ${2*l} = ${ 2*f*l }</td>
					<td>${f} x  ${3*l} = ${ 3*f*l }</td>
				</tr>
			</c:forEach>
		</c:forEach>
	</table>
	
	
	<%-- import --%>
	<c:import var="login" url="../jsp10/loginForm.jsp" />
	${login}
	
	
	<%-- out : 출력 --%>
	<input type="text" value="<c:out value="${num}" />">
	<c:out value="${num}" /> 
	
	
	<%-- url --%>
	<c:url var="u" value="../jsp10/loginForm.jsp">
		<c:param name="id" value="1234" />
		<c:param name="pw" value="1234" />
	</c:url>
	
	<%-- redirect : 페이지 이동 --%>
	<button type="button" onclick='<c:redirect url="${u}" />' >redirect : 페이지이동</button>
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>             

























