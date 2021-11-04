<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.io.PrintWriter" %> <!--  이거 라이브러리임  -->
<%@ page import= "bbs.Bbs" %>
<%@ page import= "bbs.BbsDAO" %>
<%@ page import="uname.uNameDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Test page for Board by JSP</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");			
		}
		int bbsID = 0;
		int pageNumber = 0;
		if (request.getParameter("bbsID") !=null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			System.out.println(pageNumber);
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('유효하지 않은 글입니다. 글 목록 화면으로 이동합니다.')");
 			script.println("location.href = 'bbs.jsp'");
 			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
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
					String nam1 = new uNameDAO().getUname(userID);//해냈다, 해냈어!
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">안녕하세요!
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
						<th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					
					</tr>
				</thead>
				<tbody>
				
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2"><%=bbs.getUserID() %></td>
					</tr>					
					<tr>
						<td>작성일자</td>
						<td colspan="2"><%=bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시" + bbs.getBbsDate().substring(14, 16) + "분"%></td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>").replaceAll("씨발", "사랑").replaceAll("좆", "꽃").replaceAll("iddqd!", "프로그래머용 백도어 키 예시 <script>alert('백도어 작동!')</script>")
						.replaceAll("idkfa!", "<dvi id='x'>매직워드를 찾으셨군요!</div>")
						%></td>
						<!--  replace 함수를 통해 특수문자를 엔티티문자로 전환시키거나 또는 아예 제거하거나 하는 방식으로 스크립트 공격을 막을 수 있다. 아마 욕설 필터링도 될 거 같다. -->
					</tr>
				</tbody>			
			</table>
			<button class="btn btn-primary" onclick="goBack()">돌아가기</button>


			<!--  <a href="bbs.jsp" class="btn btn-primary">목록</a>   매번 첫 페이지로 이동해 UX가 안좋음 -->
			<script>
			function goBack() {
				
				
				location.href = 'bbs.jsp?pageNumber=<%= pageNumber %>';}
			var img = document.createElement('img');
		    var src = document.getElementById('x');
		    img.src = 'https://i.imgur.com/GWVvTYM.gif';
		    src.appendChild(img);
			</script>
			
			
			
			<%
				if(userID !=null && userID.equals(bbs.getUserID())) {
			%>		
					<a href="update.jsp?bbsID=<%= bbsID %>&pageNumber=<%=pageNumber%>" class="btn btn-primary">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까? 절대 복구 안해줌')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
					<!-- <input type="submit" class="btn btn-primary pull-right" value="글쓰기"> -->
			<%					
				}
			
			%>
			
			
		</div>		
	</div>


	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>