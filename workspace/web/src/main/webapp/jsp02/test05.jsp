<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>request</title>
</head>
<body>

	<%--
		자주 발생하는 에러
		404 : 요청 "주소"가 잘못되었을경우
		500 : 자바 문법 오류, 자바쪽 오타 등등 서버쪽에서 에러발생함
	--%>
	
	
	<%-- requet 주요 메서드 --%>
	
	
	클라이언트 IP = <%= request.getRemoteAddr() %> <br>
	컨텍스트 경로 = <%= request.getContextPath() %> <br>
	 *  요청 URI = <%= request.getRequestURI() %> <br>
	
	요청정보 컨텐츠 타입 = <%= request.getContentType() %> <br>
	요청정보 인코딩 = <%= request.getCharacterEncoding() %> <br>
	요청정보 프로토콜 = <%= request.getProtocol() %> <br>
	요청정보 전송방식 = <%= request.getMethod() %> <br>
	요청정보 길이 = <%= request.getContentLength() %> <br>
	서버이름 = <%= request.getServerName() %> <br>
	서버포트 = <%= request.getServerPort() %> <br>
	
	
	
	
</body>
</html>