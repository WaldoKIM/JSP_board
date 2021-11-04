<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="user.UserDTO"%>

<%@ page import="user.UserDAO"%>

<%@ page import="util.SHA256"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userID = null;
	String userPassword = null;
	String userEmail = null;
	String userName = null;
	
	if(request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
	}
	if(request.getParameter("userName") != null) {
		userName = (String) request.getParameter("userName");
	}
	
	
	
	if(request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
	}
	if(request.getParameter("userEmail") != null) {
		userEmail = (String) request.getParameter("userEmail");
	}

	if (userID == null || userName == null || userPassword == null || userEmail == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();

	} else {

	//	System.out.println(userID);    // 아래 함수(join)가 실행되지 않고 null 프로퍼티 오류가 나는 현상이 발생
	//	System.out.println(userName);   // 그래서 뭔가 값이 전달이 안되나? 싶어서 확인하려고 이 부분을 넣음
	//	System.out.println(userPassword);  // 그런데  딱히 값이 전달되지 않은 것도 없고 모든 값이 정상적으로 출력됨
	//	System.out.println(userEmail);  // 그러다가 왠지 모르지만 아래 함수가 제대로 실행됨
	//	System.out.println(SHA256.getSHA256(userEmail)); //??????????????
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userName, userPassword, userEmail, SHA256.getSHA256(userEmail), false ));
		if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
		} else {
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'emailSendAction.jsp';");
			script.println("</script>");
			script.close();
		}
	}
%>
