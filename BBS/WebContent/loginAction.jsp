<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>  <!-- user 패키지의 UserDAO 클래스를 불러옴  -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 작성에 필요? -->
<% request.setCharacterEncoding("UTF-8"); %>   
<jsp:useBean id="user" class="user.User" scope="page" /> <!--  자바콩을 사용하는데, 현재 페이지에만 적용되게 한다는 뜻(스코프) -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />     <!-- 이전 페이지에서 넘겨준 값을 수신  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page for Board Function by JSP</title>
</head>

<body>
 	<%  
 		PrintWriter script = response.getWriter();
		
 		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
 		if (userID != null){
 			script.println("<script>");
 			script.println("alert('이미 로그인이 되었습니다.')");
 			script.println("location.href = 'main.jsp'");
 			script.println("</script>");
 		}
 	
 	
 		UserDAO userDAO = new UserDAO(); 
 		int result = userDAO.login(user.getUserID(), user.getUserPW()); //userDAO 콩에서 설정한대로 1,0,-1,-2 등으로 결과 값 반환
		
		String uid = user.getUserID();
		
		
		
		if (result == 1) {   //결과값이 1이면 = 아이디가 있고 비밀번호가 일치하면
			/* script.println("1"); */ 
			
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("alert('어서오세요~')");
		/*	script.println("var uid = '");
			script.println("</script>");
			script.println(uid);
			script.println("<script>");
			script.println("';"); */
			/*입력된 userID를 넘겨받아서  **님 환경합니다 라고 띄우려면 어떻게 해야 하나? */
			script.println("location.href = 'main.jsp'");	
			script.println("</script>");
			
			
		}
		else if (result == 0) {   //또는 결과값이 1이면 = 아이디가 있고 비밀번호는 불일치하면
			/* script.println("0"); */
			script.println("<script>");
			script.println("alert('비밀번호가 틀렸다능...')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -1) {   // 또는 결과값이 -1이면 = 아이디가 없으면
			/* script.println("-1"); */
			script.println("<script>");
			script.println("alert('없는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if (result == -2) {   // 또는 결과값이 -2이면 = 뭔가 잘못되었다면
			/* script.println("-2"); */
			script.println("<script>");
			script.println("alert('데이터베이스 오류')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else if (result == 4) {   // 또는 결과값이 -2이면 = 뭔가 잘못되었다면
			/* script.println("-2"); */
			script.println("<script>");
			script.println("alert('아이디와 비밀번호를 모두 입력하셔야 합니다')");
			script.println("history.back()");
			script.println("</script>");
		}
  %>

<h3>만약 이 메세지가 보인다면 뭔가 잘못된 것입니다. 웹 마스터와 상담하십시오.</h3>
	
</body>
</html>