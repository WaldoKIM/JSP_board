<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.io.PrintWriter" %> <!--  이거 라이브러리임  -->
<%@ page import="uname.uNameDAO" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>.hideName {display:none;} </style>
<title>Test page for Board by JSP</title>
</head>
<body>



 <%  
 		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
 		if (userID == null){
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('로그인이 필요한 기능입니다. 로그인 페이지로 이동합니다.')");
 			script.println("location.href = 'login.jsp'");
 			script.println("</script>");
 		} else {			
 					
 			}
 		
 	
 		
  %>










	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<!-- icon-bar 클래스 하나당 햄버거 메뉴 작대기 하나... 신박하네-->
			</button>
			<a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
		</div>
		
		<!--  여기까지 헤더 프레임 -->
		
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li class="active"><a href="bbs.jsp">게시판</a></li>
			</ul>
			
			<%
				if(userID == null) {
					
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">접속하기
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>					
				</li>
			</ul>				
			<%
				} else {
			
					String userName = new uNameDAO().getUname(userID); //해냈다, 해냈어!
							
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">안녕하세요
					<input type="text" id="" name="" value="<%= userName %>" >님
					 <script>    
					    var userID = '<%= userName %>';
					</script>
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">회원관리</a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>					
				</li>
			</ul>
			
			
			<%
				}
			%>
		</div>			
	</nav>
	
	<div class="container">
		<div class="row">
		<form method="post" action="writeAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px soild #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					
					</tr>
				</thead>				
				<tbody>
					<tr class="hideName">
						<% String userName = new uNameDAO().getUname(userID); %>
						<td><input type="text" class="form-control" placeholder="글 작성자" name="userName" maxlength="50" value="<%= userName %>"></td>
					</tr>
				
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="65535" style="height:350px;"></textarea></td>
					</tr>
				</tbody>			
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>			
		</div>		
	</div>


	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>