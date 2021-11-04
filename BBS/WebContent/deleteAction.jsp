<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>  <!-- user 패키지의 UserDAO 클래스를 불러옴  -->
<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 작성에 필요? -->
<% request.setCharacterEncoding("UTF-8"); %>   
<!--
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" /> 
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
빈즈를 사용하지 않는다 하는데 없어도 되는가? 빈즈가 담당하던 기능은 무엇으로 대체 했는가? bbs.Bbs 인가?     -->
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
 		} 
 		int bbsID = 0;
 		if (request.getParameter("bbsID") != null) {
 			bbsID = Integer.parseInt(request.getParameter("bbsID")); 		
 		}
 		if (bbsID == 0) {
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('유효하지 않은 글 입니다. 게시판 화면으로 돌아갑니다.')");
 			script.println("location.href = 'bbs.jsp'");
 			script.println("</script>");
 		}
 		Bbs bbs1 = new BbsDAO().getBbs(bbsID); //예제에서는 Bbs bbs 로 진행하였으나 같은 문구라고 인식하는 오류가 발생해 숫자를 추가함
 		if (!userID.equals(bbs1.getUserID())) {
 			PrintWriter script = response.getWriter();
 			script.println("<script>");
 			script.println("alert('권한이 없습니다. 게시판 화면으로 돌아갑니다.')");
 			script.println("location.href = 'bbs.jsp'");
 			script.println("</script>");
 		} else {				
 				BbsDAO bbsDAO = new BbsDAO();
 			/* int result = bbsDAO.update(bbs.getBbsTitle(), userID, bbs.getBbsContent()); 이 부분 역시 빈즈 사용시 레거시*/
 				int result = bbsDAO.delete(bbsID);
 				if (result == -1){
 					PrintWriter script = response.getWriter();
 					script.println("<script>");
 					script.println("alert('글삭제에 실패했습니다. 영구박제!')");
 					script.println("history.back()");
 					script.println("</script>"); 				
 				}
 				else { 					
 					PrintWriter script = response.getWriter();
 					script.println("<script>");
 					script.println("alert('게시글 삭제가 완료되었습니다.')");
 					script.println("location.href = 'bbs.jsp'");
 					script.println("</script>");
 			}
 		}
 		
 		
 		
  %>

<h3>만약 이 메세지가 보인다면 뭔가 잘못된 것입니다. 웹 마스터와 상담하십시오.</h3>
	
</body>
</html>