<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>jstl02.jsp</title>
</head>
<body>

	<%-- request.setCharacterEncoding("UTF-8") --%>
	<fmt:requestEncoding value="UTF-8"/>

	
	<%-- formateDate --%>
	<h3>day : ${day}</h3>
	<h3>day : <fmt:formatDate value="${day}"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="date"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="time"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both"/> </h3>
	<br>
	
	
	<h1>dateStyle</h1>
	<br>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="short"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="medium"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="long"/> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="full"/> </h3>
	<br>
	
	
	<h1>timeStyle</h1>
	<br>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="short" timeStyle="short" /> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="medium" timeStyle="medium" /> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="long" timeStyle="long" /> </h3>
	<h3>day : <fmt:formatDate value="${day}" type="both" dateStyle="full" timeStyle="full" /> </h3>
	<br>
	
	
	<%-- 원하는 패턴으로 --%>
	<h1>원하는 패턴으로</h1>
	<br>
	<h4>day : <fmt:formatDate value="${day}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></h4>
	
	


	<br>


	<%-- * 숫자와 관련된 것들 * --%>
	<h1>숫자와 관련된 것들</h1>
	<br>
	<h4><fmt:formatNumber value="1000000" groupingUsed="true"/></h4> 
	<h4><fmt:formatNumber value="1000000" groupingUsed="false"/></h4> 
	<br>

	<h4><fmt:formatNumber value="1000000" type="number"/></h4> 
	<h4><fmt:formatNumber value="1000000" type="currency" currencySymbol="\\"/></h4> 
	<h4><fmt:formatNumber value="123.75"  pattern="$.00" type="currency" /></h4> 
	<br>
	
	<h4> <fmt:formatNumber value="0.3" type="percent"/> </h4>
	<h4> <fmt:formatNumber value="12345.6789" pattern=".0"/> </h4>
	<br>
	
	
	
	<%-- 문자열 -> 숫자 --%>
	<h1>문자열 -> 숫자</h1>
	<h4> <fmt:parseNumber value="12345.6789" integerOnly="true" /> </h4>
	<h4> <fmt:parseNumber value="12345.6789" integerOnly="true" var="result" /> ${result} </h4>
	<br>


	
	<%-- 시간대 --%>
	<h1> 시간대 </h1>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${day}" type="both"/> <br>
	</fmt:timeZone>
	<fmt:timeZone value="GMT-8">
		<fmt:formatDate value="${day}" type="both"/> <br>
	</fmt:timeZone>











<br> <br>
</body>
</html>