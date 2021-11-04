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
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<Style> #whiteRabbit {color:#e6ffef; cursor:default;}</Style>

<title>Test page for Board by JSP</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") !=null){
			userID = (String) session.getAttribute("userID");			
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
				<li class="active"><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
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
					String nam1 = new uNameDAO().getUname(userID); //해냈다, 해냈어!
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
	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
	<div id="editor"></div>
	<script>      
	 const editor = new toastui.Editor({
	 el: document.querySelector('#editor'),
	previewStyle: 'vertical',
		 height: '500px',
		
		});
	</script>  
	
	<h5>메인화면 공사중입니다. <strong>&#40;게시판은 정상 작동 합니다 ↑&#41;</strong></h5>
	<span id='whiteRabbit' class='bluepill' onclick="enterthematrix()">follow the white rabbit</span>
	<!-- matrix code by Clive Cooper from codepen.io -->



<div class="box2">
<canvas>
</canvas>
</div>


</body>

<script>






// Initialising the canvas
var canvas = document.querySelector('canvas'),
    ctx = canvas.getContext('2d');
    

// Setting the width and height of the canvas
var innerWidthWithoutScrollbar = innerWidth - 0; //숫자는 스크롤바의 넓이. 메인 화면 구성에 스크롤바가 안생기게 디자인 한 경우 이 수치를 0으로 할 것
var innerHeightWithoutHead = innerHeight - 122.5; //숫자는 탑 메뉴 높이. 탑 메뉴 높이에 따라 이 수치를  조정 할 것

canvas.width = window.innerWidthWithoutScrollbar;
canvas.height = window.innerHeightWithoutHead;

// Setting up the letters
var letters = 'MATRIX system MORPHEUS error TRINITY 0010011 NEO NEBUCHADNEZZAR there is AGENT SMITH no spoon THE ORACLE 공사중 입니다 文明五朝蘚世宗大王 天下無敵 free your mind 미완성 코드 THE ARCHITECT woman in red dress';
letters = letters.split('');

// Setting up the columns
var fontSize = 10,
    columns = canvas.width / fontSize;

// Setting up the drops
var drops = [];
for (var i = 0; i < columns; i++) {
  drops[i] = 1;
}

// Setting up the draw function
function draw() {
    ctx.font = "16pt matrix-code";
  ctx.fillStyle = 'rgba(0, 0, 0, .1)';
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  for (var i = 0; i < drops.length; i++) {
    var text = letters[Math.floor(Math.random() * letters.length)];
    ctx.fillStyle = '#0f0';
    ctx.fillText(text, i * fontSize, drops[i] * 20);
    drops[i]++;
    if (drops[i] * fontSize > canvas.height && Math.random() > 0.95) {
      drops[i] = 0;
    }
  }
}

 // Loop the animation

 function enterthematrix(){
	 var morpheus = document.getElementById('whiteRabbit')
	 var trinity = morpheus.className;
	 console.log(trinity)

	 if(trinity == 'redpill')
		 {alert('the matrix has you...');
		 var box2 = document.querySelector("canvas");	//제거하고자 하는 엘리먼트
		 box2.parentNode.removeChild(box2);
		 
		 
		 }
	 
	 else if(confirm('매트릭스에 접속하시겠습니까?'))
		{
		 morpheus.className = 'redpill';
		 var matrixCode = setInterval(draw, 25);
		 
		 
	}	else { return false;
		
		
	}
 }
</script>
	

	

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</body>
</html>