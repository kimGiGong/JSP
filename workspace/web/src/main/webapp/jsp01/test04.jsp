<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<h1> test04 Page </h1>
	
	<%-- #1. 선언부 --%>
	<%! 
		// 선언부 : 클래스 영역
		// 클래스변수, 인스턴스변수, 메서드
		static int num = 10;
		int num2 = 200;
		public int mul(int a, int b){
			return a * b;
		}
	
	%>

	<%-- #2. 출력문 : 세미콜론 안적음. 변수명, 리턴있는 메서드 호출하면 값 화면에 출력 --%>
	<%= num %> <br>
	<%= num2 %> <br>
	10 * 20 = <%= mul(10,20) %>
	
	<%-- #3. 스크립트릿 --%>

	
		//	스크립트릿 : 메서드 영역
	<% 	for(int i =0 ; i<num ; i++){  %>
			
		java server pages! <br> 		
			
	<%	out.print("java server pages "+i+"<br>");	// 자바로 브라우저 화면에 출력
			// "\n" 이 안먹힘 ㄷㄷ
		}
	
		String col = "yellow";
	%>
	
	
	<body bgcolor=" <%= col %>">	
	
	<ul>
		<% for(int i=0; i<10; i++){ %>
			<li>hello jsp</li>
		<% }%>
	</ul>
	</body>
	
	









</html>