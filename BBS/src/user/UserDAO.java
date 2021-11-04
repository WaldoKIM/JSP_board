/* 패키지 내 유저 클래스가 '주고 받을 데이터의 목록' 이라면 이 DAO- 즉, 데이터베이스D 접근A 객체O를 통해 실제로 데이터를 주고 받는다? 맞나? */

package user;

import java.sql.Connection;

import java.sql.DriverManager;    /* mySQL 홈페이지에서 드라이버를 다운받아야 함. 다운받은 jar 파일을 프로젝트-웹컨텐츠-웹인포-립 폴더에 복사해넣고
프로젝트 우클릭- 프로퍼티에서 자바 패스 빌드-추가-적용 시켜줘야 함. 와이리 복잡하노...*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bbs.Bbs;

public class UserDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;
	
		
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "root";
			String dbPassword = "beer";
			/* Class.forName("com.mysql.jdbc.Driver");  mySQL driver 옛 클라스 명령어, 지금(버전 8 이후)은 아래와 같음*/
			Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection(dbURL, dbID, dbPassword);			
		} catch (Exception e) {
			e.printStackTrace();
	}
	}
	/* 여기까지 MySQL에 접속하게 해 주는 명령어 */
	
	public int login(String userID, String userPW) {
		String SQL = "SELECT userPW FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);     //PreparedStatement = 해킹 등 방지를 위해 미리 준비해 놓은 명령어, 여기서는 SQL를 사용
			rs = pstmt.executeQuery(); // result
			 if(userID == null || userPW == null )
			     return 4; // 입력 오류
		
			if (rs.next()) {   //결과가 있다면 다음을 진행하시오
				if(rs.getString(1).contentEquals(userPW)) //동일하다면
					return 1; //로그인 성공
				else
					return 0; //비밀번호 불일치				
			}
			return -1; // 아이디가 없음
		} catch (Exception e) {  //예외 처리문
			e.printStackTrace();
		}
		 
	return -2; // 데이터베이스 오류
		
	}
	
	
	//----------------
	
	
	//--------------------------
	

	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1,  user.getUserID());
				pstmt.setString(2,  user.getUserPW());
				pstmt.setString(3,  user.getUserName());
				pstmt.setString(4,  user.getUserType());
				pstmt.setString(5,  user.getUserEmail());
				return pstmt.executeUpdate();
				
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이타베이스 오류
	}
}

/* 여기까지 로그인 기능 */



