<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test page for Board by JSP</title>
</head>
<body>
<div class="landing">
<h1>JSP를 활용한 웹 게시판 만들기 테스트 페이지</h1>
<h2>입장 화면(Landing Page)테스트 입니다</h2>

<form>
<input type="button" value="게시판으로 이동" onclick="enter()">
</form>
	
</div>


	<script>
	function enter(){
		if(confirm('게시판 화면으로 이동하시겠습니까?'))
		{	
		location.href = 'main.jsp';
	}	else { return false;
		
		
	}
	}
	
	</script>
</body>
</html>