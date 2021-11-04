/* 자바 리소스 -> 소스 -> 패키지 파일 생성->클래스 생성 그런데 정확히 이게 왜 필요한건지는 잘 모르겠다 */
/* 일단 db쪽에 해당 데이터를 주고 받는데 필요한 목록... 정도로 이해하고 넘어감 */

package user;

public class User {

	private String userID;
	private String userPW;
	private String userName;
	private String userType;
	private String userEmail;
	
	/* 여기까지는 타이핑했지만, 이하 부분은 자동 생성. 이클립스 기준, 프로젝트 탐색기 창의 해당 자바 파일 선택-우클릭-소스-getters와  setters 생성 클릭 */
	/* 이후 모든 항목을 선택후 오케이! 하면 아래 부분이 아름답게 생성됨. 이것을 자바 콩(JAVA beans)이라고 함 */
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPW() {
		return userPW;
	}
	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
	
}
