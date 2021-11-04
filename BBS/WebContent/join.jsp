<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">

<title>Test page for Board by JSP</title>
</head>
<body>
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
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					role="button" aria-haspopup="true" aria-expanded="false">접속하기
					<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<!-- 액티브 클래스는 한 페이지에 한개, 즉 현재 실행중인 페이지에만 적용 가능 -->						
						<li class="active"><a href="join.jsp">회원가입</a></li>
					</ul>					
				</li>
			</ul>
		</div>			
	</nav>

	<!--  여기까지 메뉴 및 우측 드롭다운 메뉴 -->
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
				<fieldset>
					<h3 style="text-align: center;">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="userID" maxlength="32">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPW" maxlength="32">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이름을 입력하세요" name="userName" maxlength="32">
					</div>
					
					<div class="form-group" style="text-align: center;">
					<legend class="form-group" style="text-align: center; font-size: 1em;"><span>귀하의 종족은 무엇입니까?</span></legend>
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userType" autocomplete="off" value="인간">인&nbsp;&nbsp;&nbsp;간
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userType" autocomplete="off" value="외계인">외계인
							</label>
						</div>												
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일주소를 입력하세요" name="userEmail" maxlength="128">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="회원가입">
				</fieldset>
				</form>
		</div>
	
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>