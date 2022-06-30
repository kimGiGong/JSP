<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>upload form.jsp</title>
</head>
<body>
	<h1> form page </h1>
	<form action="upload.jsp" method="post" enctype="multipart/form-data">
				<%-- enctype 파일 전송용 속성 --%>	
		작성자 : <input type="text" name="writer"> <br>
		파	일 : <input type="file" name="upload"> <br>
				<input type="submit" value="전송">

	
	</form>

</body>
</html>