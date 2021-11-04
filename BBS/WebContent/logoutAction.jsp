<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page for Board Function by JSP</title>
</head>

<body>
 	
	<%
		session.invalidate();   //세션 해제 = 로그아웃
	%>
	<script>
		location.href = 'main.jsp';  //메인으로 보내버리기
	</script>

	
</body>
</html>