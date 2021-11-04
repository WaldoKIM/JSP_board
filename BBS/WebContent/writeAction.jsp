<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="bbs.BbsDAO" %>  <!-- user 패키지의 UserDAO 클래스를 불러옴  -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 작성에 필요? -->
<% request.setCharacterEncoding("UTF-8"); %>   
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> <!--  자바콩을 사용하는데, 현재 페이지에만 적용되게 한다는 뜻(스코프) -->
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="bbs" property="userName" />     <!-- 이전 페이지에서 넘겨준 값을 수신  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Page for Board Function by JSP</title>
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
 			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
 				PrintWriter script = response.getWriter();
 				script.println("<script>");
 				script.println("alert('입력이 안 된 항목이 있습니다.')");
 				script.println("history.back()");
 				script.println("</script>"); 				
 			} else {
 				BbsDAO bbsDAO = new BbsDAO();
 				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getUserName(), bbs.getBbsContent());
 				if (result == -1){
 					PrintWriter script = response.getWriter();
 					script.println("<script>");
 					script.println("alert('글쓰기에 실패했습니다.')");
 					script.println("history.back()");
 					script.println("</script>"); 				
 			}else { 					
 					PrintWriter script = response.getWriter();
 					script.println("<script>");
 					script.println("location.href = 'bbs.jsp'");
 					script.println("</script>");
 			}
 		}
 		}
 		
  %>

<h3>만약 이 메세지가 보인다면 뭔가 잘못된 것입니다. 웹 마스터와 상담하십시오.</h3>
	
</body>
</html>