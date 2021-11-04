package uname;


import java.sql.Connection;
import java.sql.DriverManager;    /* mySQL 홈페이지에서 드라이버를 다운받아야 함. 다운받은 jar 파일을 프로젝트-웹컨텐츠-웹인포-립 폴더에 복사해넣고 프로젝트 우클릭- 프로퍼티에서 자바 패스 빌드-추가-적용 시켜줘야 함. 와이리 복잡하노...*/
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class uNameDAO {

	private Connection conn; 
	private PreparedStatement pstmt;
	private ResultSet rs;
	
		
	
	public uNameDAO() {
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
	
	
	public String getUname(String userID) {
		String SQL = "SELECT userName FROM USER WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String name2 = rs.getString("userName");
				return name2;
			}			
		}	catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
	
	
/* 여기가 유저 아이디에 해당하는 유저 이름 불러오는 함수 */	
	
	
}

	