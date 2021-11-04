<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="user.UserDAO" %>  <!-- user 패키지의 UserDAO 클래스를 불러옴  -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 작성에 필요? -->
<% request.setCharacterEncoding("UTF-8"); %>   
<jsp:useBean id="user" class="user.User" scope="page" /> <!--  자바콩을 사용하는데, 현재 페이지에만 적용되게 한다는 뜻(스코프) -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userType" />    
<jsp:setProperty name="user" property="userEmail" />     <!-- 이전 페이지에서 넘겨준 값을 수신  -->
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
 		if (user.getUserID() == null || user.getUserPW() == null || user.getUserName() == null || user.getUserType() == null
 		|| user.getUserEmail() == null) {
 			script.println("<script>");
			script.println("alert('모든 항목을 입력하셔야 합니다')");
			script.println("history.back()");
			script.println("</script>");
 		} else {
 	
 	
 		UserDAO userDAO = new UserDAO(); 
 		int result = userDAO.join(user); //맨 위서 설정한대로 5가지 항목에 대한 값 반영
				
		if (result == -1) {   //결과값이 -1이면 = 이미 존재하는 아이디로 인해 PK가 겹쳐 데이터베이스 오류가 난다면...또는 알수없는 이유로 DB 오류가 난다면.
			/* script.println("1"); */ 
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");			
		}
		else { 
			session.setAttribute("userID", user.getUserID());
			script.println("<script>");
			script.println("alert('Right Away!')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		
		}
        }
  %>

<h3>만약 이 메세지가 보인다면 뭔가 잘못된 것입니다. 웹 마스터와 상담하십시오.</h3>
	
</body>
</html>