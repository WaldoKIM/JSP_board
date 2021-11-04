<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.io.PrintWriter" %> <!--  이거 라이브러리임  -->
<%@ page import= "bbs.BbsDAO" %>
<%@ page import= "bbs.Bbs" %>
<%@ page import="uname.uNameDAO" %> 
<%@ page import= "java.util.ArrayList" %> <!-- 게시판 목록 출력을 위해 필요  -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Test page for Board by JSP</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;}

</style>


</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");			
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null){     //게시글 목록 파라미터 수신
			pageNumber = Integer.parseInt(request.getParameter("pageNumber")); //파라미터를 정수형태로 변환
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
					String nam1 = new uNameDAO().getUname(userID);
			%>
		<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false"> 안녕하세요!
					<input type="text" id="" name="" value="<%= nam1 %>" >님
					 <script>    
					    var userID = '<%= nam1 %>';
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
			<table class="table table-striped" style="text-align: center; border: 1px soild #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO(); //새 인스턴스 시작 -그런데 도대체 정확히 인스턴트가 뭐람?
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i = 0; i < list.size(); i++) {				
				%>			
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>&pageNumber=<%=pageNumber%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserName() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<%
						}
					%>
				</tbody>					
			</table>
			<%
				if(pageNumber !=1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>	
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>	
			
			
		<!--	<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>--> <!--  -->	
			
			<form method="post" action="write.jsp">
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			</form>	
			
		</div>		
	</div>


	
	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>